---
cover: /images/store_page_background.png
coverY: 187
---

# Getting Started

## Creating a Scene

Let's get started! First, we need to create a **scene** in Warudo. The concept of a scene is similar to that of a scene in [OBS](https://obsproject.com/) or a game engine. It is basically a configuration file that can be switched at any time.

A Warudo scene consists of two things: assets and blueprints.

* **Assets:** Assets are basically **objects** in the scene, e.g., a character, a camera, a motion capture tracker, etc.
* **Blueprints:** Blueprints are used to create custom **behaviors**, e.g., "press X to activate expression Y and pose Z," or, "when receive redeem X, throw item Y at character," etc.

By default, Warudo will open the last opened scene (or the default scene if no scenes have been created). To make things easier, let's create a new scene!

Click "🚀" at the bottom left -> "New Scene," enter the name for your scene, and click "OK" to create it.

<figure><img src="/images/image(11).jpg" alt="" /><figcaption></figcaption></figure>

Now your asset list should look like this:

<figure><img src="/images/image(2)(3).jpg" alt="" /><figcaption></figcaption></figure>

## Import Your Character

Now let's import your character model into the scene. Your model is most likely in [VRM format](https://vrm.dev/), so let's see how we can load that into Warudo.

<div className="hint hint-success">
Warudo currently supports two model formats: `.vrm` and `.warudo`. The former is a standard avatar format exported by software like [VRoid Studio](https://vroid.com/en/studio), while the latter is Warudo's own format and supports virtually any Unity-compatible character model. Read more [here](../modding/character-mod.md).
</div>

First, open the data folder:

<figure><img src="/images/image(2).jpg" alt="" /><figcaption></figcaption></figure>

Put your VRM file in the "Characters" subfolder:

![](https://user-images.githubusercontent.com/3406505/180642642-a85ce0b2-a94b-4048-a29d-4938603977cf.png)

Without restarting Warudo, we return to the configuration window, select the character asset by clicking on "Character (Inactive)," and choose the desired VRM file to load from the "Source" drop-down menu.

<figure><img src="/images/image(63).jpg" alt="" /><figcaption></figcaption></figure>

You should now be able to see the model loaded into the scene!

![](https://user-images.githubusercontent.com/3406505/180642701-579b5537-b26d-4f3f-a9f1-587d9e54e031.png)

## Basic Controls

Let's take a moment to admire the newly loaded model. By default, the camera mode is set to **"Orbit Character"**, which means the camera will rotate around the character. You can use the <mark style={{color: "purple"}}>**left or right mouse button**</mark> to rotate the view, the <mark style={{color: "purple"}}>**mouse wheel**</mark> to zoom in or out, and the <mark style={{color: "purple"}}>**middle mouse button**</mark> to pan the view. Try moving the camera to this angle:

![](https://user-images.githubusercontent.com/3406505/180642804-34c04fc9-31c8-4e7e-a7f6-82b47fef42c1.png)

If "Character" is still selected in the asset list, you will see a **translation gizmo** under the model's feet that can be used to move the model. Its usage is intuitive - simply drag and move it around, like this:

![](https://user-images.githubusercontent.com/3406505/180642868-854a6148-3820-4ff0-9f29-4360f9ff668b.png)

You can switch to the **rotation gizmo** by pressing the <mark style={{color: "purple"}}>**E**</mark> key (and, by the way, switch back to the translation gizmo by pressing <mark style={{color: "purple"}}>**W**</mark>).

![](https://user-images.githubusercontent.com/3406505/180642926-6d34ede0-4ca2-4ae7-ac1d-faa578425cea.png)

Press <mark style={{color: "purple"}}>**R**</mark> to switch to the **scale gizmo**:

![](https://user-images.githubusercontent.com/3406505/180642936-078f2283-c470-4553-993e-2cebc455c0f1.png)

<div className="hint hint-success">
You can press <mark style={{color: "purple"}}>**G**</mark> at anytime to toggle the visibility of gizmos for the main camera.
</div>

Now you can make your model look like this:

![](https://user-images.githubusercontent.com/3406505/180642957-ae6454e5-531e-4b89-baa6-92a5ed3f114f.png)

...This doesn't look good! How can we restore the model to its original state? If you've been paying attention, you may have noticed that the values in the "Transform" section change as you drag the gizmos. For example, this is what mine looks like now:

<figure><img src="/images/image(8).jpg" alt="" /><figcaption></figcaption></figure>

To return to the initial state, just restore to the default values!

<figure><img src="/images/image(1).jpg" alt="" /><figcaption></figcaption></figure>

In addition to orbiting around the model, the camera can also be switched to a free-look mode, allowing you to fly around the scene. Select the camera asset and choose **"Free Look"** for the "Control Mode":

<figure><img src="/images/image(66).jpg" alt="" /><figcaption></figcaption></figure>

While <mark style={{color: "purple"}}>**holding down the right mouse button**</mark>, use the <mark style={{color: "purple"}}>**WASD**</mark> keys to move, the <mark style={{color: "purple"}}>**E**</mark> and <mark style={{color: "purple"}}>**Q**</mark> keys to move up and down, and hold down the left <mark style={{color: "purple"}}>**Shift**</mark> key to move faster. Use the <mark style={{color: "purple"}}>**middle mouse button**</mark> to pan the view.

After you've gotten used to the two camera modes, switch back to "Orbit Character" mode and click **"Reset Camera Transform"** to return the camera to its default position.

<figure><img src="/images/image.png" alt="" /><figcaption></figcaption></figure>

## Setting Up Motion Capture

It's finally time to get the model moving! Let's take a look at what motion capture solutions Warudo supports out-of-the-box.

#### Face Tracking

* [**OpenSeeFace (Beta)**](../mocap/openseeface.md): Webcam-based face tracking. Tracks a set of basic blendshapes, head rotation and head translation. Quality of face tracking is similar to that of [VSeeFace](https://www.vseeface.icu/).
* [**iFacialMocap**](../mocap/ifacialmocap.md): ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the $5.99 [iFacialMocap](https://apps.apple.com/us/app/id1489470545) app. Tracks 52 ARKit blendshapes, head rotation and head translation. <mark style={{color: "green"}}>**Most accurate and expressive.**</mark>
* [**RhyLive**](../mocap/rhylive.md): ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app. Tracks 52 ARKit blendshapes and head rotation. <mark style={{color: "green"}}>**Most accurate.**</mark>
* [**VMC**](../mocap/vmc.md): Face tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). VMC is typically not used for face tracking data.
* [**Rokoko**](../mocap/rokoko.md): Face tracking via [Rokoko Studio](https://www.rokoko.com/products/studio).

#### Pose Tracking

* [**MediaPipe**](../mocap/mediapipe.md): Webcam-based upper body tracking. Advantages include a wider range of motion (e.g. forward/backward hand movements) and more responsive tracking (e.g. punches). Drawbacks include the need for some time to set up and calibrate. <mark style={{color: "green"}}>**Most expressive.**</mark>
* [**RhyLive**](../mocap/rhylive.md): Upper body tracking developed by [RhythMo](https://rhythmo.cn/). Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app.
* [**VMC**](../mocap/vmc.md): Body tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). Compatible with all VR mocap (such as SlimeVR or Mocopi), via [VirtualMotionCapture ](https://vmc.info/)and some VMC-compatible studio mocap.
* [**Rokoko**](../mocap/rokoko.md): Body tracking via [Rokoko Studio](https://www.rokoko.com/products/studio).
* [**Xsens MVN**](../mocap/xsens-mvn.md): Body tracking via [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US).

Alright, I hear you asking: "So which should I choose?!

——Just follow the steps below!



* I have an iPhone or iPad：
  * I am all for convenience or I don't have a webcam: [RhyLive](../mocap/rhylive.md) + [RhyLive](../mocap/rhylive.md).
  * I want my avatar to be more expressive and I have a wide-angle webcam: [iFacialMocap ](../mocap/ifacialmocap.md)+ [MediaPipe](../mocap/mediapipe.md).

<div className="hint hint-info">
Is your avatar compatible with [the 52 ARKit blendshapes](https://arkit-face-blendshapes.com/) ("Perfect Sync")? ARKit-based face tracking are much more expressive, so it is highly recommended.
</div>

* I don't have an iPhone or iPad: [OpenSeeFace](../mocap/openseeface.md) + [MediaPipe](../mocap/mediapipe.md).

<div className="hint hint-info">
If you do not have an iOS device and looking to buy one but do not have much budget for it, look into a used iPhone X. It is the cheapest iOS device compatible with ARKit / Face ID.
</div>

* I would like to use other motion capture software: [VMC ](../mocap/vmc.md)/ [iFacialMocap ](../mocap/ifacialmocap.md)+ [VMC](../mocap/vmc.md).

<div className="hint hint-success">
Many motion capture hardware, in addition to home VR, have first or third-party VMC support, such as [Mocopi](https://www.sony.jp/mocopi/) and [Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking).
</div>

<div className="hint hint-success">
In addition to at-home mocap options, Warudo also supports a range of [professional motion capture solutions](mocap/overview)!
</div>



As this is a tutorial, we will use RhyLive + RhyLive as an example, so you can follow along if you have an iPhone. However, feel free to visit the [Motion Capture section](../mocap/overview.md) in the documentation to learn about other motion capture solutions supported by Warudo.

Select the character asset and click on "Motion Capture" -> "Setup Motion Capture":

<figure><img src="/images/image(20).jpg" alt="" /><figcaption></figcaption></figure>

Select "RhyLive" for the "Face Tracking Template." The options below will ask you which blendshape mapping you want to use. In most cases, the default automatic selection works best:

<figure><img src="/images/image(61).jpg" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-success">
<mark style={{color: "green"}}>**Tips:**</mark> What are blendshapes? A blendshape is a displacement of a number of vertices on the model mesh, like the following:

<img src="https://user-images.githubusercontent.com/3406505/180678152-daf3ff76-1ab8-4add-b0c9-b28d0676fec3.gif" alt="ref: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/" data-size="original" />

A blendshape's value is between 0 and 1. When the value is 0, the vertices do not move. When the value is 1, the vertices move to the target position, as shown below:

<img src="https://user-images.githubusercontent.com/3406505/180681379-b20131f0-fe20-4368-b9e9-c45042b2491f.gif" alt="Note that BlendShape in Unity takes values from 0-100, but in Warudo (and most 3D tools) BlendShape takes values from 0-1. ref: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/" data-size="original" />

The list of blendshapes on a model is entirely up to the modeler (and the modeling tool). Below are a few lists of common blendshapes (for reference only; your model may have more or fewer blendshapes):

<details>

<summary>VRoid Studio models</summary>

* Fcl\_ALL\_Neutral
* Fcl\_ALL\_Angry
* Fcl\_ALL\_Fun
* Fcl\_ALL\_Joy
* Fcl\_ALL\_Sorrow
* Fcl\_ALL\_Surprised
* Fcl\_BRW\_Angry
* Fcl\_BRW\_Fun
* Fcl\_BRW\_Joy
* Fcl\_BRW\_Sorrow
* Fcl\_BRW\_Surprised
* Fcl\_EYE\_Natural
* Fcl\_EYE\_Angry
* Fcl\_EYE\_Close
* Fcl\_EYE\_Close\_R
* Fcl\_EYE\_Close\_L
* Fcl\_EYE\_Fun
* Fcl\_EYE\_Joy
* Fcl\_EYE\_Joy\_R
* Fcl\_EYE\_Joy\_L
* Fcl\_EYE\_Sorrow
* Fcl\_EYE\_Surprised
* Fcl\_EYE\_Spread
* Fcl\_EYE\_Iris\_Hide
* Fcl\_EYE\_Highlight\_Hide
* Fcl\_MTH\_Close
* Fcl\_MTH\_Up
* Fcl\_MTH\_Down
* Fcl\_MTH\_Angry
* Fcl\_MTH\_Small
* Fcl\_MTH\_Large
* Fcl\_MTH\_Neutral
* Fcl\_MTH\_Fun
* Fcl\_MTH\_Joy
* Fcl\_MTH\_Sorrow
* Fcl\_MTH\_Surprised
* Fcl\_MTH\_SkinFung
* Fcl\_MTH\_SkinFung\_R
* Fcl\_MTH\_SkinFung\_L
* Fcl\_MTH\_A
* Fcl\_MTH\_I
* Fcl\_MTH\_U
* Fcl\_MTH\_E
* Fcl\_MTH\_O
* Fcl\_HA\_Hide
* Fcl\_HA\_Fung1
* Fcl\_HA\_Fung1\_Low
* Fcl\_HA\_Fung1\_Up
* Fcl\_HA\_Fung2
* Fcl\_HA\_Fung2\_Low
* Fcl\_HA\_Fung2\_Up
* Fcl\_HA\_Fung3
* Fcl\_HA\_Fung3\_Up
* Fcl\_HA\_Fung3\_Low
* Fcl\_HA\_Short
* Fcl\_HA\_Short\_Up
* Fcl\_HA\_Short\_Low

</details>

<details>

<summary>MMD models</summary>

* 真面目
* 困る
* にこり
* 怒り
* 上
* 下
* まばたき
* 笑い
* ウィンク
* ウィンク２
* ウィンク右
* ｳｨﾝｸ２右
* はぅ
* なごみ
* びっくり
* じと目
* なぬ！
* 瞳小
* 瞳縦
* 瞳縦潰れ
* びっくり
* への字
* 恐ろしい子！
* カメラ目
* はちゅ目
* 星目
* はぁと
* 涙
* 猫目
* 瞳全消し
* あ
* い
* う
* お
* ▲
* ∧
* ω
* ω□
* はんっ！
* ぺろっ
* えー
* にやり
* ぎゃーす
* がーん
* ギギギ,
* あ２
* ああ
* いい
* おお
* 青ざめ
* д
* 八重歯左
* 八重歯右
* ワ
* 口角上げ
* 口角下げ
* 口横広げ
* 口横狭め
* 頬染め
* 照れ
* 赤面

</details>

<details>

<summary>ARKit-compatible (Perfect Sync) models</summary>

* eyeBlinkLeft
* eyeLookDownLeft
* eyeLookInLeft
* eyeLookOutLeft
* eyeLookUpLeft
* eyeSquintLeft
* eyeWideLeft
* eyeBlinkRight
* eyeLookDownRight
* eyeLookInRight
* eyeLookOutRight
* eyeLookUpRight
* eyeSquintRight
* eyeWideRight
* jawForward
* jawLeft
* jawRight
* jawOpen
* mouthClose
* mouthFunnel
* mouthPucker
* mouthLeft
* mouthRight
* mouthSmileLeft
* mouthSmileRight
* mouthFrownLeft
* mouthFrownRight
* mouthDimpleLeft
* mouthDimpleRight
* mouthStretchLeft
* mouthStretchRight
* mouthRollLower
* mouthRollUpper
* mouthShrugLower
* mouthShrugUpper
* mouthPressLeft
* mouthPressRight
* mouthLowerDownLeft
* mouthLowerDownRight
* mouthUpperUpLeft
* mouthUpperUpRight
* browDownLeft
* browDownRight
* browInnerUp
* browOuterUpLeft
* browOuterUpRight
* cheekPuff
* cheekSquintLeft
* cheekSquintRight
* noseSneerLeft
* noseSneerRight
* tongueOut

</details>

In the above image, "BlendShape Mapping" refers to "how the face tracking parameters should be applied to the model's blendshapes," so it's necessary to select which set of blendshapes the model have.
</div>

<div className="hint hint-warning">
You may have heard others refer to blendshapes as "expressions." However, in Warudo, expressions are the states of several blendshapes on the character. For example, the "crying" expression shown below is a specific combination of five blendshape values:

<img src="https://user-images.githubusercontent.com/3406505/180906274-f7fcb77b-bb25-4bff-a924-66a9f7a02cc9.png" alt="" data-size="original" />\
To avoid confusion, we will stick to referring blendshapes and expressions by their respective names.
</div>

Similarly, choose "RhyLive" for the "Pose Tracking Template."

<figure><img src="/images/image(67).jpg" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-info">
If you enable "Use Keyboard" / "Use Touchpad," Warudo will procedurally generate animations of the model using the keyboard and mouse when your hands are not tracked:

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/209600556-6f0a33a2-ea4f-4f73-a8ce-0de691cb9e5d.mp4" />
</div>

After clicking "OK," you should see a success message:

<figure><img src="/images/image(4).jpg" alt="" /><figcaption></figcaption></figure>

The "RhyLive Receiver" should now appear in the asset list, which is used to receive motion capture data sent by the RhyLive App:

<figure><img src="/images/image(59).jpg" alt="" /><figcaption></figcaption></figure>

Two blueprints should also have been added to the blueprint list:

<figure><img src="/images/image(68).jpg" alt="" /><figcaption></figcaption></figure>
</div>

<div className="hint hint-info">
Warudo's blueprints are a very powerful feature, but if you're just starting out with Warudo, you can achieve great results without touching blueprints at all. We recommend reading the [blueprint tutorial](/docs/mocap/blueprints/overview) once you are familiar with the rest of Warudo's features.
</div>

To use RhyLive on an iOS device, open the app and tap on the menu icon in the top left corner to enter the settings. If your computer and phone are connected to the same WiFi network, enter your computer's IP in the "IP" field and turn on the "无线" (Wireless) switch. Alternatively, you can connect your device to your computer using a USB cable and turn on the "有线" (Wired) switch ([iTunes](https://www.apple.com/itunes/) required).

![](</images/image(8)(2)(2).jpg>)

<div className="hint hint-info">
If you do not know your computer's IP, you can check on the configuration page of the "RhyLive Receiver".

<img src="/images/image(26)(2).jpg" alt="" data-size="original" />

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with 192.168. For example, in the above picture, you can first try 192.168.1.2.
</div>

<div className="hint hint-info">
If you use the "Wired" option, you must open the RhyLive app, connect your iPhone to your PC before launching Warudo.
</div>

<div className="hint hint-success">
It is recommended to turn off "锁定弯腰" (Lock body bending) and turn on "隐藏模型" (Hide model). The former increases the range of motion of the model, while the latter helps reduce device overheating from prolonged use.
</div>

You should now see the model in motion!

![image](https://user-images.githubusercontent.com/3406505/180644072-a641eeb2-f759-4741-a303-61114ea03d65.png)

<div className="hint hint-info">
If the model's pose doesn't look quite right, select the "RhyLive Receiver" and click "Calibrate" to correct it.
</div>

## Setting Up Expressions

Now that the upper body of the model is in motion, it's time to configure the face expressions!

Scroll down on the character's config page. Click on "Expressions" -> "Import VRM Expressions":

<figure><img src="/images/image(3).jpg" alt="" /><figcaption></figcaption></figure>

If everything goes well, you should see the VRM expressions have been imported:

<figure><img src="/images/image(23).jpg" alt="" /><figcaption></figcaption></figure>

You can expand and configure each expression in detail, such as whether to disable eye blink tracking when switching to that expression:

<figure><img src="/images/image(29).jpg" alt="" /><figcaption></figcaption></figure>

However, now that the expressions have been imported, how can we trigger them? Simply click on "Generate Key Binding Blueprint":

<figure><img src="/images/image(69).jpg" alt="" /><figcaption></figcaption></figure>

<figure><img src="/images/image(5).jpg" alt="" /><figcaption></figcaption></figure>

You should notice that a new blueprint called "Expression Key Bindings" has been added to the blueprint list:

<figure><img src="/images/image(13).jpg" alt="" /><figcaption></figcaption></figure>

Press Alt+1, Alt+2, Alt+3... and so on to switch between expressions! Press Alt+Backspace to reset back to the natural expression.

![T\_T](https://user-images.githubusercontent.com/3406505/180644979-948d601f-b48f-49de-b672-91c03d28b18c.png)

## Change Idle Animation

Finally, let's give our model a different pose, shall we? Scroll down to find "Animation" -> "Idle Animation":

<figure><img src="/images/image(25).jpg" alt="" /><figcaption></figcaption></figure>

Warudo comes with over **500** built-in idle animations (you can check them out [here](../misc/idle-animations.md))! Let's choose a cute one:

<figure><img src="/images/image(19).jpg" alt="" /><figcaption></figcaption></figure>

Then you have this!

<figure><img src="/images/image(28)(1).jpg" alt="" /><figcaption></figcaption></figure>

The best part is that **Warudo's motion capture blends with the animation!** When you raise your hand for RhyLive to track, the model's hand blends into the tracked pose; when you lower your hand (and lose tracking), the model's hand blends into the idle animation pose, like the following:

<figure><img src="/images/image(45).jpg" alt="" /><figcaption></figcaption></figure>

## Summary

At this point, you have used Warudo to make your model move and have learned how to switch between expressions and idle animations! However, this is just the tip of the iceberg in terms of Warudo's capabilities...

<div className="hint hint-info">
Remember to use "🚀" -> "Save Scene" to save the scene from time to time!
</div>
