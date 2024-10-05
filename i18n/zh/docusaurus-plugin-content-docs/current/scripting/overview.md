sidebar_position: 0
---

# 概述

:::tip
本节深入探讨了Warudo的脚本API。您无需熟悉每个细节即可在Warudo中开始编写脚本，但我们还是建议您至少浏览本节，了解是脚本是如何运作的！  
:::

Warudo是两个窗口的总和：编辑器窗口和运行窗口（在本手册中，我们称之为非编程状态下的 _“主窗口”_ ）。编辑器窗口是创建和编辑场景的地方，如更新资产，设置插件，在蓝图中添加、连接节点等。运行窗口充当一个Render和脚本引擎，并运行渲染您创建的场景。  

![](/doc-img/en-scripting-concepts-1.png)
<p class="img-desc">运行窗口(左)，编辑器窗口(右)</p>  

编辑器窗口和运行窗口通过WebSocket相互联通。当您在编辑器窗口中进行改动时，变更会发送到运行窗口，然后运行窗口会相应地更新场景。这种架构允许您实时查看您所做的更改。反之亦然（如以编程方式更改节点的数据输入），更改会发回编辑器（参见[以编程方式访问数据输入](ports-and-triggers#accessing-data-inputs)）。  

尽管Warudo运行窗口是 [Unity 2021.3](https://unity.cn/)构建的，但其核心框架的设计尽可能与引擎脱节，以允许节点、资产和插件通过统一整洁的API与用户交互，并启用[热加载](../playground)等功能。  

用Warudo，您不必在Unity项目中编写例如 `MonoBehaviour` 的C#类，而是编写来自Warudo基础类，如 `Node` 和 `Asset` 。然后，这些类由Warudo的运行窗口实例化并管理。有趣的是，在这些类中，您仍可以调用Unity API与Unity场景进行交互，例如创建GameObjects、添加组件等。 ~~我想用Arduino自己做一套动捕。~~

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'Eco', github: 'EcoFur'},
],
}} />
