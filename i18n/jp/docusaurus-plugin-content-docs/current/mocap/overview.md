---
sidebar_position: 10
---

# 概要

![](/doc-img/mocap-cover.jpg)

自宅でストリーミングする場合でも、プロのモーションキャプチャスタジオでストリーミングする場合でも、Warudoが対応します。現在、Warudoは以下のモーションキャプチャシステムをサポートしています。

* Webカメラ
  * [MediaPipe](./mediapipe)または [OpenSeeFace](./openseeface)（Warudo内蔵のトラッキングソフト）
* iPhone
  * [iFacialMocap/FaceMotion3D](./ifacialmocap) または [RhyLive](./rhylive) アプリのいずれかのインストールが必要
* [SteamVR](./steamvr)
* [Leap Motion Controller](./leap-motion)
* [Sony Mocopi](./mocopi)
* [Rokoko](./rokoko)
* [Xsens MVN](./xsens-mvn)
* [Virdyn Studio (VDMocapStudio)](./virdyn)
* [Noitom Axis](./noitom)
* [StretchSense Glove](./stretchsense)
* [VMCプロトコル](./vmc)をサポートする外部アプリケーション（例: [VSeeFace](https://www.vseeface.icu/)、 [VirtualMotionCapture](https://vmc.info/)）
  * VRトラッカーは、[VirtualMotionCapture（支援版）](https://www.patreon.com/sh_akira)を使用することでサポートされます

[Warudo Pro](../pro.md)は、次のモーション キャプチャ システムもサポートしています。

* [Autodesk MotionBuilder](./motionbuilder)互換性のある光学トラッキング システム（例:  [VICON](https://www.vicon.com/)、[OptiTrack](https://optitrack.com/)）
* [OptiTrack Motive](./optitrack)
* [Chingmu Avatar](./chingmu)

## どのようなモーションキャプチャシステムを使うべきですか？ {#what-motion-capture-systems-should-i-use}

3D VTuberソフトを初めて使用する場合は、顔と手のトラッキングの両方に[MediaPipe](./mediapipe)を使用することをおすすめします。MediaPipeはWarudoに組み込まれているモーションキャプチャシステムで、Webカメラがあれば使用できます。iPhoneをお持ちの場合は、顔のトラッキングに[iFacialMocap](./ifacialmocap)アプリを使用することをおすすめします。MediaPipeよりも精度が高く、顔のトラッキングをiPhoneに任せると、コンピューターの負荷も軽減されます。

トラッキングの精度を向上させたい場合は、次の提案も参考にしてください。

* 顔のトラッキングには iPhone を使用します（[iFacialMocap](./ifacialmocap)アプリ経由）これは、現在利用できる最高のフェイストラッキングソリューションです。iPhoneをお持ちでない場合は、中古のiPhoneを検討してください。Face IDと互換性がある限り、iFacialMocapが動作するはずです。

:::tip
最高のトラッキング品質を得るには、iPhone 12以降（iPhone miniも可）の使用をおすすめします。古いiPhoneではトラッキング品質が低下する可能性があります。
:::

* MediaPipeのハンド トラッキングの精度が十分でないと思われる場合は、ハンドトラッキングに[Leap Motion Controller](./leap-motion)の使用を検討してください。[ネックマウント](https://www.etsy.com/market/leap_motion_mounting)を使用して首に装着し、手をトラッキングすることができます。
* フルトラッキングソリューションをお探しの場合は、[Sony Mocopi](./mocopi)、または[VRトラッカー](./vmc)の使用を検討してください。予算に余裕がある場合は、[Virdyn VDSuit](./virdyn)、 [Noitom Perception Neuron](./noitom)、 [Rokoko Smartsuit Pro](./rokoko)、 [Xsens MVN Link](./xsens-mvn)などのモーションキャプチャスーツの使用も検討してください。[StretchSense gloves](./stretchsense)を使用すると、これらのモーションキャプチャスーツに指のトラッキングを追加できます。 
* より専門的なソリューションをお探しの場合は、[VICON](https://www.vicon.com/)、[OptiTrack](https://optitrack.com/)、[Chingmu](https://www.chingmu.com/)などの光学式モーションキャプチャシステムの使用を検討してください。

## 設定 {#setup}

There are two ways to set up motion capture in Warudo. The first and the preferred way is to use the **Onboarding Assistant** asset that comes with every scene. Simply click **Basic Setup → Get Started** to start the onboarding process and follow the instructions.

![](/doc-img/en-getting-started-2.png)
<p class="img-desc">Setting up motion capture in the onboarding assistant asset.</p>

After the onboarding process is complete, you can select the relevant motion capture assets to further customize your tracking. For example, if you are using iFacialMocap, you may notice Warudo adds some movement to your character's body when your head moves. If this is not desirable, you can set **Body Movement Intensity** to 0 in the **iFacialMocap Receiver** asset.

![](/doc-img/en-mocap-1.png)
<p class="img-desc">Adjusting the body movement intensity of iFacialMocap.</p>

The second way to set up motion capture is to use **Character → Setup Motion Capture**. This allows you to set up face tracking and/or pose tracking directly. However, some checking steps in the onboarding process are also skipped.

![](/doc-img/en-mocap-2.png)
<p class="img-desc">Setting up motion capture in the character asset.</p>

This method is useful if you need to set up multiple face tracking or pose tracking systems, since the onboarding assistant always remove the existing motion capture setup when you start a new onboarding process.

Whichever method you choose, corresponding tracking blueprints will be generated and added to your scene. For example, if you have chosen iFacialMocap for face tracking and MediaPipe for pose tracking, you will be able to see two blueprints generated: **Face Tracking - iFacialMocap** and **Pose Tracking - MediaPipe**. You can modify these blueprints to customize your tracking.

:::caution
You should almost never create a motion capture asset manually, i.e., by clicking on **Add Asset** and selecting a motion capture asset, such as **iFacialMocap Receiver**. This is because the motion capture asset alone only receives or provides the tracking data, but does not connect the tracking data to your character, which needs to be done by blueprints. The onboarding assistant and the **Setup Motion Capture** function automatically create the necessary blueprints for you.
:::

## よくある質問 {#FAQ}

### キャラクターが動きません

If you are using a motion capture system that requires an external application, such as iFacialMocap, make sure the application is running and the tracking data is being sent to Warudo. Also, make sure your computer's firewall is not blocking Warudo from receiving the tracking data; you may need to add Warudo to the whitelist, or temporarily disable the firewall.

You may also want to set your network as a private network, as Windows may block incoming connections from public networks. See [this guide](https://support.microsoft.com/en-us/windows/make-a-wi-fi-network-public-or-private-in-windows-0460117d-8d3e-a7ac-f003-7a0da607448d) for more information.

Some motion capture receivers have a **Port** option. Make sure the port number matches the port number in the external application.

### トラッキングが敏感すぎる / 不安定すぎる

Please go to the tracking blueprint (e.g., **Face Tracking - iFacialMocap**) and locate the **Smooth Rotation List** / **Smooth Position List** / **Smooth Transform** / **Smooth BlendShape List** nodes. Increase the **Smooth Time** value to make the tracking smoother, or decrease the value to make the tracking more responsive.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
