---
sidebar_position: 10
---


# Getting Started

## Creating a Scene

Let's get started! First, we need to create a **scene** in Warudo. The concept of a scene is similar to that of a scene in [OBS](https://obsproject.com/) or a game engine. It is basically a configuration file that can be switched at any time.

A Warudo scene consists of two things: assets and blueprints.

* **Assets:** Assets are basically **objects** in the scene, e.g., a character, a camera, a motion capture tracker, etc.
* **Blueprints:** Blueprints are used to create custom **behaviors**, e.g., "press X to activate expression Y and pose Z," or, "when receive redeem X, throw item Y at character," etc.

By default, Warudo will open the last opened scene (or the default scene if no scenes have been created). To make things easier, let's create a new scene!

Click "🚀" at the bottom left -> "New Scene," enter the name for your scene, and click "OK" to create it.

![](pathname:///doc-img/en-tutorials-1.webp)

Now your asset list should look like this:

![](pathname:///doc-img/en-tutorials-2.webp)

## Import Your Character

Now let's import your character model into the scene. Your model is most likely in [VRM format](https://vrm.dev/), so let's see how we can load that into Warudo.

:::tip
Warudo currently supports two model formats: `.vrm` and `.warudo`. The former is a standard avatar format exported by software like [VRoid Studio](https://vroid.com/en/studio), while the latter is Warudo's own format and supports virtually any Unity-compatible character model. Read more [here](../modding/character-mod.md).
:::

First, open the data folder:

![](pathname:///doc-img/en-tutorials-3.webp)

Put your VRM file in the "Characters" subfolder:

![](pathname:///doc-img/en-tutorials-4.webp)

Without restarting Warudo, we return to the configuration window, select the character asset by clicking on "Character (Inactive)," and choose the desired VRM file to load from the "Source" drop-down menu.

![](pathname:///doc-img/en-tutorials-5.webp)

You should now be able to see the model loaded into the scene!

![](pathname:///doc-img/en-tutorials-6.webp)

## Basic Controls

Let's take a moment to admire the newly loaded model. By default, the camera mode is set to **"Orbit Character"**, which means the camera will rotate around the character. You can use the <b style={{color: "purple"}}>**left or right mouse button**</b> to rotate the view, the <b style={{color: "purple"}}>**mouse wheel**</b> to zoom in or out, and the <b style={{color: "purple"}}>**middle mouse button**</b> to pan the view. Try moving the camera to this angle:

![](pathname:///doc-img/en-tutorials-7.webp)

If "Character" is still selected in the asset list, you will see a **translation gizmo** under the model's feet that can be used to move the model. Its usage is intuitive - simply drag and move it around, like this:

![](pathname:///doc-img/en-tutorials-8.webp)

You can switch to the **rotation gizmo** by pressing the <b style={{color: "purple"}}>**E**</b> key (and, by the way, switch back to the translation gizmo by pressing <b style={{color: "purple"}}>**W**</b>).

![](pathname:///doc-img/en-tutorials-9.webp)

Press <b style={{color: "purple"}}>**R**</b> to switch to the **scale gizmo**:

![](pathname:///doc-img/en-tutorials-10.webp)

:::tip
You can press <b style={{color: "purple"}}>**G**</b> at anytime to toggle the visibility of gizmos for the main camera.
:::

Now you can make your model look like this:

![](pathname:///doc-img/en-tutorials-11.webp)

...This doesn't look good! How can we restore the model to its original state? If you've been paying attention, you may have noticed that the values in the "Transform" section change as you drag the gizmos. For example, this is what mine looks like now:

![](pathname:///doc-img/en-tutorials-12.webp)

To return to the initial state, just restore to the default values!

![](pathname:///doc-img/en-tutorials-13.webp)

In addition to orbiting around the model, the camera can also be switched to a free-look mode, allowing you to fly around the scene. Select the camera asset and choose **"Free Look"** for the "Control Mode":

![](pathname:///doc-img/en-tutorials-14.webp)

While <b style={{color: "purple"}}>**holding down the right mouse button**</b>, use the <b style={{color: "purple"}}>**WASD**</b> keys to move, the <b style={{color: "purple"}}>**E**</b> and <b style={{color: "purple"}}>**Q**</b> keys to move up and down, and hold down the left <b style={{color: "purple"}}>**Shift**</b> key to move faster. Use the <b style={{color: "purple"}}>**middle mouse button**</b> to pan the view.

After you've gotten used to the two camera modes, switch back to "Orbit Character" mode and click **"Reset Camera Transform"** to return the camera to its default position.

![](pathname:///doc-img/en-tutorials-15.webp)

## Setting Up Motion Capture

It's finally time to get the model moving! Let's take a look at what motion capture solutions Warudo supports out-of-the-box.

#### Face Tracking

* [**OpenSeeFace (Beta)**](../mocap/openseeface.md): Webcam-based face tracking. Tracks a set of basic blendshapes, head rotation and head translation. Quality of face tracking is similar to that of [VSeeFace](https://www.vseeface.icu/).
* [**iFacialMocap**](../mocap/ifacialmocap.md): ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the $5.99 [iFacialMocap](https://apps.apple.com/us/app/id1489470545) app. Tracks 52 ARKit blendshapes, head rotation and head translation. <b style={{color: "green"}}>**Most accurate and expressive.**</b>
* [**RhyLive**](../mocap/rhylive.md): ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app. Tracks 52 ARKit blendshapes and head rotation. <b style={{color: "green"}}>**Most accurate.**</b>
* [**VMC**](../mocap/vmc.md): Face tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). VMC is typically not used for face tracking data.
* [**Rokoko**](../mocap/rokoko.md): Face tracking via [Rokoko Studio](https://www.rokoko.com/products/studio).

#### Pose Tracking

* [**MediaPipe**](../mocap/mediapipe.md): Webcam-based upper body tracking. Advantages include a wider range of motion (e.g. forward/backward hand movements) and more responsive tracking (e.g. punches). Drawbacks include the need for some time to set up and calibrate. <b style={{color: "green"}}>**Most expressive.**</b>
* [**RhyLive**](../mocap/rhylive.md): Upper body tracking developed by [RhythMo](https://rhythmo.cn/). Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app.
* [**VMC**](../mocap/vmc.md): Body tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). Compatible with all VR mocap (such as SlimeVR or Mocopi), via [VirtualMotionCapture ](https://vmc.info/)and some VMC-compatible studio mocap.
* [**Rokoko**](../mocap/rokoko.md): Body tracking via [Rokoko Studio](https://www.rokoko.com/products/studio).
* [**Xsens MVN**](../mocap/xsens-mvn.md): Body tracking via [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US).

Alright, I hear you asking: "So which should I choose?!

——Just follow the steps below!



* I have an iPhone or iPad：
  * I am all for convenience or I don't have a webcam: [RhyLive](../mocap/rhylive.md) + [RhyLive](../mocap/rhylive.md).
  * I want my avatar to be more expressive and I have a wide-angle webcam: [iFacialMocap ](../mocap/ifacialmocap.md)+ [MediaPipe](../mocap/mediapipe.md).

:::info
Is your avatar compatible with [the 52 ARKit blendshapes](https://arkit-face-blendshapes.com/) ("Perfect Sync")? ARKit-based face tracking are much more expressive, so it is highly recommended.
:::

* I don't have an iPhone or iPad: [OpenSeeFace](../mocap/openseeface.md) + [MediaPipe](../mocap/mediapipe.md).

:::info
If you do not have an iOS device and looking to buy one but do not have much budget for it, look into a used iPhone X. It is the cheapest iOS device compatible with ARKit / Face ID.
:::

* I would like to use other motion capture software: [VMC ](../mocap/vmc.md)/ [iFacialMocap ](../mocap/ifacialmocap.md)+ [VMC](../mocap/vmc.md).

:::tip
Many motion capture hardware, in addition to home VR, have first or third-party VMC support, such as [Mocopi](https://www.sony.jp/mocopi/) and [Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking).
:::

:::tip
In addition to at-home mocap options, Warudo also supports a range of [professional motion capture solutions](mocap/overview)!
:::



As this is a tutorial, we will use RhyLive + RhyLive as an example, so you can follow along if you have an iPhone. However, feel free to visit the [Motion Capture section](../mocap/overview.md) in the documentation to learn about other motion capture solutions supported by Warudo.

Select the character asset and click on "Motion Capture" -> "Setup Motion Capture":

![](pathname:///doc-img/en-tutorials-16.webp)

Select "RhyLive" for the "Face Tracking Template." The options below will ask you which blendshape mapping you want to use. In most cases, the default automatic selection works best:

![](pathname:///doc-img/en-tutorials-17.webp)

:::tip
<b style={{color: "green"}}>**Tips:**</b> What are blendshapes? A blendshape is a displacement of a number of vertices on the model mesh, like the following:

![](pathname:///doc-img/zh-tutorials-18.gif)
<p class="img-desc">ref: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/</p>

A blendshape's value is between 0 and 1. When the value is 0, the vertices do not move. When the value is 1, the vertices move to the target position, as shown below:

![](pathname:///doc-img/zh-tutorials-19.gif)
<p class="img-desc">Note that BlendShape in Unity takes values from 0-100, but in Warudo (and most 3D tools) BlendShape takes values from 0-1. ref: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/</p>

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
:::

:::caution
You may have heard others refer to blendshapes as "expressions." However, in Warudo, expressions are the states of several blendshapes on the character. For example, the "crying" expression shown below is a specific combination of five blendshape values:

![](pathname:///doc-img/zh-tutorials-20.webp)
To avoid confusion, we will stick to referring blendshapes and expressions by their respective names.
:::

Similarly, choose "RhyLive" for the "Pose Tracking Template."

![](pathname:///doc-img/en-tutorials-18.webp)

:::info
If you enable "Use Keyboard" / "Use Touchpad," Warudo will procedurally generate animations of the model using the keyboard and mouse when your hands are not tracked:

<div className="video-box"><video controls src="/doc-img/zh-tutorials-video1.mp4" />
</div>

After clicking "OK," you should see a success message:

![](pathname:///doc-img/en-tutorials-19.webp)

The "RhyLive Receiver" should now appear in the asset list, which is used to receive motion capture data sent by the RhyLive App:

![](pathname:///doc-img/en-tutorials-20.webp)

Two blueprints should also have been added to the blueprint list:

![](pathname:///doc-img/en-tutorials-21.webp)
:::

:::info
Warudo's blueprints are a very powerful feature, but if you're just starting out with Warudo, you can achieve great results without touching blueprints at all. We recommend reading the [blueprint tutorial](/docs/mocap/blueprints/overview) once you are familiar with the rest of Warudo's features.
:::

To use RhyLive on an iOS device, open the app and tap on the menu icon in the top left corner to enter the settings. If your computer and phone are connected to the same WiFi network, enter your computer's IP in the "IP" field and turn on the "无线" (Wireless) switch. Alternatively, you can connect your device to your computer using a USB cable and turn on the "有线" (Wired) switch ([iTunes](https://www.apple.com/itunes/) required).

![](pathname:///doc-img/en-tutorials-22.webp)

:::info
If you do not know your computer's IP, you can check on the configuration page of the "RhyLive Receiver".

![](pathname:///doc-img/en-tutorials-23.webp)

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with 192.168. For example, in the above picture, you can first try 192.168.1.2.
:::

:::info
If you use the "Wired" option, you must open the RhyLive app, connect your iPhone to your PC before launching Warudo.
:::

:::tip
It is recommended to turn off "锁定弯腰" (Lock body bending) and turn on "隐藏模型" (Hide model). The former increases the range of motion of the model, while the latter helps reduce device overheating from prolonged use.
:::

You should now see the model in motion!

![](pathname:///doc-img/en-tutorials-24.webp)

:::info
If the model's pose doesn't look quite right, select the "RhyLive Receiver" and click "Calibrate" to correct it.
:::

## Setting Up Expressions

Now that the upper body of the model is in motion, it's time to configure the face expressions!

Scroll down on the character's config page. Click on "Expressions" -> "Import VRM Expressions":

![](pathname:///doc-img/en-tutorials-25.webp)

If everything goes well, you should see the VRM expressions have been imported:

![](pathname:///doc-img/en-tutorials-26.webp)

You can expand and configure each expression in detail, such as whether to disable eye blink tracking when switching to that expression:

![](pathname:///doc-img/en-tutorials-27.webp)

However, now that the expressions have been imported, how can we trigger them? Simply click on "Generate Key Binding Blueprint":

![](pathname:///doc-img/en-tutorials-28.webp)

![](pathname:///doc-img/en-tutorials-29.webp)

You should notice that a new blueprint called "Expression Key Bindings" has been added to the blueprint list:

![](pathname:///doc-img/en-tutorials-30.webp)

Press Alt+1, Alt+2, Alt+3... and so on to switch between expressions! Press Alt+Backspace to reset back to the natural expression.

![](pathname:///doc-img/en-tutorials-31.webp)
<p class="img-desc">T_T</p>

## Change Idle Animation

Finally, let's give our model a different pose, shall we? Scroll down to find "Animation" -> "Idle Animation":

![](pathname:///doc-img/en-tutorials-32.webp)

Warudo comes with over **500** built-in idle animations (you can check them out [here](../misc/idle-animations.md))! Let's choose a cute one:

![](pathname:///doc-img/en-tutorials-33.webp)

Then you have this!

![](pathname:///doc-img/en-tutorials-34.webp)

The best part is that **Warudo's motion capture blends with the animation!** When you raise your hand for RhyLive to track, the model's hand blends into the tracked pose; when you lower your hand (and lose tracking), the model's hand blends into the idle animation pose, like the following:

![](pathname:///doc-img/en-tutorials-35.webp)

## Summary

At this point, you have used Warudo to make your model move and have learned how to switch between expressions and idle animations! However, this is just the tip of the iceberg in terms of Warudo's capabilities...

:::info
Remember to use "🚀" -> "Save Scene" to save the scene from time to time!
:::
