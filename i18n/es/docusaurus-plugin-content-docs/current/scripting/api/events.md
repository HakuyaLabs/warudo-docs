---
sidebar_position: 90
---

# Eventos Globales {#events}

Warudo contiene una clase `EventBus` que te permite suscribirte y transmitir eventos globales. Para definir una clase de evento personalizada, hereda de la clase `Warudo.Core.Events.Event`. Por ejemplo:

```csharp
public class MyEvent : Event {
    public string Message { get; }
    public MyEvent(string message) {
        Message = message;
    }
}
```

Para suscribirte (escuchar) a un evento:

```csharp
Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

Para transmitir (disparar) un evento:

```csharp
Context.EventBus.Broadcast(new MyEvent("Hello, world!"));
```

Deberías cancelar la suscripción de eventos cuando ya no necesites escucharlos:

```csharp
var subscriptionId = Context.EventBus.Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
// Más tarde
Context.EventBus.Unsubscribe<MyEvent>(subscriptionId);
```

### Suscribiendo Eventos en Entidades

Si estás escribiendo código dentro de un tipo de entidad, puedes usar el método `Subscribe` directamente para evitar manejar IDs de suscripción de eventos:

```csharp
// Dentro de un tipo de entidad, es decir, asset, node, plugin, structured data
Subscribe<MyEvent>(e => {
    Debug.Log(e.Message);
});
```

Los eventos se cancelan automáticamente cuando la entidad es destruida.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
