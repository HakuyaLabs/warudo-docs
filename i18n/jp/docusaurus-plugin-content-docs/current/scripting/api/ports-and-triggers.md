---
sidebar_position: 2
translate_from_version: 2026-01-14
---

# ポートとトリガー

ポートとトリガーは[エンティティ](entities)に属し、Warudoスクリプティングで最も重要な要素と言えるでしょう。エンティティ間でデータを渡し、アクションをトリガーし、エディターでユーザー操作を提供するために使用します。

![](/doc-img/en-custom-node-1.png)

![](/doc-img/en-scripting-concepts-4.png)

## データ入力ポート {#data-input-ports}

データ入力ポートは、ユーザー（エディターを使用）または別のエンティティからエンティティへデータを渡すために使用します。データ入力には文字列、数値、ブール値のほか、[構造化データ](structured-data.md)や配列などの複雑な型も使用できます。

データ入力は、`[DataInput]`属性で修飾されたエンティティサブクラスのパブリックフィールドとして定義します。[初めてのスクリプトを作成する](../creating-your-first-script.md)の例では、数値スライダーを定義する`DataInput`を確認しました。

```csharp
[DataInput]
[IntegerSlider(1, 100)]
public int LuckyNumber = 42;
```

さらにいくつか例を示します。

- **文字列入力:**

  ```csharp
  [DataInput]
  public string MyName = "Alice";
  ```

- **列挙型入力:**（エディターではドロップダウンとして表示）

  ```csharp
  public enum Color {
      Red,
      Green,
      Blue
  }

  [DataInput]
  public Color MyColor = Color.Red;
  ```

- **配列入力:**（エディターでは編集可能なリストとして表示）

  ```csharp
  [DataInput]
  public float[] MyFavoriteNumbers = new float[] { 3.14f, 2.718f };
  ```

エディターでは次のように表示されます（ここではノードを使用していますが、これらのデータ入力はアセットやプラグインでも同じように機能します）。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-scripting-concepts-2.png" />
</div>
</div>

コードで指定した既定値で初期化されていることに注目してください。ユーザーがデータ入力ラベルの横にある「リセット」ボタンをクリックすると、これらの既定値が再びデータ入力に代入されます。

通常、データ入力にはシリアライズ可能な型を使用します（ここでの「シリアライズ可能」とは、Warudoを閉じて再度開いたときにデータ値を保存・復元できることを意味します）。次の型は既定でシリアライズ可能です。

