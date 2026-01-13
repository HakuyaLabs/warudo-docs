---
sidebar_position: 55
version: 2024-11-16
---

# OpenSeeFace

Webcam-based face tracking. Tracks a set of basic blendshapes, head rotation and head translation. Quality of face tracking is similar to that of [VSeeFace](https://www.vseeface.icu/).

:::info
OpenSeeFace is the face tracking technology used in [VSeeFace](https://www.vseeface.icu/), so users familiar with VSeeFace may find it quite familiar.
:::

:::caution
We generally recommend using [MediaPipe](./mediapipe.md) for face tracking instead, which tracks more blendshapes and has better tracking quality. OpenSeeFace is mainly provided for users who cannot use MediaPipe for some reason.
:::

## Setup

OpenSeeFace is built into Warudo, so you do not need to install any additional software.

:::tip
After OpenSeeFace tracker is started, it takes 10-15 seconds for internal calibration. During this time, the model's mouth and eyes may move randomly, which is normal.
:::

## Calibration

You can calibrate OpenSeeFace's tracking by:
* clicking **Character → Motion Capture → Quick Calibration → Calibrate OpenSeeFace**, or
* clicking **Calibrate** in the **OpenSeeFace Tracker** asset.

During calibration, you should look straight ahead and keep your head still. After calibration, you can move your head freely.

## Options

* **Eye Blinking Offset**: If you find the model's eyes are not fully closing, add 0.1 to the value until fit. Otherwise, subtract 0.1 from the value.&#x20;
* **Eye Wide Sensitivity**: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the EyeWideLeft/EyeWideRight blendshapes easier to trigger.
* **Eyebrow Movement Sensitivity**: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the eyebrow-related blendshapes easier to trigger.
* **Mouth Left Right Sensitivity**: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the MouthLeft/MouthRight blendshapes easier to trigger.
* **Mouth Open Threshold**: If you find the model's mouth opens too easily, add 0.1 to the value until fit. Otherwise, subtract 0.1 from the value.
* **Mouth Open Sensitivity**: Increasing this value makes the JawOpen blendshape (or the "A" VRM animation clip) easier to trigger.
* **Mouth Funnel Sensitivity**: Increasing this value makes the MouthFunnel blendshape (or the "O" VRM animation clip)  easier to trigger.
* **Mouth Smile Sensitivity**: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the MouthSmileLeft/MouthSmileRight blendshapes easier to trigger.
* **Body Movement Intensity**: The range of natural body movement that follows head movement.

## Frequently Asked Questions {#FAQ}

Please refer to [Overview](overview#FAQ) and [Customizing Face Tracking](face-tracking#FAQ) for common questions.

### An empty console window keeps popping up when I use OpenSeeFace, and my tracking is not working.

This is caused by a bug in Windows. To fix it, search **Terminal** in the Start Menu and open it. Click on the down arrow icon and select **Settings**. Select **Windows Console Host** for **Default terminal application** and click **Save**. Then, restart Warudo.

### I can see the OpenSeeFace tracker window, but my tracking is not working.

Some antivirus software may block Warudo from accessing the camera. Please disable the camera protection function of your antivirus software, or add Warudo to the whitelist.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
