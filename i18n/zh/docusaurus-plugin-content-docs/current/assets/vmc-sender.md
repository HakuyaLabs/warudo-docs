---
sidebar_position: 50
---

# VMC 发送器

发送角色的动画数据到任何支持 [VirtualMotionCapture 协议](https://protocol.vmc.info/english)的软件！

:::tip
可以在[这里](https://protocol.vmc.info/Reference)查看兼容的程序列表。
:::

## 属性

* IP 地址：要发送数据到哪个 IP。
* 端口：要发送数据到哪个端口。
* 角色：选择要发送动画数据的角色。
* 发送到 VirtualMotionCapture：是否正在发送到 [VirtualMotionCapture](https://akira.works/VirtualMotionCapture-en/)（这里指的是同名软件，非 VMC 协议）。由于 VirtualMotionCapture 解析动画数据时的 Bug，必须启用此选项。
  * 校准中（VirtualMotionCapture）：在 VirtualMotionCapture 内 T-Pose 校准时，请启用此选项；结束后禁用即可。

:::caution
此功能要求模型所有关节的初始旋转皆为 0，否则发送到其他软件的数据可能无法兼容。如果你的模型是 [VRM 格式](https://vrm.dev/)，那么绝大多数情况下是没有问题的——极少数情况是模型师导出时没有勾选 Enforce T-Pose 选项，重新导出即可。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
