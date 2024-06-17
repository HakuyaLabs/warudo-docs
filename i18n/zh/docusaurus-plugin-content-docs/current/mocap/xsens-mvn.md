---
sidebar_position: 100
---

# Xsens MVN

由 [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US) 发送全身动捕数据到 Warudo。

## 教程

打开 Xsens MVN → Options → Network Streamer，如下图配置即可。

![](/doc-img/zh-xens-1.webp)

:::caution
注意，你需要 MVN Animate Plus 或者 Pro 订阅才能使用 Network Streamer 功能。
:::

:::info
更多详情请参阅[官方文档](https://base.xsens.com/s/article/MVN-Unity-Live-Plugin?language=en\_US)。
:::

## 属性

* 端口：Xsens MVN 使用的端口（见上图）。默认为 9763。
* 演员 ID：要接收的 Xsens 演员（Actor）的 ID。默认为 1。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />