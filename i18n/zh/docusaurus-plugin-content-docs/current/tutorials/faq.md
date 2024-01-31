---
sidebar_position: 20
---

# 常见问题

## **Warudo 和其他 3D 应用程序 / 游戏（例如：Apex Legends）同时运行时，帧率会骤降。**

这是因为其他 3D 应用程序 / 游戏占用了大部分 GPU 资源。可以使用管理员模式运行 Warudo，并开启「设置」->「Core」->「提高 GPU 优先级」。

首先在 Steam 库中找到 Warudo，右键「管理」->「浏览本地文件」：

![](/doc-img/zh-faq-1.webp)

右键 Warudo.exe，选择「属性」：

![](/doc-img/zh-faq-2.webp)

在「兼容」标签页，勾选「以管理员身份运行此程序」，然后点击确定。

![](/doc-img/zh-faq-3.webp)

打开 Warudo，左下角「🚀」->「设置」->「Core」->「进阶」->「提高 GPU 优先级」选择「是」即可。

![](/doc-img/zh-faq-4.webp)

:::caution
与此相对地，这会导致其他 3D 应用程序 / 游戏的帧率下降。你可以尝试缩小 Warudo 的主窗口（注意不是最小化），或者降低 Warudo 的渲染帧率（「设置」->「Core」->「画面」->「限制帧数」），直到 Warudo 和其他 3D 应用程序 / 游戏的帧率变得可接受为止。
:::

:::info
在 Intel i9-9900k + NVIDIA RTX 2080 Ti 的配置下，以 1080p 分辨率运行 Warudo（模型以 NiloToon 渲染，使用高精度 3D [环境](../assets/environment.md)作为背景）和《艾尔登法环》（高画质），并且开启 OBS  1080p 录制，帧率稳定在 45 帧左右。
:::

## 选择了动作捕捉的摄像头，但是摄像头没有开启 / 画面是黑色的。

部分杀毒软件会禁止非白名单内的程序调用摄像头，比如[火绒](https://www.huorong.cn/)。请关闭杀毒软件的摄像头防护功能，或者将 Warudo 加入白名单。

另外需要注意，Warudo 目前不支持 IP 摄像头（比如 [DroidCam](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam)）。

## 我安装了 Spout 插件，但是在 OBS 找不到 Spout 的选项。

请检查你是否安装了 [PrprLive](https://store.steampowered.com/app/1279610/PrprLive/) 的透明捕捉插件。此插件是基于较旧版本的 Spout 插件开发的，功能上并无区别（只是修改了名字）。你可以直接使用 PrprLive 的捕捉来捕捉 Warudo，不过更推荐在 OBS 的插件（Plugins）文件夹中删除 prpr-library.dll，即可使用 Spout 原版插件。

## **我需要其他帮助！**

请加入我们的 [Discord](https://discord.gg/Df8qYYBFhH)、QQ 群（757419380），或者联系 [tiger@warudo.app](mailto:tiger@warudo.app)。
