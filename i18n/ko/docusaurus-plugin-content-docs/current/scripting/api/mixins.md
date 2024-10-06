---
sidebar_position: 70
---

# 믹스인

믹스인은 상속을 사용할 수 없는 상황에서 다양한 엔티티 간에 코드를 재사용하는 방법이에요. 데이터 인풋과 트리거를 포함한 재사용 가능한 로직의 집합이라고 생각할 수 있어요.

## 타입 정의

`Mixin` 타입을 상속하여 믹스인 타입을 정의할 수 있어요. 아래와 같이 정의해요:

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

이제 이 믹스인을 엔티티 서브타입에 포함할 수 있어요. 예를 들어, `PositionMixin`을 커스텀 에셋에 포함하려면 다음과 같이 해요:

```csharp
[AssetType(...)]
public class PositionAsset : Asset {
    
    [Mixin]
    public PositionMixin PositionMixin;

}
```

에셋과 마찬가지로 노드에도 믹스인을 포함할 수 있어요:

```csharp
[NodeType(...)]
public class PositionNode : Node {
    
    [Mixin]
    public PositionMixin PositionMixin;

}
```

믹스인을 포함할 때는 `[Mixin]` 속성을 추가해야 해요. 또한 엔티티가 생성될 때 자동으로 인스턴스화되므로 값을 직접 할당할 필요는 없어요. 믹스인의 데이터 인풋과 트리거에 바로 접근할 수 있어요:

```csharp
// Within entity
public override void OnCreate() {
    base.OnCreate();
    var initialPosition = PositionMixin.Position;
    PositionMixin.GeneratePosition();
}
```

하지만 `SetDataInput`과 `InvokeTrigger` 같은 메서드는 믹스인 자체에서는 사용할 수 없어요. 데이터 인풋과 트리거는 기술적으로 믹스인을 포함하는 엔티티에 속해 있으므로 다음과 같이 작성해야 해요:

```csharp
// Within entity
SetDataInput(nameof(PositionMixin.Position), new Vector3(1, 2, 3), broadcast: true);
InvokeTrigger(nameof(PositionMixin.GeneratePosition));
```

믹스인 내부에서 엔티티와 해당 메서드에 접근하려면 `Owner` 속성을 사용해요:

```csharp
// Within mixin
Position = new Vector3(9, 8, 7);
Owner.BroadcastDataInput(nameof(Position));
Owner.Watch(nameof(Position), OnPositionChanged);
```

## 구조화 데이터와의 차이점

믹스인은 [구조화된 데이터](structured-data)와 비슷하게 엔티티에 포함되고 데이터 인풋과 트리거를 가질 수 있지만, 동작 방식은 매우 달라요:

- 구조화된 데이터는 데이터 인풋에 내장되고 직렬화되지만, 믹스인은 데이터 인풋과 트리거를 포함한 엔티티에 "평탄화"돼요.
- 구조화된 데이터는 주로 데이터를 캡슐화하는 데 집중하므로, 로직을 담고 있지 않으며 믹스인보다  [라이프사이클 이벤트](#behavioral-mixins)가 적어 더 "가벼운" 구조를 가집니다.
- 엔티티에는 구조화된 데이터 배열을 포함할 수 있지만, 특정 타입의 믹스인은 엔티티에 하나만 포함할 수 있어요.

어느 것을 사용할지 확신이 없다면, 먼저 구조화된 데이터를 사용하는 것을 권장해요!

## 행동 기반 믹스인 {#behavioral-mixins}

믹스인에 엔티티 라이프사이클 이벤트가 필요하다면 `Mixin` 대신 `BehavioralMixin` instead of `Mixin`을 상속하세요. 이를 통해 `OnUpdate()`, `OnPreUpdate()`, `OnPostUpdate()`, `OnLateUpdate()`, `OnFixedUpdate()` 그리고 `OnEndOfFrame()`메서드를 오버라이드할 수 있어요. 엔티티 라이프사이클에 대한 자세한 내용은 [엔티티](entities#lifecycle) 페이지를 참조하세요.

## 내장 믹스인

Warudo는 여러 내장 믹스인을 제공하며, 이를 엔티티에 사용할 수 있어요:

- `Attachable`: 엔티티의 게임오브젝트를 다른 에셋 변환에 연결하는 기능을 추가해요.
- `PlaybackMixin`: 에디터에 재생 제어 기능을 추가하며, 음악 플레이어, MMD 플레이어, 모션 플레이어에서 사용돼요.
- `ToolbarItemMixin`: 툴바 아이콘을 추가해요. 이 믹스인은 플러그인에서 툴바에 아이콘을 표시하는 데 사용됩니다. 플러그인에 대한 자세한 내용은 [플러그인](plugins) 페이지를 참조하세요.

:::warning
현재 내장 믹스인 타입에 대한 문서화는 미흡한 상태이며, 이를 개선하기 위해 노력 중이에요. 그동안은 사용 예제를 참고하기 위해 해당 믹스인을 상속하는 클래스를 참조하는 것을 권장해요.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
