---
sidebar_position: 2
translate_from_version: 2026-01-14
---

# Ports y Triggers

Los ports y triggers pertenecen a [entities](entities) y son posiblemente la parte más importante del scripting de Warudo. Se usan para pasar datos entre entities, activar acciones, y proporcionar interacción del usuario en el editor.

![](/doc-img/en-custom-node-1.png)

![](/doc-img/en-scripting-concepts-4.png)

## Ports de Entrada de Datos {#data-input-ports}

Los data input ports se usan para proporcionar datos a una entity ya sea por el usuario (usando el editor) u otra entity.Los data inputs pueden ser de varios tipos, como strings, números, booleanos, o incluso tipos complejos como [structured data](structured-data.md) o arrays.

Un data input se define como un campo público en una subclase de entity, decorado con el atributo `[DataInput]`. En el ejemplo [Creando Tu Primer Script](../creating-your-first-script.md), vimos un `DataInput` que define un slider de número:

```csharp
[DataInput]
[IntegerSlider(1, 100)]
public int LuckyNumber = 42;
```

Aquí hay algunos ejemplos más:

- **String Input:**

  ```csharp
  [DataInput]
  public string MyName = "Alice";
  ```

- **Enum Input:** (Shown as a dropdown in the editor)

  ```csharp
  public enum Color {
      Red,
      Green,
      Blue
  }
  
  [DataInput]
  public Color MyColor = Color.Red;
  ```

- **Array Input:** (Shown as an editable list in the editor)

  ```csharp
  [DataInput]
  public float[] MyFavoriteNumbers = new float[] { 3.14f, 2.718f };
  ```

This is how they look in the editor (we use a node here, but these data inputs work the same way in assets and plugins):

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-scripting-concepts-2.png" />
</div>
</div>

Note how they are initialized with the default values we specified in the code. These default values will be assigned to the data input again when the user clicks the "Reset" button next to the data input label.

A data input typically has a serializable type ("serializable" here means that the data value can be saved and restored when Warudo is closed and reopened). The following types are serializable by default:

