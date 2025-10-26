---
sidebar_position: 20
translate_from_version: 2024-01-05
---

# 优化性能

Warudo 在大多数的 PC 上应该都能流畅运行。不过，假如你遇到了性能问题（尤其是当 Warudo 与其他的游戏/应用程序同时运行时），也是有一些办法可以提高 Warudo 的性能的！

## 窗口分辨率

Warudo 窗口的分辨率大小是影响 Warudo 性能最重要的因素之一。分辨率越高，帧率就越低。除非你有一台性能非常强劲的电脑，否则不要轻易尝试使用 4K 分辨率。推荐的分辨率是 1920 x 1080，而且大多数直播平台最高也就支持到 1080p。

如果 1920 x 1080 对于你的 GPU 来说还是太吃力了，那么你可以试试 1280 x 720。在 **菜单 → 设置 → 窗口宽度、窗口高度** 中可以手动设置 Warudo 窗口的分辨率。

## 环境

Warudo 当中的[环境](../assets/environment)（即所谓的「3D 背景」），也是影响性能的一个主要因素。环境越复杂，帧率就越低。例如，[东京街道](https://steamcommunity.com/sharedfiles/filedetails/?id=3004012790)这个环境对于大部分 GPU 来说就相当吃力。你可以尝试使用更简单的环境，或者干脆不使用任何环境。

## 角色

检查一下角色上的网格渲染器数量会不会太多了？对于从 [VRoid Studio](https://vroid.com/en/studio) 导出的模型来说，如果你忘记在导出时优化导出设置以减少网格数量的话，就很容易遇到这样的问题。（我们见过单是头发就已经有 100+ 网格的模型！）此时，你可以尝试重新导出一次模型，或者在 Blender 里合并网格。

类似地，角色上也最好不要有太多的材质。

## 限制帧率

如果你的直播平台只支持 30 FPS，或者你需要在运行 Warudo 的同时开一个负载很重的游戏，那么你可以试试将 Warudo 的帧率限制到 30 FPS，以降低对 GPU 的压力。在 **菜单 → 设置 → 限制帧率** 里你可以选择你想要的最大帧率。如果你之前开启了 VSync，那需要先把 VSync 关掉才行。

## MediaPipe 追踪

[MediaPipe](../mocap/mediapipe) 手部追踪对你的 CPU 或者 GPU 也能造成很大的压力。如果你遇到了性能问题，试试关闭 MediaPipe 手部追踪，或者将 **MediaPipe 追踪器 → GPU 加速** 这个选项设置为 `否`。

## 其他争抢 GPU 资源的程序

如果你在运行 Warudo 的同时，还同时运行着很吃 GPU 的游戏/应用程序（例如 Apex 英雄），那么你可能会发现 Warudo 掉帧掉得很严重。这是因为其他的游戏/应用程序有着更高的 GPU 优先级，Warudo 无法流畅地渲染到应有的水平。

为了让 Warudo 能有更高的 GPU 优先级，首先你需要让 Warudo 以管理员身份运行。打开你的 Steam 库，然后右键单击 Warudo，在弹出的菜单中选择 **管理 → 浏览本地文件**：

![](/doc-img/zh-faq-1.webp)

接着右键单击 Warudo.exe，再点击 **属性**：

![](/doc-img/zh-faq-2.webp)

切到 **兼容性** 选项卡，勾上 **以管理员身份运行此程序**，然后点击确定。

![](/doc-img/en-performance-1.png)

最后，打开 Warudo，将 **菜单 → 设置 → 提高 GPU 优先级** 调整为 **是** 就可以了。

:::caution
相应地，提高了 Warudo 的 GPU 优先级，会让同时运行的 3D 应用程序/游戏的帧率降低。
:::

:::info
如果你在运行其他应用程序/游戏也遇到了性能问题，你也可以尝试以管理员身份运行这些应用程序/游戏。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'robinwongm', github: 'robinwongm'},
  ],
}} />
