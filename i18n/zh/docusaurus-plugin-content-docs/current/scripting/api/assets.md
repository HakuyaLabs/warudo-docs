---
sidebar_position: 40
translate_from_version: 2026-10-06
---

# 资源

资源是在场景中实现某项功能或行为的独立对象。与节点不同，资源通常封装了更复杂的逻辑。你可以将资源视为程序中的类，它们更接近 Unity 的 `MonoBehaviour`。

## 类型定义

你可以创建资源类型，在场景中实例化并保存。资源类型继承自 `Asset`，并使用 `[AssetType]` 特性标记，如下所示：

```csharp
[AssetType(
    Id = "c6500f41-45be-4cbe-9a13-37b5ff60d057",
    Title = "Hello World",
    Category = "CATEGORY_DEBUG",
    Singleton = false
)]
public class HelloWorldAsset : Asset {
    // 资源的实现
}
```

各参数的说明如下：

- **`Id`**：资源类型的唯一标识符；你应该为每个新的资源类型[生成一个新的 GUID](https://www.guidgenerator.com/online-guid-generator.aspx)。注意，这与资源实例的 UUID（`asset.Id`）不同。
- **`Title`**：在*添加资源*菜单中显示的资源类型名称。
- **`Category`**：可选。资源在*添加资源*菜单中所属的分类。
- **`Singleton`**：可选。如果设为 `true`，场景中只能存在该资源的一个实例。默认值为 `false`。

:::info

要使用内置的默认分类，请将 `Category` 参数设为下表中的某个字符串键。表格列出了各键及其对应的英文显示名称：

| 分类键                          | 英文显示名称         |
| ------------------------------- | -------------------- |
| `CATEGORY_CHARACTERS`           | Characters           |
| `CATEGORY_PROP`                 | Props                |
| `CATEGORY_ENVIRONMENTS`         | Environment          |
| `CATEGORY_CINEMATOGRAPHY`       | Cinematography       |
| `CATEGORY_EXTERNAL_INTEGRATION` | External Integration |
| `CATEGORY_MOTION_CAPTURE`       | Motion Capture       |

:::

## 组件

资源类型可以定义数据输入和触发器。与节点不同，资源没有数据输出，也没有流输入或流输出。

![](/doc-img/en-scripting-concepts-4.png)

## 生命周期

资源的生命周期阶段列在[实体](entities#lifecycle)页面中。你可以重写这些方法来执行各种任务；例如，`OnUpdate()` 会在每一帧调用，类似于 Unity 的 `Update()` 方法。

## 激活状态 {#active-state}

与节点不同，资源具有激活状态，用来表示资源是否处于“激活”状态，即是否已准备好使用。例如，如果角色资源没有选择 `源`，它会在编辑器中显示为未激活。

![](/doc-img/en-custom-asset-1.png)

默认情况下，资源在创建时**不会激活**。你可以调用 `SetActive(bool state)` 来设置资源的激活状态。例如，如果资源始终可用，可以在 `OnCreate` 方法中将其激活：

```csharp
public override void OnCreate() {
    base.OnCreate();
    SetActive(true);
}
```

如果资源只有在连接到外部服务器（例如远程追踪设备）时才能工作，可以仅在连接成功建立后将其激活：

```csharp
[DataInput]
public string RemoteIP = "127.0.0.1";

[DataInput]
public string RemotePort = "12345";

public override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(RemoteIP), nameof(RemotePort) }, ResetConnection); // 当 RemoteIP 或 RemotePort 改变时，重置连接
}

protected void ResetConnection() {
    SetActive(false); // 在连接建立之前保持未激活状态
    if (ConnectToRemoteServer(RemoteIP, RemotePort)) {
        SetActive(true);
    }
}
```

:::tip

资源是否“已准备好使用”，完全由你决定。Warudo 内置资源遵循的惯例是：当资源正常运行所需的所有数据输入都已设置时，将资源设为激活状态。

:::

## 创建 GameObject

你可以随时在（Unity）场景中创建 GameObject。例如，以下资源会在创建时创建一个立方体 GameObject，并在销毁时销毁该 GameObject：

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

但是，用户无法移动这个立方体，因为没有控制它的数据输入！你可以添加数据输入来控制立方体的位置、缩放等属性，但更简单的方法是继承 `GameObjectAsset` 类型：

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

`GameObjectAsset` 会替你处理 GameObject 的创建和销毁，并提供一个 `Transform` 数据输入，让用户可以控制 GameObject 的位置、旋转和缩放：

![](/doc-img/en-custom-asset-2.png)

:::tip

什么时候应该使用 `GameObjectAsset`？如果你的资源是“用户可以在（Unity）场景中移动的对象”，那么继承 `GameObjectAsset` 通常是个不错的选择。

:::

## 事件

`Asset` 类型会触发以下事件，你可以监听这些事件：

- **`OnActiveStateChange`**：资源的激活状态改变时调用。
- **`OnSelectedStateChange`**：资源在编辑器中被选中或取消选中时调用。
- **`OnNameChange`**：资源名称改变时调用。

例如，内置的 [Leap Motion 追踪](../../mocap/leap-motion)资源会监听 `OnSelectedStateChange` 事件，在资源被选中时，在（Unity）场景中显示 Leap Motion 控制器模型。

```csharp
public override void OnCreate() {
    base.OnCreate();
    OnSelectedStateChange.AddListener(selected => {
        if (selected) {
            // 显示模型
        } else {
            // 隐藏模型
        }
    });
}
```

## 代码示例

### 基础

- [AnchorAsset.cs](https://gist.github.com/TigerHix/c549e984df0be34cfd6f8f50e741aab2)  
Attachable / GameObjectAsset 示例。

### 进阶

- [CharacterPoserAsset.cs](https://gist.github.com/TigerHix/8413f8e10e508f37bb946d8802ee4e0b)  
使用 IK 锚点为角色摆姿势的自定义资源。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'Hane', github: 'hanekit'},
  ],
}} />

