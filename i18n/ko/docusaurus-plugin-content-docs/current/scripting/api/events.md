---
sidebar_position: 90
---

# 글로벌 이벤트 {#events}

Warudo에는 글로벌 이벤트를 구독하고 브로드캐스트할 수 있는 `EventBus` 클래스가 있어요. 커스텀 이벤트 클래스를 정의하려면 `Warudo.Core.Events.Event` 클래스를 상속하세요. 예를 들어:

```csharp
public class MyEvent : Event {
    public string Message { get; }
    public MyEvent(string message) {
        Message = message;
    }
}
```

이벤트를 구독하려면:

```csharp
Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

이벤트를 브로드캐스트하려면:

```csharp
Context.EventBus.Broadcast(new MyEvent("Hello, world!"));
```

이벤트를 더 이상 듣고 싶지 않을 때는 구독을 해제해야 해요:

```csharp
var subscriptionId = Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
// Later
Context.EventBus.Unsubscribe<MyEvent>(subscriptionId);
```

### 엔티티에서 이벤트 구독

엔티티 타입 내에서 코드를 작성하는 경우, 구독 ID를 처리하지 않고 직접 `Subscribe` 메서드를 사용할 수 있어요:

```csharp
// Inside an entity type, i.e., asset, node, plugin, structured data
Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

이벤트는 엔티티가 삭제될 때 자동으로 구독 해제돼요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
