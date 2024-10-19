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
    - **资产：** 当用户从场景中删除资产或卸载场景时调用。
    - **节点：** 当用户从蓝图中删除节点或卸载场景时调用。节点总是在资产之后销毁。
- **`Deserialize(TSerialized data)`:** 实体从存档状态转出时调用。例如，当刚刚打开并加载场景时，将对资产调用此方法。_您通常不需要调用此方法。_
- **`Serialize()`:** 当实体需要转为存档状态时调用。例如，当场景即将保存或需要发送到编辑器时，将对资产调用此方法。_您通常不需要调用此方法。_

资产、节点和插件拥有另外几个生命周期阶段：

- **`OnUpdate()`:** 在实体未销毁时每一帧调用。这类似于 Unity 的 `Update()` 方法。
  - `OnPreUpdate()` 和 `OnPostUpdate()` 分布在 `OnUpdate()` 之前和之后调用。
- **`OnLateUpdate()`:** 在 `OnUpdate()` 之后的每一帧调用 。这类似于 Unity 的 `LateUpdate()` 方法。
- **`OnFixedUpdate()`:** 在每个固定帧调用。这类似于 Unity 的  `FixedUpdate()` 方法。
- **`OnEndOfFrame()`:** 在帧末调用。这类似于使用 Unity 的 [`WaitForEndOfFrame`](https://docs.unity3d.com/ScriptReference/WaitForEndOfFrame.html)。
- **`OnDrawGizmos()`:** 当实体应绘制 Gizmo 时调用。这类似于 Unity 的 `OnDrawGizmos()` 方法。

:::info
更新遵循以下顺序：插件 → 资产 → 节点。
:::

您可以调用这些生命周期方法，以更方便地为实体增加自定义行为。例如，要在每一帧上运行某些内容，就可以调用 `OnUpdate()` 方法。

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'Eco', github: 'EcoFur'},
],
}} />
