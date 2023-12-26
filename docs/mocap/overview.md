---
sidebar_position: 10
---

# Overview

Whether you are streaming at home or at a professional mocap studio, Warudo has you covered. Currently, Warudo supports the following motion capture systems:

* Webcam
  * Built-in tracking via [MediaPipe](./mediapipe) or [OpenSeeFace](./openseeface).
* iPhone
  * Requires either [iFacialMocap / FaceMotion3D](./ifacialmocap) or [RhyLive](./rhylive) app to be installed on the iPhone.
* [Leap Motion Controller](./leap-motion)
* [Sony Mocopi](./mocopi)
* [Rokoko](./rokoko)
* [Xsens MVN](./xsens-mvn)
* [Virdyn Studio (VDMocapStudio)](./virdyn)
* [Noitom Axis](./noitom)
* [StretchSense Glove](./stretchsense)
* External applications that support the [VMC protocol](./vmc), e.g., [VSeeFace](https://www.vseeface.icu/), [VirtualMotionCapture](https://vmc.info/)
  * VR trackers are supported using the paid (supporter) version of [VirtualMotionCapture](https://www.patreon.com/sh_akira).

[Warudo Pro](../pro.md) also supports the following motion capture systems:

* Any optical tracking system compatible with [Autodesk MotionBuilder](./motionbuilder), e.g., [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)
* [Chingmu Avatar](./chingmu)

## What motion capture systems should I use?

If you are completely new to 3D VTubing, we recommend starting with [MediaPipe](./mediapipe) for both face tracking and hand tracking. MediaPipe is a motion capture system built into Warudo, and you only need a webcam to use it. If you happen to have an iPhone, we recommend using the [iFacialMocap](./ifacialmocap) app for face tracking instead, as it offers much higher accuracy than MediaPipe, and offloading face tracking to the iPhone also reduces the load on your computer.

If you are looking to improve your tracking quality, here are a few suggestions:

* Use an iPhone for face tracking (via the [iFacialMocap](./ifacialmocap) app). This is also the best face tracking solution you can ever get. If you don't have an iPhone, you may consider looking into a used iPhone. As long as it is compatible with Face ID, it should work with iFacialMocap.

:::tip
For best tracking quality, we recommend using an iPhone 12 or newer (iPhone mini also works). Older iPhones may have lower tracking quality.
:::
* If you find MediaPipe hand tracking not accurate enough, you may consider using a [Leap Motion Controller](./leap-motion) for hand tracking. You can use a [neck mount](https://www.etsy.com/market/leap_motion_mounting) to wear it on your neck, so that it can track your hands.
* If you are looking for a full-body tracking solution, you may consider using [Sony Mocopi](./mocopi) or [VR trackers](./vmc.md). If you have the budget, you may also consider using a mocap suit, such as [Virdyn VDSuit](./virdyn), [Noitom Perception Neuron](./noitom), [Rokoko Smartsuit Pro](./rokoko), or [Xsens MVN Link](./xsens-mvn). You can add finger tracking to these mocap suits by using [StretchSense gloves](./stretchsense).
* If you are looking for a more professional solution, you may consider using an optical tracking system, such as [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/), or [Chingmu](https://www.chingmu.com/).

## Setup {#setup}

There are two ways to set up motion capture in Warudo. The first and the preferred way is to use the **Onboarding Assistant** asset that comes with every scene. Simply click **Basic Setup → Get Started** to start the onboarding process and follow the instructions.

![](pathname:///doc-img/en-getting-started-2.png)
<p class="img-desc">Setting up motion capture in the onboarding assistant asset.</p>

After the onboarding process is complete, you can select the relevant motion capture assets to further customize your tracking. For example, if you are using iFacialMocap, you may notice Warudo adds some movement to your character's body when your head moves. If this is not desirable, you can set **Body Movement Intensity** to 0 in the **iFacialMocap Receiver** asset.

![](pathname:///doc-img/en-mocap-1.png)
<p class="img-desc">Adjusting the body movement intensity of iFacialMocap.</p>

The second way to set up motion capture is to use **Character → Setup Motion Capture**. This allows you to set up face tracking and/or pose tracking directly. However, some checking steps in the onboarding process are also skipped.

![](pathname:///doc-img/en-mocap-2.png)
<p class="img-desc">Setting up motion capture in the character asset.</p>

This method is useful if you need to set up multiple face tracking or pose tracking systems, since the onboarding assistant always remove the existing motion capture setup when you start a new onboarding process.

Whichever method you choose, corresponding tracking blueprints will be generated and added to your scene. For example, if you have chosen iFacialMocap for face tracking and MediaPipe for pose tracking, you will be able to see two blueprints generated: **Face Tracking - iFacialMocap** and **Pose Tracking - MediaPipe**. You can modify these blueprints to customize your tracking.

:::caution
You should almost never create a motion capture asset manually, i.e., by clicking on **Add Asset** and selecting a motion capture asset, such as **iFacialMocap Receiver**. This is because the motion capture asset alone only receives or provides the tracking data, but does not connect the tracking data to your character, which needs to be done by blueprints. The onboarding assistant and the **Setup Motion Capture** function automatically create the necessary blueprints for you.
:::

## Frequently Asked Questions {#FAQ}

### My character is not moving.

If you are using a motion capture system that requires an external application, such as iFacialMocap, make sure the application is running and the tracking data is being sent to Warudo. Also, make sure your computer's firewall is not blocking Warudo from receiving the tracking data; you may need to add Warudo to the whitelist, or temporarily disable the firewall.

Some motion capture receivers have a **Port** option. Make sure the port number matches the port number in the external application.

### My tracking is too smooth / too jittery.

Please go to the tracking blueprint (e.g., **Face Tracking - iFacialMocap**) and locate the **Smooth Rotation List** / **Smooth Position List** / **Smooth Transform** / **Smooth BlendShape List** nodes. Increase the **Smooth Time** value to make the tracking smoother, or decrease the value to make the tracking more responsive.
