---
sidebar_position: 110
---

# Virdyn Studio (VDMocapStudio)

使用虚拟动力出品的 [Virdyn Studio（VDMocapStudio）](https://www.virdynm.com/virdyn-vdmocap-studio-motion-capture-software-system-for-vdsuit-full-product/)软件进行动作捕捉。 这个动捕方法需要使用官方售卖的 [Virdyn（虚拟动力）VDSuit](https://www.virdynm.com/virdyn-vdsuit-full-for-full-body-function-inertia-motion-capture-suit-product/) 动捕服装。

## 初始设置

请先打开 [VDMocapStudio](https://www.virdynm.com/virdyn-vdmocap-studio-motion-capture-software-system-for-vdsuit-full-product/) 软件，点击软件中的 **Broadcast → OpenShare** 以打开数据串流，并请确保您选择的IP地址能被Warudo访问。

![](/doc-img/en-virdyn-1.png)

## 校正

Virdyn硬件的校正需要在VDMocapStudio中完成。你也可以使用Warudo中的 **Virdyn Studio Receiver → Calibrate Root Transform** 功能，来将角色重置为默认的位置和方向。

## 常见问题

常见问题请参考[动作捕捉方案一览](overview#FAQ)和[姿态追踪](body-tracking#FAQ)页面。

### 我的动捕结果经常会自己平移

这种随着时间一点点增大，导致动捕结果平移的误差是惯性动捕系统的常见问题。请尽量减少动捕设备周边的电磁干扰来减少漂移问题。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'MISSINGNO', github: 'MISSINGNO'},
  ],
}} />