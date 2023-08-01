---
sidebar_position: 10
sidebar_label: 新手上路
---

# 新手上路

## 创建场景

话不多说，我们开始吧！要让你的 3D 模型动起来，我们需要配置 Warudo 的**场景**。场景的概念和 [OBS ](https://obsproject.com/)或者游戏引擎的场景有一点类似，可以理解为「一个可随时切换的配置文件」。

具体来说，Warudo 的场景由两部分组成：资源以及蓝图。

* **资源：一个资源就是一个「东西」**，比如一个角色、一个摄像机，一个动捕数据接收器等等。
* **蓝图：一个蓝图可以实现一个或多个「功能」**，比如「按 X 键切换到 Y 表情并切换到 Z 动作」、「收到 X 礼物时，让道具 Y 砸到角色的头上」等等。

Warudo 会默认打开最后一次打开的场景（没有场景的话会打开默认场景）。为了方便起见，我们创建一个新场景吧！

点击左下角「🚀」->「创建新场景」，输入场景名称，点「确定」就可以创建啦。

<figure><img src="/images/image(15).png" alt="" /><figcaption></figcaption></figure>

创建完毕后，资源列表应该是这样的：

<figure><img src="/images/image(22).png" alt="" /><figcaption></figcaption></figure>

## 加载角色

现在我们把模型加载到场景中。你的模型八成是 VRM 格式，所以我们来加载一个 VRM 文件看看吧。

<div className="hint hint-success">
Warudo 目前支持两种模型格式：`.vrm` 以及 `.warudo`。前者是使用 VRoid Studio 等软件制作的格式，后者是 Warudo 自创的格式，可以通过 [Warudo SDK](../modding/mod-sdk.md) 将 Unity 中**任意**配置好的模型 GameObject 导出为 `.warudo`。不过这是进阶话题啦！
</div>

首先，我们打开数据文件夹：

<figure><img src="/images/image(50).png" alt="" /><figcaption></figcaption></figure>

把 VRM 文件放到 Characters 文件夹里：

![](https://user-images.githubusercontent.com/3406505/180642642-a85ce0b2-a94b-4048-a29d-4938603977cf.png)

无需重启 Warudo，回到我们的配置界面，点击「角色（未激活）」选中角色资源，在「源」的下拉选单选择想加载的 VRM 即可。

<figure><img src="/images/image(38).png" alt="" /><figcaption></figcaption></figure>

应该就能见到模型加载到场景中了！

![](https://user-images.githubusercontent.com/3406505/180642701-579b5537-b26d-4f3f-a9f1-587d9e54e031.png)

## 场景基本操作

我们来欣赏一下刚刚加载好的模型吧。默认的摄像机模式是**「环绕角色」**，也就是摄像机会绕着角色转。你可以**鼠标左键或右键**来旋转视角，**鼠标滚轮**来拉远拉近，**鼠标中键**来平移视角。试下将摄像机移动到这个角度吧：

![](https://user-images.githubusercontent.com/3406505/180642804-34c04fc9-31c8-4e7e-a7f6-82b47fef42c1.png)

如果资源列表中「角色」还是选中状态的话，那么你会看到模型的脚下有一个可以用来移动模型的 Gizmo——使用方法也很直观，直接拖着移动就好了，像这样：

![](https://user-images.githubusercontent.com/3406505/180642868-854a6148-3820-4ff0-9f29-4360f9ff668b.png)

按 **E 键**可以切换到旋转 Gizmo（顺带一提，按 **W 键**可以切换回位移 Gizmo）：

![](https://user-images.githubusercontent.com/3406505/180642926-6d34ede0-4ca2-4ae7-ac1d-faa578425cea.png)

按 **R 键**可以切换到比例 Gizmo：

![](https://user-images.githubusercontent.com/3406505/180642936-078f2283-c470-4553-993e-2cebc455c0f1.png)

<div className="hint hint-success">
可以在主界面按 **G 键**随时开启 / 关闭主摄像机的 Gizmo。
</div>

然后你就可以把你的模型变成这个样子了：

![](https://user-images.githubusercontent.com/3406505/180642957-ae6454e5-531e-4b89-baa6-92a5ed3f114f.png)

……看起来不大妙！怎么复原呢？如果你有留意的话，你会发现配置界面**「变换」**里面的值会跟着你刚才的操作而改变。比如我现在的就是这个样子：

<figure><img src="/images/image(30).png" alt="" /><figcaption></figcaption></figure>

那么要回到初始状态，设置成默认值就好了！

<figure><img src="/images/image(37).png" alt="" /><figcaption></figcaption></figure>

摄像机除了可以绕着模型转以外，还可以切换成**「自由观察」**模式，直接在场景中穿梭飞行。选中摄像机资源，然后「控制模式」选择「自由观察」：

<figure><img src="/images/image(41).png" alt="" /><figcaption></figcaption></figure>

**鼠标右键**的状态下 **WASD** 键移动，**E** 键和 **Q** 键上升和下降，按住**左 Shift** 可以加速；**鼠标中键**可以平移视角。

习惯了两种摄像机操作模式后，我们回到「环绕角色」模式，然后点击**「重置摄像机变换」**让摄像机回到默认位置吧。

<figure><img src="/images/image(44).png" alt="" /><figcaption></figcaption></figure>

## 配置动作捕捉

那么，终于要让模型动起来了！我们先来看看 Warudo 内置都支持哪些动作捕捉方案吧。

#### 面部追踪方案：

* [**OpenSeeFace（Beta）**](../mocap/openseeface.md)：基于摄像头的面捕方案。可以捕捉基本 BlendShape，以及头部的旋转和移动。和 [VSeeFace ](https://www.vseeface.icu/)的面捕效果大致相仿。
* [**iFacialMocap**](../mocap/ifacialmocap.md)：基于苹果 ARKit 的面捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并购买 [iFacialMocap](https://apps.apple.com/cn/app/id1489470545) App（国区售价 40 元）。可以捕捉 52 个 ARKit BlendShape，以及头部的旋转和移动。<mark style={{color: "green"}}>**精度和可动性最佳。**</mark>
* [**RhyLive**](../mocap/rhylive.md)：基于苹果 ARKit 的面捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并下载 [RhyLive ](https://apps.apple.com/us/app/rhylive/)App（免费）。可以捕捉 52 个 ARKit BlendShape，以及头部的旋转和移动。<mark style={{color: "green"}}>**精度最佳。**</mark>
* [**VMC**](../mocap/vmc.md)：由外部程序发送 [VirtualMotionCapture 数据](https://protocol.vmc.info/english)到 Warudo。一般较少使用 VMC 发送面捕数据。
* [**Rokoko**](../mocap/rokoko.md)：由 [Rokoko Studio](https://www.rokoko.com/products/studio) 发送面捕数据到 Warudo。

#### 姿态追踪方案：

* [**MediaPipe（Beta）**](../mocap/mediapipe.md)：基于摄像头的上半身动捕方案。优点是可动范围较大，手部能够前后移动；反应更为及时，可以捕捉到快速甩手、挥拳等。缺点是初次配置和校正需要一点点时间，并且稳定性略有不足。<mark style={{color: "green"}}>**可动性最佳。**</mark>
* [**RhyLive**](../mocap/rhylive.md)：由[域动数字 RhythMo](https://rhythmo.cn/) 研发的上半身动捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并下载 [RhyLive ](https://apps.apple.com/us/app/rhylive/)App（免费）。缺点是长时间使用，设备会发热严重。
* [**VMC**](../mocap/vmc.md)：由外部程序发送 [VirtualMotionCapture 数据](https://protocol.vmc.info/english)到 Warudo。比如你想使用 VR 动捕（例如：SlimeVR、Mocopi 等），就可以使用 VirtualMotionCapture 软件，发送 VMC 数据给 Warudo。
* [**Xsens MVN**](../mocap/xsens-mvn.md)：由 [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US) 发送全身动捕数据到 Warudo。
* [**Rokoko**](../mocap/rokoko.md)：由 [Rokoko Studio](https://www.rokoko.com/products/studio) 发送全身动捕数据到 Warudo。



好了，我听到你在问了：_「那我应该选哪两个？！」_

——只要照着下面的步骤来选择就可以了！



* 我有一台 iPhone / iPad：
  * 我更在乎稳定性和易用性，或者我没有广角摄像头：[RhyLive](../mocap/rhylive.md) + [RhyLive](../mocap/rhylive.md)。
  * 我更在乎表现力，并且我有广角摄像头：[iFacialMocap ](../mocap/ifacialmocap.md)+ [MediaPipe](../mocap/mediapipe.md)。

<div className="hint hint-info">
你的模型师是否为模型适配了 ARKit 的 52 个面捕表情（又称「完美同步」）？基于 ARKit 面捕的表情要比 OpenSeeFace 灵动得多，可以极大提升模型的表现力。
</div>

* 我没有 iPhone / iPad：[OpenSeeFace](../mocap/openseeface.md) + [MediaPipe](../mocap/mediapipe.md)。

<div className="hint hint-info">
如果你没有 iOS 设备的话，可以考虑入手一台二手的 iPhone X。这是最便宜又支持面容 ID 的 iOS 设备。
</div>

* 我想使用第三方软件的动作捕捉数据（VR 等）：[VMC ](../mocap/vmc.md)+ [VMC](../mocap/vmc.md)。

<div className="hint hint-success">
除了家用 VR 设备以外，许多动捕设备都有第一方或第三方的 VMC 支持，例如 [Mocopi](https://www.sony.jp/mocopi/)、[Perception Neuron](https://github.com/emilianavt/VSeeFaceManual#perception-neuron-tracking)、[Rokoko](https://twitter.com/Kana\_Fuyuko/status/1521809776354680832)，所以都可以接入 Warudo。
</div>

<div className="hint hint-success">
除了家用动作捕捉方案以外，Warudo 还支持众多[专业动作捕捉设备](/docs/tutorials/mocap/body-tracking)。
</div>



因为是教程嘛，**我们这里就以 RhyLive + RhyLive 作为例子，**但你可以到[这个页面](/docs/tutorials/mocap/body-tracking)查看其它动捕方案的详细介绍、属性介绍和配置技巧。

选中角色资源，点击「动作捕捉」->「配置动作捕捉」：

<figure><img src="/images/image(39).png" alt="" /><figcaption></figcaption></figure>

「面部追踪模板」选择 RhyLive。下面会有选项询问想要使用哪种 BlendShape 映射；绝大多数情况下使用默认自动选择即可。

<figure><img src="/images/image(23).png" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-success">
<mark style={{color: "green"}}>**科普小时间！**</mark>BlendShape 是什么？一个 BlendShape 是模型网格上若干个顶点的位移，像下面这样：

<img src="https://user-images.githubusercontent.com/3406505/180678152-daf3ff76-1ab8-4add-b0c9-b28d0676fec3.gif" alt="来源：https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/" data-size="original" />

一个 BlendShape 的值在 0 到 1 之间。值为 0 时，顶点不移动；值为 1 时，顶点移动到目标位置，如下所示：

<img src="https://user-images.githubusercontent.com/3406505/180681379-b20131f0-fe20-4368-b9e9-c45042b2491f.gif" alt="注意，Unity 中 BlendShape 的取值范围是 0-100，但在 Warudo（以及大多数 3D 工具）中 BlendShape 的取值范围都是 0-1。来源：https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/" data-size="original" />

一个模型上有什么 BlendShape 完全根据模型师（和制作工具）而定。以下列出一些常见的 BlendShape 列表（仅供参考，你的模型可以有更多 / 更少 BlendShape）：

<details>

<summary>VRoid Studio 制作的模型</summary>

* Fcl\_ALL\_Neutral
* Fcl\_ALL\_Angry
* Fcl\_ALL\_Fun
* Fcl\_ALL\_Joy
* Fcl\_ALL\_Sorrow
* Fcl\_ALL\_Surprised
* Fcl\_BRW\_Angry
* Fcl\_BRW\_Fun
* Fcl\_BRW\_Joy
* Fcl\_BRW\_Sorrow
* Fcl\_BRW\_Surprised
* Fcl\_EYE\_Natural
* Fcl\_EYE\_Angry
* Fcl\_EYE\_Close
* Fcl\_EYE\_Close\_R
* Fcl\_EYE\_Close\_L
* Fcl\_EYE\_Fun
* Fcl\_EYE\_Joy
* Fcl\_EYE\_Joy\_R
* Fcl\_EYE\_Joy\_L
* Fcl\_EYE\_Sorrow
* Fcl\_EYE\_Surprised
* Fcl\_EYE\_Spread
* Fcl\_EYE\_Iris\_Hide
* Fcl\_EYE\_Highlight\_Hide
* Fcl\_MTH\_Close
* Fcl\_MTH\_Up
* Fcl\_MTH\_Down
* Fcl\_MTH\_Angry
* Fcl\_MTH\_Small
* Fcl\_MTH\_Large
* Fcl\_MTH\_Neutral
* Fcl\_MTH\_Fun
* Fcl\_MTH\_Joy
* Fcl\_MTH\_Sorrow
* Fcl\_MTH\_Surprised
* Fcl\_MTH\_SkinFung
* Fcl\_MTH\_SkinFung\_R
* Fcl\_MTH\_SkinFung\_L
* Fcl\_MTH\_A
* Fcl\_MTH\_I
* Fcl\_MTH\_U
* Fcl\_MTH\_E
* Fcl\_MTH\_O
* Fcl\_HA\_Hide
* Fcl\_HA\_Fung1
* Fcl\_HA\_Fung1\_Low
* Fcl\_HA\_Fung1\_Up
* Fcl\_HA\_Fung2
* Fcl\_HA\_Fung2\_Low
* Fcl\_HA\_Fung2\_Up
* Fcl\_HA\_Fung3
* Fcl\_HA\_Fung3\_Up
* Fcl\_HA\_Fung3\_Low
* Fcl\_HA\_Short
* Fcl\_HA\_Short\_Up
* Fcl\_HA\_Short\_Low

</details>

<details>

<summary>MMD 模型</summary>

* 真面目
* 困る
* にこり
* 怒り
* 上
* 下
* まばたき
* 笑い
* ウィンク
* ウィンク２
* ウィンク右
* ｳｨﾝｸ２右
* はぅ
* なごみ
* びっくり
* じと目
* なぬ！
* 瞳小
* 瞳縦
* 瞳縦潰れ
* びっくり
* への字
* 恐ろしい子！
* カメラ目
* はちゅ目
* 星目
* はぁと
* 涙
* 猫目
* 瞳全消し
* あ
* い
* う
* お
* ▲
* ∧
* ω
* ω□
* はんっ！
* ぺろっ
* えー
* にやり
* ぎゃーす
* がーん
* ギギギ,
* あ２
* ああ
* いい
* おお
* 青ざめ
* д
* 八重歯左
* 八重歯右
* ワ
* 口角上げ
* 口角下げ
* 口横広げ
* 口横狭め
* 頬染め
* 照れ
* 赤面

</details>

<details>

<summary>适配了 ARKit BlendShape（「完美同步」）的模型</summary>

* eyeBlinkLeft
* eyeLookDownLeft
* eyeLookInLeft
* eyeLookOutLeft
* eyeLookUpLeft
* eyeSquintLeft
* eyeWideLeft
* eyeBlinkRight
* eyeLookDownRight
* eyeLookInRight
* eyeLookOutRight
* eyeLookUpRight
* eyeSquintRight
* eyeWideRight
* jawForward
* jawLeft
* jawRight
* jawOpen
* mouthClose
* mouthFunnel
* mouthPucker
* mouthLeft
* mouthRight
* mouthSmileLeft
* mouthSmileRight
* mouthFrownLeft
* mouthFrownRight
* mouthDimpleLeft
* mouthDimpleRight
* mouthStretchLeft
* mouthStretchRight
* mouthRollLower
* mouthRollUpper
* mouthShrugLower
* mouthShrugUpper
* mouthPressLeft
* mouthPressRight
* mouthLowerDownLeft
* mouthLowerDownRight
* mouthUpperUpLeft
* mouthUpperUpRight
* browDownLeft
* browDownRight
* browInnerUp
* browOuterUpLeft
* browOuterUpRight
* cheekPuff
* cheekSquintLeft
* cheekSquintRight
* noseSneerLeft
* noseSneerRight
* tongueOut

</details>

BlendShape 映射的意思就是「面捕参数应该怎么应用到模型的 BlendShape 上」，所以需要选择模型上有什么 BlendShape。
</div>

<div className="hint hint-warning">
你可能听过别人把 BlendShape 称作「表情」。不过，在 Warudo 中，表情是角色若干个 BlendShape 的状态。比如，图中下方的哭哭表情是五个 BlendShape 的特定值组合而成：

<img src="https://user-images.githubusercontent.com/3406505/180906274-f7fcb77b-bb25-4bff-a924-66a9f7a02cc9.png" alt="" data-size="original" />
为了避免混淆，我们下文一律用 BlendShape 和表情来称呼两者。
</div>

同样，「姿态追踪模板」选择 RhyLive。

<figure><img src="/images/image(29).png" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-info">
开启「使用键盘」和「使用触控板」的话，在不捕捉到手部的时候，会实时生成模型使用键盘和鼠标的动画：

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/209600556-6f0a33a2-ea4f-4f73-a8ce-0de691cb9e5d.mp4" />
</div>

点击确定后，应该可以看到成功信息：

<figure><img src="/images/image(25).png" alt="" /><figcaption></figcaption></figure>

资源列表中多出来了「RhyLive 接收器」，用来接收 RhyLive App 发送的动捕数据：

<figure><img src="/images/image(4)(4).png" alt="" /><figcaption></figcaption></figure>

蓝图列表中也多出来了两个蓝图：

<figure><img src="/images/image(6)(3).png" alt="" /><figcaption></figcaption></figure>
</div>

<div className="hint hint-info">
Warudo 的蓝图是非常强大的功能，不过，刚上手 Warudo 的话，不需要接触蓝图也可以配置出很棒的效果！建议熟悉 Warudo 其他功能后，再阅读[蓝图教程](/docs/mocap/blueprints/overview)。
</div>

iOS 设备上打开 RhyLive，左上角点击菜单图标进入设置界面。电脑和手机用的是同一个 WiFi 的话，就在 「IP」处输入电脑 IP，然后开启「无线」开关；或者也可以把设备用 USB 连上电脑，然后开启「有线」开关（需要安装 [iTunes](https://www.apple.com/itunes/)）。

![](</images/image(8).png>)

<div className="hint hint-info">
如果不知道电脑的 IP，可以在「RhyLive 接收器」的配置页面查看：

<img src="/images/image(26).png" alt="" data-size="original" />

如果列出多个 IP，则需要一个一个尝试。通常来说，你的 WiFi 路由器分配给你电脑的 IP 是以 192.168. 开头的，所以以上图为例，可以先尝试 192.168.1.2。
</div>

<div className="hint hint-info">
如果你使用「有线」选项，你必须在打开 Warudo 之前，在 iPhone 打开 RhyLive，并通过 USB 线连接到电脑。
</div>

<div className="hint hint-success">
如果希望模型更可动，可以把「锁定弯腰」的选项关掉——Warudo 没有 RhyLive 里面模型常年弯腰的问题，所以可以放心关掉。
</div>

应该就能看到模型动起来啦！

![image](https://user-images.githubusercontent.com/3406505/180644072-a641eeb2-f759-4741-a303-61114ea03d65.png)

<div className="hint hint-info">
如果模型的姿势看起来不太对，请选中「RhyLive 接收器」，点击「校正」进行校正。
</div>

## 配置表情

模型的上半身动起来了，闭眼和嘴巴开合应该也能捕捉到了，接下来就该配置表情了！

在角色资源页往下滚，就可以见到表情相关的配置。点击「导入 VRM 表情」：

<figure><img src="/images/image(27).png" alt="" /><figcaption></figcaption></figure>

没有问题的话，就能看到表情导入成功：

<figure><img src="/images/image(17).png" alt="" /><figcaption></figcaption></figure>

你可以展开并且详细配置每个表情，比如切换到该表情时，是否应该禁用眨眼追踪：

<figure><img src="/images/image(7).png" alt="" /><figcaption></figcaption></figure>

不过，表情是导入进来了，我们要怎么触发它们呢？点击「生成按键绑定蓝图」就好啦：

<figure><img src="/images/image(31).png" alt="" /><figcaption></figcaption></figure>

<figure><img src="/images/image(24).png" alt="" /><figcaption></figcaption></figure>

注意到蓝图列表中多出来一个叫「表情按键绑定」的蓝图：

<figure><img src="/images/image(1)(4).png" alt="" /><figcaption></figcaption></figure>

按 Alt+1、Alt+2、Alt+3…… 如此类推，就可以切换表情啦！按下 Alt+Backspace 即可重置表情。

![哭哭脸。](https://user-images.githubusercontent.com/3406505/180644979-948d601f-b48f-49de-b672-91c03d28b18c.png)

## 切换待机动画

最后，我们给模型换个姿势吧。往下滚可以看到「待机动画」：

<figure><img src="/images/image(35).png" alt="" /><figcaption></figcaption></figure>

Warudo 内置超过 500 个待机动画（可以到[这里](../misc/idle-animations.md)查看），我们选择一个猫猫手吧：

<figure><img src="/images/image(34).png" alt="" /><figcaption></figcaption></figure>

然后就是这样的效果啦！

<figure><img src="/images/image(28).png" alt="" /><figcaption></figcaption></figure>

最棒的是，动捕可以如常运作哦！举起手让 RhyLive 捕捉到时，就会淡入到捕捉到的姿势；放下手时，就会淡出到待机动画的姿势，像下面这样：

<figure><img src="/images/image(45).png" alt="" /><figcaption></figcaption></figure>

## 小结

到这里，你已经使用 Warudo 让模型动起来，而且学会了怎样切换表情和待机动画！不过，这只是 Warudo 功能的冰山一角……

<div className="hint hint-info">
记得用「🚀」->「保存场景」时不时保存一下场景！
</div>
