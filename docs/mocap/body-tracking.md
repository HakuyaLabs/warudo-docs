---
sidebar_position: 30
---

# Pose Tracking

Warudo provides 5 pose tracking solutions:

* [**MediaPipe**](mediapipe.md): Webcam-based upper body tracking. Advantages include a wider range of motion (e.g. forward/backward hand movements) and more responsive tracking (e.g. punches). Drawbacks include the need for some time to set up and calibrate. <mark style={{color: "green"}}>**Most expressive.**</mark>
* [**RhyLive**](rhylive.md): Upper body tracking developed by [RhythMo](https://rhythmo.cn/). Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app.
* [**VMC**](vmc.md): Body tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). Compatible with all VR mocap (such as SlimeVR or Mocopi), via [VirtualMotionCapture ](https://vmc.info/)and some VMC-compatible studio mocap.
* [**Rokoko**](rokoko.md): Body tracking via [Rokoko Studio](https://www.rokoko.com/products/studio).
* [**Xsens MVN**](xsens-mvn.md): Body tracking via [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US).