- プリミティブ型: `int`、`float`、`bool`、`string`、任意の列挙型
- Unity型: `Vector2`、`Vector3`、`Vector4`、`Color`
- [構造化データ](structured-data.md)型
- [アセット参照](#asset-references)
- シリアライズ可能な型の配列

ノードでは、エディターで編集できない代わりにノード自身が処理する、シリアライズ不可能なデータ入力を定義できます。たとえば、次のコードはジェネリックな`object`データ入力に対して`ToString()`メソッドを呼び出します。

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

`Dictionary`、`GameObject`、`Quaternion`も、シリアライズできませんがノード間で受け渡しできる一般的なデータ入力型です。

### 属性 {#data-input-attributes}

データ入力ポートには属性を付与して、エディターに追加の情報を与えられます。たとえば、先ほどの`[IntegerSlider]`属性は、データ入力を1から100の範囲を持つスライダーとして表示するよう指定しています。対応する属性は次のとおりです。

- `[Label(string label)]`: データ入力のラベルを指定します。
- `[HideLabel]`: データ入力のラベルを非表示にするよう指定します。
- `[Description(string description)]`: データ入力の説明を指定します。
- `[HiddenIf(string methodName)]`: 指定したメソッドが`true`を返す場合に、データ入力を非表示にするよう指定します。メソッドはエンティティクラス内の`bool`を返す`public`または`protected`メソッドである必要があります。
  ```csharp
  [DataInput]
  public int MyNumber = 0;

  [DataInput]
  [HiddenIf(nameof(IsSecretDataInputHidden))]
  public string SecretDataInput = "I am hidden unless MyNumber is 42!";

  public bool IsSecretDataInputHidden() => MyNumber != 42;
  ```
- `[HiddenIf(string dataInputPortName, If @if, object value)]`: 指定したデータ入力ポートが`@if`条件を満たす場合に、データ入力を非表示にするよう指定します。値は定数でなければなりません。
  ```csharp
  [DataInput]
  public int MyNumber = 0;

  [DataInput]
  [HiddenIf(nameof(MyNumber), If.NotEqual, 42)]
  public string SecretDataInput = "I am hidden unless MyNumber is 42!";
  ```
- `[HiddenIf(string dataInputPortName, Is @is)]`: 指定したデータ入力ポートが`@is`条件を満たす場合に、データ入力を非表示にするよう指定します。
  ```csharp
  [DataInput]
  public CharacterAsset MyCharacter;

  [DataInput]
  [HiddenIf(nameof(MyCharacter), Is.NullOrInactive)]
  public string SecretDataInput = "I am hidden unless MyCharacter is selected and active!";
  ```
- `[DisabledIf(...)]`: `[HiddenIf(...)]`と似ていますが、データ入力を非表示ではなく無効化します。
- `[Hidden]`: データ入力を常に非表示にするよう指定します。コード内でデータ入力を使用したいものの、ユーザーには公開したくない場合に便利です。
- `[Disabled]`: データ入力を常に無効（編集不可）にするよう指定します。長さが固定の配列データ入力や、常にプログラムから設定されるデータ入力を表示する場合などに便利です。
- `[Section(string title)]`: 別のセクションが指定されない限り、データ入力および以降のすべてのデータ入力を、指定したタイトルの新しいセクションに表示するよう指定します。
- `[SectionHiddenIf(string methodName)]`: `[Section]`属性が必要です。指定したメソッドが`true`を返す場合に、そのセクションを非表示にするよう指定します。メソッドはエンティティクラス内の`bool`を返す`public`または`protected`メソッドである必要があります。`@if`および`@is`条件もサポートされています。
- `[Markdown(bool Primary = false)]`: データ入力をMarkdownテキストとして表示し、編集できないようにすることを指定します。データ入力は`string`型でなければなりません。`Primary`が`true`の場合、テキストは色付き背景なしで大きなフォントサイズで表示されます。詳細は[テキストブロック](#text-block)を参照してください。

:::info
`[HiddenIf]`および`[DisabledIf]`属性は、アセットまたはノードがエディターで表示されている間、毎フレーム評価されます。そのため、これらのメソッドでは負荷の高い処理を避けてください。
:::

一部の属性は、特定のデータ入力型に固有です。

- `[IntegerSlider(int min, int max, int step = 1)]`: データ型に`int`または`int[]`が必要です。データ入力を指定範囲の整数スライダーとして表示するよう指定します。
- `[FloatSlider(float min, float max, float step = 0.01f)]`: データ型に`float`または`float[]`が必要です。データ入力を指定範囲の浮動小数点スライダーとして表示するよう指定します。
- `[AutoCompleteResource(string resourceType, string defaultLabel = null)]`: データ型に`string`が必要です。データ入力を指定した型のリソースのオートコンプリートリストとして表示するよう指定します。たとえば、「キャラクター → デフォルトアイドルアニメーション」データ入力は`[AutoCompleteResource("CharacterAnimation")]`として定義されています。詳細は[リソースプロバイダーとリゾルバー](resource-providers-and-resolvers.md)ページを参照してください。
- `[AutoCompleteList(string methodName, bool forceSelection = false, string defaultLabel = null)]`: データ型に`string`が必要です。データ入力を、指定したメソッドで生成されるドロップダウンメニューとして表示するよう指定します。メソッドはエンティティクラス内の`UniTask<AutoCompleteList>`を返す`public`または`protected`メソッドである必要があります。このメソッドは非同期にできます。`forceSelection`が`true`の場合、ユーザーはドロップダウンリストからのみ値を選択でき、それ以外の場合は値に`null`が代入されます。
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
  オートコンプリートリストは、コンパイル時には分からない選択肢のリストを提供したい場合に便利です。たとえば、ディレクトリ内のファイル一覧やリモートサーバー上のエモート一覧を提供できます。Warudoの内部ノードやアセットでは非常に頻繁に使用されています。
  :::
- `[MultilineInput]`: データ型に`string`が必要です。データ入力を複数行のテキスト入力フィールドとして表示するよう指定します。
- `[CardSelect]`: 列挙型のデータ型が必要です。データ入力をカード選択リスト（「カメラ → コントロールモード」に類似）として表示するよう指定します。
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

### 列挙型

列挙型で`[Label(string label)]`属性を使用すると、列挙値のエディター上のラベルをカスタマイズできます。例:

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

[属性](#data-input-attributes)セクションで説明したように、`[Description(string description)]`および`[Icon(string icon)]`属性を使用して、列挙型入力をカードのリストとして表示することもできます。

:::tip
`icon`は単一のSVG要素（例: `<svg>...</svg>`）にしてください。例:
```html
<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 512 512">
    <path>...</path>
</svg>
```
:::

### アセット参照 {#asset-references}

:::warning
アセット参照は、アセット、ノード、およびプラグイン以外の構造化データでのみ使用できます。
:::

データ入力は、現在のシーンにある別のアセットを参照するために使用できます。たとえば、次のコードは`CharacterAsset`を参照するデータ入力を定義します。

```csharp
[DataInput]
public CharacterAsset MyCharacter;
```

エディターでは、ユーザーはドロップダウンリストからキャラクターアセットを選択できます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-scripting-concepts-3.png" />
</div>
</div>

その後、参照先アセットのポートとトリガーにアクセスできます。

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
`asset.IsNullOrInactive()`を使用するとアセットが`null`または非アクティブかどうかを確認でき、逆に`asset.IsNonNullAndActive()`を使用すると`null`ではなくアクティブかどうかを確認できます。
:::

ドロップダウンに表示するアセットのリストをフィルタリングしたい場合はどうすればよいでしょうか。`[AssetFilter(string methodName)]`属性を使用して、シーン内のアセットをフィルタリングするメソッドを指定できます。メソッドはアセット型のパラメーターを受け取り、`bool`を返す`public`または`protected`メソッドである必要があります。例:

```csharp
[DataInput]
[AssetFilter(nameof(FilterCharacterAsset))]
public CharacterAsset MyCharacter;

protected bool FilterCharacterAsset(CharacterAsset character) {
    return character.Active; // Only show active characters
}
```

### プログラムからデータ入力にアクセスする {#accessing-data-inputs}

エンティティがあるとします。データ入力を読み取る方法は2つあります。

1. データ入力フィールドへ直接アクセスします。たとえば、ノードに*public*なデータ入力フィールド`public int MyNumber = 42;`がある場合、`node.MyNumber`を使用して`MyNumber`の値を直接読み取れます。
2. `T GetDataInput<T>(string key)`または`object GetDataInput(string key)`メソッドを使用します。このメソッドはすべてのエンティティで使用でき、指定名のデータ入力の値を返します。たとえば、`MyNumber`というデータ入力を持つノードでは、`node.GetDataInput<int>("MyNumber")`を使用して`MyNumber`の値を読み取れます（スタイル上は`node.GetDataInput<int>(nameof(node.MyNumber))`が推奨されます）。

:::tip
ポートのキーは、ポートが動的に追加された場合を除き、常にフィールド名です（[動的ポート](#dynamic-ports)を参照）。
:::

2つ目の方法は、文字列変数に基づいてデータ入力へアクセスするなど、データ入力に動的にアクセスする必要がある場合に便利です（[動的ポート](#dynamic-ports)も参照）。それ以外では、2つの方法に実用上の違いはありません。

同様に、データ入力に書き込むには、データ入力フィールドへ直接値を代入するか、`void SetDataInput<T>(string key, T value)`メソッドを使用します。たとえば、`MyNumber`というデータ入力の値を設定するには、`node.MyNumber = 42`または`node.SetDataInput("MyNumber", 42, broadcast: true)`を使用できます（スタイル上は`node.SetDataInput(nameof(node.MyNumber), 42, broadcast: true)`が推奨されます）。

:::tip
`SetDataInput(nameof(MyNumber), 42, broadcast: true)`の別の書き方は次のとおりです。
```csharp
MyNumber = 42;
BroadcastDataInput(nameof(MyNumber));
```
:::

ただし、この場合は次の2つの理由により、**2つ目の方法を強く推奨します**。

1. このデータ入力の[ウォッチャー](watchers)に変更が通知されることを保証します。
2. `broadcast`パラメーターを`true`に設定すると、変更がエディターに送信されます。設定しない場合は、`BroadcastDataInput(string key)`を使用して手動で変更をエディターへ送信する必要があります。

次の場合にのみ、1つ目の方法を使用してください。

1. データ入力を非常に頻繁に更新し、すべての変更をエディターへ送信する必要がない場合。つまり、`BroadcastDataInput(string key)`を断続的に呼び出す場合です。これにより処理負荷を抑えられます。
2. このデータ入力のウォッチャーに明示的に通知したくない場合。これはまれです。

## データ出力ポート {#data-output-ports}

データ出力ポートはノード固有で、他のノードへデータを渡すために使用します。データ出力は、`[DataOutput]`属性で修飾されたノードサブクラスのパブリックメソッドとして定義します。メソッドは`void`以外の任意の型を返せます。例:

```csharp
[DataOutput]
public int RandomNumber() {
    return Random.Range(1, 100); // Return a random number between 1 and 100
}
```

データ出力では、[データ入力属性](#data-input-attributes)の一部である`[Label]`、`[HideLabel]`、`[Description]`、`[HiddenIf]`、`[DisabledIf]`をサポートしています。

## フロー入力ポート {#flow-input-ports}

フロー入力ポートはノード固有で、他のノードからフロー信号を受け取り、特定のアクションをトリガーするために使用します。フロー入力は、`[FlowInput]`属性で修飾されたノードサブクラスのパブリックメソッドとして定義します。メソッドはフロー出力`Continuation`を返す必要があります。例:

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

フロー入力では、[データ入力属性](#data-input-attributes)の一部である`[Label]`、`[HideLabel]`、`[Description]`をサポートしています。メソッド名が`Enter()`で`[Label]`属性がない場合、ラベルはエディターの言語に合わせて「Enter」に自動設定されます。

## フロー出力ポート {#flow-output-ports}

フロー出力ポートはノード固有で、他のノードへフロー信号を送るために使用します。フロー出力は、`[FlowOutput]`属性で修飾されたノードサブクラスのパブリックフィールドとして定義します。フィールドは`Continuation`型である必要があります。例については[フロー入力ポート](#flow-input-ports)を参照してください。

フロー出力では、[データ入力属性](#data-input-attributes)の一部である`[Label]`、`[HideLabel]`、`[Description`]をサポートしています。フィールド名が`Exit`で`[Label]`属性がない場合、ラベルはエディターの言語に合わせて「Exit」に自動設定されます。

## テキストブロック {#text-block}

テキストブロックは、`[Markdown]`属性で修飾されたエンティティサブクラスのパブリック文字列フィールドとして定義します。

テキストブロックには2つのスタイルがあります。

- 背景あり: `[Markdown]`
- 背景なし: `[Markdown(Primary = true)]`

テキストブロックは基本的な**Markdown構文**をサポートし、厳密な改行モードを使用します。つまり:

- `\n`が1つの場合は改行を作らず、スペースのように扱われます。
- `\n`の前に2つのスペースがある場合（すなわち`␠␠\n`）、新しい段落を開始せずに改行します。
- `\n`が2つ連続する場合（すなわち`\n\n`）、改行して新しい段落を開始します。

テキストブロックは、次のような**埋め込みHTML**もサポートしています。

```csharp
[Markdown]
public string TextWithHtml = "Hello <p style='color: red;'>Hello</p> Hello";
```

文字列変数を変更してから`BroadcastDataInput`を使用すると、テキストブロックの表示を更新できます。

```csharp
MarkdownVariable = "New Text";
BroadcastDataInput(nameof(MarkdownVariable));
```

テキストブロックの更新には、`OnCreate()`内で`Watch`または`WatchAll`を使用することを推奨します。
必要な場合にのみ`OnUpdate()`でテキストブロックを更新してください。更新するとパフォーマンスのオーバーヘッドが大きくなります。

注: `[HiddenIf(string methodName)]`などの`DataInput`の属性もテキストブロックに適用されます。

詳細な例を示します。

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

## トリガー {#triggers}

トリガーは簡単に言えば、エディターでクリックして特定のアクションをトリガーできるボタンです。トリガーは、`[Trigger]`属性で修飾されたエンティティサブクラスのパブリックメソッドとして定義します。例:

```csharp
[Trigger]
public void ShowPopupMessage() {
    Context.Service.PromptMessage("Title of the message", "Content of the message");
}
```

エディターでは次のように表示されます。

![](/doc-img/en-scripting-concepts-5.png)

ユーザーがボタンをクリックすると、`ShowPopupMessage`メソッドが呼び出されます。

トリガーでは、[データ入力属性](#data-input-attributes)の一部である`[Label]`、`[HideLabel]`、`[Description]`、`[HiddenIf]`、`[DisabledIf]`、`[Section]`、`[SectionHiddenIf]`をサポートしています。

### 非同期トリガー

トリガーメソッドは非同期にできます。たとえば、遅延後にメッセージを表示したい場合は、`UniTask`を使用できます。

```csharp
[Trigger]
public async void ShowPopupMessageAfterDelay() { // Note the async keyword
    await UniTask.Delay(TimeSpan.FromSeconds(1)); // Wait for 1 second
    Context.Service.PromptMessage("Title of the message", "Content of the message");
}
```

より実用的な例として、処理を続行する前に確認ダイアログを表示できます。

```csharp
[Trigger]
public async void ShowConfirmationDialog() {
    bool confirmed = await Context.Service.PromptConfirmation("Are you sure?", "Do you want to proceed?");
    if (confirmed) {
        // Proceed
    }
}
```

### プログラムからトリガーを呼び出す

[データ入力へのアクセス](#accessing-data-inputs)と同様に、メソッドを直接呼び出すか、エンティティの`void InvokeTrigger(string key)`メソッドを使用して、プログラムからトリガーを呼び出せます。たとえば、`ShowPopupMessage`というトリガーを呼び出すには、`entity.ShowPopupMessage()`または`entity.InvokeTrigger("ShowPopupMessage")`を使用できます。

## ポートの順序

既定では、ポートはエンティティクラスでの宣言順に基づいて自動的に並びます。ただし、`[DataInput]`、`[DataOutput]`、`[FlowInput]`、`[FlowOutput]`、`[Trigger]`属性の`order`パラメーターを使用して、ポートの順序を手動で指定できます。例:

```csharp
[DataInput(order = 1)]
public int MyNumber = 42;

[DataInput(order = -1)]
public string MyString = "Hello, World!"; // This will be displayed before MyNumber
```

## 動的ポート {#dynamic-ports}

特定の条件に基づいてポートを動的に追加または削除したい場合があります。たとえば、組み込みの**Multi Gate**ノードには、「Exit Count」データ入力に応じた可変数のフロー出力（出口）があります。

これを実現するには、実行時に基になるポートコレクションへアクセスします。

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
**Multi Gate**ノードの完全なソースコードは[こちら](https://gist.github.com/TigerHix/8747793a68f0aa15a469f9823812e221)で確認できます。
:::

:::info
ポートを頻繁に（つまり毎フレーム）追加または削除しないでください。パフォーマンスの問題を引き起こす可能性があります。
:::

## 動的ポートプロパティ

ラベル、説明、型固有のプロパティなど、ポートのプロパティも動的に変更できます。たとえば、次のような場合を考えます。

```csharp
[DataInput]
[IntegerSlider(1, 10)]
public int CurrentItem = 1;

private int itemCount = 10; // Assume we have 10 items initially
```

`[IntegerSlider]`の範囲はコンパイル時に決定されます。しかし、`itemCount`が変更された場合は、スライダーの範囲も更新したくなります。そのためには、ポートプロパティへ直接アクセスします。

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
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
