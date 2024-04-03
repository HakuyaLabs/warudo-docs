---
sidebar_position: 100
---

# Xsens MVN 接收器

使用 [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US) 进行身体动捕。

## 基本设置

打开 **Xsens MVN → 选项 → 网络串流** 并如图操作。

![](/doc-img/zh-xens-1.webp)

然后在 **Xsens MVN 接收器**素材中更新您想要接收动捕信息的**演员 ID** 。默认选项是1。

:::注意！
提示: 你需要一个MVN Animate Plus 或者 Pro来使用网络串流功能。
:::

:::信息
如需要更多信息，请参阅[官方指南](https://base.xsens.com/s/article/MVN-Unity-Live-Plugin?language=en\_US)。
:::

## 校正

Xsens硬件的校准需要在Xsens MVN软件中进行。

## 常见问题

常见问题请参考[动作捕捉方案一览](overview#FAQ)和[姿态追踪](body-tracking#FAQ)页面。

### 我的动捕结果经常会自己平移

这种随着时间一点点增大，导致动捕结果平移的误差是惯性动捕系统的常见问题。请尽量减少动捕设备周边的电磁干扰来减少漂移问题。