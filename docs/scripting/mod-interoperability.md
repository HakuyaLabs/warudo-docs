---
sidebar_position: 11
version: 2025-12-11
---

# Mod Interoperability

Starting from Warudo 0.14.3, mods can call each other. Mods do not need to use uMod's reference dependency system; instead, they can interoperate using the new `PluginRouter` mechanism.

## Signals and Slots
Mods can send one-way, non-directional messages to other mods via signals. This is typically used to broadcast internal mod events — for example, an environment broadcasting the start and end of an internal animation, collision states, whether a predefined environment event was triggered, or other mod internal states that other mods can automatically synchronize with.

### Emitting Signals
To emit a signal you need a valid `Plugin`/`Asset`/`Node` instance and call its `EmitSignal` instance method with a class that inherits from `Warudo.Core.Events.Event`:

```csharp
[AssetType(Id="AMod.Asset")]
public class AModAsset: Asset {
    public class MyEventOnA : Warudo.Core.Events.Event
    {
        public string message;
    }

    [Trigger]
    public void OnSomeEvent()
    {
        this.EmitSignal(new MyEventOnA {
            message = "Hello from MyMod!"
        });
    }
}
```

:::tips
This is equivalent to calling
```csharp
Context.PluginRouter.EmitSignal(this, new MyEventOnA {
    message = "Hello from MyMod!"
});
```

:::

### Connecting Slots
To receive signals, call `ConnectSlot` on your `Plugin`/`Asset`/`Node` instance, passing the sender type ID and a callback:

```csharp
[AssetType(Id="BMod.Asset")]
public class BModAsset: Asset {
    public class MyEventOnB : Warudo.Core.Events.Event
        {
            public string message;
        }
        public override void OnCreate()
        {
            base.OnCreate();
            var link = ConnectSlot<MyEventOnB>("AMod.Asset", (evt, entity) => {
                // evt is the Signal instance, in this case MyEventOnB
                // entity is the entity that sent the signal, in this case an instance of AModAsset
            });
            // Disconnect the slot. It will be automatically disconnected when the instance is destroyed
            DisconnectSlot(link); 
        }
}
```

In the example above, the first argument to `ConnectSlot` (`"AMod.Asset"`) is the type ID of the signal sender — it can be any `Plugin`/`Asset`/`Node` type ID. `MyEventOnA` and `MyEventOnB` are interoperable as long as their internal structure is the same.

:::tips
This is equivalent to calling
```csharp
var link = Context.PluginRouter.ConnectSlot<MyEventOnB>(this, "AMod.Asset", (e, s) => {
    if (CanReceiveEvents) {
        handler(e, s);
    }
});
```

:::

## Commands
Mods can also communicate bidirectionally using commands. Unlike signals, commands are directed request-response interactions: the sender waits for a response from the receiver.

### Registering a Command
To register a command, call `RegisterCommand` on a `Plugin`/`Asset`/`Node` instance and provide the command name and a callback:

```csharp
[AssetType(Id="AMod.Asset")]
public class AModAsset: Asset {
    public class MyCommandRequestOnA
    {
        public string message;
    }
    public class MyCommandResponseOnA
    {
        public int time;
        public string message;
    }

    [Trigger]
    public void OnSomeEvent()
    {
        var commandId = this.RegisterCommand<MyCommandRequestOnA, MyCommandResponseOnA>("MyCommand", (req) => {
                    // req is the command request parameter
                    Debug.Log($"AMod received command: {req.message}");
                    // Return value
                    return new MyCommandResponseOnA {
                        time = DateTime.Now.Millisecond,
                        message = "Response from AMod"
                    };
                });
    }
}
```

To unregister, call `UnregisterCommand`. Registrations are automatically removed when the instance is destroyed:
```csharp
this.UnregisterCommand(commandId);
```

### Executing a Command
To send a command you need a valid **target** `Plugin`/`Asset`/`Node` instance. Use the `PluginRouter`'s `ExecuteCommand` method to send the command:

```csharp
public class MyCommandRequestOnB
{
    public string message;
}
public class MyCommandResponseOnB
{
    public int time;
    public string message;
}

[DataInput]
[TypeIdFilter("AMod.Asset")]
Asset targetEntity;

// Execute command
CommandResult<MyCommandResponseOnB> commandResult = Context.PluginRouter.ExecuteCommand<MyCommandRequestOnB, MyCommandResponseOnB>(
    targetEntity, // Target entity, can be a Plugin/Asset/Node instance
    "MyCommand",  // Command name
    new MyCommandRequestOnB { // Command request parameter
        message = "Hello from BMod!"
    }
);
```

The method returns a `CommandResult<TResponse>` instance, which contains the result of the command:

```csharp
public class CommandResult<T>
{
    public CommandResultStatus Status;
    public T Data;
}
```

`CommandResultStatus` is an enum that indicates the execution status of the command:

```csharp
public enum CommandResultStatus
{
    SUCCESS, // Successfully executed
    ENTITY_NOT_FOUND, // Target entity not found
    COMMAND_NOT_FOUND, // Target entity has not registered this command
    EXECUTION_ERROR // An error occurred while executing the command
}
```

You can check the `Status` field to determine whether the command succeeded, and access the response via the `Data` field:
```csharp
if (commandResult.Status == CommandResultStatus.SUCCESS)
{
    Debug.Log($"BMod received response: {commandResult.Data.message} at {commandResult.Data.time}");
}
else
{
    Debug.LogError($"Command execution failed with status: {commandResult.Status}");
}
```

:::tips

Like signals, command request and response types are interoperable as long as their internal structure matches.

:::

### Querying whether a Command Exists
```csharp
Context.PluginRouter.HasCommand<TArgs>(targetEntity, "CommandName"); // returns bool
```

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [],
}} />
