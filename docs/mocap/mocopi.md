---
sidebar_position: 80
---

# 索尼 Mocopi

用 [索尼 Mocopi](https://electronics.sony.com/more/mocopi/all-mocopi/p/qmss1-uscx)进行动作捕捉。

## 初始设置

请先参照[索尼官方教程](https://www.sony.com/electronics/support/articles/00298063)来对Mocopi进行初始设置。

在初始设置完成之后，在Mocopi手机应用程序的设置页面中，选中**External device connection settings（外部设备连接设置）**，将**Transfer Format** 设置为**mocopi（UDP）**，然后再**IP address**中输入您的计算机IP地址。

:::tip
如果您不知道电脑的IP地址，可以在**Mocopi 接收器**素材的设置页面中找到。

![](/doc-img/en-ifacialmocap-1.png)

如果出现了多个IP，您将需要一个一个尝试。通常来说，您的路由器分配的IP会以`192.168`打头，比如在例图中的情况下，您可以先尝试`192.168.1.151`。
:::

回到主界面，点击顶部菜单栏中的 **Motion**然后点击**SAVE**图标以进入 **SEND** 模式。点击底部绿色的发送按钮来开始传送数据。

![](/doc-img/en-mocopi-1.png)

## 校正

Sony Mocopi的校正需要在Mocopi应用程序中完成。

## 选项

* **动作缓冲**: 选择是否开启Mocopi自带的动作缓冲功能（该功能可以让动作较为平滑）。由于Warudo自身会对捕捉数据进行平滑处理，这个设置通常不需要开启。

## 常见问题

常见问题请参考[动作捕捉方案一览](overview#FAQ)和[姿态追踪](body-tracking#FAQ)页面。

### 我的动捕结果经常会自己平移

这种随着时间一点点增大，导致动捕结果平移的误差是惯性动捕系统的常见问题。请尽量减少动捕设备周边的电磁干扰来减少漂移问题。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
