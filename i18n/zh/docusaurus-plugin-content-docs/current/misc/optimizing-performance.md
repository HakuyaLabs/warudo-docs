---
sidebar_position: 10
---

# 优化性能

Warudo 在大部分 PC 上应该都能流畅运行。不过，如果你遇到了性能问题，尤其是当 Warudo 与其他的游戏/应用程序同时运行时，你可以尝试下面的方法来提高性能。

Warudo should run smoothly on most PCs. However, if you are experiencing performance issues, especially when other games/applications are running simultaneously, you can try the following methods to improve performance.

## 窗口分辨率 Window Resolution

Warudo 窗口的分辨率大小是影响 Warudo 性能最重要的因素之一。分辨率越高，帧率就越低。除非你有一台性能非常强劲的电脑，否则你永远也不应该使用 4K 分辨率。推荐的分辨率是 1920 x 1080，并且大多数直播平台最高也就支持 1080p。

The resolution of the Warudo window is one of the most important factors affecting Warudo's performance. The higher the resolution, the lower the frame rate. You should almost never use 4K resolution unless you have a very powerful PC. The recommended resolution is 1920 x 1080, and most livestreaming platforms only support up to 1080p anyway.

如果 1080p 对于你的 GPU 来说还是太吃力了，你可以试试 1280 x 720。你可以在 **菜单 → 设置 → 窗口宽度/高度** 中手动设置 Warudo 窗口的分辨率。

If 1920 x 1080 is still too demanding on your GPU, you can try 1280 x 720. You can manually set the resolution of the Warudo window by adjusting **Menu → Settings → Window Width/Height**.

## 场景 Environment

Warudo 当中的 [场景](../assets/environment) 或者说 3D 背景，也是影响性能的一个主要因素。场景越复杂，帧率就越低。例如，[东京街道](https://steamcommunity.com/sharedfiles/filedetails/?id=3004012790) 这个场景对于大部分 GPU 来说就相当吃力。你可以尝试使用更简单的场景，或者干脆不使用任何场景。

[Environments](../assets/environment), or the 3D backgrounds in Warudo, are also a major factor affecting performance. The more complex the environment, the lower the frame rate. For example, the [Tokyo City](https://steamcommunity.com/sharedfiles/filedetails/?id=3004012790) environment is known to be very demanding on most GPUs. You can try using a simpler environment, or even no environment at all.

## 角色 Character

你的角色上是否有太多的 mesh 渲染器？对于从 [VRoid Studio](https://vroid.com/en/studio) 导出的模型，如果你忘记在导出时调整导出设置以减少面数的话，就经常会有这种问题。（我们见过一些仅仅头发就已经有 100+ 面数的模型！）你可以尝试重新导出一次模型，或者在 Blender 里合并 mesh。

Are there too many mesh renderers on your character? Models exported from [VRoid Studio](https://vroid.com/en/studio) often have this problem if you forgot to optimize the export settings to reduce the mesh count. (We have seen models with 100+ meshes for the hair alone!) You can either re-export the model or combine the meshes in Blender.

同样道理，也请确保你的角色不要有太多的材质。

Similarly, make sure there aren't too many materials on your character.

## 限制帧率 Limit FPS

如果你的直播平台只支持 30 FPS，或者你需要在使用 Warudo 的同时运行一个负载很重的游戏，那么你可以试试将帧率限制到 30 FPS，降低对 GPU 的压力。你可以在 **菜单 → 设置 → 限制帧率** 里调整。如果你之前开启了 VSync，需要先把 VSync 关掉。

If you are streaming to a platform that only supports 30 FPS, or you are running a heavy game along side Warudo, you can limit FPS to 30 to reduce the load on your GPU. You can do this by adjusting **Menu → Settings → Limit FPS**. If you have enabled VSync, turn it off first.

## MediaPipe 追踪 MediaPipe Tracking

[MediaPipe](../mocap/mediapipe) 手部追踪对你的 CPU 或者 GPU 也能造成很大的压力，具体与你是否开启了 **MediaPipe 追踪 → GPU 加速** 这个选项有关。如果你遇到了性能问题，试试关闭 MediaPipe 手动追踪，或者关闭 GPU 加速。

[MediaPipe](../mocap/mediapipe) hand tracking can be quite demanding on your CPU or GPU, depending on whether you have enabled **MediaPipe Tracker → GPU Acceleration**. If you are experiencing performance issues, try turning off MediaPipe hand tracking, or disable GPU acceleration to use CPU tracking instead.

## 其他争抢 GPU 资源的程序 Other Applications Fighting for GPU Resources

如果你在运行 Warudo 的同时，还同时运行了很吃 GPU 的游戏/应用程序（比如 Apex），你可能会发现 Warudo 的帧率下降得特别厉害。这是因为其他的游戏/应用程序获得了更高的 GPU 优先级，Warudo 没有办法流畅渲染到应有的水平。

If you are running a GPU-intensive game or application alongside Warudo such as Apex Legends, you may notice Warudo's frame rate drops significantly. This is because the other game/application requests a higher GPU priority, so Warudo is not able to render as smoothly as it should.

为了让 Warudo 有更高的 GPU 优先级，首先你需要让 Warudo 以管理员身份运行。打开你的 Steam 库，右键单击 Warudo，然后选择 **管理 → 浏览本地文件**：

To allow Warudo to have a higher GPU priority, first you must run Warudo as administrator. Go to your Steam library, right-click on Warudo and select **Manage → Browse local files**:

![](/doc-img/zh-faq-1.webp)

接着右键单击 `Warudo.exe`，再点击 **属性**：

Right click on Warudo.exe and click on **Properties**:

![](/doc-img/zh-faq-2.webp)

进入 **兼容性** 标签，勾上 **以管理员身份运行此程序**，然后点击确定。

Then go to the **Compatibility** tab, check **Run this program as an administrator**, and click OK.

![](/doc-img/en-performance-1.png)

最后，打开 Warudo，将 **菜单 → 设置 → 提高 GPU 优先级** 选项打开。

Finally, open Warudo and enable **Menu → Settings → Increase GPU Priority**.

:::caution
提高 Warudo 的 GPU 优先级反过来会降低到同时运行的 3D 应用程序/游戏的帧率。

Increased GPU priority for Warudo can in turn decrease frame rates of other 3D applications/games running simultaneously.
:::

:::info
如果你在运行其他应用程序/游戏也遇到了性能问题，你也可以尝试以管理员身份去运行这些应用程序/游戏。

If you are experiencing performance issues with other applications/games, you can try to run them as administrator as well.
:::
