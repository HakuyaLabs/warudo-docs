---
sidebar_position: 10
---


# 新手上路

## 基本设置

首先, 当你打开 Warudo 时, 你应该能看到两个窗口: 分别是 **主窗口** 和 **编辑器窗口**.

![](/doc-img/en-getting-started-1.png)
<p class="img-desc">主窗口</p>

![](/doc-img/zh-doc-img/zh-getting-started-2.png)
<p class="img-desc">编辑器窗口</p>

编辑器用于配置你的角色、环境等，然后配置好的东西会在主窗口运行。你可以随时关闭编辑器窗口，如果要重新打开配置窗口，切换到主窗口，然后按 **ESC** 即可重新启动编辑器。

让我们再深入一些，点击 **基本配置 → 开始配置**.

![](/doc-img/zh-doc-img/zh-getting-started-3.png)
<p class="img-desc">基本配置窗口</p>

点击 **打开角色文件夹**，这时会弹出资源管理器，并打开名为 "Characters" 的文件夹。这就是存放角色模型的位置。

Warudo 支持两种模型格式，分别是: `.vrm` 和 `.warudo`. 前者是 [VRoid Studio](https://vroid.com/en/studio) 之类的程序导出的标准 Avatar(化身) 格式，而后者是 Warudo 自己专用的格式，并且几乎支持任意兼容 Unity 的角色模型 ([详细信息](../modding/character-mod.md))。 现在，让我们把一个 `.vrm` 文件放在 "Characters" 文件夹里。

:::info
**Q:** Warudo 是否支持 `.vsfavatar` 模型?

**A:** 不, Warudo 不支持 `.vsfavatar` 模型。 但是，如果你可以使用创建 `.vsfavatar` 模型的源文件，那么创建 `.warudo` 模型也非常简单; 因为 `.vsfavatar` 和 `.warudo` 都是由 Unity 导出的。请参考 [“Mod制作指南”](../modding/character-mod.md) 了解更多详情。
:::

现在，回到 Warudo 的编辑器窗口，展开下拉菜单。你应该能在列表中看到你角色的名字，选择它，你的角色就会被加载到场景中了!

![](/doc-img/en-getting-started-4.png)
<p class="img-desc">角色被加载到场景中</p>

选择角色后，点击右下角 **确定** 继续下一步（如果没看到 **确定** 按钮，鼠标滚轮往下滚一下）。 在这里，系统会询问你是否希望 Warudo 为你推荐运动捕捉设置。<br/>
**如果选择“是”** ，Warudo 会问你几个问题，以决定使用什么样的面部捕捉和动作捕捉方案。<br/>
**举个例子**，假如你有一部 iPhone 和一个 WebCam(网络摄像头)，但是你没有“Leap Motion 控制器”或全身追踪硬件，Warudo 会建议你使用 [iFacialMocap](../mocap/ifacialmocap.md)（一个 iPhone 应用程序）进行面部捕捉，以及推荐使用 [MediaPipe](../mocap/mediapipe.md)（内置方案，使用你的WebCam进行追踪）进行手部追踪。<br/>
**如果选择“否”**，那么你需要自己手动选择要使用的面部捕捉和动作捕捉方案。

如果您是首次使用，我们建议您选择“是”，让 Warudo 为你推荐运动捕捉设置。点击 **确定**，接着根据你的情况进行选择, 然后再次点击 **确定** 。

![](/doc-img/zh-doc-img/zh-getting-started-5.png)
<p class="img-desc">配置动作捕捉</p>

![](/doc-img/zh-doc-img/zh-getting-started-6.png)
<p class="img-desc">回答几个问题</p>

在下一个页面中，你需要对 Warudo 为你选择的面部捕捉和动作捕捉方案进行确认。

![](/doc-img/zh-doc-img/zh-getting-started-7.png)
![](/doc-img/zh-doc-img/zh-getting-started-8.png)
<p class="img-desc">确认动作捕捉设置</p>

:::tip
如果你要设置一个辅助跟踪系统，可以使用 **次要姿态追踪** 选项。这可以让你在使用 VR 跟踪器/Mocopi 进行主要跟踪的同时，额外使用 [MediaPipe](../mocap/mediapipe.md) 或 [Leap Motion 控制器](../mocap/leap-motion.md) 或 [StretchSense 手套](../mocap/stretchsense.md) 进行另外的手部追踪。
:::

点击 **确定** 进入下一步。 如果你的模型有表情，Warudo可以帮助你导入这些表情并为它们分配快捷键。选择 **导入表情** 并点击 **确定**。

![](/doc-img/zh-doc-img/zh-getting-started-9.png)
<p class="img-desc">导入表情</p>

将会弹出一个窗口，其中显示了刚刚导入的表情以及自动分配的快捷键。当然，你可以在之后自行更改快捷键。先点击 **确认** 继续。

![](/doc-img/zh-doc-img/zh-getting-started-10.png)
<p class="img-desc">确认表情快捷键</p>

最后，系统会让你为 Vtubing 场景选择背景。你可以使用透明背景或者默认的天空盒，但 Warudo 带有一些不错的背景供你使用（这些3D背景被称为**环境**）。这里我们设置为 **选择并应用环境** ，并选择 **VR Room** 环境，但后单击 **确定** 完成设置。

![](/doc-img/zh-doc-img/zh-getting-started-11.png)
<p class="img-desc">选择一个环境</p>

你的主窗口现在应该像下面这样：

![](/doc-img/en-getting-started-12.png)
<p class="img-desc">设置后的场景</p>

如果你连接好了面部捕捉/动作捕捉的软硬件——比如我在 iPhone 上打开了iFacialMocap 应用程序——那么现在你应该可以看到你的角色可以动起来了。

![](/doc-img/en-getting-started-13.png)
<p class="img-desc">运动中的角色</p>

接下来让我们继续学习一些基本控件。

## 场景控件

让我们来看看要如何观察你的角色模型，默认情况下，场景摄像机设置为 **环绕角色** 模式，这意味着摄像机始终围绕角色旋转。你可以使用**鼠标 LMB/RMB(左/右键)** 旋转视图，滚动 **鼠标滚轮** 进行缩放，或者使用 **鼠标 MMB(按下滚轮)** 旋转视图。现在你可以试着将视角调整到下图的视角：


![](/doc-img/en-getting-started-14.png)
<p class="img-desc">相机围绕角色旋转</p>

现在让我们来学习如何移动角色，切换到编辑器窗口，在左侧列表的**角色**下拉列表中找到你的角色，点击选中你的角色资源。

![](/doc-img/zh-doc-img/zh-getting-started-15.png)
<p class="img-desc">选择角色资源</p>

可以用来移动模型。
你应该会在模型的脚下看到一个 **平移 Gizmo**，拖拽 Gizmo 的箭头即可沿着箭头的轴向移动，箭头的根部有三个方形，拖拽其中两个箭头夹角内的方形，可以在着两个箭头所在的平面上自由移动。这里我将模型移动到了床边：

![](/doc-img/en-getting-started-16.png)
<p class="img-desc">Move the model.</p>

:::tip
没看到 Gizomo ？试试使用 **鼠标中键** 平移视图找找。
:::

你可以按 **E** 键切换到 **旋转 Gizmo** （想切换回 移动 Gizmo？按下 **W** 键即可）。来试着旋转模型看看。

![](/doc-img/en-getting-started-17.png)
<p class="img-desc">旋转模型</p>

按 **R** 键切换到 **缩放 Gizmo**。虽然一般不会对角色进行缩放。但是为了好玩，你当然可以随心所欲地调整比例。

![](/doc-img/en-getting-started-18.png)
<p class="img-desc">缩放模型</p>

现在的比例变得不正常了。那么要怎么恢复正常比例呢？如果你有仔细观察，你可能已经注意到，当你操作 Gizmo 时，编辑器中的 **变换** 参数会随之改变。例如，以下是我现在的样子：

![](/doc-img/zh-doc-img/zh-getting-started-19.png)
<p class="img-desc">变换值</p>

想要回到初始比例，只需要将 **缩放比率** 设置为 **1**，或者将鼠标悬停在缩放比率这几个字上，然后点击 **重置** 按钮:

![](/doc-img/zh-doc-img/zh-getting-started-20.png)
<p class="img-desc">重置比例</p>

现在好多了

![](/doc-img/en-getting-started-21.png)
<p class="img-desc">恢复正常</p>

:::tip
除了使用快捷键，你也可以在编辑器中切换不同的 Gizmo。

![](/doc-img/zh-doc-img/zh-getting-started-66.png)
:::

除了环绕角色以外，相机还可以切换到自由观察模式，允许相机在场景中飞行。在编辑器左侧列表中，选中 **摄像机** 资源，然后将 **控制模式** 切换为 **自由观察**。

![](/doc-img/zh-doc-img/zh-getting-started-22.png)
<p class="img-desc">切换为自由观察模式</p>

按住 **鼠标右键** 的时，可以像第一人称游戏一样转动视角，保持 **按住右键**，可以使用 **WASD** 进行移动，**E**、**Q** 分别控制上下移动，按住 **左 Shift** 可以更快地进行移动。按住 **鼠标中键** 拖拽可以直接平移视图。

现在你应该对两种摄像机模式都有了一定了解。切换回 **环绕角色** 模式，然后点击 **重置相机变换** 将摄像机还原到它的默认位置。

:::tip
你可以按 **V** 键在 **环绕角色** 和 **自由观察** 模式之间切换。
:::

![](/doc-img/zh-doc-img/zh-getting-started-24.png)
<p class="img-desc">重置相机变换</p>

![](/doc-img/en-getting-started-23.png)
<p class="img-desc">回到默认相机位置</p>

## 资源选项卡

现在你对如何移动角色和相机有了一些基本概念，让我们来看看编辑器吧！

默认情况下，你会处于 **资源** 选项卡。**资源(或者叫做资产)** 实际上就是“场景中”的任何东西，比如角色、摄像机、道具、动作捕捉跟踪器等。

你可以单击资源将其选中，比如，单击 **平行光源** 资源选中它，然后调整它的颜色。


![](/doc-img/zh-doc-img/zh-getting-started-25.png)
<p class="img-desc">选择平行光源并调整其颜色</p>

啊哈!

![](/doc-img/en-getting-started-26.png)
<p class="img-desc">灯光颜色设置为红色</p>

动作捕捉跟踪器也是一种资源。例如，由于我选择了 **iFacialMocap** 作为我的面部跟踪解决方案，因此我的场景中有一个 **iFacialMocap 接收器** 的资源。我可以单击它以选择它，然后单击 **校准** 按钮来校准我的面部跟踪：

![](/doc-img/zh-doc-img/zh-getting-started-27.png)
<p class="img-desc">校准 iFacialMocap</p>

既然在这个界面了，何不试试添加新的资源？点击下方的加号 **添加资源** 并选择 **道具**：

![](/doc-img/zh-doc-img/zh-getting-started-28.png)
<p class="img-desc">添加资源</p>

![](/doc-img/zh-doc-img/zh-getting-started-29.png)
<p class="img-desc">选择“道具”</p>

道具资源被添加到了场景中，但我们还没有选择模型。单击 **源** 下拉菜单旁边的 **图片预览模式**按钮：

![](/doc-img/zh-doc-img/zh-getting-started-30.png)
<p class="img-desc">图片预览模式</p>

选择这个 **麦克风** 道具。然后，点击右上角的 **X** 关闭预览库（或者预览窗口外的任意位置）：

![](/doc-img/zh-doc-img/zh-getting-started-31.png)
<p class="img-desc">选择麦克风道具</p>

你可能没法在场景中找到麦克风。调整一下视角，你或许可以在地底下找到它。

![](/doc-img/en-getting-started-32.png)
<p class="img-desc">啊哦:(</p>

这显然不是我们想要的，我们希望的是麦克风被握在手上。在 **变换绑定** 栏中，展开 **绑定到** 下拉菜单，然后选择 **角色**。

![](/doc-img/zh-doc-img/zh-getting-started-33.png)
<p class="img-desc">绑定到角色</p>

现在麦克风就被附着在了角色的手上。你可以拖拽 Gizmo 来调整附件的位置：

![](/doc-img/en-getting-started-34.png)
<p class="img-desc">附着到角色手上的麦克风</p>

![](/doc-img/en-getting-started-35.png)
<p class="img-desc">调整附件的位置</p>

如果你设置了全身捕捉或手部捕捉，那么在你活动时，你应该可以看到麦克风会跟着手部运动。

![](/doc-img/en-getting-started-36.png)
<p class="img-desc">麦克风跟随手部运动</p>

如你所见，每种类型的资源都有许多设置选项。比如，你可以更改 **绑定骨骼** 将麦克风附着在角色的左手，或者更改 **覆盖手势** 让角色用不同的手势握住麦克风。

![](/doc-img/zh-doc-img/zh-getting-started-37.png)
<p class="img-desc">调整道具的设置选项</p>

角色资源同样也有丰富的可调整选项。举个例子，我们的角色已经在床边站了一段时间了，现在让他坐在床上吧。在编辑器左侧选中 **角色** 资源，然后点击 **待机动画** 下拉菜单旁边的 **图片预览模式** 按钮：

![](/doc-img/zh-doc-img/zh-getting-started-42.png)
<p class="img-desc">选择角色待机动画</p>

![](/doc-img/zh-doc-img/zh-getting-started-41.png)
<p class="img-desc">选择 “坐 (女性)” 待机动画</p>

呼~

![](/doc-img/en-getting-started-43.png)
<p class="img-desc">坐在床上的角色</p>

更棒的是，**Warudo 的动作捕捉功能与待机动画无缝融合**！例如，如果你举起手，角色会在跟着你举手的同时保持坐姿。

![](/doc-img/en-getting-started-55.png)
<p class="img-desc">角色举手并保持坐姿</p>


:::info
**Q:** 救命！Warudo 的选项太多了，我不知道它们是干什么的!

**A:** 也许你现在会感到手足无措，但是别担心，你不需要了解所有的东西。很多选项是面向进阶用户或开发者的，那些东西对普通用户的日常使用来说不是必须的。

如果你是 Warudo 的初学者，可以试着调整一下这些选项，看看它们有什么用。参数调乱了也不用担心，你可以将鼠标悬停在选项的文字上，然后点击旁边浮现的 **重置** 按钮，将选项恢复为默认值。本手册在后续部分会通过示例详细探讨每种类型的资源及其选项。
:::

最后，让我们添加一个 **屏幕** 资源。点击 **添加资源** 然后选择 **屏幕**：

![](/doc-img/zh-doc-img/zh-getting-started-38.png)
<p class="img-desc">添加屏幕资源</p>

屏幕资源用于显示图像和视频，但它可以像 OBS Studio 一样捕获你的 窗口/监视器，在下面的图片示例中，我将 **显示内容(Content Type)** 选项设置为了 **窗口**，将下面的 **窗口(window)** 选项设置为了 Warudo Editor，并将屏幕移动到了角色后面。

![](/doc-img/en-getting-started-39.png)
<p class="img-desc">屏幕使用示例</p>

:::tip
如果屏幕太亮，你可以将**色调**设置为更暗的灰色，使屏幕亮度降低
:::

## 蓝图选项卡

现在你已经熟悉了一下资产，现在让我们来看看 **蓝图** 选项卡。单击 **∑** 图标，切换到蓝图选项卡。

![](/doc-img/zh-doc-img/zh-getting-started-40.png)
<p class="img-desc">切换至蓝图选项卡</p>

但是，蓝图是什么？从本质上来讲，蓝图在描述“当满足某条件时，应该发生某些事”。比如，“当我按下 **空格键** 时，角色应该挥手”。或者，“当我收到 Twitch 礼物时，应该向我的角色扔一个道具”。

我们的场景中已经有了一些蓝图。比如 **表情按键绑定** 蓝图，这个蓝图用于实现表情快捷键的功能。让我们单击选中它。

![](/doc-img/zh-doc-img/zh-getting-started-44.png)
<p class="img-desc">选择表情按键绑定蓝图</p>

你可以使用 **鼠标滚轮** 进行缩放，使用 **鼠标左键** 拖拽视图。试着调整视图，直至看到这两个节点。

![](/doc-img/zh-doc-img/zh-getting-started-45.png)
<p class="img-desc">缩放与平移视图</p>

这两个节点描述的是：“当按下 **Alt+1** 时，角色资源的 **角色1** 应该将表情切换为 **Joy**。”来试试看吧，按下 **Alt+1**（这里使用键盘上方的数字区），你应该会看到你的角色的表情切换为了 **Joy**。

![](/doc-img/en-getting-started-46.png)
<p class="img-desc">角色表情切换为 Joy</p>

同理，下面两个节点描述的是：“当按下 **Alt+退格** 时，角色资产 **角色1** 应当淡出所有表情”。来按下 **Alt+退格** 试试吧。

![](/doc-img/zh-doc-img/zh-getting-started-47.png)
<p class="img-desc">淡出所有表情</p>

让我们回到触发 **Joy** 表情的两个节点。你可以通过更改 **按键** 选项和下方其他选项来修改快捷键。如下图，我将快捷键修改为了 **Ctrl+Shift+Q** 。


![](/doc-img/zh-doc-img/zh-getting-started-48.png)
<p class="img-desc">更改快捷键</p>

你可以让快捷键同时触发更多功能。比如让它同时播放音效如何？在搜索栏中输入 **播放音效** ，然后将 **播放音效** 节点拖动到 **切换角色表情** 节点的右侧。

![](/doc-img/zh-doc-img/zh-getting-started-49.png)
<p class="img-desc">找到“播放音效”节点</p>

点击并拖动 **切换角色表情** 节点的 **出口** 右边的绿点，将其拖动到 **播放音效** 节点的 **入口** 旁边的绿点上。

![](/doc-img/zh-doc-img/zh-getting-started-50.png)
<p class="img-desc">连接“切换角色表情”与“播放音效”节点</p>

这样两个节点就可以被连接在一起。现在，单击 **源** 下拉菜单，并选择你想要的音效。这里我选择了 **Punch Light 01** 音效。

![](/doc-img/zh-doc-img/zh-getting-started-51.png)
<p class="img-desc">选择音效</p>

:::tip
你可以点击 **打开音效文件夹** 按钮，在文件夹中放入你自己的音效。
:::

现在，当你按下 **Ctrl+Shift+Q**（或你指定的快捷键）时，你的角色会切换到 **Joy** 表情并播放设定好的音效。

让我们来创建一些新东西。比如，当我们按下 **空格** 时，使角色播放表情动画。在编辑器中，将视图移动到空白区域，尝试自己添加下图所示的节点并将它们连接在一起。在 **角色** 下拉菜单中选择角色资源，然后将 **动画** 选项设置为 **活力** 。

![](/doc-img/zh-doc-img/zh-getting-started-52.png)
<p class="img-desc">添加节点以播放表情动画</p>

如果你的角色当前是坐着的状态，为了仅在上半身播放，你可能需要遮罩动画。为此，请将 **播放角色单次动画** 节点上的 **遮罩** 设置为 **是** ，并点击 **遮罩上半身** 按钮。

![](/doc-img/zh-doc-img/zh-getting-started-53.png)
<p class="img-desc">将动画遮罩设置为遮罩上半身</p>

现在，当你按下 **空格** 时，你的角色会播放 **活力** 的表情动画。

![](/doc-img/en-getting-started-54.png)
<p class="img-desc">角色播放 “活力” 表情动画</p>

以上就是我们对蓝图的简单介绍。希望它可以让你了解蓝图功能。蓝图是一个非常强大的功能，但即使根本部接触它，你仍然可以使用 Warudo 做很多事。一旦你实习了其他功能，我们建议您阅读[蓝图使用说明](/docs/blueprints/overview)以了解有关蓝图的更多信息。

:::tip
你可以通过拖动 **鼠标右键** 绘制选择框来选择多个节点。如果要删除节点，请选中节点并按 **Delete** 进行删除。
:::

:::info
你可能已经注意到有一个面部跟踪蓝图和一个姿态跟踪蓝图。这些蓝图是根据你在新手向导中的设置自动生成的，可以根据你的喜好进行定制。但对于初学者来说，它们可能看起来很吓人，所以我们建议暂时不要管它。
:::

## 互动配置 {#interaction-setup}

如果无法和观众互动，那么 3D 直播就毫无乐趣。Warudo 提供了丰富的交互功能，但最快的入门方法就是使用我们的新手向导。在左侧的资源选项卡中选择 **新手向导** 资源，然后点击 **互动配置** → **开始配置** 。

![](/doc-img/zh-doc-img/zh-getting-started-58.png)
<p class="img-desc">互动配置</p>

你会被要求选择一个流媒体平台。

![](/doc-img/zh-doc-img/zh-getting-started-59.png)
<p class="img-desc">选择一个流媒体平台</p>

根据引导进行自动化设置。例如，在下面，我将 **发射液体** 交互设置为：收到含有“喷水”的弹幕时触发。

![](/doc-img/zh-doc-img/zh-getting-started-60.png)
<p class="img-desc">设置互动效果</p>

配置完成后，你可以看到新的蓝图被添加到了蓝图选项卡。还记得之前说的吗？蓝图就是在描述“当满足某条件时，应该发生某些事”。在这种情况下，蓝图应该包含着【当我们收到含有“喷水”的弹幕时向角色发射液体】的逻辑。单击蓝图将其选中，然后找到 **向角色发射液体** 节点。

![](/doc-img/zh-doc-img/zh-getting-started-61.png)
<p class="img-desc">生成了新的蓝图</p>

![](/doc-img/zh-doc-img/zh-getting-started-62.png)
<p class="img-desc">找到“向角色发射液体”节点</p>

上面的节点本质上描述的是：“当直播间收到弹幕，且弹幕内包含[喷水]时，向角色发射液体”。你可以单击 **向角色发射液体** 节点上的 “入口” 按钮进行测试。

![](/doc-img/en-getting-started-63.png)
<p class="img-desc">测试交互</p>

![](/doc-img/en-getting-started-64.png)
<p class="img-desc">测试成功</p>

## 输出到 OBS Studio / Streamlabs

是时候将 Warudo 的画面输出到你使用的流媒体软件了！有四种方式可以实现：

* **虚拟摄像头输出:** Warudo 可以作为虚拟摄像头画面进行输出。这个功能对于在 [VDO.Ninja](https://vdo.ninja/) 上进行合作直播或者在 Discord/Zoom 上使用 VTubing Avatar 时非常有用。如果要使用这种方式，请转到 **设置** → **通用** → **输出** ，将 **虚拟摄像头输出** 设置为 **是** 。

* **NDI 输出：** Warudo 可以作为 [NDI](https://ndi.video/) 源进行输出。 如果要使用这种方式，请转到 **设置** → **通用** → **输出** ，将 **NDI 输出** 设置为 **是** 。

* **Spout 输出：** Warudo 可以作为 [Spout](https://spout.zeal.co/) 源进行输出。 如果要使用这种方式，请转到 **设置** → **通用** → **输出** ，将 **Spout 输出** 设置为 **是** 。**默认启用该功能**。

* **窗口/游戏捕获：** 你还可以使用  OBS Studio 或 Streamlabs 的**窗口/游戏捕获**来捕获 Warudo 窗口。但我们不推荐这种方法，因为这种方法相比其他方法会占用更多的 CPU/GPU 资源。

我们建议采用 **Spout 输出** 方式，因为它具有零延迟和最佳性能。此外，它隐藏了 Gizmo ，因此你在直播的时候调整角色或道具时，观众看不到 Gizmo。要设置为 Spout 输出，请按照下列步骤操作：

* **OBS Studio：** 先安装 [**OBS Studio 的 Spout2 插件**](https://github.com/Off-World-Live/obs-spout2-plugin)，然后添加 **Spout2 捕获** ，并将 **SpoutSenters** 设置为 **Warudo** 。

* **Streamlabs：** 添加 **Spout2** 源，并选择 **Warudo** 作为发送方。

![](/doc-img/zh-doc-img/zh-getting-started-65.png)
<p class="img-desc">将 Spout 源输出到 OBS Studio</p>

:::tip
所有输出方式均支持透明输出。如果要使用透明背景，只需要转到相机资源，在 **基本属性** 中，将 **透明背景** 设置为 **是** 即可。
:::

## 保存/加载场景

现在你已经配置好了一个场景，请记得保存它！Wrudo 不会像其他软件那样为您自动保存，这是为了让你在尝试各种功能时，弄乱了设置以后更容易将场景复原。单击左下角的 Warudo 图标，然后点击 **保存场景** 。

![](/doc-img/zh-doc-img/zh-getting-started-56.png)
<p class="img-desc">保存场景</p>

你也可以使用 **另存为场景** 将场景另存为新的文件。要加载场景的话，请选择 **加载场景** 。

![](/doc-img/zh-doc-img/zh-getting-started-57.png)
<p class="img-desc">加载场景</p>

最后，你可以使用 **重新加载场景** 和 **重启场景** 来重置场景。**重新加载场景** 会重置场景状态，并放弃自上次保存以来对场景所做的所有更改。而 **重启场景** 仅仅会重置场景的状态，但是会保留对场景所作的更改。

:::info
“重置场景状态”指的是重置场景中的物理、临时物体等。例如，如果你以某种方式在场景中生成了 1,000 个投掷道具，那么，使用 **重新加载场景** 或 **重启场景** 将移除这些道具，因为这些道具不属于场景文件的一部分。
:::

## 总结

恭喜！你现在已经了解了 Warudo 的基础知识。我们建议您阅读手册的其余部分来了解有关 Warudo 功能的更多信息。如果您有任何问题，可以加入 [QQ频道](https://qun.qq.com/qqweb/qunpro/share?_wv=3&_wwv=128&appChannel=share&biz=ka&businessType=5&from=181075&inviteCode=20CkQK5qNh0&mainSourceId=qr_code&subSourceId=pic4&jumpsource=shorturl#/pc) 或 [Discord](https://discord.gg/warudo)，我们很乐意为您提供帮助！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
	{name: '北溟瞬息', github: 'BeiMingShunXi'},
  ],
}} />
