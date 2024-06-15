---
sidebar_position: 40
---

# Assets

Assets are self-contained objects that implement a feature or a behavior in the scene. Different from nodes, an asset usually encapsulates a more complex logic. They can be thought of classes in a program and are more similar to Unity's `MonoBehaviour`.

## Type Definition

You can create asset types that can be instantiated and stored in the scene. An asset type inherits from the `Asset` type and is decorated with the `[AssetType]` attribute, like below:

```csharp
[AssetType(
    Id = "c6500f41-45be-4cbe-9a13-37b5ff60d057",
    Title = "Hello World",
    Category = "CATEGORY_DEBUG",
    Singleton = false
)]
public class HelloWorldAsset : Asset {
    // Asset implementation
}
```

Here's a summary of the parameters:

- **`Id`**: A unique identifier for the asset type; you should [generate a new GUID](https://www.guidgenerator.com/online-guid-generator.aspx) for each new asset type. Note that this is different from the asset instance's UUID (`asset.Id`).
- **`Title`**: The name of the asset type that will be displayed in the *Add Asset* menu.
- **`Category`**: Optional. The group of the asset in the *Add Asset* menu.
- **`Singleton`**: Optional. If set to `true`, only one instance of the asset can exist in the scene. Default is `false`.

:::info
Here are some common asset categories you can use: `CATEGORY_INPUT`, `CATEGORY_CHARACTERS`, `CATEGORY_PROP`, `CATEGORY_ACCESSORY`, `CATEGORY_ENVIRONMENT`, `CATEGORY_CINEMATOGRAPHY`, `CATEGORY_EXTERNAL_INTERACTION`, `CATEGORY_MOTION_CAPTURE`.
:::

## Components

An asset type can define data inputs and triggers. Unlike nodes, assets do not have data outputs or flow inputs/outputs.

![](/doc-img/en-scripting-concepts-4.png)

## Lifecycle

Assets have the lifecycle stages listed on the [Entities](entities#lifecycle) page. You can override these methods to perform various tasks; for example, `OnUpdate()` is called every frame, similar to Unity's `Update()` method.

## Active State {#active-state}

Different from nodes, assets have an active state that inform whether the asset is "active", or ready to use. For example, when a character asset does not have a `Source` selected, it is shown as inactive in the editor.

![](/doc-img/en-custom-asset-1.png)

By default, assets are **NOT** active when they are created. You can set the active state of an asset by calling `SetActive(bool state)`. For example, if your asset is always ready to use, you can set it to active in the `OnCreate` method:

```csharp
public override void OnCreate() {
    base.OnCreate();
    SetActive(true);
}
```

If your asset only works when connected to an external server, e.g., a remote tracking device, you can set it to active only if the connection is successfully established:

```csharp
[DataInput]
public string RemoteIP = "127.0.0.1";

[DataInput]
public string RemotePort = "12345";

public override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(RemoteIP), nameof(RemotePort) }, ResetConnection); // When RemoteIP or RemotePort changes, reset the connection
}

protected void ResetConnection() {
    SetActive(false); // Inactive until connection is established
    if (ConnectToRemoteServer(RemoteIP, RemotePort)) {
        SetActive(true);
    }
}
```

:::tip
Determining whether your asset is "ready to use" is entirely up to you. The convention that Warudo's internal assets use is that an asset is active when all data inputs required for the asset to function properly are set.
:::

## Creating GameObjects

You can create GameObjects in the (Unity) scene anytime you want. For example, the following asset creates a cube GameObject when the asset is created, and destroys it when the asset is destroyed:

```csharp
private GameObject gameObject;

public override void OnCreate() {
    base.OnCreate();
    gameObject = GameObject.CreatePrimitive(PrimitiveType.Cube);
}

public override void OnDestroy() {
    base.OnDestroy();
    Object.Destroy(gameObject);
}
```

However, the user cannot move this cube around, since there are no data inputs that control the cube! You can add data inputs to control the cube's position, scale, etc., but an easier way is to inherit from the `GameObjectAsset` type:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Plugins.Core.Assets;

[AssetType(
    Id = "4c00b14a-aed5-423e-abe6-6921032439c5",
    Title = "My Awesome Cube",
    Category = "CATEGORY_DEBUG"
)]
public class MyAwesomeCubeAsset : GameObjectAsset {
    protected override GameObject CreateGameObject() {
        return GameObject.CreatePrimitive(PrimitiveType.Cube);
    }
}
```

The `GameObjectAsset` handles creating and destroying the GameObject for you, and it comes with a `Transform` data input that allows the user to control the GameObject's position, rotation, and scale:

![](/doc-img/en-custom-asset-2.png)

:::tip
When to use `GameObjectAsset`? If your asset is "something that can be moved by the user in the (Unity) scene", then it's probably a good idea to inherit from `GameObjectAsset`.
:::

## Events

The `Asset` type invokes the following events that you can listen to:

- **`OnActiveStateChange`**: Called when the active state of the asset changes.
- **`OnSelectedStateChange`**: Called when the asset is selected or deselected in the editor.
- **`OnNameChange`**: Called when the name of the asset changes.

For example, the built-in [Leap Motion tracking](../../mocap/leap-motion) asset listens to the `OnSelectedStateChange` event to display a Leap Motion controller model in the (Unity) scene when the asset is selected.

```csharp
public override void OnCreate() {
    base.OnCreate();
    OnSelectedStateChange.AddListener(selected => {
        if (selected) {
            // Show the model
        } else {
            // Hide the model
        }
    });
}
```

## Code Examples

### Basic

- [AnchorAsset.cs](https://gist.github.com/TigerHix/c549e984df0be34cfd6f8f50e741aab2)  
Attachable / GameObjectAsset example.

### Advanced

- [CharacterPoserAsset.cs](https://gist.github.com/TigerHix/8413f8e10e508f37bb946d8802ee4e0b)  
Custom asset to pose your character with IK anchors.
