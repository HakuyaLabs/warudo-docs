# 蓝图是什么？

作为 Warudo 最独特的功能之一，**蓝图**到底是什么呢？

在回答「是什么」之前，我们不妨先来看一下「为什么」——而这又要从「VTuber 软件是什么」讲起了……

## 如何制作一款 VTuber 软件？

等等等等，别被副标题吓跑了。一个 VTuber 软件的基本架构其实非常简单；只考虑面捕的话，画成流程图就是：

![](https://user-images.githubusercontent.com/3406505/180648522-84bc5c45-994b-43b6-8fef-05b475738056.png)

对吧，不需要技术背景也能看懂。当然了，「把面部数据应用到模型上」有点过于笼统了，假设我们的面捕方案非常原始，只支持「眼睛睁闭」以及「嘴巴张合」的侦测，那么流程图可以画成这样：

![](https://user-images.githubusercontent.com/3406505/180677760-bf1a6446-dcae-441c-8e29-be97fce70196.png)

可是什么叫做「应用在模型上」呢？目前最主流的实现方式是通过设置模型上的 **BlendShape**，像这个样子：

![来源：https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/](https://user-images.githubusercontent.com/3406505/180678152-daf3ff76-1ab8-4add-b0c9-b28d0676fec3.gif)
<p class="img-desc">来源：https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/</p>

<div className="hint hint-info">
可以看到，BlendShape 的原理是**位移模型网格的若干个顶点**。[HANA\_Tool](https://kuniyan.booth.pm/items/2604269) 给 VRoid 模型自动生成 52 个 ARKit BlendShape（又被称作「完美同步」）的原理，正是因为同版本 VRoid Studio 导出的 VRM 模型，脸部网格的顶点数量和排列是完全一致的，因此一个模型的 BlendShape 可以直接套用在另一个模型上。其他软件制作的模型就只能手工制作 BlendShape 了。
</div>

主流的 [VRM 格式](https://store.steampowered.com/app/2079120/Warudo/)中，对应「眼睛睁闭」的 BlendShape 名称是 Blink，「嘴巴张合」则是 A（O 也可以），所以流程图又可以变成这样：

![](https://user-images.githubusercontent.com/3406505/180681038-d71002fd-eb60-4ac2-90a9-5a6f07ca33e9.png)

你可能还是不满意，能不能说清楚一点，到底什么是「应用到 BlendShape 上」呀？好吧，_假设_我收到的动捕数据里，「眼睛睁闭」是一个 0-1 的小数，如果是 0 呢，那就是捕捉到我的眼睛是张开的，如果是 1，我的眼睛就是闭上的，0.5 就是半睁眼；「嘴巴闭合」的数据同理。而对于模型的一个 BlendShape 而言，当其值为 0 时，顶点不移动；当 BlendShape 的值为 1 时，顶点移动到目标位置，如下所示：

![注意，Unity 中 BlendShape 的取值范围是 0-100，但在 Warudo（以及大多数 3D 工具）中 BlendShape 的取值范围都是 0-1。来源：https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/](https://user-images.githubusercontent.com/3406505/180681379-b20131f0-fe20-4368-b9e9-c45042b2491f.gif)
<p class="img-desc">注意，Unity 中 BlendShape 的取值范围是 0-100，但在 Warudo（以及大多数 3D 工具）中 BlendShape 的取值范围都是 0-1。来源：https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/</p>

那两边都是 0-1 之间，这不是刚刚好嘛！所以，流程图应该变成这样（第几个版本了……）：

![](https://user-images.githubusercontent.com/3406505/180685252-4a3d2d8d-2aaf-451b-863a-7038dadcb9ff.png)

恭喜你，你成功开发出了一款 VTuber 软件。🎉

## 但是……

问题来了：在我们的流程图里面，我们做了一些关键的假设……

* 模型已经适配了 VRM 格式，因此有 Blink 和 A 两个 BlendShape。
* 动捕数据的值，应该等同于其对应 BlendShape 的值。
* 如果中之人眨眼的话，Blink 的 BlendShape 就应该为 1；如果中之人张嘴的话，A 的 BlendShape 就应该为 1。

这些假设是否一定成立呢？

* _模型已经适配了 VRM 格式，因此有 Blink 和 A 两个 BlendShape。_\
  \
  显然，如果你的模型没有适配 VRM（比如是 VRChat 用的模型，又或者是 MMD 直接转换而来），那么这两个 BlendShape 是不存在的。
* _动捕数据的值，应该等同于其对应 BlendShape 的值。_\
  \
  动捕数据不一定总是正确的（尤其是家用的动捕方案），以「睁眼闭眼」举例，如果你的眼睛本来就比较小，可能会一直被识别为半睁眼状态；明明闭眼了，模型却闭不上眼的情况也很常见。这是因为我们假设了对于所有人来说，只要闭上眼，动捕数据就应该是 1；只要张开眼，动捕数据就应该是 0。而实际的情况每个人都不同，比如有可能对于你来说，闭上眼，动捕数据是 0.7 左右，张开眼，动捕数据是 0.2 左右。
* _如果中之人眨眼的话，Blink 的 BlendShape 就应该为 1；如果中之人张嘴的话，A 的 BlendShape 就应该为 1。_\
  \
  乍一看，这不是理所当然的吗？还真不一定。比如，假设我现在让模型做出了 ^^ 的表情：

![可爱捏](https://user-images.githubusercontent.com/3406505/180691970-c9ce152a-ef04-4e60-a014-4d6bb29105c1.png)
<p class="img-desc">可爱捏</p>

我们已经知道，这个表情实际上也是一个 BlendShape，这个 BlendShape 将模型上眼皮和下眼皮的顶点合了起来。那么，这个时候，我们再应用 Blink 闭眼的 BlendShape，会发生什么呢？

![草！](https://user-images.githubusercontent.com/3406505/180692226-3ab2d7f9-072e-436b-a736-c959ea6858d7.png)
<p class="img-desc">草！</p>

救命！原因也很简单，Blink 的 BlendShape 是将模型上眼皮的顶点往下拉，它就不该和 ^^ 的 BlendShape 一起使用，不然一定会穿模。

那，怎么办呢？我们看看以往都是怎么做的……

* _模型不一定适配 VRM 格式，所以没有 Blink 和 A 两个 BlendShape。_\
  \
  **市面软件：**不解决，模型适配 VRM，请。\
  **自研：**反正代码是自己写的，代码里把 `Blink` 改成正确的 BlendShape 就行了（比如 MMD 就是`まばたき`）。
* _动捕数据的值，不一定等同于其对应 BlendShape 的值。_\
  \
  **市面软件：**给特定 BlendShape 添加灵敏度调整（例：[VSeeFace](https://www.vseeface.icu/) 可以调节眨眼灵敏度、[RhyLive（Windows 客户端）](https://rhythmo.cn/rhylive/)可以调节每个 ARKit BlendShape 的灵敏度），但「灵敏度」仅是简单的乘数，可以让眼睛更容易合上，却无法解决眼睛睁不开的问题。市面上暂时没有 3D 软件能做到 [VTube Studio](https://denchisoft.com/) 这样的线性映射：\
  ![image](https://user-images.githubusercontent.com/3406505/180693648-8c2408db-8cb7-410e-ab6b-403a99ff4205.png)\
  **自研：**反正代码是自己写的，根据中之人手动适配好正确的数值即可。
* _部分 BlendShape 需要约束其他 BlendShape 的值，例如 ^^ BlendShape 被激活时，Blink BlendShape 的值应该等于 0。_\
  \
  **市面软件：**给特定 BlendShape 添加播放表情时的约束（例：[Luppet](https://luppet.appspot.com/) 可以设置播放某表情时是否允许眨眼），但市面上的 3D 软件仅适配了 VRM 所定义的 BlendShape 的约束——毕竟 VRM 本身定义的 BlendShape 就不多——而其他的 BlendShape 就不支持了（比如 ARKit）。\
  **自研：**和传统软件类似，不过反正代码是自己写的，根据模型适配好约束即可。

现在你或许已经意识到了，即便我们的需求看上去很简单（只是捕捉眼睛和嘴巴！），想要适配所有情况还是有点难度的。市面上 3D VTuber 软件的限制性都很大，而自研虽然看似能解决一切问题，但绝大多数自研项目不会考虑自定义性，仅为单个模型和中之人做适配，即使是简单的需求变化（比如动捕灵敏度）也需要程序侧来迭代和构建新版本，更别说更为复杂的需求了（比如更换场景、角色配件、礼物效果等）。当然，自研本身的技术门槛也是让不少 VTuber 望而却步的原因之一。

## 如何_用 Warudo_ 制作一款 VTuber 软件？

为了解决以上的种种问题，Warudo 引入了**蓝图**的概念。还记得我们一开始的这张流程图吗？

![](https://user-images.githubusercontent.com/3406505/180721847-3829eace-6a3e-4c6c-9962-ead730c98f24.png)

在 Warudo 中，对应的蓝图就是这个样子：

![](https://user-images.githubusercontent.com/3406505/180722958-0d0490a6-6caf-4c1b-9f78-00f9c6045ebc.png)

:::info
这里使用的是 RhyLive，当然也可以使用其他动捕数据源。
:::

让我们来解释一下发生了什么。每个蓝图中有若干个**节点**，比如上面的蓝图里面就有三个。每种节点有若干个**端口**，相同颜色的端口之间可以互相连接。

* <b style={{color: "green"}}>**绿色的端口**</b>：决定节点执行的先后顺序。在上图中，「当 Update 时」执行后，「更新角色 BlendShape 列表」便会执行。
* **黑色的端口**：在节点之间传送数据。在上图中，黑色的连接线负责把「获取 RhyLive 接收器数据」节点的「BlendShape 列表」，传给「更新角色 BlendShape 列表」的「BlendShape 列表」。

「更新角色 BlendShape 列表」节点所负责的，就是把模型的 BlendShape 的值设置为输入的值。比如左边给它的 BlendShape 列表是 `X=0.55, Y=0.75`，那么模型的 X BlendShape 就会设置成 0.55，Y BlendShape 就会设置为 0.75。而「当 Update 时」这个节点，会在每一帧被自动执行。也就是说，用文字来解释的话，以上蓝图的意思就是「每一帧获取 RhyLive 接收器收到的 BlendShape，全部应用在模型对应的 BlendShape 上」。

事实上，如果你的模型已经适配了 ARKit BlendShape（即「完美同步」），以上的蓝图可以直接运作：

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180726572-9ddcf9c5-0473-4cdc-b152-ef9ba93853eb.mp4" /></div>

恭喜你，你在 Warudo 里成功开发出了一款 VTuber 软件（这次是真的！）。🎉

不过如果换成没有适配 ARKit 的模型，那就应该完全不会动：

![](https://user-images.githubusercontent.com/3406505/180736152-2089d448-67dc-43be-a23b-fdaf5fa4ee02.png)

好啦，我知道上面是图片，但录成视频也确实不会动。——这是因为 RhyLive 接收器给出的数据是 [ARKit 的 52 个 BlendShape](https://arkit-face-blendshapes.com/) 所对应的数值，而这个模型上没有这 52 个 BlendShape，当然就不管用啦。怎么办呢？我们用「嘴巴张合」作为例子，对蓝图做一点点修改：

![](https://user-images.githubusercontent.com/3406505/180872576-9245a6d1-3f0a-4c91-82df-2f29d6d3a10a.png)

「设置 BlendShape」节点的逻辑很简单——左边给它一个列表，它就会把列表里指定的某个 BlendShape 设定为指定的值（如果列表里没有这个 BlendShape，那就增添一项），然后把列表传到右边去。我们指定了想要设置的 BlendShape 为 `あ`（`あ` 是我们模型上嘴张合的 BlendShape），而要设置的值…… 则是由「获取 BlendShape」节点给出的。而这个节点的职责就是从左边给它的列表里，找到指定的 BlendShape `jawOpen` 的值——这正正是 RhyLive 捕捉到的嘴巴张合的动捕数据！

用文字来解释的话，以上蓝图的意思就是「每一帧获取 RhyLive 接收器收到的 BlendShape，并且将 `あ` 的值设置为 `jawOpen` 的值，全部应用在模型对应的 BlendShape 上」。

同样道理，我们把「眼睛睁闭」也做上吧！

![](https://user-images.githubusercontent.com/3406505/180773758-de44d067-610a-4427-9433-1eab8b4c7240.png)

用文字来解释的话，以上蓝图的意思就是「每一帧获取 RhyLive 接收器收到的 BlendShape，并且将 `あ` 的值设置为 `jawOpen` 的值，并且将 `ウィンク2` 的值设置为 `eyeBlinkLeft` 的值，并且将 `ウィンク2右` 的值设置为 `eyeBlinkRight` 的值，全部应用在模型对应的 BlendShape 上」。（`ウィンク2` 和 `ウィンク2右` 是这个模型上睁闭眼的 BlendShape。）

效果如下：

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180735646-3f4a6324-938f-404c-9500-1f47481ab887.mp4" /></div>

好耶！可是你有没有留意到，我闭眼闭得很勉强的样子。我们来调整一下吧！

![](https://user-images.githubusercontent.com/3406505/180773881-1fde2afd-f73f-46a9-afc3-57578cc5f28e.png)

「Float 相乘」节点的作用——顾名思义，把 A（由左边的节点提供）和 B（我们手动设置了 2）乘起来，然后输出到右边。「限制 Float 取值范围」则把 A（由左边的节点提供）限制在最小值（0）和最大值（1）之间——这是为了防止 BlendShape 超过 1，导致穿模的现象。

用文字来解释的话——聪明的你应该意识到了——我们把动捕数据的 `eyeBlinkLeft` 和 `eyeBlinkRight` 乘大了一倍，但是确保值不会超过 1。

效果如下：

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180757257-c815210a-74eb-4adb-8bc8-d867bb572e44.mp4" /></div>

甚至还有更有意思的玩法——比如我想在我鼓起脸的时候，让模型 ^^ 眼笑起来。同理，只需要加两个节点就好了：

![](https://user-images.githubusercontent.com/3406505/180773943-6cb1663d-5f25-4bdc-a778-f105861775d2.png)

（`笑い` 是这个模型上 ^^ 眼的 BlendShape。）

效果如下：

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180759207-28d1e5b5-c575-4f42-b127-afb20a2c3608.mp4" /></div>

咦，怎么感觉眼皮穿模了？这正是我们之前提到的问题：`笑い` 这个 ^^ 眼 BlendShape 不能和闭眼的 `ウィンク2`/`ウィンク2右` 一起用！好在 Warudo 中，解决这个问题非常简单：

![](https://user-images.githubusercontent.com/3406505/180774031-5b9a30a0-b06a-4eb6-8b08-da004d7f2df7.png)

不穿模啦！

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180760044-f899f4df-7064-441d-bb6f-b1305899a6a4.mp4" /></div>

让我们现在回头看看之前的问题：

* _模型不一定适配 VRM 格式，所以没有 Blink 和 A 两个 BlendShape。_\
  \
  **Warudo：**不强制 BlendShape 名称，有什么用什么。
* _动捕数据的值，不一定等同于其对应 BlendShape 的值。_\
  \
  **Warudo：**没事，可以对动捕数据自由操作。
* _部分 BlendShape 需要约束其他 BlendShape 的值，例如 ^^ BlendShape 被激活时，Blink BlendShape 的值应该等于 0。_\
  \
  **Warudo：**拖一个「约束 BlendShape」节点解决。

似乎都解决了！当然啦，你不需要像上面一样，从 0 到 1 创建蓝图——在[新手上路](https://tiger-tang.gitbook.io/warudo/)的教程里，我们已经使用过 Warudo 自带的动捕 & 面捕蓝图生成工具，一键生成匹配模型信息的蓝图了。我们还演示了怎么把毫不相关的动捕数据（鼓脸）映射到指定的 BlendShape（`^^`）上——这当然只是蓝图万千可能性中的其中一种，比如，下面的蓝图就可以实现按下 Alt + C 时，切换模型的待机动作和表情：

![](https://user-images.githubusercontent.com/3406505/180763374-782368c5-4a64-408b-9462-22289dc34922.png)

**最棒的是，这一切都无需程序（我）的干预。**今天是万圣节？那就做个一键换上南瓜头的快捷键吧，还可以顺便播放点特效。想让角色卖个萌？那就让直播间收到喵娘的时候，让模型做出 >w< 的表情，或者摆出猫猫手吧。手边有 MIDI 控制器？用旋钮来控制场景里光源的明暗怎么样？这些简单的逻辑都可以在蓝图里五分钟实现——如果现有节点的功能不够用，你甚至可以开发[ Mod ](blueprints-intro.md)来添加自己的节点类型。而且，由于 Warudo 的蓝图都是保存在场景文件里的，只要复制场景文件和配套的模型、场景等文件，放到另一台电脑的 Warudo 里，就能实现完全一致的效果。
