---
sidebar_position: 75
version: 2024-06-16
---

# Communicating with the Editor {#service}

Any communication between the runtime and the editor is done through the `Service` class, accessible via the `Context` singleton object. For example, to display a popup message in the editor, you can use the following code:

```csharp
Context.Service.PromptMessage("Hey!", "I'm a message!");
```

Here are some of the commonly used methods:

- **`void BroadcastOpenedScene()`:** Send the entire scene to the editor. You only need to do this after programmatically adding/removing assets and blueprints to/from the scene.
- **`void Toast(ToastSeverity severity, string header, string summary, string message = null, TimeSpan duration = default)`:** Show a toast message in the editor. If `message` is not `null`, the user can click on the toast to see the full message.
- **`void PromptMessage(string header, string message, bool markdown = false)`:** Show a popup message in the editor. If `markdown` is `true`, the message will be rendered as Markdown text.
- **`UniTask<bool> PromptConfirmation(string header, string message)`:** Show a confirmation dialog in the editor. Returns `true` if the user clicks "OK", and `false` if the user clicks "Cancel".
- **`UniTask<T> PromptStructuredDataInput<T>(string header, T structuredData = null)`:** Show a [structured data input dialog](structured-data#input) in the editor. If passed a `structuredData` object, the dialog will be pre-filled with the data. Returns the structured data object after the user clicks "OK", or `null` if the user clicks "Cancel".
- **`UniTask<T> PromptStructuredDataInput<T>(string header, Action<T> structuredDataInitializer)`:** Similar to the above, but the `structuredDataInitializer` function is called to initialize the structured data object.
- **`void ShowProgress(string message, float progress, TimeSpan timeout = default)`:** Show a progress bar in the editor. The `progress` value should be between 0 and 1. If `timeout` is specified, the progress bar will automatically hide after the specified duration.
- **`void HideProgress()`:** Hide the progress bar.
- **`void NavigateToGraph(Guid graphId, Guid nodeId = default)`:** Navigate to the specified graph in the editor. If `nodeId` is specified, the editor will select the specified node in the graph.
- **`void NavigateToPlugin(string pluginId, string port = default)`:** Navigate to the specified plugin in the editor. If `port` is specified, the editor will navigate to the specified port of the plugin.

:::tip
You can safely assume `Context.Service` is always available in the runtime, even if the editor is closed.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
