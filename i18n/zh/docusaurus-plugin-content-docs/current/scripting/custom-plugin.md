---
sidebar_position: 40
---

# 自定义插件

:::warning

本条目目前仍在开发中，尚不完整。我们正在努力完善其内容。

:::

## 范例

### 基础

- [Example plugin](https://gist.github.com/TigerHix/b78aabffc2d03346ff3da526706ce2ca)  
插件的基础模板（单文件），`Plugin` 类的基本使用。

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)  
完整插件范例（多文件），包括 **Stream Deck 插件** 和 **VMC 插件**。
    - **Stream Deck Plugin**：该插件通过 WebSocket 与外部应用程序通信（Warudo 的 [Stream Deck plugin](https://apps.elgato.com/plugins/warudo.streamdeck)）。它演示了 WebSocket 服务基类 `WebSocketService` 的使用。
    - **VMC Plugin**：此插件通过注册 `FaceTrackingTemplate` 和 `PoseTrackingTemplate` 从而添加了 [VMC](https://protocol.vmc.info/english) 作为受支持的动作捕捉方案。

### 进阶

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)  
自定义插件，用于从 mod 文件夹加载 AnimationClips 并将它们注册为角色动画。

- [KatanaAnimations.cs #Comment](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3?permalink_comment_id=4633225#gistcomment-4633225)  
内置资源类型以及 URI 解析器预期返回的内容。 
（如果你试图使用 `Context.ResourceManager.ResolveResourceUri<T>` ）

## 文件结构

推荐的插件项目的文件结构如下：  
注意，除了 `*Plugin.cs` 以外的所有文件和文件夹都不是必须的，你可以仅在需要的时候再创建它们。

```
<PLUGIN_DIR>
│
├── <PLUGIN_NAME>Plugin.cs
│
├── Localizations
│   └── Warudo.<PLUGIN_NAME>.json
│
├── Assets
│   ├── Asset1.cs
│   ├── Asset2.cs
│   └── ...
│
├── Nodes
│   ├── Node1.cs
│   ├── Node2.cs
│   └── ...
│
└── ...
```
