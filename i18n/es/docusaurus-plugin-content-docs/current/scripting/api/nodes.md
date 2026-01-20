---
sidebar_position: 30
version: 2024-12-10
---

# Nodos

Los nodos son unidades de lógica que pueden conectarse entre sí para crear comportamientos complejos. Se pueden pensar como funciones en un programa pero con una representación visual.

## Definición de Tipo

Puedes crear tipos de nodo que pueden ser instanciados y almacenados en un blueprint. Un tipo de nodo hereda del tipo `Node` y está decorado con el atributo `[NodeType]`, como se muestra abajo:

```csharp
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

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

Aquí hay un resumen de los parámetros:

| Parámetros |   Tipo    | Tipo de Dato | Descripción                                                                                                                                                                                                                                                                  |
|:---------- |:---------:|:---------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Id`       | Obligatorio | `string`  | El **identificador único** de esta clase de nodo. <br/> Debes [generar un nuevo GUID](https://www.guidgenerator.com/online-guid-generator.aspx) para cada nuevo tipo de nodo. <br/> **Nota:** el `Id` de la clase de nodo es diferente del UUID de una instancia de nodo (`node.Id`). |
| `Title`    | Opcional  | `string`  | El **nombre** de este nodo que se mostrará en la paleta de nodos.                                                                                                                                                                                                        |
| `Category` | Opcional  | `string`  | El **grupo** de este nodo en la paleta de nodos.                                                                                                                                                                                                                              |
| `Width`    | Opcional  |  `float`  | El **ancho** de este nodo, que por defecto es `1f`. <br/> Un nodo con un ancho de `2f` ocupará el doble de espacio que un nodo con un ancho de `1f`.                                                                                                                         |

:::info[ **About Category**]

- You can use the built-in `Category` strings listed in the **Table** below.
	- They will be automatically localized to the program's language.  
- You can also use your own custom `Category` names.
	- We strongly recommend doing this when you want to upload this node to the workshop.  
	- And using the plugin name as the `Category`  allows users to more clearly know that the node they are using is from a plugin, and which plugin is the node from.

:::

**Table** The built-in `Category` strings and their localized text.

| `Category`                      | en                   | zh_CN      | ja                     |
|:------------------------------- |:-------------------- |:---------- |:---------------------- |
| `CATEGORY_ACCESSORIES`          | Accessories          | 配件       | 付属品                 |
| `CATEGORY_ANIMATION`            | Animation            | 动画       | アニメーション         |
| `CATEGORY_ARITHMETIC`           | Arithmetic           | 运算       | 計算                   |
| `CATEGORY_ASSETS`               | Asset                | 资源       | アセット               |
| `CATEGORY_BLENDSHAPES`          | BlendShapes          | BlendShape | BlendShape             |
| `CATEGORY_CHARACTERS`           | Characters           | 角色       | キャラクター           |
| `CATEGORY_CINEMATOGRAPHY`       | Cinematography       | 摄影       | 撮影                   |
| `CATEGORY_CONDITIONALS`         | Conditionals         | 条件       | 条件                   |
| `CATEGORY_CONTROL_FLOW`         | Flow Control         | 流控制     | フローコントロール     |
| `CATEGORY_DATA`                 | Data                 | 数据       | データ                 |
| `CATEGORY_DEBUG`                | Debug                | 调试       | デバッグ               |
| `CATEGORY_ENVIRONMENTS`         | Environment          | 环境       | 環境                   |
| `CATEGORY_EVENTS`               | Events               | 事件       | イベント               |
| `CATEGORY_EXTERNAL_INTEGRATION` | External Integration | 外部集成   | 外部統合               |
| `CATEGORY_GRAPHS`               | Blueprints           | 蓝图       | ブループリント         |
| `CATEGORY_INPUT`                | Input                | 输入       | –                      |
| `CATEGORY_LIGHTS`               | Lights               | 光源       | ライト                 |
| `CATEGORY_LITERALS`             | Literals             | 字面量     | リテラル               |
| `CATEGORY_MOTION_CAPTURE`       | Motion Capture       | 动作捕捉   | モーションキャプチャー |
| `CATEGORY_PROP`                 | Props                | 道具       | 道具                   |
| `CATEGORY_SCENE`                | Scene                | 场景       | Scene                  |
| `CATEGORY_SWITCHES`             | Switches             | 切换       | 切り替え               |
| `CATEGORY_VARIABLES`            | Variables            | 变量       | 変量                   |

## Componentes

A node type can define data inputs, data outputs, flow inputs, flow outputs, and triggers.

![](/doc-img/en-custom-node-1.png)

## Ciclo de Vida

In addition to the lifecycle stages listed on the [Entities](entities#lifecycle) page, nodes have the following additional lifecycle stages:

- **`OnAllNodesDeserialized()`:** Called after all nodes in the belonging blueprint are deserialized. This is useful when you need to access other nodes in the same blueprint.
- **`OnUserAddToScene()`:** Called when the node is just instantiated in the blueprint editor, by the user dragging it from the node palette.

## Activando Flujos

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

## Data Inputs y Outputs No Serializables

One thing special about nodes is that they can have non-serializable data inputs and outputs (you can't do that in assets or plugins - they will just not display at all). This allows nodes to pass, e.g., Unity objects like `GameObject` or `Texture2D` between each other and process them.

You can even have a generic data input or output, like this:

```csharp
[DataInput]
public object MyGenericInput; // Note it's 'object', not 'Object'

[DataOutput
public object MyGenericOutput() => ...
```

Data output port of any type can be connected to `MyGenericInput` (the value will just be upcast to `object`). Conversely, `MyGenericOutput` can be connected to any data input port, but the value received by the input port will be `null` if the input port type is not compatible with the underlying type of what `MyGenericOutput` returns.

## Convertidores de Tipos

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

## Ejemplos de Código

### Básico

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

### Avanzado

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
{name: 'Hane', github: 'hanekit'}
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
