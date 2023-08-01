---
sidebar_position: 50
---

# 动作捕捉节点

在这篇文档中，我们不再一一介绍每个节点，而是讲解基于 RhyLive 的动作捕捉是怎样用蓝图实现的。

<div className="hint hint-warning">
建议对蓝图的运作有一定了解后再阅读此篇文档。
</div>

### **面部追踪**

基于 RhyLive 的面部追踪蓝图如下（使用标准 VRM BlendShape）：

<div className="hint hint-info">
其他两个 RhyLive 面部追踪模板（使用 ARKit 面部 BlendShape 和使用 MMD BlendShape）的工作原理是类似的（甚至更简单），在此不再赘述。
</div>

<figure><img src="/images/image(1).png" alt="" /><figcaption></figcaption></figure>

我们已经在[「蓝图是什么？」](../advanced/blueprints-intro.md)文档中介绍过面部追踪的基本原理。这张蓝图虽然看似复杂，但核心的逻辑用一句话就可以表达：「获取 RhyLive 接收器得到的 BlendShape 列表，进行一系列数据处理，最后应用到模型上。」我们跟着数据流动的方向，先来看看蓝图最左边的部分吧：

![](</images/image(3)(1)(2).png>)

可以看到，[「切换 BlendShape 列表」节点](advanced-nodes.md#qie-huan)会根据 RhyLive 接收器「追踪中」的信号，选择动捕数据或空白的 BlendShape 列表输出。这可以防止动捕信号丢失时，模型表情「卡住」的现象。

<div className="hint hint-info">
如果我们觉得模型表情「卡住」更有意思呢？只需要删除「空 BlendShape 列表」节点，然后将「获取 RhyLive 接收器数据 -> BlendShape 列表」连接到「切换 BlendShape 列表 -> 条件为假」就可以了。
</div>

往右看，我们可以看到虽然蓝图看上去错综复杂，不过流向右边的数据其实仅是原本的 BlendShape 列表（来自左边）设置了 6 个 BlendShape（上面的「设置 BlendShape」节点）：Blink\_L、Blink\_R、A、O、I、U。比如 U 的值直接采用了 `mouthPucker`（ARKit 面捕中嘟嘴的数据）的值；A 的值是 `jawOpen * 1.2 - mouthFunnel`，等等。

<div className="hint hint-info">
为什么需要设置 A、O、I、U 的值呢？因为 RhyLive 的面捕数据是 [52 个 ARKit BlendShape 的值](https://arkit-face-blendshapes.com/)，但是我们的模型只有 VRM 的 BlendShape（A、I、E、O、U、Blink……）。因此，我们需要想办法从前者计算出后者的值。

为什么是 `jawOpen` 乘以 1.2，不是 1.3、1.4？为什么要减去 `mouthFunnel` 的值？其实，模板里的公式都是经验推导出来的，如果试出效果更好的公式，欢迎与大家分享哦。
</div>

<figure><img src="/images/image(9).png" alt="" /><figcaption></figcaption></figure>

接下来，我们希望对口型的 BlendShape 值作出一定约束。在这里，「约束 BlendShape」的作用是，**受约束 BlendShape 列表**中的每个 BlendShape 的值，必须小于等于 1 减去**约束 BlendShape** 的值。以最后一个节点为例，如果 BlendShape 列表中 U 的值为 0.7，那么 I、A、U 的值将被限制在 0.3 或以下。这样可以防止多个嘴型的 BlendShape 叠加在一起，出现穿模的现象；而「约束 BlendShape」节点的先后顺序则决定了嘴型的优先级（在这里，U 的优先级最高）：

<figure><img src="/images/image(8)(1).png" alt="" /><figcaption></figcaption></figure>

在蓝图的最后，我们对 BlendShape 列表中的数据作平滑处理（使表情动画看起来更为流畅），然后覆盖掉模型中相应的 BlendShape 的值：

![](/images/image.png)

你可能会问：「使用 VRM BlendShape Proxy」这个选项是什么？我们熟知的 VRM 模型格式上的 A、I、E、O、U、Blink\_L、Blink\_R 并不是模型上的 BlendShape 名称，而是 VRM 内部的 BlendShapeClip 名称；每个 BlendShapeClip 内部对应的才是模型上实际 BlendShape 的值，如下所示：

![](</images/image(6)(1)(1).png>)

但是，Warudo 并不依赖于 VRM 的 BlendShapeClip 或 BlendShapeProxy，而是直接对模型上的 BlendShape 进行操作。所以，我们便需要「使用 VRM BlendShape Proxy」节点帮我们作这一转换。用以上的蓝图和模型为例，Blink\_L BlendShape 会被映射到 VRM 的 Blink\_L BlendShapeClip 上，也即模型的 `Fcl_EYE_Close_L` BlendShape。

### **姿态追踪**

基于 RhyLive 的上半身姿态追踪蓝图如下：

<figure><img src="/images/image(7)(3).png" alt="" /><figcaption></figcaption></figure>

不用担心，并没有看上去那么复杂啦！首先，仅看流程走向的话，我们可以看出这个蓝图会在每一帧覆盖角色的骨骼信息和左右手的 IK 权重：

<figure><img src="/images/image(10)(1).png" alt="" /><figcaption></figcaption></figure>

骨骼信息指的是什么呢？一个角色的模型上有若干个关节，而每个关节的初始**相对**位置和旋转都是 (0, 0, 0)。所谓的让模型摆出某个 pose，其实就是设置每个关节的相对位置和旋转：

<figure><img src="/images/image(2)(3).png" alt="" /><figcaption><p>来源：<a href="https://blenderartists.org/t/apply-relative-rotation-from-one-armature-to-another/1194354">https://blenderartists.org/t/apply-relative-rotation-from-one-armature-to-another/1194354</a></p></figcaption></figure>

Warudo 支持一切 Unity 兼容的人形模型（即 [Humanoid Rig](https://docs.unity3d.com/2021.3/Documentation/Manual/UsingHumanoidChars.html)），而标准的人形模型共有 [54 个关节](https://docs.unity3d.com/ScriptReference/HumanBodyBones.html)。也就是说，无论你使用怎样的动捕硬件和软件，只要可以将输出的动捕数据转换（或合并）为 54 个旋转矢量，就可以让模型按照动捕数据动起来了。以下，我们把这 54 个旋转矢量称为**（角色）骨骼旋转**。

<div className="hint hint-info">
为什么在这个蓝图中没有操控骨骼位置呢？首先，除了人体的根关节（臀部）以外，除非想像《海贼王》的路飞那样伸长手臂，不然每个关节的**相对**位置应该是不变的。

这里的相对位置指的是子关节在父关节的参照系的位置。我们以手臂为例：

![](</images/image(4)(1)(3).png>)

![](</images/image(3)(3).png>)

可以看到，即使手臂摆出了不同的姿势，每个子关节**相对**于父关节的位置，都是沿着父关节的 Y 轴（绿轴）平移一段距离，而这段距离的长度是不会变的（除非想做拉长手臂的效果）。

通常情况下，唯一会覆盖的骨骼位置是臀部（Hips），因为臀部是角色的根骨骼，移动臀部的相对位置即移动角色在世界中的绝对位置。但 RhyLive 只提供上半身动捕，所以不会移动角色的位置，这就是此蓝图中没有操控角色骨骼位置的原因。像是 [VMC ](../mocap/vmc.md)或 [Rokoko ](../mocap/rokoko.md)等全身动捕的蓝图就会通过「覆盖角色骨骼位置」节点来操控角色骨骼位置。
</div>

我们来看看骨骼旋转的数据传递。可以看到，「覆盖角色骨骼」和「覆盖角色骨骼偏移」节点会接收<mark style={{color: "red"}}>**骨骼旋转**</mark>和<mark style={{color:"orange"}}>**骨骼旋转偏移**</mark>两组数据。这两组数据的源头都是 RhyLive 接收器，可是它们之间有什么区别呢？<mark style={{color: "blue"}}>**骨骼旋转权重**</mark>又是什么呢？我们先来看看前两者吧：

<figure><img src="/images/image(54).png" alt="" /><figcaption></figcaption></figure>

在以上的蓝图中，我们看到，RhyLive 输出的动捕数据被分为了两部分：一部分只有脸部、头部、骨盆的数据，一部分只有双臂与双手（左右臂、左右手手指）的数据。前者被当作<mark style={{color:"orange"}}>**骨骼旋转偏移**</mark>传进了节点里；这部分的动捕数据会<mark style={{color:"orange"}}>**始终应用在模型上**</mark>**。**后者被当作<mark style={{color: "red"}}>**覆盖骨骼旋转**</mark>传进了节点里，而这部分动捕数据是否被应用在模型上，则<mark style={{color: "red"}}>**取决于**</mark><mark style={{color: "blue"}}>**覆盖骨骼旋转权重**</mark><mark style={{color: "red"}}>**的值**</mark>**。**

<div className="hint hint-info">
你可能还注意到了「平滑旋转列表」这个节点。和「平滑 BlendShape 列表」一样，这个节点的作用便是让输入数据变得平滑，让角色动起来更为自然。
</div>

<div className="hint hint-info">
更严谨的表述：<mark style={{color: "red"}}>**骨骼旋转**</mark>是 54 个旋转矢量；<mark style={{color:"orange"}}>**骨骼旋转偏移**</mark>也是 54 个旋转矢量。<mark style={{color: "blue"}}>**骨骼旋转权重**</mark>则是 54 个 0 到 1 之间的小数。我们先假设<mark style={{color:"orange"}}>**骨骼旋转偏移**</mark>全部为 0。那么，<mark style={{color: "blue"}}>**骨骼旋转权重**</mark>全部为 1 时，模型的姿势和<mark style={{color: "red"}}>**骨骼旋转**</mark>（即动捕数据）一致；<mark style={{color: "blue"}}>**骨骼旋转权重**</mark>全部为 0 时，模型的姿势保持[动画设置](../assets/character/#dong-hua)的姿势。<mark style={{color:"orange"}}>**骨骼旋转偏移**</mark>是在这之上，对每个关节的旋转进行的微调。

用公式来表达，每个关节 i 的最终旋转为：

`FinalBoneRotations[i] =`<mark style={{color: "red"}}>**`BoneRotations`**</mark>`[i] *`<mark style={{color: "blue"}}>**`BoneRotationWeights`**</mark>`[i] + OriginalBoneRotations[i] *(1 -`<mark style={{color: "blue"}}>**`BoneRotationWeights`**</mark>`[i]) +`<mark style={{color:"orange"}}>**`BoneRotationOffsets`**</mark>`[i]`

其中，OriginalBoneRotations 是[动画设置](../assets/character/#dong-hua)给出的骨骼旋转数据。
</div>

让我们回想一下 Warudo 的最大卖点之一吧：可以实现动捕 + 动画的完美融合，即在捕捉到左右手的动作时让模型采用中之人的动作，而失去捕捉时，模型平滑过渡到[动画设置](../assets/character/#dong-hua)的动作。你或许猜到了：这正是利用调整<mark style={{color: "blue"}}>**骨骼旋转权重**</mark>的值来实现的：

<figure><img src="/images/image(7)(1).png" alt="" /><figcaption></figcaption></figure>

就这么看有点复杂，我们不妨倒过来看：<mark style={{color: "blue"}}>**覆盖骨骼旋转权重**</mark>的数据来源自[「切换 Float 列表」节点](advanced-nodes.md#qie-huan)。当 RhyLive 接收器给出「追踪中」的信号时，<mark style={{color: "blue"}}>**覆盖骨骼旋转权重**</mark>的数据会来自于「构建角色骨骼权重」节点；否则，<mark style={{color: "blue"}}>**覆盖骨骼旋转权重**</mark>即为最小角色骨骼权重（也就是 54 个 0），也就是最终骨骼旋转会完全采用动画的数据了。

「构建角色骨骼权重」节点的数据又是怎么给出的呢？可以看到，左臂和左手手指的权重来自于上面的[「切换 Float」节点](advanced-nodes.md#qie-huan)，这个节点等同于将 RhyLive 接收器给出的「左手追踪中」布尔值（真 / 假）信号转换为 1 或者 0，并且在信号转变时在 0 和 1 之间过渡。右臂和右手手指的权重同理。也就是说，当收到左 / 右手动捕信号的时候，<mark style={{color: "blue"}}>**覆盖骨骼旋转权重**</mark>中左 / 右手的权重会逐渐过渡到 1（模型左右手跟随动捕）；当丢失信号的时候，权重逐渐过渡到 0（模型左右手跟随动画）。

深呼一口气，我们的蓝图只剩下最后一部分了！不过，你或许已经能看出个大概……

<figure><img src="/images/image(26)(1).png" alt="" /><figcaption></figcaption></figure>

两个「Float 相减」的输出值即为 1 减去左 / 右手的覆盖旋转权重，被用作「覆盖角色肢体 IK 位置 / 旋转权重」节点的位置 / 旋转权重输入。简单来说，就是**「左右手正在动捕的时候，不要应用左右手 IK」**的意思啦。

<div className="hint hint-info">
「相对于配置权重」中的配置权重指的是[角色资源中对应的 IK 权重](../assets/character/#shen-ti-ik)。
</div>

### 小结

如果你完全理解了以上的内容，你就是名副其实的 Warudo 蓝图专家了！🎉 现在你理解了基于 RhyLive 的动作捕捉是怎样 100% 用蓝图系统实现的，你可以：

* 微调动作捕捉的效果，比如调整「平滑…」节点来调节数据平滑的程度。
* 自定义面捕映射，比如中之人鼓起脸（`cheekPuff`）时，淡入到生气的 BlendShape。
* 研究[「RhyLive + 键盘 + 触控板」姿态捕捉模板](../assets/character/#dong-zuo-bu-zhuo)是怎么实现的。
* 利用「获取 VMC 接收器数据」节点，将 VMC 数据与 RhyLive 数据融合在一起（比如使用 VMC 来 8  点 / 10 点捕捉，再用 RhyLive 进行 ARKit 面捕和手指的捕捉）。
* 有别的动捕硬件或软件，但是数据并不是 VMC 格式？利用 [Mod SDK](../modding/mod-sdk.md) 创建与「获取 RhyLive 接收器数据」类似的节点类型，然后整合到蓝图里吧。

### 其他

**「偏移角色变换」**节点用来偏移角色的变换（即空间中的位置、旋转、比例），但不影响角色资源页设置的变换。通常用来应用 VMC 的动捕数据：

![](</images/image(22)(1).png>)

**「偏移角色骨骼旋转列表」**节点可以偏移指定骨骼的旋转。以下蓝图会在按下 Z 键时让角色的头逐渐向左扭转 30 度，松开后逐渐复原：

![](</images/image(2)(1)(4).png>)
