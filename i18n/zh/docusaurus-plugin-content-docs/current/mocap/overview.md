# 动作捕捉方案一览

Warudo 针对家用 3D 特别优化，同时也支持主流的专业动作捕捉方案。

## 家用方案

* 我有一台 iPhone / iPad：
  * 我更在乎易用性，或者我没有广角摄像头：[RhyLive](rhylive.md) + [RhyLive](rhylive.md)。
  * 我更在乎表现力，并且我有广角摄像头：[iFacialMocap ](ifacialmocap.md)+ [MediaPipe](mediapipe.md)。

:::info
你的模型师是否为模型适配了 ARKit 的 52 个面捕表情（又称「完美同步」）？基于 ARKit 面捕的表情要比 OpenSeeFace 灵动得多，可以极大提升模型的表现力。
:::

* 我没有 iPhone / iPad：[OpenSeeFace](openseeface.md) + [MediaPipe](mediapipe.md)。

:::info
如果你没有 iOS 设备的话，可以考虑入手一台二手的 iPhone X。这是最便宜又支持面容 ID 的 iOS 设备。
:::

* 我想使用第三方软件的动作捕捉数据（VR 等）：[VMC ](vmc.md)/ [iFacialMocap ](ifacialmocap.md)+ [VMC](vmc.md)。

:::tip
除了家用 VR 设备以外，许多动捕设备都有第一方或第三方的 VMC 支持，例如 [Mocopi](https://www.sony.jp/mocopi/)、[Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking)、[Rokoko](https://twitter.com/Kana\_Fuyuko/status/1521809776354680832)，所以都可以接入 Warudo。
:::

## 专业方案

* 兼容 [VMC 协议](https://protocol.vmc.info/english)的动捕系统（[Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking)、[Rokoko](https://twitter.com/Kana\_Fuyuko/status/1521809776354680832) 等）：[VMC ](vmc.md)/ [iFacialMocap ](ifacialmocap.md)+ [VMC](vmc.md)。
* [Xsens MVN](xsens-mvn.md)
* 以下方案需要定制，详情请联系 [tiger@warudo.app](mailto:tiger@warudo.app)。
  * 兼容 [VRPN ](https://github.com/vrpn/vrpn)的动捕系统（[青瞳视觉](https://digi-human.com) Avatar Lite、[OptiTrack ](https://optitrack.com/)等）
  * [Manus Core](https://www.manus-meta.com/knowledge-products/manus-core)