- Primitive types: `int`, `float`, `bool`, `string`, any Enum type
- Unity types: `Vector2`, `Vector3`, `Vector4`, `Color`
- [Structured data](structured-data.md) types
- [Referencias de Assets](#referencias-de-assets)
- Arrays of serializable types

For nodes, it is possible to define non-serializable data inputs that cannot be edited in the editor but instead processed by the node itself. For example, the following code calls the `ToString()` method on the generic `object` data input:

```csharp
[NodeType(Id = "dc28819e-5149-4573-945e-40e81e2874c4", Title = "ToString()", Category = "CATEGORY_ARITHMETIC")]
public class ToStringNode : Node {

    [DataInput]
    public object A; // Not serialized

    [DataOutput]
    [Label("OUTPUT_STRING")]
    public string Result() {
        return A?.ToString();
    }

}
```

Other common data input types that are not serializable but can be passed between nodes include `Dictionary`, `GameObject` and `Quaternion`.

### Attributes {#data-input-attributes}

Data input ports can be annotated with attributes to provide additional context to the editor. For example, the `[IntegerSlider]` attribute we saw earlier specifies that the data input should be displayed as a slider with a range of 1 to 100. Here are the supported attributes:

- `[Label(string label)]`: Specifies the label of the data input.
- `[HideLabel]`: Specifies that the label of the data input should be hidden.
- `[Description(string description)]`: Specifies the description of the data input.
- `[HiddenIf(string methodName)]`: Specifies that the data input should be hidden if the specified method returns `true`. The method must be a `public` or `protected` method in the entity class that returns a `bool`.
  ```csharp
  [DataInput]
  public int MyNumber = 0;
  
  [DataInput]
  [HiddenIf(nameof(IsSecretDataInputHidden))]
  public string SecretDataInput = "I am hidden unless MyNumber is 42!";
  
  public bool IsSecretDataInputHidden() => MyNumber != 42;
  ```
- `[HiddenIf(string dataInputPortName, If @if, object value)]`: Specifies that the data input should be hidden if the specified data input port satisfies the `@if` condition. The value must be a constant.
  ```csharp
  [DataInput]
  public int MyNumber = 0;
  
  [DataInput]
  [HiddenIf(nameof(MyNumber), If.NotEqual, 42)]
  public string SecretDataInput = "I am hidden unless MyNumber is 42!";
  ```
- `[HiddenIf(string dataInputPortName, Is @is)]`: Specifies that the data input should be hidden if the specified data input port satisfies the `@is` condition.
  ```csharp
  [DataInput]
  public CharacterAsset MyCharacter;
  
  [DataInput]
  [HiddenIf(nameof(MyCharacter), Is.NullOrInactive)]
  public string SecretDataInput = "I am hidden unless MyCharacter is selected and active!";
  ```
- `[DisabledIf(...)]`: Similar to `[HiddenIf(...)]`, but the data input is disabled instead of hidden.
- `[Hidden]`: Specifies that the data input should be always hidden. This is useful when you want to use a data input in code but not expose it to the user.
- `[Disabled]`: Specifies that the data input should be always disabled (non-editable). This is useful for array data inputs that have a constant length, or for visualizing data inputs that are always programmatically set, etc.
- `[Section(string title)]`: Specifies that the data input and all subsequent data inputs should be displayed in a new section with the specified title, unless another section is specified.
- `[SectionHiddenIf(string methodName)]`: Requires attribute `[Section]`. Specifies that the section should be hidden if the specified method returns `true`. The method must be a `public` or `protected` method in the entity class that returns a `bool`. The `@if` and `@is` conditions are also supported.
- `[Markdown(bool Primary = false)]`: Specifies that the data input should be displayed as a Markdown text and cannot be edited. The data input must be of type `string`. If `primary` is `true`, the text will be displayed in a larger font size without a color background. See [Text Block](#text-block) for details.

:::info
`[HiddenIf]` and `[DisabledIf]` attributes are evaluated every frame when the asset or node is visible in the editor. Therefore, you should avoid using expensive operations in these methods.
:::

Some attributes are specific to certain data input types:

- `[IntegerSlider(int min, int max, int step = 1)]`: Requires data type `int` or `int[]`. Specifies that the data input should be displayed as an integer slider with the specified range.
- `[FloatSlider(float min, float max, float step = 0.01f)]`: Requires data type `float` or `float[]`. Specifies that the data input should be displayed as a float slider with the specified range.
- `[AutoCompleteResource(string resourceType, string defaultLabel = null)]`: Requires data type `string`. Specifies that the data input should be displayed as an auto-complete list of resources of the specified type. For example, the "Character → Default Idle Animation" data input is defined as `[AutoCompleteResource("CharacterAnimation")]`. Please refer to the [Resource Providers & Resolvers](resource-providers-and-resolvers.md) page for more information.
- `[AutoCompleteList(string methodName, bool forceSelection = false, string defaultLabel = null)]`: Requires data type `string`. Specifies that the data input should be displayed as a dropdown menu generated by the specified method. The method must be a `public` or `protected` method in the entity class that returns a `UniTask<AutoCompleteList>`. Note that the method can be asynchronous. If `forceSelection` is `true`, the user can only select a value from the dropdown list, or the value is assigned `null`.
  ```csharp
  using System.Linq;
  
  [DataInput]
  [AutoComplete(nameof(AutoCompleteVipName), forceSelection: true)]
  public string VipName = "Alice";
  
  protected async UniTask<AutoCompleteList> AutoCompleteVipName() {
      return AutoCompleteList.Single(vipNames.Select(name => new AutoCompleteEntry {
          label = name,  // This is what the user sees
          value = name   // This is what the field stores
      }).ToList());
  }
  
  private List<string> vipNames; // Entity-controlled runtime data
  
  // Some other code should update the vipNames list
  ```
  :::tip
  Autocomplete lists are useful when you want to provide a list of options that are not known at compile time. For example, you can use an autocomplete list to provide a list of files from a directory, a list of emotes from the remote server, etc. They are used very frequently in Warudo's internal nodes and assets!
  :::
- `[MultilineInput]`: Requires data type `string`. Specifies that the data input should be displayed as a multiline text input field.
- `[CardSelect]`: Requires an enum data type. Specifies that the data input should be displayed as a card selection list (similar to "Camera → Control Mode").
  ```csharp
  public enum Color {
      [Label("#00FF00")]
      [Description("I am so hot!")]
      Red,
      [Label("#00FF00")]
      [Description("I am so natural!")]
      Green,
      [Label("#0000FF")]
      [Description("I am so cool!")]
      Blue
  }
  
  [DataInput]
  [CardSelect]
  public Color MyColor = Color.Red;
  ```

### Enums

You can customize the editor labels of enum values by using the `[Label(string label)]` attribute in your enum type. For example:

```csharp
public enum Color {
    [Label("#FF0000")]
    Red,
    [Label("#00FF00")]
    Green,
    [Label("#0000FF")]
    Blue
}
```

As mentioned in the [Attributes](#data-input-attributes) section, you can also use the `[Description(string description)]` and `[Icon(string icon)]` attributes to show the enum input as a list of cards.

:::tip
`icon` should be a single SVG element (e.g., `<svg>...</svg>`). For example:
```html
<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 512 512">
    <path>...</path>
</svg>
```
:::

### Referencias de Assets {#asset-references}

:::warning
Asset references are only available in assets, nodes, and non-plugin structured data.
:::

A data input can be used to reference another asset in the current scene. For example, the following code defines a data input that references a `CharacterAsset`:

```csharp
[DataInput]
public CharacterAsset MyCharacter;
```

In the editor, the user can select a character asset from the dropdown list:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-scripting-concepts-3.png" />
</div>
</div>

You can then access ports and triggers of the referenced asset:

```csharp
[FlowInput]
public Continuation Enter() {
    if (MyCharacter.IsNonNullAndActive()) {
        MyCharacter.EnterExpression("Joy", transient: true); // Make the character smile!
    }
    return Exit;
}
```

:::tip
You can check if the asset is `null` or inactive by using `asset.IsNullOrInactive()`, and vice versa, `asset.IsNonNullAndActive()`.
:::

What if you want to filter the list of assets shown in the dropdown? You can use the `[AssetFilter(string methodName)]` attribute to specify a method that is used to filter the assets in the scene. The method must be a `public` or `protected` method that receives a parameter of the asset type and returns a `bool`. For example:

```csharp
[DataInput]
[AssetFilter(nameof(FilterCharacterAsset))]
public CharacterAsset MyCharacter;

protected bool FilterCharacterAsset(CharacterAsset character) {
    return character.Active; // Only show active characters
}
```

### Accediendo a Data Inputs Programáticamente {#accessing-data-inputs}

Let's say you have an entity. There are two ways to read its data inputs:

1. Access the data input field directly. For example, if you have a node with a _public_ data input field `public int MyNumber = 42;`, you can read the value of `MyNumber` directly by using `node.MyNumber`.
2. Use the `T GetDataInput<T>(string key)` or `object GetDataInput(string key)` method. This method is available in all entities and returns the value of the data input with the specified name. For example, if you have a node with a data input named `MyNumber`, you can read the value of `MyNumber` by using `node.GetDataInput<int>("MyNumber")` (or `node.GetDataInput<int>(nameof(node.MyNumber))` which is stylistically preferred).

:::tip
The key of a port is always the name of the field, unless the port is dynamically added (see [Dynamic Ports](#dynamic-ports))
:::

The second method is useful when you need to access data inputs dynamically, for example, when you need to access a data input based on a string variable. (Also see [Dynamic Ports](#dynamic-ports).) Otherwise, the two methods do not have practical differences.

Similarly, to write to a data input, you can either assign a value to the data input field directly or use the `void SetDataInput<T>(string key, T value)` method. For example, to set the value of a data input named `MyNumber`, you can use `node.MyNumber = 42` or `node.SetDataInput("MyNumber", 42, broadcast: true)` (or `node.SetDataInput(nameof(node.MyNumber), 42, broadcast: true)` which is stylistically preferred).

:::tip
Another alternative to `SetDataInput(nameof(MyNumber), 42, broadcast: true)` is to write:
```csharp
MyNumber = 42;
BroadcastDataInput(nameof(MyNumber));
```
:::

However, in this case, the second method is **strongly recommended** due to two reasons:

1. It ensures [watchers](operations#watchers) of this data input are notified of the change.
2. By setting the `broadcast` parameter to `true`, the change is sent to the editor. Otherwise, you need to use `BroadcastDataInput(string key)` to manually send the change to the editor.

You should use the first method only if:

1. You are updating the data input extremely frequently, and you do not need to send every change to the editor, i.e., you will call `BroadcastDataInput(string key)` sporadically. This saves performance.
2. You explicitly do not want to notify watchers of this data input. This is rare.

## Ports de Salida de Datos

Data output ports are node-specific and are used to provide data to other nodes. A data output is defined as a public method in a node subclass, decorated with the `[DataOutput]` attribute. The method can return any non-void type. Here is an example:

```csharp
[DataOutput]
public int RandomNumber() {
    return Random.Range(1, 100); // Return a random number between 1 and 100
}
```

Data outputs support a subset of [data input attributes](#data-input-attributes): `[Label]`, `[HideLabel]`, `[Description]`, `[HiddenIf]`, and `[DisabledIf]`.

## Ports de Entrada de Flujo {#flow-input-ports}

Flow input ports are node-specific and are used to receive flow signals from other nodes to trigger certain actions.A flow input is defined as a public method in a node subclass, decorated with the `[FlowInput]` attribute. The method must return a flow output `Continuation`. Here is an example:

```csharp
[DataInput]
public bool FlowToA = true;

[FlowInput]
public Continuation Enter() {
    return FlowToA ? ExitA : ExitB; // If FlowToA is true, trigger ExitA; otherwise, trigger ExitB
}

[FlowOutput]
public Continuation ExitA;

[FlowOutput]
public Continuation ExitB;
```

Flow inputs support a subset of [data input attributes](#data-input-attributes): `[Label]`, `[HideLabel]`, and `[Description]`. Note that if the method is named `Enter()` and without a `[Label]` attribute, the label will be automatically set to the word "Enter" localized in the editor's language.

## Ports de Salida de Flujo

Flow output ports are node-specific and are used to send flow signals to other nodes.A flow output is defined as a public field in a node subclass, decorated with the `[FlowOutput]` attribute. The field must be of type `Continuation`. See [Flow Input Ports](#flow-input-ports) for an example.

Flow outputs support a subset of [data input attributes](#data-input-attributes): `[Label]`, `[HideLabel]`, and `[Description`]. Note that if the field is named `Exit` and without a `[Label]` attribute, the label will be automatically set to the word "Exit" localized in the editor's language.

## Text Block {#text-block}

A text block is defined as a public string field in an entity subclass, decorated with the `[Markdown]` attribute.

There are two styles of text blocks:

- with background: `[Markdown]` ;
- and without background `[Markdown(Primary = true)]` .

Text block support basic **Markdown syntax** and use strict line-break mode. That is:

- A single `\n` does not create a line break and is treated like a space;
- Two spaces followed by `\n` (i.e. `␠␠\n`) create a line break without starting a new paragraph;
- Two consecutive `\n` (i.e. `\n\n`) create a line break and start a new paragraph.

Text block also supports **embedded HTML**, such as:

```csharp
[Markdown]
public string TextWithHtml = "Hello <p style='color: red;'>Hello</p> Hello";
```

You can modify the string variable and then use `BroadcastDataInput` to update the display of the text block:

```csharp
MarkdownVariable = "New Text";
BroadcastDataInput(nameof(MarkdownVariable));
```

We recommend using `Watch` or `WatchAll` in `OnCreate()` to update the text block.  
Only update the text block in `OnUpdate()` when necessary, as doing so incurs higher performance overhead.

Note:  The attributes of `DataInput` such as `[HiddenIf(string methodName)]` also apply to text blocks.

Here is a detailed example:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(
     Id = "Markdown-Example-Node",
     Title = "Markdown Example Node",
     Category = "Examples")]
public class MarkdownExampleNode : Node {

    [Markdown]
    public string Markdown = "### Title\n\nHello1\nHello2  \nHello3\n\n<p style='color: red;'>Hello4</p>\n\n- list1\n- list2\n\n**bold** *italic* `code`";

    [Markdown(Primary = true)]
    public string MarkdownPrimary = "### Title\n\nHello1\nHello2  \nHello3\n\n<p style='color: red;'>Hello4</p>\n\n- list1\n- list2\n\n**bold** *italic* `code`";

    [DataInput]
    [FloatSlider(0, 1)]
    public float A = 0.5f;

    [DataInput]
    [FloatSlider(0, 1)]
    public float B = 0.5f;

    [Markdown(Primary = true)]
    public string MarkdownDynamicPrimary = "A: 0.5  \nB: 0.5";

    protected override void OnCreate() {
        base.OnCreate();
        WatchAll(new[] {
            nameof(A),
            nameof(B),
        }, () => {
            MarkdownDynamicPrimary = "A: " + A.ToString() + "  \nB: " + B.ToString();
            BroadcastDataInput(nameof(MarkdownDynamicPrimary));
        });
    }

    [Markdown]
    public string MarkdownDynamic = "";

    public override void OnUpdate() {
        base.OnUpdate();
        string time = "RealTime: " + Time.time.ToString();

        MarkdownDynamic = time;
        BroadcastDataInput(nameof(MarkdownDynamic));
    }
}
```

## Triggers

Triggers are, simply put, buttons that can be clicked in the editor to trigger certain actions. A trigger is defined as a public method in an entity subclass, decorated with the `[Trigger]` attribute. Here is an example:

```csharp
[Trigger]
public void ShowPopupMessage() {
    Context.Service.PromptMessage("Title of the message", "Content of the message");
}
```

Which is rendered in the editor as:

![](/doc-img/en-scripting-concepts-5.png)

When the user clicks the button, the `ShowPopupMessage` method is called.

Triggers support a subset of [data input attributes](#data-input-attributes): `[Label]`, `[HideLabel]`, `[Description]`, `[HiddenIf]`, `[DisabledIf]`, `[Section]`, and `[SectionHiddenIf]`.

### Triggers Asíncronos

Trigger methods can be asynchronous. For example, if you want to show a message after a delay, you can use `UniTask`:

```csharp
[Trigger]
public async void ShowPopupMessageAfterDelay() { // Note the async keyword
    await UniTask.Delay(TimeSpan.FromSeconds(1)); // Wait for 1 second
    Context.Service.PromptMessage("Title of the message", "Content of the message");
}
```

A more practical example is to show a confirmation dialog before proceeding:

```csharp
[Trigger]
public async void ShowConfirmationDialog() {
    bool confirmed = await Context.Service.PromptConfirmation("Are you sure?", "Do you want to proceed?");
    if (confirmed) {
        // Proceed
    }
}
```

### Invocando Triggers Programáticamente

Similar to [accessing data inputs](#accessing-data-inputs), you can invoke triggers programmatically by calling the method directly or using the `void InvokeTrigger(string key)` method on the entity.For example, to invoke a trigger named `ShowPopupMessage`, you can use `entity.ShowPopupMessage()` or `entity.InvokeTrigger("ShowPopupMessage")`.

## Orden de Ports

By default, ports are automatically ordered based on their declaration order in the entity class.However, you can manually specify the order of ports by using the `order` parameter in the `[DataInput]`, `[DataOutput]`, `[FlowInput]`, `[FlowOutput]`, and `[Trigger]` attributes. For example:

```csharp
[DataInput(order = 1)]
public int MyNumber = 42;

[DataInput(order = -1)]
public string MyString = "Hello, World!"; // This will be displayed before MyNumber
```

## Ports Dinámicos

Sometimes, you want to dynamically add or remove ports based on certain conditions.For example, the built-in **Multi Gate** node has a dynamic number of flow outputs (exits) based on the "Exit Count" data input.

To achieve this, you can access the underlying port collections at runtime:

```csharp
FlowOutputPortCollection.GetPorts().Clear(); // Clear all flow output ports
for (var i = 1; i <= ExitCount; i++) {
    AddFlowOutputPort("Exit" + i, new FlowOutputProperties {
        label = "EXIT".Localized() + " " + i
    }); // Create a new flow output port for each exit
}
Broadcast(); // Notify the editor that the ports have changed
```

:::tip
You can find the full source code of the **Multi Gate** node [here](https://gist.github.com/TigerHix/8747793a68f0aa15a469f9823812e221).
:::

:::info
You should not add or remove ports frequently (i.e., on every frame), as it may cause performance issues.
:::

## Propiedades de Ports Dinámicos

You can also dynamically change the properties of a port, such as label, description, or type-specific properties.For example, consider the following:

```csharp
[DataInput]
[IntegerSlider(1, 10)]
public int CurrentItem = 1;

private int itemCount = 10; // Assume we have 10 items initially
```

The range of the `[IntegerSlider]` is determined at compile time. But if `itemCount` changes, we will want to update the range of the slider. To do this, you can access the port properties directly:

```csharp
var properties = GetDataInputPort(nameof(CurrentItem)).Properties;
properties.description = $"Select from {itemCount} items."; // Change the description

var typeProperties = (IntegerDataInputTypeProperties) properties.typeProperties; // Get type-specific properties
typeProperties.min = 1;
typeProperties.max = itemCount; // Change the slider range

BroadcastDataInputProperties(nameof(CurrentItem)); // Notify the editor that the properties have changed
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
{name: 'hanekit', github: 'hanekit'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
