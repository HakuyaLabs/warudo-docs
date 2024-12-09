---
sidebar_position: 30
---

# Nodes

Nodes are units of logic that can be connected together to create complex behaviors. They can be thought as functions in a program but with a visual representation.

## Type Definition

You can create node types that can be instantiated and stored in a blueprint. A node type inherits from the `Node` type and is decorated with the `[NodeType]` attribute, like below:

```csharp
[NodeType(
    Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660",
    Title = "Hello World",
    Category = "CATEGORY_DEBUG",
    Width = 1f
)]
public class HelloWorldNode : Node {
    // Node implementation
}
```

Here's a summary of the parameters:

- **`Id`**: A unique identifier for the node type; you should [generate a new GUID](https://www.guidgenerator.com/online-guid-generator.aspx) for each new node type. Note that this is different from the node instance's UUID (`node.Id`).
- **`Title`**: The name of the node type that will be displayed in the node palette.
- **`Category`**: Optional. The group of the node in the node palette.
- **`Width`**: Optional. The width of the node, which is by default `1f`. A node with a width of `2f` will take up twice the space of a node with a width of `1f`.

:::info
Here are some common node categories you can use: `CATEGORY_ARITHMETIC`, `CATEGORY_ASSETS`, `CATEGORY_BLENDSHAPES`, `CATEGORY_CHARACTERS`, `CATEGORY_DATA`, `CATEGORY_DEBUG`, `CATEGORY_EVENTS`, `CATEGORY_CONTROL_FLOW`, `CATEGORY_INPUT`, `CATEGORY_MOTION_CAPTURE`, `CATEGORY_INTERACTIONS`.

You can also use your own category name, but the above categories are automatically localized to the user's language.
:::

## Components

A node type can define data inputs, data outputs, flow inputs, flow outputs, and triggers.

![](/doc-img/en-custom-node-1.png)

## Lifecycle

In addition to the lifecycle stages listed on the [Entities](entities#lifecycle) page, nodes have the following additional lifecycle stages:

- **`OnAllNodesDeserialized()`:** Called after all nodes in the belonging blueprint are deserialized. This is useful when you need to access other nodes in the same blueprint.
- **`OnUserAddToScene()`:** Called when the node is just instantiated in the blueprint editor, by the user dragging it from the node palette.

## Triggering Flows

You can trigger an output flow by returning the `Continuation` of the flow output in a flow input method. For example:

```csharp
[FlowInput]
public Continuation Enter() {
    // Do something
    return Exit;
}

[FlowOutput]
public Continuation Exit;
```

If your flow ends here, you can return `null` to indicate that the flow has ended.

```csharp
[FlowInput]
public Continuation Enter() {
    // Do something
    return null;
}
```

Sometimes, you may want to delay the flow output or trigger a flow output manually. You can use the `InvokeFlow(string flowOutputPortKey)` method to trigger a flow output. For example:

```csharp
[FlowInput]
public Continuation Enter() {
    async void TriggerExitLater() {
        await UniTask.Delay(TimeSpan.FromSeconds(5));
        InvokeFlow(nameof(Exit)); // Start a new flow from the "Exit" output port
    }
    return null; // You still need to return a Continuation. Since *this* flow technically ends here, we return null
}
```

## Non-Serializable Data Inputs & Outputs

One thing special about nodes is that they can have non-serializable data inputs and outputs (you can't do that in assets or plugins - they will just not display at all). This allows nodes to pass, e.g., Unity objects like `GameObject` or `Texture2D` between each other and process them.

You can even have a generic data input or output, like this:

```csharp
[DataInput]
public object MyGenericInput; // Note it's 'object', not 'Object'

[DataOutput
public object MyGenericOutput() => ...
```

Data output port of any type can be connected to `MyGenericInput` (the value will just be upcast to `object`). Conversely, `MyGenericOutput` can be connected to any data input port, but the value received by the input port will be `null` if the input port type is not compatible with the underlying type of what `MyGenericOutput` returns.

## Type Converters

When connecting nodes, you will notice Warudo will automatically convert the data type if possible. For example, it is possible to connect a `float` output to an `int` input - the value is simply truncated.

You can register custom type converters using the `DataConverters` class. The easiest way is to implement the `DataConverter<T1, T2>` class:

```csharp
public class MyFloatToIntConverter : DataConverter<float, int> {
    public override int Convert(float data) => (int) data;
}
```

Then, register the converter in the `OnCreate` method of your [plugin](plugins):

```csharp
public override void OnCreate() {
    base.OnCreate();
    DataConverters.RegisterConverter(new MyFloatToIntConverter());
}
```

:::caution
You should not register type converters in your node type's `OnCreate` - you will register them each time a node instance is created!
:::

## Code Examples

### Basic

- [ExampleNode.cs](https://github.com/HakuyaLabs/WarudoPlaygroundExamples/blob/master/ExampleNode.cs)  
Standard example of node, showing the basic format of various node components.

- [StructuredDataExampleNode.cs](https://gist.github.com/TigerHix/81cfa66a8f810165c426d1b5157677b5)  
Creating "inner" data types. (StructuredData)

- [GetRandomSoundNode.cs](https://gist.github.com/TigerHix/f0f1a7e3c53ca65450fdca1ff06eb343)  
Get Random Sound node.

- [LiteralCharacterAnimationSourceNode.cs](https://gist.github.com/TigerHix/2dc58213defe400ddb280a8cc1e6334b)  
Character Animation (source) node.

- [SmoothTransformNode.cs](https://gist.github.com/TigerHix/eaf8e05e5e1b687b8265420b9943903d)  
Smooth Transform node.

### Advanced

- [FindAssetByTypeNode.cs](https://gist.github.com/TigerHix/ab3522bb25669457cc583abc4fb025d2)  
AutoCompleteList (Dropdown) example.

- [MultiGateNode.cs](https://gist.github.com/TigerHix/8747793a68f0aa15a469f9823812e221)  
Dynamic data / flow ports example.

- [ThrowPropAtCharacterNode.cs](https://gist.github.com/TigerHix/18e9f20152c0cfac38fd5528c7af16b6)  
Throw Prop At Character.

- [SpawnStickerNode.cs](https://gist.github.com/TigerHix/fe35442e9052cd8c4ea80e0261349321)  
Spawn Local / Online Image Sticker.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
