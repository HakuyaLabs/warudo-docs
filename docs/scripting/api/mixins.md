---
sidebar_position: 70
---

# Mixins

Mixins are a way to reuse code between different entities when inheritance is not an option. They can be thought of a collection of data inputs and triggers with optional, reusable logic.

## Type Definition

You can create mixin types by inheriting from the `Mixin` type, like below:

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

Then you can now include this mixin in any entity subtype. For example, to include the `PositionMixin` in a custom asset:

```csharp
[AssetType(...)]
public class PositionAsset : Asset {
    
    [Mixin]
    public PositionMixin PositionMixin;

}
```

Same as with assets, you can include mixins in nodes:

```csharp
[NodeType(...)]
public class PositionNode : Node {
    
    [Mixin]
    public PositionMixin PositionMixin;

}
```

Remember to add the `[Mixin]` attribute. Also, you do not need to assign a value as it will be automatically instantiated when the entity is created. That means you can access the mixin's data inputs and triggers directly:

```csharp
// Within entity
public override void OnCreate() {
    base.OnCreate();
    var initialPosition = PositionMixin.Position;
    PositionMixin.GeneratePosition();
}
```

However, methods such as `SetDataInput` and `InvokeTrigger` are not available in the mixin itself. The data inputs and triggers still technically belong to the entity that includes the mixin, so you should write:

```csharp
// Within entity
SetDataInput(nameof(PositionMixin.Position), new Vector3(1, 2, 3), broadcast: true);
InvokeTrigger(nameof(PositionMixin.GeneratePosition));
```

To access the entity and its methods within the mixin, use the `Owner` property:

```csharp
// Within mixin
Position = new Vector3(9, 8, 7);
Owner.BroadcastDataInput(nameof(Position));
Owner.Watch(nameof(Position), OnPositionChanged);
```

## Differences from Structured Data

Mixins are similar to [structured data](structured-data) in that they can be included in entities and have data inputs and triggers. However, they work in very different ways:

- A structured data is embedded and serialized in a data input; a mixin "flattens" its data inputs and triggers into the entity that includes it.
- A structured data is "lighter" in the sense that it is designed to encapsulate data, not logic, so it doesn't have as much [lifecycle events](#behavioral-mixins) as a mixin.
- You can have a structured data array in an entity, but you can only have one mixin of a specific type in an entity.

If you are not sure which to use, we recommend to start with structured data first!

## Behavioral Mixins {#behavioral-mixins}

If you need entity lifecycle events in your mixin, you can inherit from `BehavioralMixin` instead of `Mixin`. This will allow you to override the following methods: `OnUpdate()`, `OnPreUpdate()`, `OnPostUpdate()`, `OnLateUpdate()`, `OnFixedUpdate()`, and `OnEndOfFrame()`. Refer to [Entities](entities#lifecycle) page for more information on entity lifecycle.

## Built-in Mixins

Warudo provides several built-in mixins that you can use in your entities:

- `Attachable`: Adds the ability to attach the entity's GameObject to another asset transform.
- `PlaybackMixin`: Adds playback controls to the editor; used in the music player,  the MMD player, and the motion player.
- `ToolbarItemMixin`: Adds a toolbar icon. This mixin is used in plugins to display an icon in the toolbar. Refer to the [Plugins](plugins) page for more information.

:::warning
Currently, built-in mixin types are not well-documented. We are working on improving this, but in the meantime, we recommend referring to their inheritors for usage examples.
:::
