---
sidebar_position: 150
version: 2026-09-19
---

# External Callbacks {#callbacks}

External callbacks are how your plugin completes **OAuth-style authorization and account-linking flows** — and, more generally, how a program **outside** Warudo (a web page, a phone browser, another process) hands a one-off result back to your logic inside Warudo. Warudo hosts the "redirect target" for you: you register a handler, get back a local URL or a `warudo://` deep link, and when the external flow comes back to it, the query parameters are delivered to your handler.

External WebSocket channels are the persistent counterpart: instead of one request coming back, an external program keeps an open, bidirectional connection with your plugin — for example, an external whiteboard/drawing app streaming strokes into Warudo in real time.

Both are managed by `Context.ExternalCallbackManager`, normally through the convenience methods on your `Plugin` / entities:

- **External callbacks**: one-shot or reusable HTTP handlers, ideal for OAuth redirects, "open this link on your phone" pairing codes, and webhook-style pushes.
- **External WebSocket channels**: persistent, bidirectional data links for continuous synchronization.

## External Callbacks {#http-callbacks}

### The Linking Flow {#linking-flow}

A typical OAuth/account-linking flow looks like this:

1. Your plugin calls `CreateExternalCallback` and receives a `url` like `http://localhost:19052/callback/{callbackId}`.
2. You use that URL as the **redirect URI** when launching the authorization (e.g. show the user an authorize link, or open it in their browser).
3. After the user approves, the browser redirects back to your callback URL with the provider's parameters — e.g. `?code=abc123&state=xyz`.
4. Warudo invokes your handler with those parameters as a dictionary, and answers the browser with a friendly built-in status page ("✅ done, close this window") — the user never sees raw JSON.
5. The handler returns `true`, and the callback revokes itself. You finish the token exchange from the main thread.

### Creating a Callback {#creating-a-callback}

```csharp
[Trigger]
public void StartLinking() {
    var callback = CreateExternalCallback(args => {
        // args is a Dictionary<string, string> parsed from the query string,
        // e.g. the ?code=...&state=... the provider redirected back with
        pendingAuthResult = args;
        return Task.FromResult(true);  // consume: the callback revokes itself after this call
    }, "Linking complete! You can close this page.");  // description shown on the success page
    Debug.Log($"Redirect URI: {callback.url}");
}
```

The returned `ExternalCallback` object gives you everything the external flow needs:

| Property | Example | Description |
| --- | --- | --- |
| `callbackId` | `com.example.myplugin-3f2a…` | Unique ID of the callback. |
| `url` | `http://localhost:19052/callback/{callbackId}` | HTTP GET endpoint. Query-string parameters are passed to your handler as a dictionary. |
| `warudoLink` | `warudo://callback/{callbackId}` | Deep link that opens Warudo from a browser or phone app and forwards the call through the Warudo Link companion — useful when the flow starts on a phone. |

An external caller needs nothing more than an ordinary HTTP request — which is exactly what a browser redirect is:

```bash
curl "http://localhost:19052/callback/com.example.myplugin-3f2a...?code=abc123&state=xyz"
```

### One-shot vs. Reusable {#one-shot}

The handler returns a `Task<bool>`:

- Return `true` to signal "handled, I'm done" — the callback is automatically revoked and further calls will fail. This is what you want for authorization codes, pairing tokens, and other results that must be single-use.
- Return `false` to keep it alive for future calls (e.g. a webhook that fires repeatedly).

Either way, you can revoke a callback manually at any time — call this when the user cancels a linking flow:

```csharp
RevokeExternalCallback(callback);      // or RevokeExternalCallback(callback.callbackId)
```

All callbacks created by a plugin are automatically revoked when the plugin is destroyed, so you don't need to worry about leaks across hot reloads.

### The Response Page {#response-page}

When the redirect lands in a **browser**, Warudo responds with a small built-in HTML page instead of JSON — a centered status card. On success, the page title shows the `description` you passed to `CreateExternalCallback` (e.g. "✅ Linked! You can close this page."); on failure it shows an error card with a localized message. The external site you are linking with needs no parsing logic at all.

:::warning
The handler may run on a **background thread** (the HTTP server or the deep-link relay thread). Do not touch Unity objects or scene state directly inside the handler — and do not start the network token exchange there either. A safe pattern is: store the received values in plain fields, set a "pending" flag, and do the actual work in `OnUpdate()` on the main thread:

```csharp
private volatile Dictionary<string, string> pendingAuthResult; // written from the callback thread

public override void OnUpdate() {
    base.OnUpdate();
    var result = pendingAuthResult;
    if (result == null) return;
    pendingAuthResult = null;
    // Now it is safe to touch the scene and start the token exchange
}
```
:::

## External WebSocket Channels {#websocket-channels}

When one-shot request/response is not enough — for example, an external whiteboard app that should **continuously sync its strokes** into Warudo, or a remote control that sends input while receiving state back — create a WebSocket channel on any entity (asset, node, or plugin):

```csharp
var channel = CreateWebSocketChannel(async (Send, args) => {
    // args.Data is one message from the external client, e.g. a JSON point: {"x":0.32,"y":0.61}
    pendingStrokes.Enqueue(args.Data);   // ConcurrentQueue<string>; consumed in OnUpdate()
    await Send(Encoding.UTF8.GetBytes("ack"));
});
// channel.websocketUrl => "ws://0.0.0.0:19190"
// channel.channelId    => the value to put in the "Channel" request header
```

