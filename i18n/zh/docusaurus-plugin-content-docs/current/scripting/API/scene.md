---
sidebar_position: 1
---

# 场景（Scene）

场景（Scene）是一个 JSON 文件，用于存储该场景的资源列表、蓝图列表和插件设置。当您在编辑器中打开已保存的场景时，将首先创建并转出存档状态的资源，然后逐个将保存的蓝图实例化，并创建和转出存档状态中的每个蓝图节点。

:::info
在代码中，蓝图被称为 _graphs（图形）_.
:::

## 访问场景数据

您可以使用 `Context.OpenedScene` 访问当前打开的场景的数据。然后，您可以访问场景中的资源、蓝图等：

```csharp
var scene = Context.OpenedScene;

var assets = scene.GetAssets();
var characterAssets = scene.GetAssets<CharacterAsset>();
var blueprints = scene.GetGraphs();
```

您可以实例化新资产或节点：

```csharp
var newCharacterAsset = scene.AddAsset<CharacterAsset>(); // 实例化新的角色资产
var newCharacterAssetByTypeId = scene.AddAsset("726ab674-a550-474e-8b92-66526a5ad55e"); // 按类 ID 实例化新的角色资产

var blueprint = scene.GetGraphs().Values.First(); // 获取场景中的第一个蓝图
var newNode = blueprint.AddNode<ToggleCharacterMeshesNode>(); // 实例化新节点
var newNodeByTypeId = blueprint.AddNode("e931f780-e41e-40ce-96d0-a4d47ca64853"); // 按类 ID 实例化新节点

Context.Service.BroadcastOpenedScene(); // 将更新的场景发送到编辑器
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'Eco', github: 'EcoFur'},
],
}} />
