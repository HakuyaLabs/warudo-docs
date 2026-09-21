---
sidebar_position: 30
translate_from_version: 2024-12-10
---

# ノード

ノードは、複雑な動作を作成するために接続できるロジックの単位です。プログラム内の関数を視覚的に表現したものと考えることができます。

## 型定義

ブループリント内でインスタンス化して保存できるノード型を作成できます。ノード型は`Node`型を継承し、次のように`[NodeType]`属性で修飾します。

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

パラメーターの概要は次のとおりです。

| パラメーター | 必須 | データ型 | 説明 |
|:---------- |:---------:|:---------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Id`       | 必須 | `string`  | このノードクラスの**一意の識別子**です。<br/> 新しいノード型ごとに[新しいGUIDを生成](https://www.guidgenerator.com/online-guid-generator.aspx)してください。<br/> **注:** ノードクラスの`Id`は、ノードインスタンスのUUID（`node.Id`）とは異なります。 |
| `Title`    | 任意 | `string`  | ノードパレットに表示される、このノードの**名前**です。 |
| `Category` | 任意 | `string`  | ノードパレット内での、このノードの**グループ**です。 |
| `Width`    | 任意 |  `float`  | このノードの**幅**です。デフォルトは`1f`です。<br/> 幅が`2f`のノードは、幅が`1f`のノードの2倍のスペースを占めます。 |

:::info[ **Categoryについて**]

- 下の**表**にある組み込みの`Category`文字列を使用できます。
	- これらはプログラムの言語に自動的にローカライズされます。
- 独自のカスタム`Category`名を使用することもできます。
	- このノードをワークショップにアップロードする場合は、これを強く推奨します。
	- プラグイン名を`Category`として使用すると、ユーザーは使用しているノードがどのプラグインのものかをより明確に把握できます。

:::

**表** 組み込みの`Category`文字列とローカライズされたテキスト。

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

## コンポーネント

ノード型では、データ入力、データ出力、フロー入力、フロー出力、トリガーを定義できます。

![](/doc-img/en-custom-node-1.png)

## ライフサイクル

[エンティティ](entities#lifecycle)ページに記載されているライフサイクル段階に加え、ノードには次の追加のライフサイクル段階があります。

- **`OnAllNodesDeserialized()`:** 所属するブループリント内のすべてのノードがデシリアライズされた後に呼び出されます。同じブループリント内の他のノードにアクセスする必要がある場合に便利です。
- **`OnUserAddToScene()`:** ユーザーがノードパレットからドラッグして、ブループリントエディター内でノードをインスタンス化した直後に呼び出されます。

## フローのトリガー

フロー入力メソッドでフロー出力の`Continuation`を返すと、出力フローをトリガーできます。例:

```csharp
[FlowInput]
public Continuation Enter() {
    // Do something
    return Exit;
}

[FlowOutput]
public Continuation Exit;
```

フローがここで終了する場合は、`null`を返してフローが終了したことを示せます。

```csharp
[FlowInput]
public Continuation Enter() {
    // Do something
    return null;
}
```

フロー出力を遅延させたり、手動でトリガーしたりしたい場合があります。`InvokeFlow(string flowOutputPortKey)`メソッドを使用して、フロー出力をトリガーできます。例:

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

## シリアライズ不可能なデータ入力と出力

ノードの特別な点として、シリアライズ不可能なデータ入力と出力を持たせることができます（アセットやプラグインではできません。まったく表示されません）。これにより、ノード間で`GameObject`や`Texture2D`などのUnityオブジェクトを渡して処理できます。

次のように、ジェネリックなデータ入力または出力を持たせることもできます。

```csharp
[DataInput]
public object MyGenericInput; // Note it's 'object', not 'Object'

[DataOutput
public object MyGenericOutput() => ...
```

任意の型のデータ出力ポートを`MyGenericInput`に接続できます（値は単に`object`へアップキャストされます）。逆に、`MyGenericOutput`は任意のデータ入力ポートへ接続できますが、入力ポートの型が`MyGenericOutput`の返す基になる型と互換性がない場合、入力ポートが受け取る値は`null`になります。

## 型コンバーター

ノードを接続すると、可能であればWarudoが自動的にデータ型を変換することに気付くでしょう。たとえば、`float`出力を`int`入力へ接続できます。この場合、値は単に切り捨てられます。

`DataConverters`クラスを使用してカスタム型コンバーターを登録できます。最も簡単な方法は、`DataConverter<T1, T2>`クラスを実装することです。

```csharp
public class MyFloatToIntConverter : DataConverter<float, int> {
    public override int Convert(float data) => (int) data;
}
```

次に、[プラグイン](plugins)の`OnCreate`メソッドでコンバーターを登録します。

```csharp
public override void OnCreate() {
    base.OnCreate();
    DataConverters.RegisterConverter(new MyFloatToIntConverter());
}
```

:::caution
ノード型の`OnCreate`で型コンバーターを登録しないでください。ノードインスタンスが作成されるたびに登録されてしまいます。
:::

## コード例

### 基本

- [ExampleNode.cs](https://github.com/HakuyaLabs/WarudoPlaygroundExamples/blob/master/ExampleNode.cs)
さまざまなノードコンポーネントの基本形式を示す、標準的なノードの例です。

- [StructuredDataExampleNode.cs](https://gist.github.com/TigerHix/81cfa66a8f810165c426d1b5157677b5)
「内部」データ型（StructuredData）の作成。

- [GetRandomSoundNode.cs](https://gist.github.com/TigerHix/f0f1a7e3c53ca65450fdca1ff06eb343)
ランダムなサウンドを取得するノード。

- [LiteralCharacterAnimationSourceNode.cs](https://gist.github.com/TigerHix/2dc58213defe400ddb280a8cc1e6334b)
キャラクターアニメーション（ソース）ノード。

- [SmoothTransformNode.cs](https://gist.github.com/TigerHix/eaf8e05e5e1b687b8265420b9943903d)
スムーズトランスフォームノード。

### 上級

- [FindAssetByTypeNode.cs](https://gist.github.com/TigerHix/ab3522bb25669457cc583abc4fb025d2)
AutoCompleteList（ドロップダウン）の例。

- [MultiGateNode.cs](https://gist.github.com/TigerHix/8747793a68f0aa15a469f9823812e221)
動的なデータ／フローポートの例。

- [ThrowPropAtCharacterNode.cs](https://gist.github.com/TigerHix/18e9f20152c0cfac38fd5528c7af16b6)
キャラクターに小道具を投げる。

- [SpawnStickerNode.cs](https://gist.github.com/TigerHix/fe35442e9052cd8c4ea80e0261349321)
ローカル／オンライン画像ステッカーを生成する。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
