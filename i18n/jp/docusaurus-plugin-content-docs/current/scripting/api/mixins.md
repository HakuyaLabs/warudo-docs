---
sidebar_position: 70
translate_from_version: 2024-06-16
---

# ミックスイン

ミックスインは、継承を利用できない場合に異なるエンティティ間でコードを再利用する方法です。任意の再利用可能なロジックを備えた、データ入力とトリガーの集合と考えることができます。

## 型の定義

次のように`Mixin`型を継承して、ミックスイン型を作成できます。

```csharp
public class PositionMixin : Mixin {
    [DataInput]
    public Vector3 Position;

    [Trigger]
    public void GeneratePosition() {
        SetDataInput(nameof(Position), new Vector3(Random.value, Random.value, Random.value), broadcast: true);
    }
}
```

このミックスインは、任意のエンティティサブタイプに含められます。たとえば、カスタムアセットに`PositionMixin`を含めるには、次のようにします。

```csharp
[AssetType(...)]
public class PositionAsset : Asset {

    [Mixin]
    public PositionMixin PositionMixin;

}
```

アセットと同様に、ノードにもミックスインを含めることができます。

```csharp
[NodeType(...)]
public class PositionNode : Node {

    [Mixin]
    public PositionMixin PositionMixin;

}
```

`[Mixin]`属性を追加することを忘れないでください。また、エンティティの作成時に自動的にインスタンス化されるため、値を代入する必要はありません。つまり、ミックスインのデータ入力とトリガーに直接アクセスできます。

```csharp
// Within entity
public override void OnCreate() {
    base.OnCreate();
    var initialPosition = PositionMixin.Position;
    PositionMixin.GeneratePosition();
}
```

ただし、`SetDataInput`や`InvokeTrigger`などのメソッドは、ミックスイン自体では利用できません。データ入力とトリガーは技術的にはミックスインを含むエンティティに属しているため、次のように記述してください。

```csharp
// Within entity
SetDataInput(nameof(PositionMixin.Position), new Vector3(1, 2, 3), broadcast: true);
InvokeTrigger(nameof(PositionMixin.GeneratePosition));
```

ミックスイン内からエンティティとそのメソッドにアクセスするには、`Owner`プロパティを使用します。

```csharp
// Within mixin
Position = new Vector3(9, 8, 7);
Owner.BroadcastDataInput(nameof(Position));
Owner.Watch(nameof(Position), OnPositionChanged);
```

## 構造化データとの違い

ミックスインは、エンティティに含めることができ、データ入力とトリガーを持つという点で[構造化データ](structured-data)に似ています。ただし、動作は大きく異なります。

- 構造化データはデータ入力に埋め込まれシリアライズされます。一方、ミックスインはデータ入力とトリガーを、それを含むエンティティに「フラット化」します。
- 構造化データは、データをカプセル化するために設計されておりロジック向けではないため、ミックスインほど多くの[ライフサイクルイベント](#behavioral-mixins)を持たないという意味で「軽量」です。
- エンティティには構造化データの配列を持たせられますが、特定の型のミックスインはエンティティごとに1つしか持てません。

どちらを使うべきかわからない場合は、まず構造化データから始めることをおすすめします。

## 振る舞いを持つミックスイン {#behavioral-mixins}

ミックスインでエンティティのライフサイクルイベントが必要な場合は、`Mixin`ではなく`BehavioralMixin`を継承できます。これにより、`OnUpdate()`、`OnPreUpdate()`、`OnPostUpdate()`、`OnLateUpdate()`、`OnFixedUpdate()`、`OnEndOfFrame()`の各メソッドをオーバーライドできます。エンティティのライフサイクルについての詳細は、[エンティティ](entities#lifecycle)ページを参照してください。

## 組み込みミックスイン

Warudoには、エンティティで使用できる組み込みミックスインがいくつかあります。

- `Attachable`: エンティティのGameObjectを別のアセットのトランスフォームにアタッチする機能を追加します。
- `PlaybackMixin`: エディターに再生コントロールを追加します。ミュージックプレーヤー、MMDプレーヤー、モーションプレーヤーで使用されます。
- `ToolbarItemMixin`: ツールバーアイコンを追加します。このミックスインは、プラグインでツールバーにアイコンを表示するために使用されます。詳細は[プラグイン](plugins)ページを参照してください。

:::warning
現在、組み込みミックスイン型は十分に文書化されていません。改善に取り組んでいますが、それまでの間は使用例としてその派生型を参照することをおすすめします。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
