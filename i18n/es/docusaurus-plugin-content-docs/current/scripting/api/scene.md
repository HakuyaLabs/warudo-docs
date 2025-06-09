---
sidebar_position: 1
---

# Scene

Una scene es un archivo JSON que almacena una lista de assets, una lista de blueprints, y configuraciones de plugin específicas de esa escena. Cuando abres una escena guardada en el editor, los assets guardados son creados y deserializados (es decir, restaurados) primero; luego, los blueprints guardados son instanciados uno por uno, con nodos en cada uno creados y deserializados.

:::info
En el código base, los blueprints son llamados _graphs_.
:::

## Accediendo a Datos de Scene

Puedes acceder a los datos de la escena actualmente abierta usando `Context.OpenedScene`. Luego, puedes acceder a los assets en escena, blueprints, etc.:

```csharp
var scene = Context.OpenedScene;

var assets = scene.GetAssets();
var characterAssets = scene.GetAssets<CharacterAsset>();
var blueprints = scene.GetGraphs();
```

Puedes instanciar nuevos assets o nodos:

```csharp
var newCharacterAsset = scene.AddAsset<CharacterAsset>(); // Instanciar un nuevo asset de personaje
var newCharacterAssetByTypeId = scene.AddAsset("726ab674-a550-474e-8b92-66526a5ad55e"); // Instanciar un nuevo asset de personaje por ID de tipo

var blueprint = scene.GetGraphs().Values.First(); // Obtener el primer blueprint en la escena
var newNode = blueprint.AddNode<ToggleCharacterMeshesNode>(); // Instanciar un nuevo nodo
var newNodeByTypeId = blueprint.AddNode("e931f780-e41e-40ce-96d0-a4d47ca64853"); // Instanciar un nuevo nodo por ID de tipo

Context.Service.BroadcastOpenedScene(); // Enviar la escena actualizada al editor
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
