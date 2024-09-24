---
sidebar_position: 40
---

# 에셋

에셋은 씬에서 기능이나 동작을 구현하는 독립적인 오브젝트에요. 노드와는 다르게, 에셋은 보통 더 복잡한 로직을 캡슐화하고 있어요. 프로그램에서 클래스처럼 생각할 수 있으며, Unity의 `MonoBehaviour`와 유사해요.

## 타입 정의

에셋 타입을 생성하고 씬에 인스턴스화하여 저장할 수 있어요. 에셋 타입은 `Asset` 타입을 상속받고 `[AssetType]` 속성으로 정의돼요:

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

파라미터 요약:

- **`Id`**: 에셋 타입을 위한 고유 식별자;  각 새로운 에셋 타입에 대해 [새로운 GUID를 생성](https://www.guidgenerator.com/online-guid-generator.aspx)해야 해요. 이는 에셋 인스턴스의 UUID (`asset.Id`)와는 다르다는 점에 유의하세요..
- **`Title`**: 추가 에셋 메뉴에 표시될 에셋 타입의 이름이에요.
- **`Category`**: 선택사항. *Add Asset* 메뉴에서 에셋이 속할 그룹이에요.
- **`Singleton`**: 선택사항. `true`로 설정하면 장면에 해당 에셋 인스턴스가 하나만 존재할 수 있어요. 기본값은 `false`에요.

:::info
다음은 사용할 수 있는 일반적인 에셋 카테고리입니다: `CATEGORY_INPUT`, `CATEGORY_CHARACTERS`, `CATEGORY_PROP`, `CATEGORY_ACCESSORY`, `CATEGORY_ENVIRONMENT`, `CATEGORY_CINEMATOGRAPHY`, `CATEGORY_EXTERNAL_INTERACTION`, `CATEGORY_MOTION_CAPTURE`.
:::

## 컴포넌트

에셋 타입은 데이터 인풋과 트리거를 정의할 수 있어요. 노드와는 달리, 에셋에는 데이터 아웃풋이나 플로우 인풋/아웃풋이 없어요.

![](/doc-img/en-scripting-concepts-4.png)

## 라이프사이클

에셋은 [엔티티](entities#lifecycle) 페이지에서 설명된 라이프 사이클을 갖고 있어요. 이러한 메서드를 오버라이드하여 다양한 작업을 수행할 수 있어요. 예를 들어 `OnUpdate()` 메서드는 매 프레임 호출되며, Unity의 `Update()` 메서드와 비슷해요.

## 활성 상태 {#active-state}

노드와는 달리, 에셋은 "활성" 상태, 즉 사용할 준비가 되었는지를 나타내는 활성 상태를 가지고 있어요. 예를 들어, 캐릭터 에셋에 `Source`가 선택되지 않은 경우, 에디터에서 비활성 상태로 표시돼요.

![](/doc-img/en-custom-asset-1.png)

기본적으로 에셋은 생성될 때 활성 상태가 **아니에요**. `SetActive(bool state)` 메서드를 호출해 에셋의 활성 상태를 설정할 수 있어요. 예를 들어, 에셋이 항상 사용할 준비가 되어 있다면 `OnCreate` 메서드에서 이를 활성으로 설정할 수 있어요:

```csharp
public override void OnCreate() {
    base.OnCreate();
    SetActive(true);
}
```

에셋이 외부 서버(예: 원격 추적 장치)에 연결될 때만 동작하는 경우, 연결이 성공적으로 이루어졌을 때에만 활성으로 설정할 수 있어요:

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
에셋이 "사용 준비 완료" 상태인지 여부를 결정하는 것은 전적으로 개발자의 판단에 달려 있어요. Warudo의 내부 에셋에서 사용되는 규칙은 에셋이 제대로 작동하기 위해 필요한 모든 데이터 인풋이 설정되었을 때 활성 상태가 된다는 것이에요.
:::

## 게임오브젝트 생성

원할 때마다 (Unity) 씬에서 게임 오브젝트를 생성할 수 있어요. 예를 들어, 다음 에셋은 에셋이 생성될 때 큐브 게임 오브젝트를 만들고, 에셋이 파괴될 때 이를 삭제해요:

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

하지만 사용자는 이 큐브를 움직일 수 없어요. 왜냐하면 큐브를 제어할 수 있는 데이터 인풋이 없기 때문이에요! 큐브의 위치, 크기 등을 제어할 수 있는 데이터 인풋을 추가할 수 있지만, 더 쉬운 방법은 `GameObjectAsset` 타입을 상속받는 것이에요:

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

`GameObjectAsset`은 게임 오브젝트의 생성과 삭제를 자동으로 처리해주며, 사용자에게 게임 오브젝트의 위치, 회전, 크기를 제어할 수 있는 `Transform` 데이터 인풋을 제공해요:

![](/doc-img/en-custom-asset-2.png)

:::tip
`GameObjectAsset`을 언제 사용해야 할까요? 에셋이 "(Unity) 씬에서 사용자가 움직일 수 있는 무언가"라면 `GameObjectAsset`을 상속받는 것이 좋은 선택이에요.
:::

## 이벤트

`Asset` 타입은 다음 이벤트를 호출하며, 이를 통해 이벤트를 수신할 수 있어요:

- **`OnActiveStateChange`**: 에셋의 활성 상태가 변경될 때 호출돼요.
- **`OnSelectedStateChange`**: 에셋이 에디터에서 선택되거나 선택 해제될 때 호출돼요.
- **`OnNameChange`**: 에셋의 이름이 변경될 때 호출돼요.

예를 들어, 내장된 [Leap Motion tracking](../../mocap/leap-motion) 에셋은 `OnSelectedStateChange` 이벤트를 수신하여 에셋이 선택되면 (Unity) 씬에서 Leap Motion 컨트롤러 모델을 표시해요.

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

## 코드 예시

### 기본

- [AnchorAsset.cs](https://gist.github.com/TigerHix/c549e984df0be34cfd6f8f50e741aab2)  
Attachable / GameObjectAsset 예시

### 고급

- [CharacterPoserAsset.cs](https://gist.github.com/TigerHix/8413f8e10e508f37bb946d8802ee4e0b)  
IK 앵커로 캐릭터 포즈를 조절하는 커스텀 에셋.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
