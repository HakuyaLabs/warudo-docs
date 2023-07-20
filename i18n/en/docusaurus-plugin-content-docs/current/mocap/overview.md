# Overview

Warudo supports both at-home use with budget motion capture as well as professional use in motion capture studios.

## At-Home

* I have an iPhone or iPad：
  * I am all for convenience or I don't have a webcam: [RhyLive](rhylive.md) + [RhyLive](rhylive.md).
  * I want my avatar to be more expressive and I have a wide-angle webcam: [iFacialMocap ](ifacialmocap.md)+ [MediaPipe](mediapipe.md).

<div className="hint hint-info">
Is your avatar compatible with [the 52 ARKit blendshapes](https://arkit-face-blendshapes.com/) ("Perfect Sync")? ARKit-based face tracking are much more expressive, so it is highly recommended.
</div>

* I don't have an iPhone or iPad: [OpenSeeFace](openseeface.md) + [MediaPipe](mediapipe.md).

<div className="hint hint-info">
If you do not have an iOS device and looking to buy one but do not have much budget for it, look into a used iPhone X. It is the cheapest iOS device compatible with ARKit / Face ID.
</div>

* I would like to use other motion capture software: [VMC ](vmc.md)/ [iFacialMocap ](ifacialmocap.md)+ [VMC](vmc.md).

<div className="hint hint-success">
Many motion capture hardware, in addition to home VR, have first or third-party VMC support, such as [Mocopi](https://www.sony.jp/mocopi/) and [Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking).
</div>

## Professional

* [Rokoko](rokoko.md)
* [Xsens MVN](mocap/xsens-mvn)
* Motion capture systems compatible with the [VMC protocol](https://protocol.vmc.info/english): ([Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking), etc.): [VMC ](vmc.md)/ [iFacialMocap ](ifacialmocap.md)+ [VMC](vmc.md).
* For the following and other options, a private Warudo build is required. Please contact [tiger@warudo.app](mailto:tiger@warudo.app) for details.
  * Motion capture systems with [VRPN ](https://github.com/vrpn/vrpn)([Chingmu](https://digi-human.com) Avatar Lite, [OptiTrack](https://optitrack.com/), etc.）
  * [Manus Core](https://www.manus-meta.com/knowledge-products/manus-core)
