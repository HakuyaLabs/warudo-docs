---
sidebar_position: 90
---

# Global Events {#events}

Warudo contains a `EventBus` class that allows you to subscribe to and broadcast global events. To define a custom event class, inherit from the `Warudo.Core.Events.Event` class. For example:

```csharp
public class MyEvent : Event {
    public string Message { get; }
    public MyEvent(string message) {
        Message = message;
    }
}
```

To subscribe (listen) to an event:

```csharp
Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

To broadcast (fire) an event:

```csharp
Context.EventBus.Broadcast(new MyEvent("Hello, world!"));
```

You should unsubscribe from events when you no longer need to listen to them:

```csharp
var subscriptionId = Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
// Later
Context.EventBus.Unsubscribe<MyEvent>(subscriptionId);
```

### Subscribing Events In Entities

If you are writing code inside an entity type, you can use the `Subscribe` method directly to avoid handling event subscription IDs:

```csharp
// Inside an entity type, i.e., asset, node, plugin, structured data
Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

The events are automatically unsubscribed when the entity is destroyed.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
