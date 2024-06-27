---
sidebar_position: 2
---

# Entities

An entity is an object that is persistent in a [scene](scene) (e.g., nodes, assets) or across scenes (e.g., plugins). Scripting in Warudo is all about defining your own entity types and interacting with the Warudo runtime. You can define your own entity type by inheriting a base class provided by Warudo:

- **Node:** Inherit from `Node` to create a new node type. A node type can define data inputs, data outputs, flow inputs, flow outputs, and triggers. A node is instantiated by dragging it from the node palette to the blueprint editor; the node instance is saved along with the blueprint.
- **Asset:** Inherit from `Asset` to create a new asset type. An asset type can define data inputs and triggers. An asset is instantiated by using the *Add Asset* menu; the asset instance is saved along with the scene.
- **Plugin:** Inherit from `Plugin` to create a new plugin type. A plugin type can define data inputs and triggers. A plugin is loaded when Warudo starts, or when the plugin is hot-reloaded. There is only one plugin instance per plugin type, and data inputs are saved across scenes.
- **Structured Data:** Inherit from `StructuredData` to create a new [structured data](structured-data) type. Structured data is a complex data type that can be used as an "embedded" data input in nodes, assets, or plugins.

:::info
In the [Creating Your First Script](../creating-your-first-script.md) tutorial, we created a custom node type called `HelloWorldNode` and a custom asset type called `CookieClickerAsset`.
:::

:::tip
The concept of entities is loosely similar to Unity's MonoBehaviour, but with a more structured approach.
:::

After an entity is instantiated, it is automatically assigned a UUID (unique identifier) by Warudo. You can access it via the `Id` property. This UUID is then used to identify the entity in the scene, and is saved along with the scene.

An entity type can contain regular C# fields and methods. However, to interface with the Warudo runtime, you need to create [**ports and triggers**](ports-and-triggers) in the entity. All entities can have [data input ports](ports-and-triggers#data-input-ports) and [triggers](ports-and-triggers#triggers), while nodes can additionally have [data output ports](ports-and-triggers#data-output-ports), [flow input ports](ports-and-triggers#flow-input-ports), and [flow output ports](ports-and-triggers#flow-output-ports).

![](/doc-img/en-custom-node-1.png)

![](/doc-img/en-scripting-concepts-4.png)

## Lifecycle {#lifecycle}

An entity has a lifecycle that consists of several stages:

- **`OnCreate()`:** Called when the entity is created. This is where you should initialize the instance fields, subscribe to events, etc.
    - **Assets:** Called when a new asset is added to the scene by the user, or when the scene is loaded.
    - **Nodes:** Called when a new node is added to the blueprint by the user, or when the scene is loaded. Nodes are always created _after_ assets.
    - **Plugins:** Called when the plugin is loaded by Warudo on startup, or when the plugin is hot-reloaded.
    - **Structured Data:** Called when the parent entity is created, or when the user adds a new structured data to an array of structured data.
- **`OnDestroy()`:** Called when the entity is destroyed. This is where you should release resources, etc.
    - **Assets:** Called when the asset is removed from the scene by the user, or when the scene is unloaded.
    - **Nodes:** Called when the node is removed from the blueprint by the user, or when the scene is unloaded. Nodes are always destroyed _after_ assets.
- **`Deserialize(TSerialized data)`:** Called when the entity is deserialized from a saved state. For example, this method is called on an asset when the scene is just opened and loaded. _You usually do not need to override this method._
- **`Serialize()`:** Called when the entity needs to be serialized to a saved state. For example, this method is called on an asset when the scene is about to be saved, or need to be sent to the editor. _You usually do not need to override this method._

Assets, nodes, and plugins have extra lifecycle stages:

- **`OnUpdate()`:** Called every frame when the entity is not destroyed. This is similar to Unity's `Update()` method.
  - `OnPreUpdate()` and `OnPostUpdate()` are also provided. They are called before and after `OnUpdate()`, respectively.
- **`OnLateUpdate()`:** Called every frame after `OnUpdate()`. This is similar to Unity's `LateUpdate()` method.
- **`OnFixedUpdate()`:** Called every fixed frame. This is similar to Unity's `FixedUpdate()` method.
- **`OnEndOfFrame()`:** Called at the end of the frame. This is similar to using Unity's [`WaitForEndOfFrame` coroutine](https://docs.unity3d.com/ScriptReference/WaitForEndOfFrame.html).
- **`OnDrawGizmos()`:** Called when the entity should draw gizmos. This is similar to Unity's `OnDrawGizmos()` method.

:::info
The update order is as follows: plugins → assets → nodes.
:::

You can override these lifecycle methods to implement custom behavior for your entities. For example, if you want to run something on every frame, override the `OnUpdate()` method.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
