---
sidebar_position: 70
---

# RhyLive

ARKit-based face and upper body tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app. Tracks 52 ARKit blendshapes, head rotation, and hand movements.

:::info
RhyLive and iFacialMocap have similar accuracy when it comes to face tracking, but iFacialMocap is more flexible because it can track head movements, which allows the model to move more naturally. See the following comparison:

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-1.mp4" />
<p>RhyLive</p>
</div>

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-2.mp4" />
<p>iFacialMocap</p>
</div>
:::

## Setup

To use RhyLive on an iOS device, open the app and tap on the menu icon in the top left corner to enter the settings. If your computer and phone are connected to the same WiFi network, enter your computer's IP in the "IP" field and turn on the "无线" (Wireless) switch. Alternatively, you can connect your device to your computer using a USB cable and turn on the "有线" (Wired) switch ([iTunes](https://www.apple.com/itunes/) required).

![](/doc-img/zh-rhylive-1.webp)

:::info
If you do not know your computer's IP, you can check on the configuration page of the "RhyLive Receiver".

![](/doc-img/zh-rhylive-2.webp)

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with 192.168. For example, in the above picture, you can first try 192.168.1.2.
:::

:::info
If you use the "Wired" option, you must open the RhyLive app, connect your iPhone to your PC before launching Warudo.
:::

It is recommended to turn off "锁定弯腰" (Lock body bending) and turn on "隐藏模型" (Hide model). The former increases the range of motion of the model, while the latter helps reduce device overheating from prolonged use.

![](/doc-img/zh-rhylive-3.webp)

## Properties

* Character: Select the character to apply tracking to.
* Port: The port used by Warudo to receive data. You can change it in RhyLive -> Settings -> Port.
* Calibrate: Correct the position and rotation of the head to face forward.
* Head Rotation Offset: The offset of head rotation.
* Body Movement Intensity: The range of body movement.
* Eye Movement Intensity: The range of eye movement.
* Eye Blink Sensitivity: The sensitivity of the eye blinking.
* Limit Eye Squint: If your model is compatible with ARKit blendshapes, the eyes of your model may not be able to completely close (or close too much) based on the preferences of the modeler. In this case, try toggling this option.
* Use BlendShapes For Eye Movement: **Requires ARKit blendshapes to be present on the model.** Controls the movement of the character's eyes using eye movement blendshapes (EyeLookInLeft, EyeLookInRight, EyeLookOutLeft, EyeLookOutRight) instead of the eye bones. If your model does not have eye bones, enable this option.
