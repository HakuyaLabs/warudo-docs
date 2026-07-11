---
sidebar_position: 75
translate_from_version: 2024-06-16
---

# エディターとの通信 {#service}

ランタイムとエディター間の通信はすべて、`Context`シングルトンオブジェクトからアクセスできる`Service`クラスを介して行います。たとえば、エディターにポップアップメッセージを表示するには、次のコードを使用します。

```csharp
Context.Service.PromptMessage("Hey!", "I'm a message!");
```

よく使用されるメソッドを以下に示します。

- **`void BroadcastOpenedScene()`:** シーン全体をエディターに送信します。プログラムからシーンにアセットやブループリントを追加・削除した場合にだけ必要です。
- **`void Toast(ToastSeverity severity, string header, string summary, string message = null, TimeSpan duration = default)`:** エディターにトーストメッセージを表示します。`message`が`null`でない場合、ユーザーはトーストをクリックしてメッセージ全体を確認できます。
- **`void PromptMessage(string header, string message, bool markdown = false)`:** エディターにポップアップメッセージを表示します。`markdown`が`true`の場合、メッセージはMarkdownテキストとしてレンダリングされます。
- **`UniTask<bool> PromptConfirmation(string header, string message)`:** エディターに確認ダイアログを表示します。ユーザーが"OK"をクリックした場合は`true`、"Cancel"をクリックした場合は`false`を返します。
- **`UniTask<T> PromptStructuredDataInput<T>(string header, T structuredData = null)`:** エディターに[構造化データ入力ダイアログ](structured-data#input)を表示します。`structuredData`オブジェクトを渡すと、ダイアログにはそのデータがあらかじめ入力されます。ユーザーが"OK"をクリックした後に構造化データオブジェクトを返し、"Cancel"をクリックした場合は`null`を返します。
- **`UniTask<T> PromptStructuredDataInput<T>(string header, Action<T> structuredDataInitializer)`:** 上記と同様ですが、`structuredDataInitializer`関数を呼び出して構造化データオブジェクトを初期化します。
- **`void ShowProgress(string message, float progress, TimeSpan timeout = default)`:** エディターに進行状況バーを表示します。`progress`の値は0から1の範囲で指定します。`timeout`を指定した場合、進行状況バーは指定した時間の経過後に自動的に非表示になります。
- **`void HideProgress()`:** 進行状況バーを非表示にします。
- **`void NavigateToGraph(Guid graphId, Guid nodeId = default)`:** エディターで指定したグラフに移動します。`nodeId`を指定した場合、エディターはグラフ内の指定したノードを選択します。
- **`void NavigateToPlugin(string pluginId, string port = default)`:** エディターで指定したプラグインに移動します。`port`を指定した場合、エディターはプラグインの指定したポートに移動します。

:::tip
エディターが閉じている場合でも、ランタイムでは`Context.Service`を常に利用できると考えて問題ありません。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
