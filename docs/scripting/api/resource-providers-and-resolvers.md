---
sidebar_position: 200
---

# Resource Providers & Resolvers

Resources in Warudo are any external data that can be used by assets and nodes. For example, character resources are the `.vrm` and `.warudo` files in the `Characters` directory; character animation resources are the 500+ built-in animations provided by Warudo plus any custom [character animation mods](../../modding/character-animation-mod) in the `CharacterAnmations` directory; [screen](../../assets/screen) image resources are the image files in the `Images` directory; and so on.

## Overview

Internally, each resource is uniquely identified by a **resource URI**, which looks like `character://data/Characters/MyModel.vrm` or `character-animation://resources/Animations/AGIA/01_Idles/AGIA_Idle_generic_01`.

When you open a resource dropdown such as the `Source` dropdown in the character asset, the dropdown queries **resource providers** to obtain a list of compatible resource URIs; in the case of the character asset, two resource providers will return results: one that look for files in the `Characters` directory, and the other that look for installed character mods installed from the Steam Workshop.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '75%'}}>
![](/doc-img/en-resource-providers-1.png)
</div>
</div>

When you select a resource URI, Warudo invokes the corresponding **resource URI resolver** to load the resource data. For example, a `.vrm` file and a `.warudo` file can be loaded by two different resolvers, but both resolvers return a `GameObject` (which is the character loaded into the Unity scene), so the character asset can treat them the same way.

Note that resource providers and resolvers must be registered by a [plugin](plugins). 

## Provider

Let's go through a toy plugin example to register a custom resource provider that provides prop resources which are just cubes and spheres.

```csharp
using System;
using System.Collections.Generic;
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Core.Resource;

[PluginType(
    Id = "hakuyatira.primitiveprops", 
    Name = "Primitive Props",
    Description = "A simple plugin that registers primitive props.",
    Version = "1.0.0", 
    Author = "Hakuya Tira", 
    SupportUrl = "https://docs.warudo.app")]
public class PrimitivePropsPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Context.ResourceManager.RegisterProvider(new PrimitivePropResourceProvider(), this);
    }
    
}

public class PrimitivePropResourceProvider : IResourceProvider {
    public string ResourceProviderName => "Primitives"; // The name of your provider
    
    public List<Resource> ProvideResources(string query) {
        if (query != "Prop") return null; // If the query is not "Prop", we don't have any compatible resources
        return new List<Resource> {
            new Resource {
                category = "Primitives", // Category that will be shown in the dropdown
                label = "Cube", // Label that will be shown in the dropdown
                uri = new Uri("prop://primitives/cube") // Underlying resource URI
            },
            new Resource {
                category = "Primitives",
                label = "Sphere",
                uri = new Uri("prop://primitives/sphere")
            }
        };
    }
}
```

In the example above, we register a custom resource provider that provides two prop resources: a cube and a sphere. Note the `ProvideResources` method returns the list of resources only when the query is `"Prop"`; this is because the prop asset queries for prop resources with the query `"Prop"`, like this:

```csharp
// In the prop asset class
[AutoCompleteResource("Prop")]
public string Source;
```

