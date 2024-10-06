---
sidebar_position: 75
---

# 에디터와의 통신 {#service}

런타임과 에디터 간의 모든 통신은 `Service` 클래스를 통해 이루어지며, 이는 `Context` 싱글턴 오브젝트를 통해 접근할 수 있어요. 예를 들어, 에디터에서 팝업 메시지를 표시하려면 다음 코드를 사용할 수 있습니다:

```csharp
Context.Service.PromptMessage("Hey!", "I'm a message!");
```

자주 사용되는 메서드:

- **`void BroadcastOpenedScene()`:** 씬 전체를 에디터로 전송해요. 씬에 에셋이나 blueprint를 프로그램적으로 추가/삭제한 후에만 호출하면 돼요.
- **`void Toast(ToastSeverity severity, string header, string summary, string message = null, TimeSpan duration = default)`:** 에디터에 토스트 메시지를 표시해요. `message`가 null이 아니면, 사용자는 토스트를 클릭해 전체 메시지를 볼 수 있어요.
- **`void PromptMessage(string header, string message, bool markdown = false)`:** 에디터에 팝업 메시지를 표시해요. `markdown`이 `true`면, 메시지는 Markdown 형식으로 렌더링돼요.
- **`UniTask<bool> PromptConfirmation(string header, string message)`:** 에디터에 확인 다이얼로그를 표시해요. 사용자가 "OK"를 클릭하면 `true`를 반환하고, "Cancel"을 클릭하면 `false`를 반환해요.
- **`UniTask<T> PromptStructuredDataInput<T>(string header, T structuredData = null)`:** 에디터에 [구조화된 데이터 인풋 다이얼로그](structured-data#input)를 표시해요. `structuredData` 오브젝트를 전달하면, 해당 데이터로 미리 채워진 다이얼로그가 표시돼요. 사용자가 "OK"를 클릭하면 구조화된 데이터 오브젝트를 반환하고 "Cancel"을 클릭하면 `null`을 반환해요.
- **`UniTask<T> PromptStructuredDataInput<T>(string header, Action<T> structuredDataInitializer)`:** 위와 비슷하지만, `structuredDataInitializer` 함수가 구조화된 데이터 오브젝트를 초기화하는 데 사용돼요.
- **`void ShowProgress(string message, float progress, TimeSpan timeout = default)`:** 에디터에 진행률 표시줄을 표시해요. `progress` 값은 0과 1 사이여야 해요. `timeout`이 지정되면, 해당 시간 후에 진행률 표시줄이 자동으로 사라져요.
- **`void HideProgress()`:** 진행률 표시줄을 숨겨요.
- **`void NavigateToGraph(Guid graphId, Guid nodeId = default)`:** 에디터에서 지정된 그래프로 이동해요. `nodeId`가 지정되면, 에디터는 해당 그래프에서 지정된 노드를 선택해요.
- **`void NavigateToPlugin(string pluginId, string port = default)`:** 에디터에서 지정된 플러그인으로 이동해요. `port`가 지정되면, 에디터는 해당 플러그인의 지정된 포트로 이동해요.

:::tip
`Context.Service`는 에디터가 닫혀 있어도 런타임에서 언제든지 사용할 수 있다고 생각하시면 돼요.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
