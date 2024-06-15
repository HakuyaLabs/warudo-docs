---
sidebar_position: 80
---

# Data Input Watchers {#watchers}

Often you are interested in knowing when the value of a data input changes. For example, let's say you have the following code that lets the user select a file from the `MyPluginFiles` directory in the data folder:

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

You want to know when the user selects a new file. The naive way is to check the value of `SelectedFile` every frame, but this is inefficient and cumbersome. Instead, you can register a watcher in `OnCreate()`:

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

You can also watch another entity's data input by using the overloaded `Watch<T>(Entity otherEntity, string dataInputKey, Action<T, T> onChange, bool deep = true)` method.

:::tip
Watchers are automatically unregistered when the entity is destroyed.
:::

## Watching Asset States

Sometimes, you want to watch more than just the value change. For example, consider the following simple asset that prints a message whenever the user selects a new `Character`:

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

However, the watcher is only triggered when the value of `Character` data input in the current asset changes; that means if the scene has two characters, the watcher is triggered when the user changes from one character to another. However, let's say there is only one character asset in the scene, and the user goes into the character asset and change the `Source` data input, then this watcher will not be triggered.

In this case, you can use `WatchAsset`:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAsset(nameof(Character), OnCharacterChanged);
}

protected void OnCharacterChanged() {
    if (Character.IsNonNullAndActive()) Debug.Log("New character file selected! " + Character.Source);
}
```

The watcher is now triggered both when the value of `Character` changes and when the `Source` data input of the `Character` asset changes.

:::info
Why does this work? The `WatchAsset` method will additionally trigger the watcher when an asset's [active state](assets#active-state) changes. In Warudo, all assets that have a `Source` data input toggles the active state based on the `Source` data input. For example, `CharacterAsset` uses `Source` to load a .vrm model or .warudo character mod, `PropAsset` uses `Source` to load a .warudo prop mod, and so on. The active state is only `true` if the `Source` is successfully loaded.

Say we have a currently active asset with a `Source` selected. When the user selects a new `Source`, the active state is set to `false` (triggering the watcher), and then if the new `Source` is successfully loaded, set to `true` again (triggering the watcher again). In the above code, only the second trigger will print the message, since when the first trigger is called, the character asset is not yet active.
:::

## Watching Multiple Data Inputs

If you need to watch multiple data inputs and only care about executing a callback function when any of them changes, you can use the `WatchAll` method:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(A), nameof(B), nameof(C) }, OnAnyDataInputChanged);
}

protected void OnAnyDataInputChanged() {
    // Called when A, B, or C changes
}
```
