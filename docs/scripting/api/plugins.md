---
sidebar_position: 50
---

# Plugins

Plugins are the parents of all custom scripts in Warudo. They are also used to perform tasks that are independent of the scene, such as registering [resource providers & resolvers](resource-providers-and-resolvers), authenticating with an external service, or allowing the user to configure the global settings of the plugin's assets and nodes.

:::tip
You can use [Playground](../playground) to load custom assets and nodes without creating a plugin; those will be automatically registered and managed by Warudo's "Core" plugin. However, to distribute your custom assets and nodes to other users, you must create a [plugin mod](../plugin-mod) in which your own plugin will register your custom assets and nodes.
:::

:::info
This page discusses the scripting APIs for creating plugins. Please also refer to the [Plugin Mod](../plugin-mod) page.
:::

## Type Definition

You can create a plugin type that can be loaded and executed in Warudo. A plugin type inherits from the `Plugin` type and is decorated with the `[PluginType]` attribute, like below:

```csharp
[PluginType(
    Id = "hakuyatira.helloworld",
    Name = "Hello World",
    Description = "A simple plugin that says hello to the world.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    Icon = null,
    SupportUrl = "https://docs.warudo.app",
    AssetTypes = new [] { typeof(HelloWorldAsset) },
    NodeTypes = new [] { typeof(HelloWorldNode) }
)]
public class HelloWorldPlugin : Plugin {
    // Plugin implementation
}
```

Here's a summary of the parameters:

- **`Id`**: A unique identifier for the plugin type; we recommend using the reverse domain name notation (e.g., `com.example.pluginname`). Since the plugin type is a singleton, its `Id` property (`plugin.Id`) is identical to the plugin type's ID (`plugin.PluginType.Id`).
- **`Name`**: The name of the plugin.
- **`Description`**: A brief description of the plugin.
- **`Version`**: The version of the plugin. We recommend following the [Semantic Versioning](https://semver.org/) standard.
- **`Author`**: The author of the plugin.
- **`Icon`**: Optional. The SVG icon of the plugin. It is recommended to define a `const string` field to store this value.
- **`SupportUrl`**: Optional. The URL to the support page of the plugin.
- **`AssetTypes`**: An array of asset types in this plugin.
- **`NodeTypes`**: An array of node types in this plugin.

:::tip
`icon` should be a single SVG element (e.g., `<svg>...</svg>`). For example:
```html
<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 512 512">
    <path>...</path>
</svg>
```
:::

## Lifecycle

In addition to the lifecycle stages listed on the [Entities](entities#lifecycle) page, plugins have the following additional lifecycle stages:

- **`OneTimeSetup()`:** Called once when the plugin is loaded by Warudo the first time, determined by the existence of the plugin's data file in `Plugins/Data`.
- **`OnSceneLoaded(Scene scene, SerializedScene serializedScene)`:** Called when a scene is loaded, after all assets and nodes are deserialized.
- **`OnSceneUnloaded(Scene scene)`:** Called when a scene is unloaded.

## Components

A plugin type can define data inputs and triggers.

![](/doc-img/en-custom-plugin-1.png)

## Loading Unity Assets {#loading-unity-assets}

As shown in the [Creating Your First Plugin Mod](../creating-your-first-plugin-mod) tutorial, you can load Unity assets in your plugin's mod folder by using `ModHost`. For example, to load a prefab:

```csharp
var prefab = ModHost.LoadAsset<GameObject>("Assets/MyModFolder/MyPrefab.prefab");
```

To load a text asset (e.g., JSON file):

```csharp
var text = ModHost.LoadAsset<TextAsset>("Assets/MyModFolder/MyText.json");
```

:::tip
Warudo uses [uMod 2.0](https://trivialinteractive.co.uk/products.html) as the underlying modding framework. You can refer to the [ModHost documentation](https://trivialinteractive.co.uk/products/documentation/umod_20/scriptingreference/html/T_UMod_ModHost.htm) for more information on loading assets.
:::

## Toolbar Icon

You may notice some built-in plugins display an icon in the toolbar. Furthermore, the icon is clickable and can be used to open the plugin's settings.

![](/doc-img/en-custom-plugin-2.png)

To achieve this, you can include the `ToolbarItemMixin` [mixin](mixins) in your plugin class:

```csharp
[Mixin]
public ToolbarItemMixin ToolbarItem;

private bool serverConnected; // Assume this is a field that indicates whether the plugin is connected to an external server

public override void OnCreate() {
    base.OnCreate();
    ToolbarItem.SetIcon(ToolbarIcon); // ToolbarIcon is a const string that contains a SVG icon
    ToolbarItem.OnTrigger = () => Context.Service.NavigateToPlugin(Type.Id); // Open the plugin settings when the icon is clicked
}

public override void OnUpdate() {
    base.OnUpdate();
    ToolbarItem.SetEnabled(serverConnected); // Only show the icon if connected to the server
    ToolbarItem.SetTooltip("Connected! Current time: " + DateTime.Now); // Set a tooltip that is displayed when the user hovers over the icon
}
```

## Accessing Owner Plugin from Nodes and Assets

You can access the owner plugin from nodes and assets by using the `Plugin` property. For example:

```csharp
public override void OnCreate() {
    base.OnCreate();
    var myPlugin = (HelloWorldPlugin) Plugin;
    // Do something with myPlugin
}
```

## Plugin vs. Node

Custom scripting in Warudo works best when it complements, not replaces, the [blueprint system](../../blueprints/overview.md). If you find yourself writing a huge `Plugin` class that handles a lot of logic, think carefully if it can be written as a custom node instead. For example, if your idea is to play a fireworks effect when you receive a custom UDP packet over the LAN, instead of a `Plugin` class that does both, it is much better (and easier to maintain) to implement two custom nodes - one that triggers the output flow when the custom UDP packet is received, and one that straightly plays a firework effect when the input flow is received. This also gives your users more flexibility in using your custom nodes in their blueprints.

## Code Examples

### Basic

- [Example plugin](https://gist.github.com/TigerHix/b78aabffc2d03346ff3da526706ce2ca)  
The template of a plugin (single file) with the basic use of `Plugin` class.

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)  
The complete plugin examples (multiple files), including the **Stream Deck Plugin** and **VMC Plugin**.
    - **Stream Deck Plugin**: This plugin communicates with an external application (Warudo's [Stream Deck plugin](https://apps.elgato.com/plugins/warudo.streamdeck)) via WebSocket. It demonstrates the use of the WebSocket service base class `WebSocketService`.
    - **VMC Plugin**: This plugin adds [VMC](https://protocol.vmc.info/english) as a supported motion capture method via registering a `FaceTrackingTemplate` and a `PoseTrackingTemplate`.

### Advanced

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)  
Custom plugin to load AnimationClips from the mod folder and registers them as character animations.
