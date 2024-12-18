---
sidebar_position: 90
---

# Rokoko

使用 [Rokoko](https://www.rokoko.com/) 进行面部/身体动捕。

## 初始设定

打开Rokoko并开启 **Livestream → Activate streaming to Unity**:

![](/doc-img/zh-rokoko-1.webp)

然后，在 **Rokoko 接收器** 组件中将 **Profile Name** 更新为您想要接收动捕数据的Rokoko actor的名字。

![](/doc-img/zh-rokoko-2.webp)

:::note

注意：你需要拥有 Rokoko Plus 或者 Pro 订阅才能将数据流分享到 Unity。

:::

:::info

如有更多疑问，请您查阅 [Rokoko官方手册](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity).

:::

## 校正

Rokoko 动捕硬件的校正需要在 Rokoko Studio中进行。

## 常见问题{#FAQ}

常见问题请参考[动作捕捉方案一览](overview#FAQ)以及[姿态追踪](body-tracking#FAQ)。

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
