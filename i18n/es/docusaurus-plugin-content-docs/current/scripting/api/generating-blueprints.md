---
sidebar_position: 130
---

# Generando Blueprints

Cuando [configuras seguimiento](../../mocap/overview) en Warudo, notarás que se genera un blueprint de seguimiento. Generar blueprints puede ser útil especialmente si quieres preservar algo de flexibilidad para que el usuario modifique el blueprint, en lugar de codificar toda la lógica en un asset personalizado o plugin.

## Por Código

La forma recomendada de generar blueprints es usar código. Esto te permite controlar la generación (ej., agregar o quitar nodos condicionalmente), y también asegura que estés referenciando correctamente los tipos de nodo. La desventaja es que es más verboso de escribir.

Aquí hay un ejemplo mínimo que genera un blueprint con dos nodos: `On Update` y `Show Toast`. El nodo `On Update` está conectado al nodo `Show Toast`, para que el mensaje toast se muestre cada frame.

```csharp
var graph = new Graph {
    Name = "My Awesome Blueprint",
    Enabled = true // Habilitar el blueprint por defecto
};

// Agregar dos nodos: On Update y Show Toast
var onUpdateNode = graph.AddNode<OnUpdateNode>();
var toastNode = graph.AddNode<ShowToastNode>();
toastNode.Header = "Hey!";
toastNode.Caption = "This is a toast message!";

// Conectar los nodos para que el toast se muestre cada frame
graph.AddFlowConnection(onUpdateNode, nameof(onUpdateNode.Exit), toastNode, nameof(toastNode.Enter));

// Agregar el grafo a la escena abierta
Context.OpenedScene.AddGraph(graph);

// Enviar la escena actualizada al editor
Context.Service.BroadcastOpenedScene();
```

:::tip
El editor automáticamente formatea un blueprint si todos los nodos están en la posición (0, 0). Por lo tanto, no necesitas preocuparte por posicionar correctamente los nodos. Aún puedes acceder a la posición de un nodo usando `node.GraphPosition`.
:::

:::info
No todos los tipos de nodo integrados están incluidos en el Warudo SDK. Si estás creando un plugin mod y quieres referenciar un tipo de nodo que no está incluido en el SDK, puedes usar el método sobrecargado `AddNode(string nodeTypeId)` para crear un nodo por su ID de tipo en su lugar.
:::

## Por JSON

La forma más fácil (pero hacky) de generar blueprints es usar la característica integrada "Import Blueprint From JSON" en el editor. Puedes crear tu blueprint en el editor, exportarlo como JSON, y luego almacenarlo en tu plugin. Luego, usa la clase `Service` para importar el archivo JSON como un blueprint.

```csharp
var fileContents = "..."; // Asume que esto es el contenido del archivo JSON
Context.Service.ImportGraph(fileContents); // Importar el blueprint
Context.Service.BroadcastOpenedScene(); // Enviar la escena actualizada al editor
```

Luego puedes acceder al blueprint generado por nombre:

```csharp
var graph = Context.OpenedScene.GetGraphs().Values.First(it => it.Name == "My Awesome Blueprint");
```

Como puedes ver, esto es bastante hacky y no se recomienda para código de producción. El formato JSON puede cambiar en versiones futuras, y no es tan flexible como generar blueprints por código.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
