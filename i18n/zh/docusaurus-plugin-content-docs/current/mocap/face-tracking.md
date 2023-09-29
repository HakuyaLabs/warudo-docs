# 面部追踪

Warudo 目前支持 5 种面部捕捉方案。

* [**OpenSeeFace（Beta）**](openseeface.md)：基于摄像头的面捕方案。可以捕捉基本 BlendShape，以及头部的旋转和移动。和 [VSeeFace ](https://www.vseeface.icu/)的面捕效果大致相仿。
* [**iFacialMocap**](ifacialmocap.md)：基于苹果 ARKit 的面捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并购买 [iFacialMocap](https://apps.apple.com/cn/app/id1489470545) App（国区售价 40 元）。可以捕捉 52 个 ARKit BlendShape，以及头部的旋转和移动。<b style={{color: "green"}}>**精度和可动性最佳。**</b>
* [**RhyLive**](rhylive.md)：基于苹果 ARKit 的面捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并下载 [RhyLive ](https://apps.apple.com/us/app/rhylive/)App（免费）。可以捕捉 52 个 ARKit BlendShape，但仅捕捉头部的旋转。<b style={{color: "green"}}>**精度最佳。**</b>
* [**VMC**](vmc.md)：由外部程序发送 [VirtualMotionCapture 数据](https://protocol.vmc.info/english)到 Warudo。一般较少使用 VMC 发送面捕数据。
* [**Rokoko**](rokoko.md)：由 [Rokoko Studio](https://www.rokoko.com/products/studio) 发送面捕数据到 Warudo。

开发中的面部捕捉方案：

* **NVIDIA Maxine**：基于摄像头的面捕方案，需要 NVIDIA RTX 系列（或者其他图灵架构）显卡。可以捕捉 51 个 ARKit BlendShape。
