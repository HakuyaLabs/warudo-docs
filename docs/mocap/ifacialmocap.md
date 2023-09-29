---
sidebar_position: 40
---

# iFacialMocap

ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the $5.99 [iFacialMocap](https://apps.apple.com/us/app/id1489470545) app. Tracks 52 ARKit blendshapes, head rotation and head translation.

<div className="hint hint-info">
iFacialMocap is actually very simple in its offerings and there are free alternatives like [waidayo](https://apps.apple.com/us/app/waidayo/id1513166077) that provide ARKit-based facial tracking with the same level of accuracy. (You can even write your own using[ Unity](https://docs.unity3d.com/Packages/com.unity.xr.arkit-face-tracking@1.1/manual/index.html).) However, iFacialMocap is one of the earliest and most widely used apps in this category, so Warudo added support for it first, and support for other similar apps will come later.
</div>

## Setup

Open the iFacialMocap app, tap on the gear icon in the upper right corner to enter the settings interface. Tap on "Destination IP address" and enter your computer's IP address.

<img src="/images/image(42).jpg" alt="" data-size="original" />

<div className="hint hint-info">
If you do not know your computer's IP, you can check on the configuration page of the "iFacialMocap Receiver".

<img src="/images/image(21)(2)(1).jpg" alt="" data-size="original" />

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with 192.168. For example, in the above picture, you can first try 192.168.1.2.
</div>

It's recommended to enable "Optimize for long-time streaming," which can help reduce device overheating from prolonged use.

![](</images/image(2)(1)(4)(2).jpg>)

## Properties

* Character: Select the character to apply face tracking to.
* Port: The port used by Warudo to receive data. This can be changed in iFacialMocap -> Settings -> Details Settings -> Port.
* Calibrate: Correct the position and rotation of the head to face forward.
* Head Movement Range: The range of movement for the head.
* Head Vertical Movement: Whether or not to allow the head to move up and down.

<figure><img src="/images/image(4)(3).jpg" alt="" /><figcaption><p>When enabled, the legs will naturally bend when the head moves down.</p></figcaption></figure>

* Inverted Head Forward/Backward Movement: Whether or not to invert the forward-back movement of the head.
* Head Rotation Range: The range of head rotation.
* Head Rotation Offset: The offset of head rotation.
* Eye Movement Intensity: The range of eye movement.
* Eye Blink Sensitivity: The sensitivity of the eye blinking.
* Body Movement Intensity: The range of natural body movement that follows head movement.
* Limit Eye Squint: If your model is compatible with ARKit blendshapes, the eyes of your model may not be able to completely close (or close too much) based on the preferences of the modeler. In this case, try toggling this option.
* Use BlendShapes For Eye Movement: **Requires ARKit blendshapes to be present on the model.** Controls the movement of the character's eyes using eye movement blendshapes (EyeLookInLeft, EyeLookInRight, EyeLookOutLeft, EyeLookOutRight) instead of the eye bones. If your model does not have eye bones, enable this option.
