---
sidebar_position: 1
translate_from_version: 2024-06-16
---

# シーン

シーンは、アセットのリスト、ブループリントのリスト、そのシーン固有のプラグイン設定を保存するJSONファイルです。保存済みのシーンをエディターで開くと、まず保存済みのアセットが作成・デシリアライズ（復元）されます。次に、保存済みのブループリントが1つずつインスタンス化され、それぞれに含まれるノードが作成・デシリアライズされます。

:::info
コードベースでは、ブループリントを_グラフ_と呼びます。
:::

## シーンデータへのアクセス

現在開いているシーンのデータには、`Context.OpenedScene`を使用してアクセスできます。そこからシーン内のアセット、ブループリントなどにアクセスできます。

```csharp
var scene = Context.OpenedScene;

var assets = scene.GetAssets();
var characterAssets = scene.GetAssets<CharacterAsset>();
var blueprints = scene.GetGraphs();
```

新しいアセットまたはノードをインスタンス化できます。

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
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
