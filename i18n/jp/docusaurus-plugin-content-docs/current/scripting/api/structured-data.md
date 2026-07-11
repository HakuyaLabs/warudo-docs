---
sidebar_position: 60
translate_from_version: 2024-06-16
---

# 構造化データ

構造化データは、エンティティ内に埋め込まれたデータ構造を定義する方法です。同じエンティティ内または複数のエンティティ間で再利用する必要がある、複雑なデータ入力を定義する際に便利です。

## 型定義

次のように`StructuredData`型を継承して、構造化データ型を作成できます。

```csharp
public class MyTransformData : StructuredData {
    [DataInput]
    public Vector3 Position;

    [DataInput]
    public Vector3 Rotation;

    [DataInput]
    public Vector3 Scale = Vector3.one;

    [Trigger]
    public void ResetAll() {
        Position = Vector3.zero;
        Rotation = Vector3.zero;
        Scale = Vector3.one;
        Broadcast();
    }
}
```

この構造化データ型は、エンティティ内の任意のデータ入力フィールドの型として使用できます。

```csharp
[DataInput]
public MyTransformData MyTransform;
```

表示は次のようになります。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-1.png)
</div>
</div>

構造化データフィールドには値を代入する必要がないことに注意してください。エンティティの作成時に自動的にインスタンス化されます。つまり、構造化データのデータ入力に直接アクセスできます。

```csharp
public override void OnCreate() {
    base.OnCreate();
    MyTransform.ResetAll();
}
```

## コンポーネント

構造化データ型では、データ入力とトリガーを定義できます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-5.png)
</div>
</div>

## ライフサイクル

構造化データには、[エンティティ](entities#lifecycle)ページに記載されている標準ライフサイクルイベント（例: `OnCreate()`）に加えて、`OnUpdate()`という追加のライフサイクルイベントが1つだけあります。

:::tip
構造化データはデータコンテナーと考えるのが最適なので、内部で複雑なロジックを実行すべきではありません。構造化データはできるだけシンプルに保ち、重い処理は親エンティティに任せることをおすすめします。
:::

## 構造化データの更新

構造化データもエンティティであるため、ほかのエンティティと同じようにデータ入力を更新できます。

```csharp
MyTransform.SetDataInput(nameof(MyTransform.Position), new Vector3(1, 2, 3), broadcast: true);

// or

MyTransform.Position = new Vector3(1, 2, 3);
MyTransform.BroadcastDataInput(nameof(MyTransform.Position));
```

複数のデータ入力を更新する場合も、フィールドに直接代入し、`Broadcast`メソッドを使用してすべてのデータ入力を一度にブロードキャストできます。

```csharp
MyTransform.Position = new Vector3(1, 2, 3);
MyTransform.Rotation = new Vector3(0, 0, 0);
MyTransform.Scale = new Vector3(1, 1, 1);
MyTransform.Broadcast(); // Or BroadcastDataInput(nameof(MyTransform));
```

## ネストした構造化データ

構造化データはネストできます。

```csharp
public class MyData1 : StructuredData {
    [DataInput]
    public MyData2 NestedData;

    public class MyData2 : StructuredData {
        [DataInput]
        public MyData3 NestedData;

        public class MyData3 : StructuredData {
            [DataInput]
            public bool SuperNestedBool;
        }
    }
}
```

## 配列

構造化データの配列も定義できます。

```csharp
[DataInput]
public MyTransformData[] MyTransforms;
```

配列を初期化する必要はないことに注意してください。Warudoが空の配列を自動的に初期化します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-2.png)
</div>
</div>

ユーザーが**+**ボタンをクリックすると、構造化データ要素が配列に追加されます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-3.png)
</div>
</div>

## カスタム初期化子

構造化データ配列の要素はWarudoによって自動的に初期化されます。

```csharp
[DataInput]
public MyTransformData[] MyTransforms; // Each MyTransforms[i].Scale is initialized to (1, 1, 1)
```

ただし、新しい要素を動的な値で初期化したい場合もあります。`[StructuredDataInitializer]`属性を使用して、構造化データの初期化時に呼び出すメソッドを指定できます。

```csharp
[DataInput]
[StructuredDataInitializer(nameof(InitializeTransform))]
public MyTransformData[] MyTransforms;

protected void InitializeTransform(MyTransformData transform) {
    transform.Position = new Vector3(Random.value, Random.value, Random.value);
    transform.Rotation = new Vector3(Random.value, Random.value, Random.value);
    transform.Scale = new Vector3(Random.value, Random.value, Random.value);
    // Note there is no need to broadcast - the structured data has not be sent to the editor anyway
}
```

ユーザーが**+**ボタンをクリックすると、`InitializeTransform`メソッドが呼び出され、新しい構造化データ要素が初期化されます。

## プログラムによる構造化データの作成

構造化データ配列を手動で設定する場合、またはプログラムで構造化データ要素を追加する場合は、`StructuredData.Create<T>()`メソッドを使用します。

