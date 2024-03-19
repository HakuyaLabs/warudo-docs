---
sidebar_position: 70
---

# Leap Motion 控制器 

使用 [Leap Motion 控制器](https://leap2.ultraleap.com/leap-motion-controller-2/)进行手部捕捉。

## 初始设置

为了更准确和稳定的手部捕捉，我们推荐您使用更新一代的Leap Motion 控制器 2，但Warudo也支持使用初代Leap Motion 控制器进行捕捉。

您将需要下载安装最新的[Gemeni软件](https://leap2.ultraleap.com/gemini-downloads/)以将您的Leap Motion 控制器连接到Warudo。

Warudo支持 Leap Motion 控制器提供的所有三种捕捉模式：**Desktop（将设备置于桌面上时）**, **Screen Top（将设备置于屏幕顶部时）**, 以及 **Chest Mounted（颈挂式）**。为了更好的体验，我们推荐在使用颈挂式捕捉模式时，使用一个[颈挂](https://www.etsy.com/market/leap_motion_mounting)。

## 校正 {#Calibration}

总体来讲，Leap Motion 控制器并不需要校正即可使用。但您可以在 **Leap Motion 控制器 Asset** 中调制**控制器位置偏移**，**控制器旋转偏移**，以及**控制器缩放比率** 来调整捕捉效果。该界面中将会显示一个虚拟的 Leap Motion 控制器图标，以帮助您可视化的校正动捕效果。

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">图为调整 Leap Motion 控制器的示意图。</p>

## 选项

* **控制器位置偏移**: 对传感器的三维空间坐标位置进行调整，正数X值会将传感器位置向左侧调整，反之则向右侧调整。正数Y值会将传感器位置向上方调整，反之则向下方调整。正数Z值会将传感器位置向前方调整，反之则向后方调整。
* **控制器旋转偏移**: 平面旋转虚拟 Leap Motion 控制器,以调整传感器的角度。
* **控制器缩放比率**: 此参数为调整传感器的距离感应比例，调整它可以改变模型手部和身体的距离感应灵敏度。你也可以使用 **对每个轴单独缩放** 来单独精调传感器在每个方向上的灵敏度。 
* **修正手指朝向权重**: 由于每个人物模型的参数不同，Leap Motion 控制器中手指的朝向可能与模型中手指的朝向不同步，这个参数可以让您调整手指的朝向，以使模型显示的动作与传感器捕捉到的动作同步。0代表不做任何调整，1代表最高修正值。请您持续调整，直至模型看上去效果自然。
* **修正肩部朝向权重**: 这个参数会改变模型肩部的旋转角度，0代表不做任何调整，1代表完全翻转，请您持续调整，直至模型看上去效果自然。

## 常见问题{#FAQ}

常见问题请参考[动作捕捉方案一览](overview#FAQ)以及[姿态追踪](body-tracking#FAQ)。

### **Leap Motion 追踪器显示**"Tracker not started."

请确保您已下载并安装最新版本的[Gemini软件](https://leap2.ultraleap.com/gemini-downloads/)，并且程序已在后台运行。

### 我的模型的手腕/手指看着很奇怪。.

请尝试在**Leap Motion 追踪器 Asset**中调整**修正手指朝向权重（手指方向修正权重）** 选项,您可能也需要调整**手腕旋转偏移** 与 **全局手指旋转偏移** 选项。（您可以在选项左侧的方框内开启它们）
