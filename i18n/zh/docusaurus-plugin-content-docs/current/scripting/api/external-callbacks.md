---
sidebar_position: 150
---

# 外部回调 (External Callbacks) {#callbacks}

外部回调是插件完成 **OAuth 式授权 / 账号绑定流程**的方式——更一般地说，它是 Warudo **之外**的程序（网页、手机浏览器、其他进程）把一次性结果交还给 Warudo 内部逻辑的通道。Warudo 替你托管"重定向目标"：注册一个处理器，拿到一个本地 URL 或 `warudo://` 深链接，当外部流程回到这个地址时，查询参数会以字典形式送达你的处理器。

外部 WebSocket 通道则是它的持久版对应物：不再是"一次请求回来"，而是外部程序与插件之间保持一条打开的双向连接——例如外部画板/绘图应用把笔迹实时流入 Warudo。

两者都由 `Context.ExternalCallbackManager` 管理（一般通过 `Plugin` / 实体上的封装方法使用）：

- **外部回调（External Callback）**：一次性或可复用的 HTTP 处理器，适合 OAuth 重定向、"用手机打开这个链接"的配对码、webhook 式推送。
- **外部 WebSocket 通道**：持久的双向数据链路，适合连续同步。

## 外部回调 {#http-callbacks}

### 绑定流程 {#linking-flow}

典型的 OAuth/账号绑定流程如下：

1. 插件调用 `CreateExternalCallback`，得到一个形如 `http://localhost:19052/callback/{callbackId}` 的 `url`。
2. 发起授权时把这个 URL 作为**重定向 URI**（例如向用户展示授权链接，或直接在浏览器中打开）。
3. 用户同意后，浏览器带着服务商的参数重定向回你的回调 URL——例如 `?code=abc123&state=xyz`。
4. Warudo 用这些参数（字典形式）调用你的处理器，并给浏览器返回一个友好的内置状态页（"✅ 已完成，可以关闭此窗口"）——用户不会看到原始 JSON。
5. 处理器返回 `true`，回调自动撤销。你再从主线程完成后续的令牌交换。

### 创建回调 {#creating-a-callback}

```csharp
[Trigger]
public void StartLinking() {
    var callback = CreateExternalCallback(args => {
        // args 是查询参数解析出的 Dictionary<string, string>，
        // 例如服务商重定向回来的 ?code=...&state=...
        pendingAuthResult = args;
        return Task.FromResult(true);  // 消费：本次调用后回调自动撤销
    }, "绑定完成！可以关闭本页了。");  // 描述，会显示在成功页面标题上
    Debug.Log($"重定向 URI: {callback.url}");
}
```

返回的 `ExternalCallback` 对象包含了外部流程所需的所有入口信息：

| 属性 | 示例 | 说明 |
| --- | --- | --- |
| `callbackId` | `com.example.myplugin-3f2a…` | 回调的唯一 ID。 |
| `url` | `http://localhost:19052/callback/{callbackId}` | HTTP GET 端点。查询串参数会以字典形式传给你的处理器。 |
| `warudoLink` | `warudo://callback/{callbackId}` | 深链接。可从浏览器/手机唤起 Warudo，并经 Warudo Link 伴生进程转发调用——适合在手机上发起的流程。 |

外部调用方只需要一个普通的 HTTP 请求——浏览器重定向本质上正是如此：

```bash
curl "http://localhost:19052/callback/com.example.myplugin-3f2a...?code=abc123&state=xyz"
```

### 一次性 vs. 可复用 {#one-shot}

处理器的签名是 `Task<bool>`：

- 返回 `true` 表示"已处理、到此为止"——回调被自动撤销，后续调用会失败。授权码、配对令牌等必须一次性的结果就该这样处理。
- 返回 `false` 则保留回调，供之后反复触发（例如会被多次推送的 webhook）。

无论哪种，你都可以随时手动撤销——用户取消绑定流程时就该调用它：

```csharp
RevokeExternalCallback(callback);      // 或 RevokeExternalCallback(callback.callbackId)
```

插件销毁时，其创建的所有回调会按插件 ID 自动批量撤销，热重载时不必担心泄漏。

### 响应页面 {#response-page}

当重定向落在**浏览器**中时，Warudo 返回的不是 JSON，而是一个内置的小型 HTML 页面——居中的状态卡片。成功时页面主标题显示你传给 `CreateExternalCallback` 的 `description`（例如"✅ 绑定成功！可以关闭本页了。"）；失败时显示带本地化文案的错误卡片。与之绑定的外部站点完全不需要任何解析逻辑。

:::warning
处理器可能运行在**后台线程**（HTTP 服务器线程或深链接中继线程）。不要在处理器里直接操作 Unity 对象或场景状态——也不要在其中发起网络令牌交换。安全的写法是：把收到的值存进普通字段并设置"待处理"标志，再在 `OnUpdate()` 中回到主线程处理：

```csharp
private volatile Dictionary<string, string> pendingAuthResult; // 由回调线程写入

public override void OnUpdate() {
    base.OnUpdate();
    var result = pendingAuthResult;
    if (result == null) return;
    pendingAuthResult = null;
    // 此时可以安全操作场景、开始令牌交换
}
```
:::

## 外部 WebSocket 通道 {#websocket-channels}

当一次性的请求/响应不够用——例如外部画板应用需要把笔迹**持续同步**进 Warudo，或一个遥控器边发送操作边接收状态回传——可以在任意实体（资产、节点或插件）上创建 WebSocket 通道：

