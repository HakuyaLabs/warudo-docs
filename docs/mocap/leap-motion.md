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

总体来讲，Leap Motion Controller并不需要校正即可使用。但您可以在**Leap Controller Asset**中调制**Controller Position Offset（传感器位置校正）**，**Controller Rotation Offset（传感器转向校正）**，以及**Controller Scale（传感器比例校正）** 来调整捕捉效果。该界面中将会显示一个虚拟的Leap Motion Controller图标，以帮助您可视化的校正捕捉效果。

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">Adjusting the virtual Leap Motion Controller.</p>

## 选项

* **Controller Position Offset（传感器位置校正）**: 对传感器的位置进行调整，正数X值会将传感器位置向左侧调整，反之则向右侧调整。正数Y值会将传感器位置向上方调整，反之则向下方调整。正数Z值会将传感器位置向前方调整，反之则向后方调整。
* **Controller Rotation Offset（传感器转向校正）**: 平面旋转画面以调整传感器的角度。
* **Controller Scale（传感器比例校正）**: 此参数为调整传感器的距离感应比例，调整它可以改变模型手部和身体的距离感应灵敏度。你也可以使用 **Per Axis Scale（单向量比例校正）** 来单独精调传感器每个方向上的灵敏度。 
* **Fix Finger Orientations Weight**: 由于每个模型的参数不同，Leap Motion Controller中手指的朝向可能与模型中手指的朝向不同，这个参数可以让您调整手指的朝向以对应您使用的模型。0代表不做任何调整，1代表最高修正值。请您持续调整，直至模型看上去效果自然。
* **Shoulder Rotation Weight**: 这个参数会改变模型肩部的旋转角度，0代表不做任何调整，1代表完全翻转，请您持续调整，直至模型看上去效果自然。

## 常见问题{#FAQ}

Please refer to [动作捕捉方案一览](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.常见问题请参考[Overview](overview#FAQ)以及[姿态追踪](body-tracking#FAQ)。

### Leap Motion Tracker显示"Tracker not started."

请确保您已下载并安装最新版本的[Gemini软件](https://leap2.ultraleap.com/gemini-downloads/)，并且程序已在后台运行。

### 我的模型的手腕/手指看着很奇怪。.

请尝试在**Leap Motion Tracker Asset**中调整**Fix Finger Orientations Weight**选项,您可能也需要调整**Wrist Rotation Offset** 与 **Global Finger Rotation Offset**选项。（您可以在选项左侧的方框内开启它们）
