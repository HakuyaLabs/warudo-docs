---
sidebar_position: 40
translate_from_version: 2024-06-16
---

# アセット

アセットは、シーン内で機能または振る舞いを実装する自己完結型のオブジェクトです。ノードと異なり、アセットは通常、より複雑なロジックをカプセル化します。プログラムにおけるクラスと考えることができ、Unityの`MonoBehaviour`により近いものです。

## 型の定義

シーン内でインスタンス化して保存できるアセット型を作成できます。アセット型は`Asset`型を継承し、次のように`[AssetType]`属性で装飾します。

```csharp
[AssetType(
    Id = "c6500f41-45be-4cbe-9a13-37b5ff60d057",
    Title = "Hello World",
    Category = "CATEGORY_DEBUG",
    Singleton = false
)]
public class HelloWorldAsset : Asset {
    // Asset implementation
}
```

パラメーターの概要は次のとおりです。

- **`Id`**: アセット型の一意の識別子です。新しいアセット型ごとに[新しいGUIDを生成](https://www.guidgenerator.com/online-guid-generator.aspx)してください。これはアセットインスタンスのUUID（`asset.Id`）とは異なります。
- **`Title`**: *アセットを追加*メニューに表示されるアセット型の名前です。
- **`Category`**: 任意。*アセットを追加*メニュー内のアセットのグループです。
- **`Singleton`**: 任意。`true`に設定すると、シーンにはアセットのインスタンスを1つだけ存在させることができます。デフォルトは`false`です。

:::info
使用できる一般的なアセットカテゴリー: `CATEGORY_INPUT`、`CATEGORY_CHARACTERS`、`CATEGORY_PROP`、`CATEGORY_ACCESSORY`、`CATEGORY_ENVIRONMENT`、`CATEGORY_CINEMATOGRAPHY`、`CATEGORY_EXTERNAL_INTERACTION`、`CATEGORY_MOTION_CAPTURE`。
:::

## コンポーネント

アセット型では、データ入力とトリガーを定義できます。ノードとは異なり、アセットにはデータ出力やフロー入力／出力はありません。

![](/doc-img/en-scripting-concepts-4.png)

## ライフサイクル

アセットには、[エンティティ](entities#lifecycle)ページに記載されているライフサイクル段階があります。これらのメソッドをオーバーライドしてさまざまな処理を実行できます。たとえば、`OnUpdate()`はUnityの`Update()`メソッドと同様に毎フレーム呼び出されます。

## アクティブ状態 {#active-state}

ノードとは異なり、アセットには、そのアセットが「アクティブ」、つまり使用可能な状態かどうかを示すアクティブ状態があります。たとえば、キャラクターアセットで`Source`が選択されていない場合、エディターでは非アクティブとして表示されます。

![](/doc-img/en-custom-asset-1.png)

デフォルトでは、アセットは作成時に**アクティブではありません**。`SetActive(bool state)`を呼び出してアセットのアクティブ状態を設定できます。たとえば、アセットが常に使用可能な場合は、`OnCreate`メソッドでアクティブに設定できます。

```csharp
public override void OnCreate() {
    base.OnCreate();
    SetActive(true);
}
```

アセットが外部サーバー（例: リモートトラッキングデバイス）への接続時にのみ機能する場合は、接続が正常に確立されたときだけアクティブに設定できます。

```csharp
[DataInput]
public string RemoteIP = "127.0.0.1";

[DataInput]
public string RemotePort = "12345";

public override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(RemoteIP), nameof(RemotePort) }, ResetConnection); // When RemoteIP or RemotePort changes, reset the connection
}

protected void ResetConnection() {
    SetActive(false); // Inactive until connection is established
    if (ConnectToRemoteServer(RemoteIP, RemotePort)) {
        SetActive(true);
    }
}
```

:::tip
アセットが「使用可能な状態」であるかどうかの判断は、完全にあなた次第です。Warudoの内部アセットで使用されている慣例は、アセットが適切に機能するために必要なすべてのデータ入力が設定されているとき、そのアセットをアクティブにすることです。
:::

## GameObjectの作成

(Unity)シーン内には、いつでもGameObjectを作成できます。たとえば、次のアセットはアセットの作成時にキューブのGameObjectを作成し、アセットの破棄時にそれを破棄します。

```csharp
private GameObject gameObject;

public override void OnCreate() {
    base.OnCreate();
    gameObject = GameObject.CreatePrimitive(PrimitiveType.Cube);
}

public override void OnDestroy() {
    base.OnDestroy();
    Object.Destroy(gameObject);
}
```

ただし、このキューブを制御するデータ入力がないため、ユーザーはこのキューブを動かせません。キューブの位置やスケールなどを制御するデータ入力を追加することもできますが、より簡単な方法は`GameObjectAsset`型を継承することです。

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Plugins.Core.Assets;

[AssetType(
    Id = "4c00b14a-aed5-423e-abe6-6921032439c5",
    Title = "My Awesome Cube",
    Category = "CATEGORY_DEBUG"
)]
public class MyAwesomeCubeAsset : GameObjectAsset {
    protected override GameObject CreateGameObject() {
        return GameObject.CreatePrimitive(PrimitiveType.Cube);
    }
}
```

`GameObjectAsset`はGameObjectの作成と破棄を処理してくれます。また、ユーザーがGameObjectの位置、回転、スケールを制御できる`Transform`データ入力も備えています。

![](/doc-img/en-custom-asset-2.png)

:::tip
`GameObjectAsset`を使用するのはいつでしょうか。アセットが「(Unity)シーン内でユーザーが移動できるもの」であれば、`GameObjectAsset`を継承するのがよいでしょう。
:::

## イベント

`Asset`型は、リッスンできる次のイベントを呼び出します。

- **`OnActiveStateChange`**: アセットのアクティブ状態が変わったときに呼び出されます。
- **`OnSelectedStateChange`**: エディターでアセットが選択または選択解除されたときに呼び出されます。
- **`OnNameChange`**: アセットの名前が変わったときに呼び出されます。

たとえば、組み込みの[Leap Motionトラッキング](../../mocap/leap-motion)アセットは、アセットが選択されたときに(Unity)シーン内にLeap Motionコントローラーモデルを表示するため、`OnSelectedStateChange`イベントをリッスンします。

```csharp
public override void OnCreate() {
    base.OnCreate();
    OnSelectedStateChange.AddListener(selected => {
        if (selected) {
            // Show the model
        } else {
            // Hide the model
        }
    });
}
```

## コード例

### 基本

- [AnchorAsset.cs](https://gist.github.com/TigerHix/c549e984df0be34cfd6f8f50e741aab2)
Attachable / GameObjectAssetの例。

### 高度

- [CharacterPoserAsset.cs](https://gist.github.com/TigerHix/8413f8e10e508f37bb946d8802ee4e0b)
IKアンカーでキャラクターにポーズを付けるカスタムアセット。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
