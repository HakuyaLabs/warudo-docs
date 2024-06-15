---
sidebar_position: 130
---

# Generating Blueprints

When you [set up tracking](../../mocap/overview) in Warudo, you will notice that a tracking blueprint is generated. Generating blueprints can be useful especially if you want to preserve some flexibility for the user to modify the blueprint, instead of hard-coding the entire logic in a custom asset or plugin.

## By Code

The recommended way to generate blueprints is to use code. This allows you to control the generation (e.g., conditionally add or remove nodes), and it also ensures you are correctly referencing the node types. The downside is that it is more verbose to write.

Here's a minimal example that generates a blueprint with two nodes: `On Update` and `Show Toast`. The `On Update` node is connected to the `Show Toast` node, so that the toast message is shown each frame.

```csharp
var graph = new Graph {
    Name = "My Awesome Blueprint",
    Enabled = true // Enable the blueprint by default
};

// Add two nodes: On Update and Show Toast
var onUpdateNode = graph.AddNode<OnUpdateNode>();
var toastNode = graph.AddNode<ShowToastNode>();
toastNode.Header = "Hey!";
toastNode.Caption = "This is a toast message!";

// Connect the nodes so that the toast is shown each frame
graph.AddFlowConnection(onUpdateNode, nameof(onUpdateNode.Exit), toastNode, nameof(toastNode.Enter));

// Add the graph to the opened scene
Context.OpenedScene.AddGraph(graph);

// Send the updated scene to the editor
Context.Service.BroadcastOpenedScene();
```

:::tip
The editor automatically formats a blueprint if all nodes are at (0, 0) position. Therefore, you do not need to worry about correctly positioning the nodes. You can still access a node's position by using `node.GraphPosition`.
:::

:::info
Not all built-in node types are included in the Warudo SDK. If you are creating a plugin mod and want to reference a node type that is not included in the SDK, you can use the overloaded `AddNode(string nodeTypeId)` method to create a node by its type ID instead.
:::

## By JSON

The easier (but hacky) way to generate blueprints is to use the built-in "Import Blueprint From JSON" feature in the editor. You can create your blueprint in the editor, export it as JSON, and then store it into your plugin. Then, use the `Service` class to import the JSON file as a blueprint.

```csharp
var fileContents = "..."; // Assume this is the JSON file contents
Context.Service.ImportGraph(fileContents); // Import the blueprint
Context.Service.BroadcastOpenedScene(); // Send the updated scene to the editor
```

Then you can access the generated blueprint by name:

```csharp
var graph = Context.OpenedScene.GetGraphs().Values.First(it => it.Name == "My Awesome Blueprint");
```

As you can see, this is rather hacky and not recommended for production code. The JSON format may change in future versions, and it is not as flexible as generating blueprints by code.
