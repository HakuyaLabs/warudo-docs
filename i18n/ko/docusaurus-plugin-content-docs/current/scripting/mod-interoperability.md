---
sidebar_position: 11
translate_from_version: 2026-08-11
---

# 모드 상호운용성

Warudo 0.14.3부터 모드 간에 서로 호출할 수 있게 되었어요. 모드는 uMod의 참조 의존성 시스템을 사용할 필요 없이, 새로운 `PluginRouter` 메커니즘을 사용하여 상호운용할 수 있어요.

## 시그널과 슬롯

모드는 시그널을 통해 다른 모드에 단방향, 비방향성 메시지를 보낼 수 있어요. 이는 일반적으로 내부 모드 이벤트를 브로드캐스트하는 데 사용돼요 — 예를 들어, 환경이 내부 애니메이션의 시작과 끝을 브로드캐스트하거나, 충돌 상태, 미리 정의된 환경 이벤트의 트리거 여부, 또는 다른 모드가 자동으로 동기화할 수 있는 기타 모드 내부 상태 등이에요.

### 시그널 발신

시그널을 발신하려면 유효한 `Plugin`/`Asset`/`Node` 인스턴스가 필요하고, `Warudo.Core.Events.Event`를 상속하는 클래스와 함께 `EmitSignal` 인스턴스 메서드를 호출하면 돼요:

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

이것은 다음과 동일해요:
```csharp
Context.PluginRouter.EmitSignal(this, new MyEventOnA {
    message = "Hello from MyMod!"
});
```

:::

### 슬롯 연결

시그널을 수신하려면, `Plugin`/`Asset`/`Node` 인스턴스에서 `ConnectSlot`을 호출하고, 발신자 타입 ID와 콜백을 전달하면 돼요:

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
                // evt는 Signal 인스턴스, 이 경우 MyEventOnB
                // entity는 시그널을 보낸 엔티티, 이 경우 AModAsset의 인스턴스
            });
            // 슬롯 연결 해제. 인스턴스가 파괴될 때 자동으로 연결 해제돼요
            DisconnectSlot(link);
        }
}
```

위 예시에서 `ConnectSlot`의 첫 번째 인자 (`"AMod.Asset"`)는 시그널 발신자의 타입 ID로, 어떤 `Plugin`/`Asset`/`Node` 타입 ID든 될 수 있어요. `MyEventOnA`와 `MyEventOnB`는 내부 구조가 동일하기만 하면 상호운용이 가능해요.

:::tip

이것은 다음과 동일해요:
```csharp
var link = Context.PluginRouter.ConnectSlot<MyEventOnB>(this, "AMod.Asset", (e, s) => {
    if (CanReceiveEvents) {
        handler(e, s);
    }
});
```

:::

## 커맨드

모드는 커맨드를 사용하여 양방향으로 통신할 수도 있어요. 시그널과 달리, 커맨드는 방향이 있는 요청-응답 상호작용이에요: 발신자가 수신자의 응답을 기다려요.

### 커맨드 등록

커맨드를 등록하려면, `Plugin`/`Asset`/`Node` 인스턴스에서 `RegisterCommand`를 호출하고 커맨드 이름과 콜백을 제공하면 돼요:

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
                    // req는 커맨드 요청 파라미터
                    Debug.Log($"AMod received command: {req.message}");
                    // 반환 값
                    return new MyCommandResponseOnA {
                        time = DateTime.Now.Millisecond,
                        message = "Response from AMod"
                    };
                });
    }
}
```

등록을 해제하려면 `UnregisterCommand`를 호출하세요. 인스턴스가 파괴될 때 등록은 자동으로 제거돼요:
```csharp
this.UnregisterCommand(commandId);
```

### 커맨드 실행

커맨드를 보내려면 유효한 **대상** `Plugin`/`Asset`/`Node` 인스턴스가 필요해요. `PluginRouter`의 `ExecuteCommand` 메서드를 사용하여 커맨드를 보내세요:

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

// 커맨드 실행
CommandResult<MyCommandResponseOnB> commandResult = Context.PluginRouter.ExecuteCommand<MyCommandRequestOnB, MyCommandResponseOnB>(
    targetEntity, // 대상 엔티티, Plugin/Asset/Node 인스턴스가 될 수 있어요
    "MyCommand",  // 커맨드 이름
    new MyCommandRequestOnB { // 커맨드 요청 파라미터
        message = "Hello from BMod!"
    }
);
```

이 메서드는 커맨드의 결과를 담고 있는 `CommandResult<TResponse>` 인스턴스를 반환해요:

```csharp
public class CommandResult<T>
{
    public CommandResultStatus Status;
    public T Data;
}
```

`CommandResultStatus`는 커맨드의 실행 상태를 나타내는 열거형이에요:

```csharp
public enum CommandResultStatus
{
    SUCCESS, // 성공적으로 실행됨
    ENTITY_NOT_FOUND, // 대상 엔티티를 찾을 수 없음
    COMMAND_NOT_FOUND, // 대상 엔티티가 이 커맨드를 등록하지 않음
    EXECUTION_ERROR // 커맨드 실행 중 오류 발생
}
```

`Status` 필드를 확인하여 커맨드가 성공했는지 판단하고, `Data` 필드를 통해 응답에 접근할 수 있어요:
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

시그널과 마찬가지로, 커맨드의 요청 및 응답 타입도 내부 구조가 일치하기만 하면 상호운용이 가능해요.

:::

### 커맨드 존재 여부 쿼리

```csharp
Context.PluginRouter.HasCommand<TArgs>(targetEntity, "CommandName"); // bool을 반환
```

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [
    {name: 'Puri', github: 'Puri12'},
  ],
}} />