```csharp
public override void OnCreate() {
    base.OnCreate();

    // Create a new structured data instance
    var mySampleData = StructuredData.Create<MyTransformData>();
    mySampleData.Position = new Vector3(1, 2, 3);
    // Or equivalently
    // var mySampleData = StructuredData.Create<MyTransformData>(sd => sd.Position = new Vector3(1, 2, 3));

    SetDataInput(nameof(MyTransforms), new [] { mySampleData }, broadcast: true);
}

[Trigger]
public void AddNewRandomTransform() {
    var newTransform = StructuredData.Create<MyTransformData>();
    newTransform.Position = new Vector3(Random.value, Random.value, Random.value);
    newTransform.Rotation = new Vector3(Random.value, Random.value, Random.value);
    newTransform.Scale = new Vector3(Random.value, Random.value, Random.value);

    var newTransforms = new List<MyTransformData>(MyTransforms);
    newTransforms.Add(newTransform);

    SetDataInput(nameof(MyTransforms), newTransforms.ToArray(), broadcast: true);
}
```

:::caution
構造化データインスタンスの作成に`new MyTransformData()`を使用しないでください。適切にエンティティを初期化するため、必ず`StructuredData.Create<T>()`を使用してください。
:::

## 折りたたみ可能な構造化データ

構造化データは、スペースを節約するために折りたためます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-4.png)
</div>
</div>

`ICollapsibleStructuredData`インターフェースを実装するだけです。

```csharp
public class MyTransformData : StructuredData, ICollapsibleStructuredData {
    // ...

    public string GetHeader() => Position + " " + Rotation + " " + Scale;
}
```

`CollapsedSelf`および`CollapsedInHierarchy`プロパティを使用して、構造化データが折りたたまれているかどうかを判定できます。たとえば、構造化データの折りたたみ状態に応じて、Unityシーン内のGameObjectの表示を切り替えられます。

```csharp
public override void OnUpdate() {
    base.OnUpdate();
    gameObject.SetActive(!CollapsedInHierarchy);
}
```

## 親エンティティへのアクセス

構造化データから親エンティティにアクセスする必要がある場合は、基底クラスを`StructuredData<TParent>`に変更し、自動的に`TParent`へキャストされる`Parent`プロパティを使用できます。`MyTransformData`の例では、次のようになります。

```csharp
[AssetType(...)]
public class MyTransformAsset : Asset {

    [DataInput]
    public MyTransformData MyTransform;

    protected void ParentMethod() {
        // ...
    }

    public class MyTransformData : StructuredData<MyTransformAsset> {
        // ...

        public void AccessParentMethod() {
            Parent.ParentMethod();
        }
    }
}
```

`OnCreate`が呼び出された時点では`Parent`は`null`であるため、`OnCreate`内で親エンティティにアクセスすべきではないことに注意してください。代わりに、`OnAssignedParent()`コールバックを実装します。

```csharp
public class MyTransformData : StructuredData<MyTransformAsset> {
    public override void OnAssignedParent() {
        Parent.ParentMethod();
    }
}
```

## 構造化データ入力ダイアログ {#input}

構造化データの非常に一般的な用途は、ダイアログでユーザーにデータを入力してもらうことです。オンボーディングアシスタントを覚えていますか？オンボーディング中に表示された各ポップアップウィンドウは、実は構造化データです。

構造化データ入力ダイアログを作成するには、構造化データ型を定義して`Context.Service.PromptStructuredDataInput<T>`を呼び出すだけです。

```csharp
[Trigger]
public async void PromptUserInput() {
    var sd = await Context.Service.PromptStructuredDataInput<MyTransformData>("Customize Your Transform");
    if (sd == null) return; // The user clicked cancel

    Context.Service.Toast(ToastSeverity.Success,
        "Thank you for your input!",
        "Your new transform is: " + sd.GetHeader());
    SetDataInput(nameof(MyTransform), sd, broadcast: true);
}
```

文字列データ入力の`[Markdown(primary: true)]`、列挙型データ入力の`[CardSelect]`、そして`[HiddenIf]`を工夫して組み合わせることで、プラグイン用の見栄えがよく使いやすいダイアログを作成できます。

### ダイアログの再試行

現在の構造化データとともに`PromptStructuredDataInput`を再度呼び出すことで、現在のダイアログを「再試行」できます。

```csharp
[Trigger]
public async void PromptUserInput() {
    var sd = await Context.Service.PromptStructuredDataInput<MyTransformData>("Customize Your Transform");
    if (sd == null) return; // The user clicked cancel

    while (sd.Position == Vector3.zero) {
        Context.Service.Toast(ToastSeverity.Error, "Invalid Input", "Position cannot be zero!");
        sd = await Context.Service.PromptStructuredDataInput("Customize Your Transform", sd); // Note the second parameter
        if (sd == null) return; // The user clicked cancel
    }
}
```

これにより、無効な入力を修正できるようにしながら、構造化データに対するユーザーの編集を保存できます。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
