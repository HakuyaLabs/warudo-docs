---
sidebar_position: 75
---

# Comunicándose con el Editor {#service}

Toda comunicación entre el runtime y el editor se realiza a través de la clase `Service`, accesible mediante el objeto singleton `Context`. Por ejemplo, para mostrar un mensaje popup en el editor, puedes usar el siguiente código:

```csharp
Context.Service.PromptMessage("Hey!", "I'm a message!");
```

Aquí están algunos de los métodos más comúnmente usados:

- **`void BroadcastOpenedScene()`:** Envía toda la escena al editor. Solo necesitas hacer esto después de agregar/eliminar assets y blueprints de la escena programáticamente.
- **`void Toast(ToastSeverity severity, string header, string summary, string message = null, TimeSpan duration = default)`:** Muestra un mensaje toast en el editor. Si `message` no es `null`, el usuario puede hacer clic en el toast para ver el mensaje completo.
- **`void PromptMessage(string header, string message, bool markdown = false)`:** Muestra un mensaje popup en el editor. Si `markdown` es `true`, el mensaje será renderizado como texto Markdown.
- **`UniTask<bool> PromptConfirmation(string header, string message)`:** Muestra un diálogo de confirmación en el editor. Devuelve `true` si el usuario hace clic en "OK", y `false` si el usuario hace clic en "Cancel".
- **`UniTask<T> PromptStructuredDataInput<T>(string header, T structuredData = null)`:** Muestra un [diálogo de entrada de structured data](structured-data#input) en el editor. Si se pasa un objeto `structuredData`, el diálogo será prellenado con los datos. Devuelve el objeto structured data después de que el usuario haga clic en "OK", o `null` si el usuario hace clic en "Cancel".
- **`UniTask<T> PromptStructuredDataInput<T>(string header, Action<T> structuredDataInitializer)`:** Similar al anterior, pero la función `structuredDataInitializer` es llamada para inicializar el objeto structured data.
- **`void ShowProgress(string message, float progress, TimeSpan timeout = default)`:** Muestra una barra de progreso en el editor. El valor `progress` debe estar entre 0 y 1. Si se especifica `timeout`, la barra de progreso se ocultará automáticamente después de la duración especificada.
- **`void HideProgress()`:** Oculta la barra de progreso.
- **`void NavigateToGraph(Guid graphId, Guid nodeId = default)`:** Navega al gráfico especificado en el editor. Si se especifica `nodeId`, el editor seleccionará el nodo especificado en el gráfico.
- **`void NavigateToPlugin(string pluginId, string port = default)`:** Navega al plugin especificado en el editor. Si se especifica `port`, el editor navegará al port especificado del plugin.

:::tip
Puedes asumir con seguridad que `Context.Service` siempre está disponible en el runtime, incluso si el editor está cerrado.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
