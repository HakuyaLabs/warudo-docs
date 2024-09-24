---
sidebar_position: 80
---

# 데이터 인풋 감시자 {#watchers}

종종 데이터 인풋의 값이 변경될 때 이를 알아야 할 경우가 있어요. 예를 들어, 다음 코드에서 사용자가 데이터 폴더의 `MyPluginFiles` 디렉토리에서 파일을 선택하도록 하려면:

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

사용자가 새로운 파일을 선택했을 때 이를 알 수 있으면 좋겠죠. 가장 단순한 방법은 `SelectedFile`의 값을 매 프레임마다 확인하는 것이지만, 이는 비효율적이고 번거로워요. 대신 `OnCreate()`에서 감시자를 등록할 수 있어요::

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

다른 엔티티의 데이터 인풋을 감시하고 싶다면 `Watch<T>(Entity otherEntity, string dataInputKey, Action<T, T> onChange, bool deep = true)` 메서드를 사용할 수 있어요.

:::tip
감시자는 엔티티가 삭제될 때 자동으로 등록 해제돼요.
:::

## 에셋 상태 감시

때로는 단순한 값 변경 이상의 것을 감시하고 싶을 때가 있어요. 예를 들어, 사용자가 새로운 `Character`를 선택할 때마다 메시지를 출력하는 간단한 에셋을 고려해보면:

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

하지만 이 감시자는 `Character` 데이터 인풋의 값이 변경될 때만 트리거됩니다. 즉, 씬에 캐릭터 에셋이 두 개 있을 경우, 사용자 간의 캐릭터 전환 시 트리거돼요. 하지만 씬에 캐릭터 에셋이 하나만 있고, 사용자가 해당 에셋 안에서 `Source` 데이터를 변경하면 이 감시자는 트리거되지 않아요.

이런 경우, `WatchAsset`을 사용할 수 있어요:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAsset(nameof(Character), OnCharacterChanged);
}

protected void OnCharacterChanged() {
    if (Character.IsNonNullAndActive()) Debug.Log("New character file selected! " + Character.Source);
}
```

이제 감시자는 `Character` 값이 변경될 때뿐만 아니라, 해당 `Character` 에셋의 `Source` 데이터가 변경될 때도 트리거됩니다.

:::info
왜 이 방식이 동작할까요? `WatchAsset` 메서드는 에셋의 [활성 상태](assets#active-state)가 변경될 때도 감시자를 트리거해요. Warudo에서는 `Source` 데이터 인풋을 가진 모든 에셋이 `Source`에 따라 활성 상태를 토글해요. 예를 들어, `CharacterAsset`은 `Source`를 사용해 .vrm 모델 또는 .warudo 캐릭터 모드를 로드하고 `PropAsset`은 `Source`를 사용해 .warudo 소품 모드를 로드하는 방식이에요.  `Source`가 성공적으로 로드될 때만 활성 상태가 `true`가 돼요.

예를 들어, 현재 활성화된 에셋이 있고, `Source`가 선택되어 있을 때 사용자가 새로운 `Source`를 선택하면 활성 상태는 `false`로 설정되고(감시자가 트리거됨), 새 `Source`가 성공적으로 로드되면 다시 `true`로 설정돼요(감시자가 다시 트리거됨). 위 코드에서는 두 번째 트리거에서만 메시지가 출력되는데, 첫 번째 트리거가 호출될 때는 캐릭터 에셋이 아직 활성화되지 않았기 때문이에요.
:::

## 다중 데이터 인풋 감시

여러 데이터 인풋을 감시해야 하고, 그 중 하나라도 변경될 때 콜백 함수를 실행하고 싶다면 `WatchAll` 메서드를 사용할 수 있어요:

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
    {name: 'Willycho', github: 'Willycho'},
],
}} />
