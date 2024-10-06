---
sidebar_position: 1
---

# 씬

씬은 에셋 목록, blueprint 목록, 그리고 해당 씬에 대한 플러그인 설정을 저장하는 JSON 파일이에요. 저장된 씬을 에디터에서 열면, 저장된 에셋이 먼저 생성되고 역직렬화(즉, 복원)됩니다. 그 후에, 저장된 blueprint가 하나씩 인스턴스화되며, 각 노드는 생성되고 역직렬화돼요.

:::info
코드베이스에서는 blueprint를 _graphs_라고 부릅니다.
:::

## 씬 데이터 액세스

현재 열린 씬의 데이터를 `Context.OpenedScene`을 사용하여 접근할 수 있어요. 그런 다음, 씬 내의 에셋, blueprint 등을 접근할 수 있습니다:

```csharp
var scene = Context.OpenedScene;

var assets = scene.GetAssets();
var characterAssets = scene.GetAssets<CharacterAsset>();
var blueprints = scene.GetGraphs();
```

새로운 에셋이나 노드를 인스턴스화할 수 있어요:

```csharp
var newCharacterAsset = scene.AddAsset<CharacterAsset>(); // Instantiate a new character asset
var newCharacterAssetByTypeId = scene.AddAsset("726ab674-a550-474e-8b92-66526a5ad55e"); // Instantiate a new character asset by type ID

var blueprint = scene.GetGraphs().Values.First(); // Get the first blueprint in the scene
var newNode = blueprint.AddNode<ToggleCharacterMeshesNode>(); // Instantiate a new node
var newNodeByTypeId = blueprint.AddNode("e931f780-e41e-40ce-96d0-a4d47ca64853"); // Instantiate a new node by type ID

Context.Service.BroadcastOpenedScene(); // Send the updated scene to the editor
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
