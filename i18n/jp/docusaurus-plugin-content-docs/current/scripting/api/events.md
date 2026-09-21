---
sidebar_position: 90
translate_from_version: 2024-06-16
---

# グローバルイベント {#events}

Warudoには、グローバルイベントを購読およびブロードキャストできる`EventBus`クラスがあります。カスタムイベントクラスを定義するには、`Warudo.Core.Events.Event`クラスを継承します。例:

```csharp
public class MyEvent : Event {
    public string Message { get; }
    public MyEvent(string message) {
        Message = message;
    }
}
```

イベントを購読（リッスン）するには:

```csharp
Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

イベントをブロードキャスト（発火）するには:

```csharp
Context.EventBus.Broadcast(new MyEvent("Hello, world!"));
```

イベントをリッスンする必要がなくなったら、購読を解除してください。

```csharp
var subscriptionId = Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
// Later
Context.EventBus.Unsubscribe<MyEvent>(subscriptionId);
```

### エンティティ内でのイベントの購読

エンティティ型の内部でコードを記述している場合、イベントの購読IDを扱わずに済むよう、`Subscribe`メソッドを直接使用できます。

```csharp
// Inside an entity type, i.e., asset, node, plugin, structured data
Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

エンティティが破棄されると、イベントの購読は自動的に解除されます。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
