---
sidebar_position: 110
---

# 데이터 저장 및 불러오기 {#io}

## 데이터 인풋 사용

엔티티의 [데이터 인풋](ports-and-triggers#data-inputs)은 자동으로 직렬화됩니다. 즉, 커스텀 에셋이나 노드에 데이터를 저장해야 할 경우, 가장 좋은 방법은 단순히 데이터 인풋을 정의하는 것입니다:

```csharp
[DataInput]
public Vector3 MySpecialVector3;
```

사용자에게 표시하고 싶지 않은 경우 숨겨진 데이터 인풋도 사용할 수 있습니다:

```csharp
[DataInput]
[Hidden]
public Vector3 MySpecialVector3;
```

보다 복잡한 상태를 저장해야 할 경우, JSON 문자열로 직렬화하고 필요할 때 역직렬화하는 방법을 사용할 수 있습니다:

```csharp
[DataInput]
[Hidden]
public string MyJSONState;

// Use Newtonsoft.Json to serialize and deserialize
MyJSONState = JsonConvert.SerializeObject(mySerializableObject);
mySerializableObject = JsonConvert.DeserializeObject<MySerializableObject>(MyJSONState);
```

## 영속 데이터 매니저 사용

직렬화할 수 없는 데이터를 저장하려면 `Context.PersistentDataManager`를 사용해 데이터 폴더에 접근할 수 있는 파일 시스템 API를 이용할 수 있습니다. 예를 들어, 커스텀 디렉토리에서 이미지를 불러오고 저장하려면 다음과 같이 사용할 수 있습니다:

```csharp
var bytes = await Context.PersistentDataManager.ReadFileBytesAsync("MyPlugin/MyProfileImage.png");
await Context.PersistentDataManager.WriteFileBytesAsync("MyPlugin/MyProfileImage.png", bytes);
```

## 플러그인 모드 사용

[플러그인 모드](../plugin-mod)는 모드 폴더에 텍스트 에셋을 저장할 수 있으며, 플러그인은 런타임 시 이를 액세스할 수 있습니다. 예를 들어 `Animations.json`이라는 JSON 파일을 모드 폴더에 저장하고, 이를 플러그인에서 로드할 수 있습니다:

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
    {name: 'Willycho', github: 'Willycho'},
],
}} />
