---
sidebar_position: 1
---

# Scene

A scene is a JSON file that stores a list of assets, a list of blueprints, and plugin settings specific to that scene. When you open a saved scene in the editor, the saved assets are created and deserialized (i.e., restored) first; then, the saved blueprints are instantiated one by one, with nodes in each created and deserialized.

:::info
In the codebase, blueprints are called _graphs_.
:::

## Accessing Scene Data

You can access the currently opened scene's data using `Context.OpenedScene`. Then, you can access the in-scene assets, blueprints, etc.:

```csharp
var scene = Context.OpenedScene;

var assets = scene.GetAssets();
var characterAssets = scene.GetAssets<CharacterAsset>();
var blueprints = scene.GetGraphs();
```

You can instantiate new assets or nodes:

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
],
}} />
