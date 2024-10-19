---
sidebar_position: 2
---

# 实体（Entities）

实体是在[场景（Scene）](scene) 中（如节点、资产）或跨场景（如插件）持续存在的对象。在 Warudo 中编写脚本就是定义您自己的实体类型并与 Warudo 主窗口场景交互。您可以使用 Warudo 提供的基本类来定义自己的实体类：

- **节点：** 继承 `Node` 来创建新的节点。节点可自定义数据输入、数据输出、流输入、流输出和触发器。通过将节点从节点控制板拖到蓝图编辑器来实例化节点。（节点实例会与蓝图一同保存）
- **资产：** 继承 `Asset` 来创建新的资产。资产类型可以定义数据输入和触发器。使用 **添加资产** 菜单实例化资产。（资产实例会与蓝图一同保存）
- **插件：** 继承 `Plugin` 来创建新的插件。插件类型可以定义数据输入和触发器。当 Warudo 启动时或热重载插件时，将加载插件。每种插件类型只有一个插件实例，并且数据输入跨场景保存。
- **结构数据：** 继承 `StructuredData` 来创建新的 [结构体](structured-data) 。结构体是一种复杂的数据类型，可用作节点、资产或插件中的“嵌入式”数据输入。

:::info
在创建您的[第一个脚本教程](../creating-your-first-script.md)中，我们创建了一个名为 `HelloWorldNode` 的自定义节点和一个名为 的 `CookieClickerAsset` 自定义资产。
:::

:::tip
实体的概念与 Unity 的 MonoBehaviour 大致相似，但采用了更规范易用的方式。
:::

实体实例化后，Warudo 会自动为其分配一个 UUID（唯一标识符），此 UUID 用于标识场景中的实体，并与场景一起保存。您也可以通过 `Id` 属性获取 UUID。

实体类可以包含常规 C# 字段和方法。但是，要与 Warudo 主窗口场景交互，您需要在实体中创建 [**端口和触发器**](ports-and-triggers)。所有实体都可以具有 [数据输入端口](ports-and-triggers#data-input-ports) 和 [触发器](ports-and-triggers#triggers)，而节点还可以具有 [数据输出端口](ports-and-triggers#data-output-ports) 、[流输入端口](ports-and-triggers#flow-input-ports) 和 [流输出端口](ports-and-triggers#flow-output-ports)。

![](/doc-img/en-custom-node-1.png)

![](/doc-img/en-scripting-concepts-4.png)

## 生命周期 {#lifecycle}

实体的生命周期由多个阶段组成：

- **`OnCreate()`:** 在创建实体时调用。您可以
    - **资产：** 当用户将新资产添加到场景中时，或加载场景时调用。
    - **节点：** 当用户将新节点添加到蓝图中或加载场景时调用。节点始终在资产之后创建。
    - **插件：** 当 Warudo 在启动时加载插件或热重载插件时调用。
    - **结构体：** 在创建父实体时调用，或者当用户将新的结构体添加到结构体数组时调用。
- **`OnDestroy()`:** 在实体被销毁时调用。您可以在这里释放资源。
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
