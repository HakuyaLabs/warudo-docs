---
sidebar_position: 70
---

# Leap Motion Controller 

使用 [Leap Motion Controller](https://leap2.ultraleap.com/leap-motion-controller-2/)进行手部捕捉。

## 初始设置

为了更准确和稳定的手部捕捉，我们推荐您使用Leap Motion Controller 2，但初代Leap Motion Controller 也是受支持的。

您将需要下载安装最新的[Gemeni](https://leap2.ultraleap.com/gemini-downloads/)软件以将Leap Motion Controller连接到Warudo。

Warudo支持Leap Motion Controller提供的所有三种捕捉模式：**Desktop（桌面）**, **Screen Top（屏幕顶部）**, 以及 **Chest Mounted（颈挂式）**。为了更好的体验，我们推荐在使用颈挂式捕捉模式时，使用一个[颈挂](https://www.etsy.com/market/leap_motion_mounting)。

## 校正 {#Calibration}

总体来讲，Leap Motion Controller并不需要校正即可使用。但您可以在**Leap Controller Asset**中调制**传感器位置**，**传感器转向**以及**传感器距离**来调整捕捉效果。该界面中将会显示一个虚拟的Leap Motion Controller图标，以帮助您可视化的校正捕捉效果。

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">Adjusting the virtual Leap Motion Controller.</p>

## 选项

* **Controller Position Offset**: 对传感器的位置进行调整，正数X值会将传感器位置向左侧调整，反之则向右侧调整。正数Y值会将传感器位置向上方调整，反之则向下方调整。正数Z值会将传感器位置向前方调整，反之则向后方调整。
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