The external client connects to `ws://localhost:19190` and identifies the channel with a **`Channel` request header** in the WebSocket handshake:

```javascript
// Node.js using the `ws` package (browsers cannot set custom handshake headers)
const WebSocket = require("ws");
const ws = new WebSocket("ws://127.0.0.1:19190", {
  headers: { Channel: "my-entity-id-3f2a..." }, // the channelId from CreateWebSocketChannel
});
ws.on("open", () => {
  setInterval(() => ws.send(JSON.stringify(readNextWhiteboardPoint())), 16); // stream strokes
});
ws.on("message", (data) => console.log("Warudo acked:", data.toString())); // "ack"
```

Every message on that connection is routed to your handler, and `Send` pushes bytes back to the same client. The channel stays open until you remove it:

```csharp
RemoveWebSocketChannel(channel);
```

:::warning
Unlike plugin callbacks, WebSocket channels are **not** removed automatically when the owning entity is destroyed. Call `RemoveWebSocketChannel` from `OnDestroy()`.
:::

:::info
Connections without a `Channel` header still go through the existing raw-message pipeline (`WebSocketRawMessageEvent` on the event bus), so adding channels does not affect other WebSocket users of port 19190.
:::

## Complete Example {#example}

A plugin that links an account via an OAuth-style redirect and keeps a whiteboard channel open for live stroke sync:

```csharp
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Core.Server;

[PluginType(Id = "com.example.externalbridge", Name = "External Bridge", Version = "1.0.0")]
public class ExternalBridgePlugin : Plugin {

    private ExternalCallbackManager.ExternalCallback linkCallback;
    private ExternalCallbackManager.ExternalWebSocket whiteboardChannel;

    // Written from callback/client threads, consumed in OnUpdate() on the main thread
    private volatile Dictionary<string, string> pendingAuthResult;
    private readonly ConcurrentQueue<string> pendingStrokes = new();

    // ---------- OAuth-style account linking ----------

    [Trigger]
    public void StartLinking() {
        CancelLinking();
        linkCallback = CreateExternalCallback(args => {
            pendingAuthResult = args;           // e.g. ?code=abc123&state=xyz redirected back
            return Task.FromResult(true);       // authorization codes are single-use
        }, "Linking complete! You can close this page.");
        var redirectUri = Uri.EscapeDataString(linkCallback.url);
        Context.Service.PromptMessage("Link account",
            $"Ask the user to open:\nhttps://example.com/oauth/authorize?client_id=...&redirect_uri={redirectUri}&state=xyz");
    }

    [Trigger]
    public void CancelLinking() {
        if (linkCallback != null) RevokeExternalCallback(linkCallback);
        linkCallback = null;
        pendingAuthResult = null;
    }

    private void HandleAuthResult(Dictionary<string, string> result) {
        // Main thread: exchange result["code"] for an access token (UnityWebRequest, etc.),
        // store it, and update the UI. The callback has already revoked itself.
    }

    // ---------- Persistent whiteboard sync ----------

    [Trigger]
    public void OpenWhiteboard() {
        if (whiteboardChannel != null) CloseWhiteboard();
        whiteboardChannel = CreateWebSocketChannel(async (Send, args) => {
            pendingStrokes.Enqueue(args.Data); // one stroke point per message
            await Send(Encoding.UTF8.GetBytes("ack"));
        });
        Debug.Log($"Point the whiteboard app at {whiteboardChannel.websocketUrl} " +
                  $"with header Channel: {whiteboardChannel.channelId}");
    }

    [Trigger]
    public void CloseWhiteboard() {
        if (whiteboardChannel != null) RemoveWebSocketChannel(whiteboardChannel);
        whiteboardChannel = null;
    }

    // ---------- Main-thread pumping ----------

    public override void OnUpdate() {
        base.OnUpdate();
        var result = pendingAuthResult;
        if (result != null) {
            pendingAuthResult = null;
            HandleAuthResult(result);
        }
        while (pendingStrokes.TryDequeue(out var stroke)) {
            // Parse the JSON point and feed it to the scene — safe here, we are on the main thread
        }
    }

    protected override void OnDestroy() {
        base.OnDestroy();
        CancelLinking();
        CloseWhiteboard(); // WebSocket channels must be removed manually
    }
}
```

## Quick Reference {#quick-reference}

| API (on `Plugin`) | Description |
| --- | --- |
| `ExternalCallback CreateExternalCallback(ReceiveCallBack handler)` | Register a callback; `handler` is `async (Dictionary<string, string> args) => bool`. |
| `ExternalCallback CreateExternalCallback(ReceiveCallBack handler, string description)` | Same, with a custom title on the browser success page. |
| `void RevokeExternalCallback(string callbackId)` / `RevokeExternalCallback(ExternalCallback)` | Revoke a callback. All of the plugin's callbacks are also revoked automatically when the plugin is destroyed. |

| API (on any `Entity`) | Description |
| --- | --- |
| `ExternalWebSocket CreateWebSocketChannel(ReceiveWebSocket handler)` | Register a WebSocket channel; `handler` is `async (Send, MessageEventArgs args) => void`. |
| `void RemoveWebSocketChannel(...)` | Close a channel (by object or by `channelId`). |

| Endpoint | Default |
| --- | --- |
| HTTP callback | `http://localhost:19052/callback/{callbackId}` |
| WebSocket | `ws://localhost:19190` with header `Channel: {channelId}` |
| Deep link | `warudo://callback/{callbackId}` |

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [],
}} />
