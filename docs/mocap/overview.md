---
sidebar_position: 10
---

# 动作捕捉方案一览

![](/doc-img/mocap-cover.jpg)

不论在自家还是在专业动捕工作室，Warudo自有妙计帮助您。目前Warudo支持以下动捕设备：

* 摄像头
  * 使用本软件自带的[MediaPipe](./mediapipe) 或者 [OpenSeeFace](./openseeface)功能即可进行动作捕捉。
* iPhone
  * 在iPhone上安装[iFacialMocap / FaceMotion3D](./ifacialmocap) 或 [RhyLive]软件即可使用
* [Leap Motion Controller](./leap-motion)
* [Sony Mocopi](./mocopi)
* [Rokoko](./rokoko)
* [Xsens MVN](./xsens-mvn)
* [Virdyn Studio (VDMocapStudio)](./virdyn)
* [Noitom Axis](./noitom)
* [StretchSense Glove](./stretchsense)
* 支持[VMC protocol](./vmc)的第三方软件, 例如[VSeeFace](https://www.vseeface.icu/), [VirtualMotionCapture](https://vmc.info/)
  * 付费（赞助性质）版本的[VirtualMotionCapture](https://www.patreon.com/sh_akira)可支持VR动捕。

[Warudo Pro](../pro.md) 可以额外支持以下系统:

* 任何兼容[Autodesk MotionBuilder](./motionbuilder)软件的光学动捕系统,例如 [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)
* [青瞳 Avatar](./chingmu)

## 我应该使用哪种动捕系统?

如果您是初次进行3D直播的话，我们建议您先使用Warudo内置的[MediaPipe](./mediapipe)来完成全部动捕，只需要您拥有一个电脑摄像头便可完成全部流程。如果您使用iPhone，我们推荐您使用[iFacialMocap](./ifacialmocap)来代替MediaPipe进行更高精度的面部动捕，这样也可以降低您电脑的动捕负载。

如果您想要提高您的动捕质量，我们有以下建议：

* 使用iPhone上的[iFacialMocap](./ifacialmocap)应用进行面部动捕，这是目前最好的家用面部动捕方案。如果您没有iPhone，请考虑购买一台二手iPhone，只要它支持Face ID即可使用此应用。

:::提示
为了更好的捕捉效果，我们推荐您使用iPhone 12或更新的iPhone型号（iPhone mini也可以），较早期的iPhone型号可能会影响捕捉效果。
:::
* 如果您对MediaPipe的手部捕捉感到不满意，请您考虑使用[Leap Motion Controller](./leap-motion)进行手部动捕。您可以使用一个[颈挂](https://www.etsy.com/market/leap_motion_mounting)以让它能够追踪手部动作。
* 如果您需要全身动捕方案，您可以考虑使用[Sony Mocopi](./mocopi)或者[VR trackers](./vmc.md)。如果您有足够预算，您也可以考虑购买动捕服装，例如[Virdyn VDSuit](./virdyn), [Noitom Perception Neuron](./noitom), [Rokoko Smartsuit Pro](./rokoko), 或者[Xsens MVN Link](./xsens-mvn)。您也可以使用[StretchSense gloves](./stretchsense)为其增加手部动捕功能。
* 如果您需要更专业的解决方案，您也可以使用光学捕捉系统，常见的方案有[Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)和 [青瞳](https://www.chingmu.com/)。

## 初始设置 {#setup}

在Warudo中有两种方法进行动捕初始设置。第一种推荐的方法是使用**开播助手**一步一步的进行。只需点击**Basic Setup → Get Started**开始开播流程，然后按指示做即可。

![](/doc-img/en-getting-started-2.png)
<p class="img-desc">在开播助手组件中设置动作捕捉</p>

在开播流程完毕后，您可以使用相关的动捕组件来客制化您的动捕效果。比如说，如果您正在使用iFacialMocap，您可能会注意到Warudo会在您移动头部时增加一些躯干动作。如果您不需要，可以在**iFacialMocap Receiver**组件中将**Body Movement Intensity**设置为0.

![](/doc-img/en-mocap-1.png)
<p class="img-desc">在iFacialMocap中调整Body Movement Intensity</p>

另一种设置动捕的方式是使用**Character → Setup Motion Capture**，这样能让您直接设置面部和身体的动捕。然而，一些开播流程中的检察环节会被跳过。

![](/doc-img/en-mocap-2.png)
<p class="img-desc">在角色模块中设置动捕</p>

这个方法在使用多个面部/身体动捕时非常方便，因为开播助手每进行一次新的开播时都会删除已有的动捕设置。

不论您使用哪种方法，Warudo都会在您的界面上生成对应的蓝图。比如说如果您使用iFacialMocap进行面部动捕，使用MediaPipe进行身体动捕，您会看到两张蓝图：**Face Tracking - iFacialMocap** 以及 **Pose Tracking - MediaPipe**，您可以编辑这些蓝图来定制化您的动捕效果。

:::注意
在几乎所有情况下您都不应该手工创建一个动捕模块（例如点击**Add Asset**然后选择一个动捕模块，例如**iFacialMocap Receiver**）这是因为动捕模块本身只能捕捉动作并输出捕捉结果，但它必须要使用蓝图才能与您想要使用的直播模型相关联。开播助手和**Setup Motion Capture**两种模块都能够自动为您创建需要的蓝图。
:::

## 常见问题 {#FAQ}

### 动啊模型，为什么不动！

如果您正在使用一个需要外部应用程序的动捕设备（如iFacialMocap），请确保该应用正在运行并在将动捕数据传输给Warudo。并且您需要检查您电脑的防火墙设置以防其阻止Warudo接收动捕数据；您可能需要暂时停用防火墙或者将Warudo列入白名单。

有些动捕接收器有**Port（接口）** 选项。请确保接口号码与第三方应用的接口号码对应。

### 我的模型动作太跳跃/太僵硬了。

请在动捕蓝图（例如**Face Tracking - iFacialMocap**）中找到**Smooth Rotation List** / **Smooth Position List** / **Smooth Transform** / **Smooth BlendShape List** 选项。增加**Smooth Time**可以让动捕轨迹更平滑，反之可以让模型响应更迅速。
