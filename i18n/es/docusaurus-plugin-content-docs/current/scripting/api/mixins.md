---
sidebar_position: 70
---

# Mixins

Los mixins son una forma de reutilizar código entre diferentes entities cuando la herencia no es una opción. Se pueden pensar como una colección de data inputs y triggers con lógica opcional y reutilizable.

## Definición de Tipo

Puedes crear tipos de mixin heredando del tipo `Mixin`, como se muestra abajo:

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

Entonces ahora puedes incluir este mixin en cualquier subtipo de entity. Por ejemplo, para incluir el `PositionMixin` en un asset personalizado:

```csharp
[AssetType(...)]
public class PositionAsset : Asset {
    
    [Mixin]
    public PositionMixin PositionMixin;

}
```

Lo mismo que con los assets, puedes incluir mixins en nodos:

```csharp
[NodeType(...)]
public class PositionNode : Node {
    
    [Mixin]
    public PositionMixin PositionMixin;

}
```

Recuerda agregar el atributo `[Mixin]`. También, no necesitas asignar un valor ya que será instanciado automáticamente cuando la entity es creada. Eso significa que puedes acceder a los data inputs y triggers del mixin directamente:

```csharp
// Dentro de la entity
public override void OnCreate() {
    base.OnCreate();
    var initialPosition = PositionMixin.Position;
    PositionMixin.GeneratePosition();
}
```

Sin embargo, métodos como `SetDataInput` e `InvokeTrigger` no están disponibles en el mixin mismo. Los data inputs y triggers aún técnicamente pertenecen a la entity que incluye el mixin, así que debes escribir:

```csharp
// Dentro de la entity
SetDataInput(nameof(PositionMixin.Position), new Vector3(1, 2, 3), broadcast: true);
InvokeTrigger(nameof(PositionMixin.GeneratePosition));
```

Para acceder a la entity y sus métodos dentro del mixin, usa la propiedad `Owner`:

```csharp
// Dentro del mixin
Position = new Vector3(9, 8, 7);
Owner.BroadcastDataInput(nameof(Position));
Owner.Watch(nameof(Position), OnPositionChanged);
```

## Diferencias de Structured Data

Los mixins son similares a [structured data](structured-data) en que pueden ser incluidos en entities y tienen data inputs y triggers. Sin embargo, funcionan de maneras muy diferentes:

- Un structured data está embebido y serializado en un data input; un mixin "aplana" sus data inputs y triggers en la entity que lo incluye.
- Un structured data es "más ligero" en el sentido de que está diseñado para encapsular datos, no lógica, así que no tiene tantos [eventos del ciclo de vida](#behavioral-mixins) como un mixin.
- Puedes tener un array de structured data en una entity, pero solo puedes tener un mixin de un tipo específico en una entity.

Si no estás seguro de cuál usar, ¡recomendamos empezar con structured data primero!

## Behavioral Mixins {#behavioral-mixins}

Si necesitas eventos del ciclo de vida de entity en tu mixin, puedes heredar de `BehavioralMixin` en lugar de `Mixin`. Esto te permitirá sobrescribir los siguientes métodos: `OnUpdate()`, `OnPreUpdate()`, `OnPostUpdate()`, `OnLateUpdate()`, `OnFixedUpdate()`, y `OnEndOfFrame()`. Consulta la página [Entities](entities#lifecycle) para más información sobre el ciclo de vida de entities.

## Mixins Integrados

Warudo proporciona varios mixins integrados que puedes usar en tus entities:

- `Attachable`: Agrega la habilidad de adjuntar el GameObject de la entity a otro transform de asset.
- `PlaybackMixin`: Agrega controles de reproducción al editor; usado en el reproductor de música, el reproductor MMD, y el reproductor de movimiento.
- `ToolbarItemMixin`: Agrega un ícono de barra de herramientas. Este mixin se usa en plugins para mostrar un ícono en la barra de herramientas. Consulta la página [Plugins](plugins) para más información.

:::warning
Actualmente, los tipos de mixin integrados no están bien documentados. Estamos trabajando en mejorar esto, pero mientras tanto, recomendamos consultar sus herederos para ejemplos de uso.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
