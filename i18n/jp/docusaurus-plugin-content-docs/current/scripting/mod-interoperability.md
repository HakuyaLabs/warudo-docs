---
sidebar_position: 11
translate_from_version: 2025-12-11
---

# Mod間の相互運用性

Warudo 0.14.3以降、Mod同士で呼び出しが可能です。ModはuModの参照依存関係システムを使用する必要はなく、新しい`PluginRouter`メカニズムを通じて相互運用できます。

## シグナルとスロット

Modは、シグナルを介してほかのModに一方向で宛先を指定しないメッセージを送信できます。これは通常、Mod内部のイベントをブロードキャストするために使用されます。たとえば、環境が内部アニメーションの開始・終了、衝突状態、定義済みの環境イベントがトリガーされたかどうか、またはほかのModが自動的に同期できるその他のMod内部状態をブロードキャストする場合です。

### シグナルを発行する
シグナルを発行するには、有効な`Plugin`/`Asset`/`Node`インスタンスを取得し、`Warudo.Core.Events.Event`を継承するクラスを引数として、そのインスタンスの`EmitSignal`メソッドを呼び出します。

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

:::tip
これは次の呼び出しと同等です。
```csharp
Context.PluginRouter.EmitSignal(this, new MyEventOnA {
    message = "Hello from MyMod!"
});
```

:::

### スロットを接続する
シグナルを受信するには、送信者の型IDとコールバックを渡して、`Plugin`/`Asset`/`Node`インスタンスの`ConnectSlot`を呼び出します。

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

上の例で`ConnectSlot`の第1引数（`"AMod.Asset"`）はシグナル送信者の型IDです。任意の`Plugin`/`Asset`/`Node`型IDを指定できます。`MyEventOnA`と`MyEventOnB`は、内部構造が同一である限り相互運用できます。

:::tip
これは次の呼び出しと同等です。
```csharp
var link = Context.PluginRouter.ConnectSlot<MyEventOnB>(this, "AMod.Asset", (e, s) => {
    if (CanReceiveEvents) {
        handler(e, s);
    }
});
```

:::

## コマンド

Modはコマンドを使用して双方向に通信することもできます。シグナルと異なり、コマンドは指向性のあるリクエスト・レスポンスのやり取りであり、送信者は受信者からの応答を待ちます。

### コマンドを登録する
コマンドを登録するには、コマンド名とコールバックを渡して、`Plugin`/`Asset`/`Node`インスタンスの`RegisterCommand`を呼び出します。

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

登録を解除するには、`UnregisterCommand`を呼び出します。インスタンスが破棄されると、登録は自動的に削除されます。
```csharp
this.UnregisterCommand(commandId);
```

### コマンドを実行する
コマンドを送信するには、有効な**対象**の`Plugin`/`Asset`/`Node`インスタンスが必要です。`PluginRouter`の`ExecuteCommand`メソッドを使用してコマンドを送信します。

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

このメソッドは、コマンドの実行結果を含む`CommandResult<TResponse>`インスタンスを返します。

```csharp
public class CommandResult<T>
{
    public CommandResultStatus Status;
    public T Data;
}
```

`CommandResultStatus`は、コマンドの実行状態を示すenumです。

```csharp
public enum CommandResultStatus
{
    SUCCESS, // Successfully executed
    ENTITY_NOT_FOUND, // Target entity not found
    COMMAND_NOT_FOUND, // Target entity has not registered this command
    EXECUTION_ERROR // An error occurred while executing the command
}
```

`Status`フィールドでコマンドの成功を確認し、`Data`フィールドから応答にアクセスできます。
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

:::tip

シグナルと同様に、コマンドのリクエスト型とレスポンス型は、内部構造が一致する限り相互運用できます。

:::

### コマンドが存在するか問い合わせる
```csharp
Context.PluginRouter.HasCommand<TArgs>(targetEntity, "CommandName"); // returns bool
```

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
