---
sidebar_position: 80
sidebar_label: VMC
---

# VMC

由外部程序发送 [VirtualMotionCapture 数据](https://protocol.vmc.info/english)到 Warudo。

## 教程

以下使用 [VSeeFace ](https://www.vseeface.icu/)为例，演示怎样将 VMC 数据应用到角色上。其他支持 VMC 的软件可以通过类似方法配置。

右上角点击设置 -> 整体设置，勾选「OSC/VMC协议」->「发送配合OSC/VMC协议的数据」。默认 IP 是本机 IP；默认端口 39539 也是 Warudo 的 VMC 接收器默认接收的端口，所以如果你想将 VSeeFace 的动捕数据发送到在同一台电脑运行的 Warudo，那么这里的设置无需更改。

<figure><img src="/images/image(9)(2).jpg" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-warning">
此功能要求模型所有关节的初始旋转皆为 0，否则发送到其他软件的数据可能无法兼容。如果你的模型是 [VRM 格式](https://vrm.dev/)，那么绝大多数情况下是没有问题的——极少数情况是模型师导出时没有勾选 Enforce T-Pose 选项，重新导出即可。
</div>

## 属性

* 端口：Warudo 接收数据使用的端口。

