---
sidebar_position: 10
translate_from_version: 2026-07-30
---

# 概述

![](/doc-img/blueprints-cover.jpg)

蓝图是一套灵活而强大的可视化脚本系统。它让任何人都能运用通常只有程序员才会接触的概念和工具，为自己的 VTubing 配置创造独特的交互。蓝图通过 Warudo 编辑器创建和编辑，所有更改都会实时反映在场景中。

简单来说，蓝图就是流程图。它定义了**“当 X 发生时，执行 Y。”**让我们来看几个简单的例子：

* 当我按下 Esc 键时，晃动摄像机。
* 当我收到包含“beep boop”的 Twitch 消息时，播放一段 beep boop 音效。
* 当我大声喊叫时，将我的角色发射到空中。

觉得没什么意思？那么这些例子如何：

* 当我张开嘴时，我的角色会[开始喷火](https://twitter.com/MVjagaimo/status/1725869971845333173/video/1)。（来自 [@MVjagaimo](https://twitter.com/MVjagaimo)）
* 当我按下一个按键时，我的角色会[走到房间里的另一个位置，摄像机也会跟随角色移动](https://twitter.com/FelineEntity/status/1730225167572615582)。（来自 [@FelineEntity](https://twitter.com/FelineEntity)）
* 当我按下 WASD 键时，我的角色会[开着卡车四处行驶](https://twitter.com/sablokato/status/1731679138677768700)。（来自 [@sablokato](https://twitter.com/sablokato)）
* 当我收到 Twitch 奖励兑换请求时，我的角色会[旋转并以布娃娃状态飞向空中](https://twitter.com/Shellbunny_/status/1712629869488853260)。（来自 [@Shellbunny_](https://twitter.com/Shellbunny_)）
* 当我的两根食指相碰时，它们之间会[产生电火花](https://twitter.com/hakuyalabs/status/1724364814158360767)。（来自 [@HakuyaTira](https://twitter.com/hakuyatira)）
* 当我的角色用手碰到道具时，道具会被[击飞](https://twitter.com/FelineEntity/status/1727379837185319176)。（来自 [@FelineEntity](https://twitter.com/FelineEntity)）
* 当我将双手合拢时，[《健身环大冒险》的健身环道具也会被挤压](https://twitter.com/VanJiha_Vtuber/status/1737645095095341397/video/1)。（来自 [@VanJiha_Vtuber](https://twitter.com/VanJiha_Vtuber)）
* 当我按下 MIDI 控制器上的按钮时，[虚拟 MIDI 控制器上对应的按钮也会亮起](https://twitter.com/ChiuYukina/status/1734913824086729149)。（来自 [@ChiuYukina](https://twitter.com/ChiuYukina)）
  ……

一切皆有可能！你可以在我们的社区 [Discord](https://discord.gg/warudo) 中寻找和分享他人制作的蓝图，也可以从零开始创建自己的蓝图。本手册的这一章节将带你了解蓝图的基础知识，提供一些示例帮助你入门，并深入探讨更高级的主题。

:::tip

蓝图在 Warudo 中不只是新奇的附加功能，更是其架构中的重要组成部分。例如，Warudo 的动作捕捉完全由蓝图实现。这确保了蓝图系统能够持续更新和改进，并不断提供更多节点类型，带来无穷无尽的组合方式。

:::

:::info

如果你是开发者，那么你会很高兴地发现：可以通过添加新的节点类型来扩展 Warudo 的蓝图系统！更多详情请参阅[脚本](../scripting/overview)章节。

:::

## 界面

在**蓝图**选项卡中，你可以看到场景内所有蓝图的列表。选择一个蓝图，即可在节点编辑器中对其进行编辑；随后，你可以从**节点面板**选项卡中拖入节点，或者在**属性**选项卡中修改所选蓝图的属性。

![](/doc-img/en-blueprints-1.png)

<p class="img-desc">界面概览。</p>

工具栏中包含以下按钮：

* **添加蓝图**：向场景中添加一个新蓝图。
* **移除蓝图**：从场景中移除所选蓝图。
* **复制蓝图**：复制所选蓝图。
* **更改蓝图名称**：重命名所选蓝图。
* **创建群组**：创建用于整理蓝图的分组。可以通过拖动蓝图来管理分组。
* **自动布局**：格式化所选蓝图，即自动排列其中的节点。
* **从剪贴板导入蓝图**：从剪贴板导入蓝图。
* **导出蓝图剪贴板**：将所选蓝图导出到剪贴板。
* **从文件导入蓝图**：从 JSON 文件导入蓝图。
* **导出蓝图到文件**：将所选蓝图导出为 JSON 文件。

:::tip

你可以使用导入和导出功能在不同场景之间复制蓝图。

:::

在节点编辑器中，可以使用**鼠标左键**平移视图、使用**鼠标滚轮**缩放视图，并使用**鼠标右键**框选多个节点。选中一个或多个节点后，可以使用**鼠标左键**拖动它们，或按 **Delete** 键将其删除。你也可以使用 **Ctrl+C** 和 **Ctrl+V** 复制和粘贴所选节点。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Hane', github: 'hanekit'},
  ],
}} />
