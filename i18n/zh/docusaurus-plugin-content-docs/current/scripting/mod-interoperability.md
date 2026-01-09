---
sidebar_position: 11
---

# Mod 互操作性

Warudo 从 0.14.3 版本起，支持 Mod 之间的调用。Mod 之间无需使用 uMod 的引用依赖系统，而是可以让 Mod 通过全新的 PluginRouter 机制进行互操作。

## 信号与插槽
Mod 可以通过信号向其他 Mod 发送不定向的单向消息。这一般可以用于 Mod 内部事件的广播，例如环境广播其内部动画的开始与结束，碰撞状态、是否触发环境预定义事件或某些 Mod 有内部状态可以进行广播以便其他 Mod 自动与其同步。

### 发送信号
要发送信号，需要一个有效的 `Plugin`/`Asset`/`Node` 实例，并调用其实例方法 `EmitSignal` 并传入一个继承于 `Warudo.Core.Events.Event` 的类：

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

这相当于调用
```csharp
Context.PluginRouter.EmitSignal(this, new MyEventOnA {
    message = "Hello from MyMod!"
});
```

:::

### 连接信号槽
要接收信号，需要在 `Plugin`/`Asset`/`Node` 实例中调用 `ConnectSlot` 方法，并传入信号的发送方类型 ID 与回调函数：

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
            // evt 即 Signal 实例，在此处为 MyEventOnB
            // entity 为发送该信号的实体，在此处为 AModAsset 的实例
        });
        // 断开连接，该实例移除时会自动断开
        DisconnectSlot(link); 
    }
}
```

在上述代码中，`ConnectSlot` 的第一个参数 `"AMod.Asset"` 是信号发送方的类型 ID，可以是 `Plugin`/`Asset`/`Node` 的任意一种类型 ID。`MyEventOnA` 和 `MyEventOnB` 只要内部结构相同即可互通。

:::tips

这相当于调用
```csharp
var link = Context.PluginRouter.ConnectSlot<MyEventOnB>(this, "AMod.Asset", (e, s) => {
    if (CanReceiveEvents) {
        handler(e, s);
    }
});
```

:::

## 命令
Mod 之间也可以通过命令进行双向通信。命令与信号不同的是，命令是有明确目标的请求-响应式通信，发送方会等待接收方的响应结果。

### 注册一个命令
要注册一个命令，需要在 `Plugin`/`Asset`/`Node` 实例中调用 `RegisterCommand` 方法，并传入命令名称与回调函数：

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
            // req 即命令请求的参数
            Debug.Log($"AMod received command: {req.message}");
            // 返回值
            return new MyCommandResponseOnA {
                time = DateTime.Now.Millisecond,
                message = "Response from AMod"
            };
        });
    }
}
```

想要解除命令注册，可以调用 `UnregisterCommand` 方法，当前实例被销毁时会自动解除注册：

```csharp
this.UnregisterCommand(commandId);
```

### 执行命令
要发送一个命令，需要有效的**目标** `Plugin`/`Asset`/`Node` 实例。并通过 `PluginRouter` 的 `ExecuteCommand` 方法发送命令

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

// 调用
CommandResult<MyCommandResponseOnB> commandResult = Context.PluginRouter.ExecuteCommand<MyCommandRequestOnB, MyCommandResponseOnB>(
    targetEntity, // 目标实体，可以是 Plugin/Asset/Node 实例
    "MyCommand",  // 命令名称
    new MyCommandRequestOnB { // 命令请求参数
        message = "Hello from BMod!"
    }
);
```

该方法会返回一个 `CommandResult<TResponse>` 实例，包含命令的执行结果：

```csharp
public class CommandResult<T>
{
    public CommandResultStatus Status;
    public T Data;
}
```

其中 `CommandResultStatus` 是一个枚举，表示命令的执行状态：

```csharp
public enum CommandResultStatus
{
    SUCCESS, // 成功执行
    ENTITY_NOT_FOUND, // 没有找到目标实体
    COMMAND_NOT_FOUND, // 目标实体没有注册该命令
    EXECUTION_ERROR // 执行命令时发生错误
}
```

可以通过检查 `Status` 字段来判断命令是否成功执行，并可以通过 `Data` 字段访问响应数据

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

与信号类似，命令的请求与响应类型只要内部结构相同即可互通。

:::

### 查询命令是否存在
```csharp
Context.PluginRouter.HasCommand<TArgs>(targetEntity, "CommandName"); // 返回 bool
```

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [],
}} />
