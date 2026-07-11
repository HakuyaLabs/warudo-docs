---
sidebar_position: 80
translate_from_version: 2024-06-16
---

# データ入力ウォッチャー {#watchers}

データ入力の値がいつ変更されたかを知りたいことはよくあります。たとえば、次のコードでは、ユーザーがデータフォルダーの`MyPluginFiles`ディレクトリからファイルを選択できます。

```csharp
[DataInput]
[AutoCompleteList(nameof(AutoCompletePluginFiles), forceSelection: true)]
public string SelectedFile;

protected async UniTask<AutoCompleteList> AutoCompletePluginFiles() {
    return AutoCompleteList.Single(Context.PersistentDataManager.GetFileEntries("MyPluginFiles").Select(it => new AutoCompleteEntry {
        label = it.fileName,
        value = it.path
    }));
}
```

ユーザーが新しいファイルを選択したときに知りたいとします。単純な方法は、毎フレーム`SelectedFile`の値を確認することですが、これは非効率で煩雑です。代わりに、`OnCreate()`でウォッチャーを登録できます。

```csharp
protected override void OnCreate() {
    base.OnCreate();
    Watch<string>(nameof(SelectedFile), OnSelectedFileChanged);
}

protected void OnSelectedFileChanged(string from, string to) {
    if (to == null) {
        // The user has cleared the selected file
    }
    // More logic to handle the file change
}
```

オーバーロードされた`Watch<T>(Entity otherEntity, string dataInputKey, Action<T, T> onChange, bool deep = true)`メソッドを使用して、別のエンティティのデータ入力を監視することもできます。

:::tip
ウォッチャーは、エンティティが破棄されると自動的に登録解除されます。
:::

## アセットの状態を監視する

単なる値の変更以上を監視したい場合があります。たとえば、ユーザーが新しい`Character`を選択するたびにメッセージを出力する、次のシンプルなアセットを考えてみましょう。

```csharp
[DataInput]
public CharacterAsset Character;

protected override void OnCreate() {
    base.OnCreate();
    Watch<CharacterAsset>(nameof(Character), OnCharacterChanged);
}

protected void OnCharacterChanged(CharacterAsset from, CharacterAsset to) {
    if (to != null) Debug.Log("New character file selected! " + to.Source);
}
```

ただし、このウォッチャーがトリガーされるのは、現在のアセットの`Character`データ入力の値が変わったときだけです。つまり、シーンにキャラクターが2つある場合、ユーザーが一方のキャラクターからもう一方に変更するとウォッチャーがトリガーされます。しかし、シーン内にキャラクターアセットが1つだけあり、ユーザーがそのキャラクターアセットに入り、`Source`データ入力を変更した場合、このウォッチャーはトリガーされません。

この場合は、`WatchAsset`を使用できます。

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAsset(nameof(Character), OnCharacterChanged);
}

protected void OnCharacterChanged() {
    if (Character.IsNonNullAndActive()) Debug.Log("New character file selected! " + Character.Source);
}
```

このウォッチャーは、`Character`の値が変更されたときと、`Character`アセットの`Source`データ入力が変更されたときの両方でトリガーされるようになりました。

:::info
なぜこれが機能するのでしょうか。`WatchAsset`メソッドは、アセットの[アクティブ状態](assets#active-state)が変わったときにもウォッチャーをトリガーします。Warudoでは、`Source`データ入力を持つすべてのアセットは、`Source`データ入力に基づいてアクティブ状態を切り替えます。たとえば、`CharacterAsset`は`Source`で`.vrm`モデルまたは`.warudo`形式のキャラクターModを読み込み、`PropAsset`は`Source`で`.warudo`形式の道具Modを読み込みます。アクティブ状態が`true`になるのは、`Source`が正常に読み込まれた場合のみです。

現在`Source`が選択されているアクティブなアセットがあるとします。ユーザーが新しい`Source`を選択すると、アクティブ状態は`false`に設定され（ウォッチャーがトリガーされます）、新しい`Source`が正常に読み込まれれば再び`true`に設定されます（ウォッチャーがもう一度トリガーされます）。上記のコードでは、最初のトリガー時にはキャラクターアセットがまだアクティブではないため、メッセージを出力するのは2回目のトリガーだけです。
:::

## 複数のデータ入力を監視する

複数のデータ入力を監視し、それらのいずれかが変更されたときにのみコールバック関数を実行したい場合は、`WatchAll`メソッドを使用できます。

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(A), nameof(B), nameof(C) }, OnAnyDataInputChanged);
}

protected void OnAnyDataInputChanged() {
    // Called when A, B, or C changes
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
