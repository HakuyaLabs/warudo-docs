---
sidebar_position: 20
---

# Face Tracking

Warudo provides 5 face tracking solutions:

* [**OpenSeeFace (Beta)**](openseeface.md): Webcam-based face tracking. Tracks a set of basic blendshapes, head rotation and head translation. Quality of face tracking is similar to that of [VSeeFace](https://www.vseeface.icu/).
* [**iFacialMocap**](ifacialmocap.md): ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the $5.99 [iFacialMocap](https://apps.apple.com/us/app/id1489470545) app. Tracks 52 ARKit blendshapes, head rotation and head translation. <b style={{color: "green"}}>**Most accurate and expressive.**</b>
* [**RhyLive**](rhylive.md): ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app. Tracks 52 ARKit blendshapes and head rotation. <b style={{color: "green"}}>**Most accurate.**</b>
* [**VMC**](vmc.md): Face tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). VMC is typically not used for face tracking data.
* [**Rokoko**](rokoko.md): Face tracking via [Rokoko Studio](https://www.rokoko.com/products/studio).

Upcoming face tracking solutions in development:

* **NVIDIA Maxine:** Webcam-based face tracking. Requires a NVIDIA RTX series graphics card (or any Turing GPU). Tracks 51 ARKit blendshapes.