```csharp
var channel = CreateWebSocketChannel(async (Send, args) => {
    // args.Data 是外部客户端发来的一条消息，例如 JSON 坐标点：{"x":0.32,"y":0.61}
    pendingStrokes.Enqueue(args.Data);   // ConcurrentQueue<string>；在 OnUpdate() 中消费
    await Send(Encoding.UTF8.GetBytes("ack"));
});
// channel.websocketUrl => "ws://0.0.0.0:19190"
// channel.channelId    => 握手请求头 "Channel" 应填的值
```

外部客户端连接 `ws://localhost:19190`，并在 WebSocket **握手请求头**中携带 `Channel` 来指定通道：

```javascript
// Node.js（使用 ws 包；浏览器无法自定义握手头）
const WebSocket = require("ws");
const ws = new WebSocket("ws://127.0.0.1:19190", {
  headers: { Channel: "my-entity-id-3f2a..." }, // CreateWebSocketChannel 返回的 channelId
});
ws.on("open", () => {
  setInterval(() => ws.send(JSON.stringify(readNextWhiteboardPoint())), 16); // 持续流入笔迹
});
ws.on("message", (data) => console.log("Warudo 确认：", data.toString())); // "ack"
```

该连接上的每条消息都会被路由给你的处理器，`Send` 则把字节回发给同一个客户端。通道会一直保持打开，直到你移除它：

```csharp
RemoveWebSocketChannel(channel);
```

:::warning
与插件回调不同，WebSocket 通道**不会**随宿主实体销毁而自动移除。请在 `OnDestroy()` 中调用 `RemoveWebSocketChannel`。
:::

:::info
不带 `Channel` 头的连接仍会走原有的原始消息管线（事件总线上的 `WebSocketRawMessageEvent`），因此新增通道不影响 19190 端口上的其他 WebSocket 用户。
:::

## 完整示例 {#example}

一个插件把两块拼在一起：通过 OAuth 式重定向绑定账号，并开一条持续同步笔迹的画板 WebSocket 通道：

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

    // 由回调/客户端线程写入，在 OnUpdate() 的主线程消费
    private volatile Dictionary<string, string> pendingAuthResult;
    private readonly ConcurrentQueue<string> pendingStrokes = new();

    // ---------- OAuth 式账号绑定 ----------

    [Trigger]
    public void StartLinking() {
        CancelLinking();
        linkCallback = CreateExternalCallback(args => {
            pendingAuthResult = args;           // 例如重定向回来的 ?code=abc123&state=xyz
            return Task.FromResult(true);       // 授权码只用一次
        }, "绑定完成！可以关闭本页了。");
        var redirectUri = Uri.EscapeDataString(linkCallback.url);
        Context.Service.PromptMessage("绑定账号",
            $"请让用户打开：\nhttps://example.com/oauth/authorize?client_id=...&redirect_uri={redirectUri}&state=xyz");
    }

    [Trigger]
    public void CancelLinking() {
        if (linkCallback != null) RevokeExternalCallback(linkCallback);
        linkCallback = null;
        pendingAuthResult = null;
    }

    private void HandleAuthResult(Dictionary<string, string> result) {
        // 主线程：用 result["code"] 换取访问令牌（UnityWebRequest 等）、存储并更新 UI。
        // 此时回调已自行撤销。
    }

    // ---------- 持久画板同步 ----------

    [Trigger]
    public void OpenWhiteboard() {
        if (whiteboardChannel != null) CloseWhiteboard();
        whiteboardChannel = CreateWebSocketChannel(async (Send, args) => {
            pendingStrokes.Enqueue(args.Data); // 每条消息一个笔迹点
            await Send(Encoding.UTF8.GetBytes("ack"));
        });
        Debug.Log($"让画板应用连接 {whiteboardChannel.websocketUrl}，" +
                  $"请求头 Channel: {whiteboardChannel.channelId}");
    }

    [Trigger]
    public void CloseWhiteboard() {
        if (whiteboardChannel != null) RemoveWebSocketChannel(whiteboardChannel);
        whiteboardChannel = null;
    }

    // ---------- 主线程轮询消费 ----------

    public override void OnUpdate() {
        base.OnUpdate();
        var result = pendingAuthResult;
        if (result != null) {
            pendingAuthResult = null;
            HandleAuthResult(result);
        }
        while (pendingStrokes.TryDequeue(out var stroke)) {
            // 解析 JSON 坐标点并喂给场景——这里在主线程，操作安全
        }
    }

    protected override void OnDestroy() {
        base.OnDestroy();
        CancelLinking();
        CloseWhiteboard(); // WebSocket 通道必须手动移除
    }
}
```

## 速查表 {#quick-reference}

| API（`Plugin` 上） | 说明 |
| --- | --- |
| `ExternalCallback CreateExternalCallback(ReceiveCallBack handler)` | 注册回调；`handler` 形如 `async (Dictionary<string, string> args) => bool`。 |
| `ExternalCallback CreateExternalCallback(ReceiveCallBack handler, string description)` | 同上，`description` 用作浏览器成功页的主标题。 |
| `void RevokeExternalCallback(string callbackId)` / `RevokeExternalCallback(ExternalCallback)` | 撤销回调。插件销毁时其全部回调也会自动撤销。 |

| API（任意 `Entity` 上） | 说明 |
| --- | --- |
| `ExternalWebSocket CreateWebSocketChannel(ReceiveWebSocket handler)` | 注册 WebSocket 通道；`handler` 形如 `async (Send, MessageEventArgs args) => void`。 |
| `void RemoveWebSocketChannel(...)` | 关闭通道（传对象或 `channelId` 均可）。 |

| 端点 | 默认值 |
| --- | --- |
| HTTP 回调 | `http://localhost:19052/callback/{callbackId}` |
| WebSocket | `ws://localhost:19190`，请求头 `Channel: {channelId}` |
| 深链接 | `warudo://callback/{callbackId}` |

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [],
}} />
