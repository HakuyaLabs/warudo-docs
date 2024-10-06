---
sidebar_position: 30
---

# 노드

노드는 서로 연결되어 복잡한 동작을 만들 수 있는 로직 단위예요. 프로그램에서 함수처럼 동작하지만, 시각적으로 표현된다고 생각하면 돼요.

## 타입 정의

노드 타입을 생성하여 blueprint에 인스턴스화하고 저장할 수 있어요. 노드 타입은 `Node` 클래스를 상속하고, `[NodeType]` 속성으로 정의돼요. 아래는 그 예시예요:

```csharp
[NodeType(
    Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660",
    Title = "Hello World",
    Category = "CATEGORY_DEBUG",
    Width = 1f
)]
public class HelloWorldNode : Node {
    // Node implementation
}
```

파라미터 요약:

- **`Id`**: 노드 타입의 고유 식별자; 각 새로운 노드 타입에 대해 [새로운 GUID를 생성](https://www.guidgenerator.com/online-guid-generator.aspx)해야 해요. 이는 노드 인스턴스의 UUID(`node.Id`)와는 달라요.
- **`Title`**: 노드 팔레트에 표시될 노드 타입의 이름.
- **`Category`**: 선택 사항. 노드 팔레트에서 노드를 그룹화하는 데 사용돼요.
- **`Width`**: 선택 사항. 기본적으로 노드의 너비는 `1f`인데, `2f`로 설정하면 해당 노드는`1f`너비의 노드보다 두 배의 공간을 차지해요.

:::info
자주 사용되는 노드 카테고리: `CATEGORY_ARITHMETIC`, `CATEGORY_ASSETS`, `CATEGORY_BLENDSHAPES`, `CATEGORY_CHARACTERS`, `CATEGORY_DATA`, `CATEGORY_DEBUG`, `CATEGORY_EVENTS`, `CATEGORY_FLOW`, `CATEGORY_INPUT`, `CATEGORY_MOTION_CAPTURE`, `CATEGORY_INTERACTIONS`.

직접 카테고리 이름을 사용할 수도 있지만, 위 카테고리들은 사용자 언어로 자동으로 현지화돼요.
:::

## 컴포넌트

노드 타입은 데이터 인풋, 데이터 아웃풋, 플로우 인풋, 플로우 아웃풋, 트리거를 정의할 수 있어요.

![](/doc-img/en-custom-node-1.png)

## 라이프사이클

[엔티티](entities#lifecycle) 페이지에 나와 있는 라이프사이클 단계 외에도, 노드는 다음과 같은 추가적인 라이프사이클 단계가 있어요:

- **`OnAllNodesDeserialized()`:** 해당 blueprint의 모든 노드가 역직렬화된 후에 호출됩니다. 같은 blueprint의 다른 노드에 접근해야 할 때 유용해요.
- **`OnUserAddToScene()`:** 사용자가 노드를 노드 팔레트에서 드래그하여 에디터에 추가할 때 호출됩니다.

## 트리거링 플로우

플로우 인풋 메서드에서 플로우 아웃풋의 `Continuation`을 반환함으로써 플로우 아웃풋을 트리거할 수 있어요. 예를 들어:

```csharp
[FlowInput]
public Continuation Enter() {
    // Do something
    return Exit;
}

[FlowOutput]
public Continuation Exit;
```

만약 플로우가 여기서 끝난다면, `null`을 반환하여 플로우가 종료되었음을 나타낼 수 있어요.

```csharp
[FlowInput]
public Continuation Enter() {
    // Do something
    return null;
}
```

때로는 플로우 아웃풋을 지연시키거나 수동으로 트리거하고 싶을 수 있어요. 이럴 때는 `InvokeFlow(string flowOutputPortKey)` 메서드를 사용하여 플로우 아웃풋을 트리거할 수 있어요. 예를 들어:

```csharp
[FlowInput]
public Continuation Enter() {
    async void TriggerExitLater() {
        await UniTask.Delay(TimeSpan.FromSeconds(5));
        InvokeFlow(nameof(Exit)); // Start a new flow from the "Exit" output port
    }
    return null; // You still need to return a Continuation. Since *this* flow technically ends here, we return null
}
```

## 비직렬화 데이터 인풋 & 아웃풋

노드만이 가지고 있는 특별한 점은 비직렬화 데이터 인풋 및 아웃풋을 가질 수 있다는 점이에요. (에셋이나 플러그인에서는 불가능하며, 아예 표시되지 않아요.) 이를 통해 노드 간에 Unity 오브젝트인 `GameObject`나 `Texture2D` 같은 데이터를 주고받고 처리할 수 있어요.

다음과 같이 제네릭 데이터 인풋 또는 아웃풋도 가질 수 있어요:

```csharp
[DataInput]
public object MyGenericInput; // Note it's 'object', not 'Object'

[DataOutput
public object MyGenericOutput() => ...
```

어떤 타입의 데이터 아웃풋 포트든 `MyGenericInput`에 연결할 수 있어요(값은 단순히 `object`로 업캐스트 돼요). 반대로, `MyGenericOutput`은 어떤 데이터 인풋 포트에도 연결될 수 있지만, 인풋 포트 타입이 `MyGenericOutput`이 반환하는 타입과 호환되지 않으면 인풋 포트로 받은 값은 `null`이 됩니다.

## 타입 컨버터

노드를 연결할 때, Warudo에서 자동으로 데이터 타입을 변환할 수 있어요. 예를 들어 `float`아웃풋을 `int` 인풋에 연결하면 값이 단순히 소수점 이하가 잘려서 변환돼요.

`DataConverters` 클래스를 사용해서 커스텀 타입 컨버터를 등록할 수 있어요. 가장 쉬운 방법은 `DataConverter<T1, T2>` 클래스를 구현하는 거예요:

```csharp
public class MyFloatToIntConverter : DataConverter<float, int> {
    public override int Convert(float data) => (int) data;
}
```

그런 다음, [플러그인](plugins)의 `OnCreate` 메서드에서 컨버터를 등록할 수 있어요:

```csharp
public override void OnCreate() {
    base.OnCreate();
    DataConverters.RegisterConverter(new MyFloatToIntConverter());
}
```

:::caution
노드 타입의 `OnCreate`에서 타입 컨버터를 등록하지 않아야 해요. 그렇게 하면 노드 인스턴스가 생성될 때마다 컨버터를 등록하게 돼요!
:::

## 코드 예시

### 기본

- [ExampleNode.cs](https://github.com/HakuyaLabs/WarudoPlaygroundExamples/blob/master/ExampleNode.cs)  
다양한 노드 컴포넌트의 기본 형식을 보여주는 표준 예시예요.

- [StructuredDataExampleNode.cs](https://gist.github.com/TigerHix/81cfa66a8f810165c426d1b5157677b5)  
"내부" 데이터 타입을 생성해요.(구조화된 데이터)

- [GetRandomSoundNode.cs](https://gist.github.com/TigerHix/f0f1a7e3c53ca65450fdca1ff06eb343)  
랜덤 사운드 노드를 가져오는 예시예요.

- [LiteralCharacterAnimationSourceNode.cs](https://gist.github.com/TigerHix/2dc58213defe400ddb280a8cc1e6334b)  
캐릭터 애니메이션 (소스) 노드예요.

- [SmoothTransformNode.cs](https://gist.github.com/TigerHix/eaf8e05e5e1b687b8265420b9943903d)  
부드러운 트랜스폼 노드예요.

### 고급

- [FindAssetByTypeNode.cs](https://gist.github.com/TigerHix/ab3522bb25669457cc583abc4fb025d2)  
AutoCompleteList (드롭다운) 예시예요.

- [MultiGateNode.cs](https://gist.github.com/TigerHix/8747793a68f0aa15a469f9823812e221)  
동적 데이터/플로우 포트 예시예요.

- [ThrowPropAtCharacterNode.cs](https://gist.github.com/TigerHix/18e9f20152c0cfac38fd5528c7af16b6)  
캐릭터에게 소품을 던지는 예시예요.

- [SpawnStickerNode.cs](https://gist.github.com/TigerHix/fe35442e9052cd8c4ea80e0261349321)  
로컬/온라인 이미지 스티커를 생성하는 예시예요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
