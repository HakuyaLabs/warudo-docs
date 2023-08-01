---
sidebar_position: 30
sidebar_label: 姿态追踪
---

# 姿态追踪

Warudo 目前支持 5 种姿态捕捉方案。

* [**MediaPipe**](mediapipe.md)：基于摄像头的上半身动捕方案。优点是可动范围较大，手部能够前后移动；反应更为及时，可以捕捉到快速甩手、挥拳等。缺点是初次配置和校正需要一点点时间，并且稳定性略有不足。<mark style={{color: "green"}}>**可动性最佳。**</mark>
* [**RhyLive**](rhylive.md)：由[域动数字 RhythMo](https://rhythmo.cn/) 研发的上半身动捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并下载 [RhyLive ](https://apps.apple.com/us/app/rhylive/)App（免费）。缺点是长时间使用，设备会发热严重。
* [**VMC**](vmc.md)：由外部程序发送 [VirtualMotionCapture 数据](https://protocol.vmc.info/english)到 Warudo。比如你想使用 VR 动捕（例如：SlimeVR、Mocopi 等），就可以使用 VirtualMotionCapture 软件，发送 VMC 数据给 Warudo。
* [**Rokoko**](rokoko.md)：由 [Rokoko Studio](https://www.rokoko.com/products/studio) 发送全身动捕数据到 Warudo。
* [**Xsens MVN**](xsens-mvn.md)：由 [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US) 发送全身动捕数据到 Warudo。
