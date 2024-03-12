---
sidebar_position: 70
---

# Leap Motion Controller 

使用 [Leap Motion Controller](https://leap2.ultraleap.com/leap-motion-controller-2/)进行手部追踪。

## 初始设置

为了更准确和稳定的手部追踪，我们推荐您使用Leap Motion Controller 2，但初代Leap Motion Controller 也是受支持的。

您将需要下载安装最新的[Gemeni](https://leap2.ultraleap.com/gemini-downloads/)软件以将Leap Motion Controller连接到Warudo。

Warudo supports all 3 tracking modes offered by the Leap Motion Controller: **Desktop**, **Screen Top**, and **Chest Mounted**. We recommend using the **Chest Mounted** mode along with a [neck/chest mount](https://www.etsy.com/market/leap_motion_mounting) for the best experience.
Warudo支持Leap Motion Controller提供的所有三种追踪模式：**Desktop（桌面）**, **Screen Top（屏幕顶部）**, 以及 **Chest Mounted（颈挂式）**

## Calibration {#Calibration}

There is generally no need to calibrate the Leap Motion Controller. However, you can adjust **Controller Position Offset**, **Controller Rotation Offset**, and **Controller Scale** in the **Leap Motion Controller** asset to adjust the tracking. A virtual Leap Motion Controller will be displayed in the scene to help you visualize the tracking.

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">Adjusting the virtual Leap Motion Controller.</p>

## Options

* **Controller Position Offset**: The offset of the controller position. Positive X is a left offset, positive Y is an upward offset, and positive Z is a forward offset.
* **Controller Rotation Offset**: The offset of the controller rotation.
* **Controller Scale**: The scale of the controller. Increase this value if you want hands to be further away from the body. You can also enable **Per-Axis Scale** to scale the controller on each axis separately.
* **Fix Finger Orientations Weight**: Due to different model specifications, the finger orientations of the Leap Motion Controller may not match the finger orientations of the model. This option allows you to adjust the finger orientations of the Leap Motion Controller to match the model. 0 means no adjustment, 1 means full adjustment. Adjust this value until the fingers look natural.
* **Shoulder Rotation Weight**: How much the shoulders should be rotated. 0 means no rotation, 1 means full rotation. Adjust this value until the shoulders look natural.

## Frequently Asked Questions {#FAQ}

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### The Leap Motion Tracker asset says "Tracker not started."

Please make sure you have installed the latest [Gemini software](https://leap2.ultraleap.com/gemini-downloads/), and it is running in the background.

### My model's wrist/fingers look unnatural.

Try adjusting the **Fix Finger Orientations Weight** option in the **Leap Motion Tracker** asset. You may also need to adjust the **Wrist Rotation Offset** and **Global Finger Rotation Offset** options (check the left boxes to enable them).
