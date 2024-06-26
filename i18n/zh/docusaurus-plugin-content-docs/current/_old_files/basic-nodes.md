---
sidebar_position: 30
---

# 基础节点

### 事件

每一张蓝图都可以用一句话来概括：「如果发生 X，那么发生 Y」。事件节点便是蓝图中「如果发生 X」的部分。

**「当按下键盘按键时」**节点会在按下指定的按键时触发流程出口。以下蓝图会在按下 Alt + Q 键时，切换角色的待机动画：

![](/doc-img/zh-blueprint-basic-node-1.webp)

**「当松开键盘按键时」**节点同理，会在松开指定按键时触发流程出口。

**「当蓝图被启用时」**节点和**「当蓝图被禁用时」**节点会在启用蓝图后 / 禁用蓝图前触发流程出口。

**「当 Update 时」**节点和**「当 LateUpdate 时」**节点会在每一帧触发流程出口；后者的触发时间稍晚。以下蓝图会将 RhyLive 接收器收到的 BlendShape 数据持续应用到模型上：

![](/doc-img/zh-blueprint-basic-node-2.webp)

**「当 FixedUpdate 时」**节点会在物理演算（每 1 / 90 秒）之前触发流程出口。

:::info
Update、LateUpdate 和 FixedUpdate 为 Unity 中的[事件执行顺序](https://docs.unity3d.com/Manual/ExecutionOrder.html)。在蓝图列表中越靠下的蓝图，会越后收到 Update / LateUpdate / FixedUpdate 事件。
:::

### 角色

角色节点属于蓝图中「那么发生 Y」的部分。

:::info
由于角色节点的数量较多，以下仅举例说明自定义时常用的节点。与动作捕捉相关节点的说明，请参看[这篇文档](mocap-nodes.md)。
:::

**「播放角色待机动画」**节点会切换角色的待机动画到指定动画。以下节点会在按下 Alt + Q 键时切换待机动画到猫猫手：

![](/doc-img/zh-blueprint-basic-node-3.webp)

:::tip
**缓动函数**可以调整数值变化的速度。例如 Linear 会让值线性变化，而 OutCubic 会让值一开始变化较大，快到终点之前慢下来。详情可参考 [https://easings.net](https://easings.net/)。
:::

**「播放角色单次动画」**节点会在角色上播放指定动画，播放完毕后回到之前的状态。以下节点会在按下 Alt + Q 键时播放大笑的附加动画：

![](/doc-img/zh-blueprint-basic-node-4.webp)

**「切换临时角色 IK 目标锚点」**节点会启用 / 禁用角色的[临时角色 IK 目标锚点](../assets/character/#shen-ti-ik)，即把角色的脊椎或四肢固定（或尽量固定）在空间中当前的位置。以下蓝图会在按下 Alt + Q 键时锁定角色的双手在当前所在位置，再次按下后即可撤销固定：

![](/doc-img/zh-blueprint-basic-node-5.webp)

**「切换角色网格」**节点会启用 / 禁用角色模型上的特定[网格](../assets/character/#wang-ge)。以下节点会在按下 Alt + Q 键时切换角色外套的显示：

![](/doc-img/zh-blueprint-basic-node-6.webp)

**「加载角色动画预设」**节点会加载预先保存的[角色动画设置](../assets/character/#dong-hua)。以下节点会在按下 Alt + Q 键时加载名为 cat 的动画预设：

![](/doc-img/zh-blueprint-basic-node-7.webp)

**「启用角色 IK」**节点会淡入角色脊椎 / 四肢的 IK 属性到指定的设置。以下蓝图会在按下 Alt + Q 键时让角色的右手移动到指定的 IK 目标：

![](/doc-img/zh-blueprint-basic-node-8.webp)

**「禁用角色 IK」**节点会淡出角色脊椎 / 四肢的 IK，并在淡出完毕后禁用 IK。

**「启用角色覆盖手势」**节点会设置角色的[覆盖手势](../assets/character/#dong-hua)。以下蓝图会在按下 Alt + Q 键时让角色双手比耶：

![](/doc-img/zh-blueprint-basic-node-9.webp)

**「禁用角色覆盖手势」**节点会撤销角色的覆盖手势。

### 摄像机

和角色节点类似，摄像机节点也属于蓝图中「那么发生 Y」的部分。

**「切换主摄像机」**节点会切换主窗口渲染及控制的摄像机。以下蓝图会在按下 Alt + 2 键时切换主摄像机到摄像机 2：

![](/doc-img/zh-blueprint-basic-node-10.webp)

**「摄像机聚焦角色」**节点会开启摄像机的景深并逐渐聚焦到指定角色。以下蓝图会在按下 Alt + F 键时聚焦主摄像机到角色上：

![](/doc-img/zh-blueprint-basic-node-10.5.webp)

**「晃动摄像机」**节点会摇晃或颤动摄像机的位置和旋转。以下蓝图会在按下 Alt + F 键时晃动主摄像机：

![](/doc-img/zh-blueprint-basic-node-11.webp)

**「设置摄像机…」**等节点会设置摄像机的相应属性。

### 资源

和角色节点类似，资源节点也属于蓝图中「那么发生 Y」的部分。

**「切换资源启用状态」**节点会启用 / 禁用指定的资源。以下蓝图会在按下 Alt + R 键时让角色摆出手拿玫瑰的姿势（玫瑰为[道具](../assets/prop.md)资源，事先配置[绑定](../assets/prop.md#jiao-se-pei-jian)在角色右手）：

![](/doc-img/zh-blueprint-basic-node-12.webp)

**「设置资源属性」**节点是最通用的节点之一，可以用来设置任何资源的指定属性。以下蓝图会在按下 Alt + T 键键时让角色望向玫瑰（设置角色的视线 IK 目标为玫瑰）：

![](/doc-img/zh-blueprint-basic-node-13.webp)

对于 Float（小数）和 Color（颜色）的属性，还可以指定过渡时间和缓动函数：

![](/doc-img/zh-blueprint-basic-node-14.webp)

:::caution
你可能会意识到，很多节点都可以用「设置资源属性」节点来代替。比如，「设置摄像机亮度」节点和「设置资源属性 → 数据路径：Brightness（亮度）」节点的效果是一样的。

不过，我们推荐尽可能不使用「设置资源属性」节点，除非实在没有替代的节点。这是因为「设置资源属性」节点的性能消耗**远大于**直接设置属性的节点。如果节点是按键后触发，那么对性能的影响是较难察觉的；但如果配合「当 Update 时」等每帧执行的节点使用，可能会使帧数骤降。
:::

**「触发资源扳机」**节点可以触发任何资源页显示的按钮（扳机）。以下蓝图会在按下 Print Screen 键时截图：

![](/doc-img/zh-blueprint-basic-node-15.webp)

