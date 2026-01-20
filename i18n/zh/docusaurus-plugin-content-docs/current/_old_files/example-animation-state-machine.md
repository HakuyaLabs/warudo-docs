---
sidebar_position: 70
---

# 示例：热键切换角色动画 / 道具

通过 Warudo 的[角色配置](../assets/character/)，你可以让模型摆出几乎任何想要的姿势。可是，身为 VTuber，总不能在直播中途配置吧！以下给出一个蓝图的实例，利用角色的[身体 IK](../assets/character/#shen-ti-ik)，让模型在「默认」、「举起玫瑰」、「双手比耶」和「右手拿麦克风」四种状态间自由切换，并实现流畅过渡。最棒的是：这些动画都是实时生成的，不需要在 3D 工具（例如：Blender）中事先制作。

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196837021-1697da39-8988-4a12-9277-78040e4ef4a9.mp4" />
<p>视频里左右手的动作，除了一开始的左手是动捕之外，都是通过 IK 实现的。</p>
</div>

### 准备工作

:::info
还不清楚 IK 是什么？先看一下[身体 IK](../assets/character/#shen-ti-ik) 的说明吧！
:::

首先，我们需要创建用来作为 IK 目标的[锚点](../assets/anchor.md)。创建名为「麦克风右手」的锚点，配置如下：

![](/doc-img/zh-blueprint-example-animation-state-machine-1.webp)

:::info
这里将锚点与角色绑定，这样即使角色的姿势或位置改变了，锚点的位置仍然会与胸骨保持同样的相对位置。
:::

放到合适的位置：

![](/doc-img/zh-blueprint-example-animation-state-machine-2.webp)

创建名为「麦克风右手肘」的锚点，配置如下：

![](/doc-img/zh-blueprint-example-animation-state-machine-3.webp)

:::info
与上面相似，我们将锚点绑定到角色的脊椎，这样无论角色如何移动，锚点的位置始终与脊椎保持同样的相对位置。之所以绑定脊椎而不是胸骨，是因为这个锚点距离脊椎较近；通常而言，选择距离最近的骨骼来绑定是最合适的。
:::

创建「麦克风」道具，**源**选择「内置 - 其他 → 麦克风」，**角色配件**处配置如下：

![](/doc-img/zh-blueprint-example-animation-state-machine-4.webp)

在这一步，我们可以配置角色的[右手 IK](../assets/character/#shen-ti-ik) 属性如下，来验证两个 IK 锚点的配置无误：

![](/doc-img/zh-blueprint-example-animation-state-machine-5.webp)

:::info
你的权重不需要与图中一致，因为在之后的蓝图配置中，这些权重都可以在节点上自由设置。
:::

开启麦克风道具的显示，调整两个锚点以及麦克风道具的位置，直到看起来自然为止：

![](/doc-img/zh-blueprint-example-animation-state-machine-6.webp)

创建「比耶左手」「比耶右手」「比耶左手肘」「比耶右手肘」「玫瑰右手」锚点，还有「玫瑰」道具。以下仅展示每个锚点的位置，锚点的属性配置与上面类似，**绑定骨骼**选锚点最近的骨骼即可；玫瑰道具的属性配置也与麦克风类似，只不过覆盖手势我换成了「拿着物品 2」：



### 蓝图配置

创建一个新的蓝图（使用现有的当然也可以），放置以下节点和连接即可：

![](/doc-img/zh-blueprint-example-animation-state-machine-8.webp)

这里共四行节点——你可能已经猜到了，每一行节点就是对应一种状态的变换。按下从上往下第一个「触发」按钮，即可显示玫瑰并让角色举起玫瑰；第二个「触发」按钮会淡出角色双手的 IK；第三个「触发」按钮会显示麦克风并让角色把麦克风放到胸前；第四个「触发」按钮会让角色双手比耶。值得留意的是，每个「触发」按钮都会在上述逻辑之前（第二个按钮是在之后），通过[「序列」节点](advanced-nodes.md#liu-kong-zhi)，禁用覆盖手势及两个道具：

![](/doc-img/zh-blueprint-example-animation-state-machine-9.webp)

:::info
你也可以将第二行的两个「禁用角色 IK」节点移动到最右侧「切换资源启用状态」节点右边，这样切换姿势时会保证重置左右手的 IK。副作用是，切换状态时，模型的手会抖一下……
:::

以上使用「触发流程」节点仅是举例，在实际使用中，可以替换成[「当按下键盘按键时」节点](basic-nodes.md#shi-jian)来用热键切换角色的动画状态。另外，用同样的方法，你还可以用热键[切换角色的待机动画](basic-nodes.md#jiao-se)！
