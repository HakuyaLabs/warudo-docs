---
sidebar_position: 110
translate_from_version: 2024-06-16
---

# データの保存と読み込み {#io}

## データ入力を使用する

エンティティ内の[データ入力](ports-and-triggers#data-input-ports)は自動的にシリアライズされます。つまり、カスタムアセットまたはノードにデータを保存する必要がある場合、データ入力を定義するのが最適な方法です。

```csharp
[DataInput]
public Vector3 MySpecialVector3;
```

ユーザーに表示したくない場合は、非表示のデータ入力にすることもできます。

```csharp
[DataInput]
[Hidden]
public Vector3 MySpecialVector3;
```

より複雑な状態については、JSON文字列にシリアライズし、必要に応じてデシリアライズできます。

```csharp
[DataInput]
[Hidden]
public string MyJSONState;

// Use Newtonsoft.Json to serialize and deserialize
MyJSONState = JsonConvert.SerializeObject(mySerializableObject);
mySerializableObject = JsonConvert.DeserializeObject<MySerializableObject>(MyJSONState);
```

## Persistent Data Managerを使用する

シリアライズできないデータには、`Context.PersistentDataManager`を使用して、データフォルダーに制限されたファイルシステムAPIへアクセスできます。たとえば、カスタムディレクトリから画像を読み込み・保存するには、次のようにします。

```csharp
var bytes = await Context.PersistentDataManager.ReadFileBytesAsync("MyPlugin/MyProfileImage.png");
await Context.PersistentDataManager.WriteFileBytesAsync("MyPlugin/MyProfileImage.png", bytes);
```

## プラグインModを使用する

[プラグインMod](../plugin-mod)では、Modフォルダーにテキストアセットを保存でき、プラグインは実行時にそれらへアクセスできます。たとえば、ModフォルダーにJSONファイル`Animations.json`を保存し、プラグインで読み込めます。

```csharp
protected override void OnCreate() {
    base.OnCreate();
    var json = ModHost.Assets.Load<TextAsset>("Assets/MyModFolder/Animations.json"); // Change the path to match your mod folder structure
}
```

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