:::tip
A list of queries used by the built-in assets can be found in the [Built-in Resource Types](#built-in-resource-types) section.
:::

:::tip
We write the URIs like `prop://primitives/cube` because it is a convention to use the `prop://` scheme for prop resources, but you don't necessarily have to follow, especially if you will write a custom resolver for your resource URIs.
:::

Once the plugin is loaded, when you open the `Source` dropdown in a prop asset, you should be able to see the two resources provided by our custom resource provider:

![](/doc-img/en-resource-providers-2.png)

Selecting them will invoke the corresponding resource URI resolver to load the prop data. But no one knows how to resolve our URIs! Let's create a resolver for our URIs.

## URI Resolver

Add the following class to our plugin:

```csharp
public class PrimitivePropResourceUriResolver : IResourceUriResolver {
    public object Resolve(Uri uri) {
        if (uri.Scheme != "prop" || uri.Authority != "primitives") return null;
        var path = uri.LocalPath.TrimStart('/');
        
        return path switch {
            "cube" => GameObject.CreatePrimitive(PrimitiveType.Cube),
            "sphere" => GameObject.CreatePrimitive(PrimitiveType.Sphere),
            _ => throw new Exception("Unknown primitive prop: " + path)
        };
    }
}
```

The first few two lines check if the URI matches our custom format, i.e., `prop://primitives/xxx`. If so, we extract the last part of the URI (`path`) and create a cube or a sphere accordingly. We return a `GameObject` directly, because it is what the prop asset expects when it selects a prop resource.

:::tip
The returned object type must be compatible with the asset that uses the resource. For example, a character asset expects a `GameObject` when it selects a character resource, a screen asset expects a `ImageResource` when it selects an image resource, etc. A list of expected types for internal assets can be found in the [Built-in Resource Types](#built-in-resource-types) section.
:::

Now we just need to register it in the `OnCreate` method of the plugin:

```csharp
Context.ResourceManager.RegisterUriResolver(new PrimitivePropResourceUriResolver(), this);
```

Once the plugin is reloaded, when you select a cube or a sphere in the prop asset, Warudo will create a cube or a sphere in the Unity scene!

## Mod Collection

A common use case of resource providers and resolvers is to provide a collection of mods. For example, if you have 100 prop prefabs in Unity and would like to use them in Warudo, compared to exporting 100 [prop mods](../../modding/prop-mod) to the `Props` directory, you can write a custom resource provider and resolver to load the prefabs directly from the plugin's mod folder (see [Loading Unity Assets](plugins#loading-unity-assets)). This comes with the added benefit that your users would be able to see all of your resources under the same category in the dropdown.

:::tip
For best practices on writing a mod collection plugin, please refer to the [Katana Animations](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3) sample plugin.
:::

## Custom Resource Types

Resources are designed to be generic, so you can use them for any type of data. For example, if you are writing a plugin that lets the user spawn an emote, you may want to create a custom resource type called `Emote`:

```csharp
[AutoCompleteResource("Emote")]
public string Emote; // This will be used by the user to select the emote URI
```

Then write a custom resource provider that provides a list of emote URIs (say `emote://xxx/yyy`) when the query is `"Emote"`, and a custom resource URI resolver that loads the emote data when the URI scheme matches your custom scheme.

## Built-in Resource Types {#built-in-resource-types}

Here is a list of built-in resource types used by the built-in assets:

| Query              | Example(s)                               | Expects                                    |
|--------------------|------------------------------------------|--------------------------------------------|
| `"Character"`          | Character                                | `GameObject `                                |
| `"CharacterAnimation"` | Character, Play Character Idle Animation | `AnimationClip`                              |
| `"Environment"`        | Environment                              | `Scene` or `ValueTuple<ModHost, Scene>`       |
| `"Image"`              | Screen                                   | `Warudo.Plugins.Core.Utils.ImageResource`    |
| `"Music"`              | Music Player                             | `string` (absolute file path)                |
| `"Particle"`           | Throw Prop At Character                  | `GameObject`                                 |
| `"Prop"`               | Prop                                     | `GameObject`                                 |
| `"Sound"`              | Play Sound, Throw Prop At Character      | `AudioClip`                                  |
| `"Video"`              | Screen                                   | `string` (absolute file path)                |

## Thumbnail Resolver

When resource dropdowns are annotated with the `[PreviewGallery]` attribute, the user can click the "Preview Gallery" button to see a grid of thumbnails of the resources. This is useful when the resources are images, props, poses, or any other visual data.

To provide thumbnails, you need to implement the `IResourceUriThumbnailResolver` interface that asynchronously returns a `byte[]` of the thumbnail image data. Then, register the resolver in the plugin's `OnCreate` method:

```csharp
Context.ResourceManager.RegisterUriThumbnailResolver(new MyUriThumbnailResolver(), this);
```

:::tip
For best experience, make sure your thumbnail images can be loaded within 50ms.
:::
