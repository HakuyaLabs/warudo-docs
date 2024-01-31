---
sidebar_position: 40
---

# 进阶节点

### 调试

Warudo 提供以下的节点，让蓝图调试起来更加方便。

**「触发流程」**节点可以在按下「触发」按钮后触发流程出口。以下蓝图会在按下「触发」按钮后播放角色待机动画：

![](/doc-img/zh-blueprint-advanced-node-1.webp)

**「显示 Toast」**节点可以在配置窗口底部显示弹窗信息：

![](/doc-img/zh-blueprint-advanced-node-2.webp)

**「检查值」**节点可以用来查看任何数据出口的值。以下蓝图可以用来检查 RhyLive 接收器是否接收到了数据，排查网络故障：

![](/doc-img/zh-blueprint-advanced-node-3.webp)

:::danger
「检查值」节点会在每帧对数据进行序列化，可能会拉低渲染帧数。检查完毕后记得断开连接！
:::

### **切换**

**「切换…」**节点会根据输入的条件输出不同的数据；条件为真时输出「条件为真」入口的数据，条件为假时输出「条件为假」入口的数据。当条件变化时（真 → 假、假 → 真），输出的数据会在两个数据之间平滑过渡。以下蓝图会在按下 Z 键后，拉近摄像机（设置视场角为 15）；松开 Z 键后，拉远摄像机（设置视场角为 35）：

![](/doc-img/zh-blueprint-advanced-node-4.webp)

### 变量

有时候，我们需要在蓝图中保存一些状态。比如，我们希望在按下 5 次 Esc 后，才晃动摄像机。可以想象，我们需要一个类似计数器的东西，在每次按下 Esc 时，计数器会加 1，当计数器为 5 时晃动摄像机即可。像计数器这样，可以让我们读写数据的，便是**变量**。

你可以在右边的属性栏为蓝图定义变量。这里我们定义了一个名称为**按键次数**的变量，数据类型是 Integer（整数），值是 0（从 0 开始）。

![](/doc-img/zh-blueprint-advanced-node-5.webp)

:::info
以下是 Warudo 中变量可以设置的数据类型：

* **Integer**：整数。
* **Float**：小数。
* **Boolean**：布尔值（即「是（真）」或「否（假）」）。
* **String**：字符串（即一串字符，像「Bilibili」）。

:::

可以通过「设置 Integer 变量」节点给变量设置值，并通过「获取 Integer 变量」节点来获取变量的当前值。以下蓝图会在按下 Esc 键后，设置**按键次数**变量的值为 1。

![](/doc-img/zh-blueprint-advanced-node-6.webp)

可想而知，上面的蓝图作用不大——这样按键次数永远都是 1 了！我们想要的是每次按下 Esc 键后，给按键次数增加 1。也就是说，我们要把**按键次数**变量设置为按键次数**当前的值**加上 1。用蓝图来表示就是：

![](/doc-img/zh-blueprint-advanced-node-7.webp)

此处，「Integer 相加」节点负责将数据入口 A 和 B 的值相加。A 会是获取到的**按键次数**变量的值，而 B 则是 1。

试着按下 Esc 键，你会发现右边属性显示的值从 0 变成了 1：

![](/doc-img/zh-blueprint-advanced-node-8.webp)

接下来，给按键次数增加 1 后，我们会再次检查按键次数的值。当按键次数达到 5 时，我们便会晃动摄像机。（否则，我们便什么也不做。）用蓝图来表示就是：

![](/doc-img/zh-blueprint-advanced-node-9.webp)

此处，「Integer 大于等于」节点负责判断数据入口 A 的值是否大于等于 B 的值（即按键次数是否大于等于 5）。这个节点输出的 Boolean 值（「是」或「否」）则被用作「分支」节点的条件；如果「分支」节点收到了「是」，那么就会触发「条件为真」的流程出口，执行「晃动摄像机」节点。否则，就会触发「条件为假」的流程出口，但因为出口没有连接到别的节点，便等同于什么也不做了。

:::info
这里我们使用「Integer 大于等于」节点而不是「Integer 相等」节点来判断，结果是一致的，但更为保险（例如：意外设置了大于 5 的值）。
:::

最后，只要在晃动摄像机后，重置我们的按键次数为 0，我们的功能就大功告成啦：

![](/doc-img/zh-blueprint-advanced-node-10.webp)

### 流控制

:::info
如果你用过虚幻引擎（Unreal Engine）的蓝图功能，你会惊喜地发现，Warudo 大多数的流控制节点[都是从虚幻引擎搬运过来的](https://docs.unrealengine.com/4.26/zh-CN/ProgrammingAndScripting/Blueprints/UserGuide/FlowControl/)！谢谢你，Epic。😉
:::

**「分支」（Branch）**节点会根据条件触发「条件为真」或「条件为假」的流程出口。

**「交替执行」（FlipFlop）**节点会轮流触发流程出口 A 和 B。以下蓝图会在第一次执行时显示「你好！」，第二次执行时显示「再见！」，第三次执行时显示「你好！」，如此类推：

![](/doc-img/zh-blueprint-advanced-node-11.webp)

**「序列」（Sequence）**节点会在执行时依次触发所有流程出口，触发之间没有延迟。以下蓝图会在执行时显示「Wa」、「ru」、「do」：

![](/doc-img/zh-blueprint-advanced-node-12.webp)

**「最多执行一次」（DoOnce）**节点只会触发一次流程出口，触发后，必须通过触发「重置」流程入口来重置。以下蓝图会在按下 Q 键时显示 Toast，但之后再按 Q 键不会有反应，必须按下 W 键后，再按 Q 键才会再次显示 Toast。

![](/doc-img/zh-blueprint-advanced-node-13.webp)

**「最多执行 N 次」（DoN）**节点类似，最多触发 N 次流程出口。

**「门」（Gate）**节点只会在「开启」属性为「是」的情况下触发流程出口。触发「开启」流程入口即可「开门」，触发「关闭」流程入口即可「关门」。以下蓝图用 W 键开门，E 键关门；开门的情况下，按 Q 键显示 Toast：

![](/doc-img/zh-blueprint-advanced-node-14.webp)

**「多重门」（MultiGate）**节点会按顺序触发所有流程出口（每次执行仅触发一个出口）。如果「循环」属性设置了「否」，所有流程出口被触发后此节点便会停止运作，除非触发「重置」流程入口来重置。以下蓝图第一次执行会显示 1、第二次显示 2、第三次显示 3、第四次显示 4、第五次显示 1……如此类推：

![](/doc-img/zh-blueprint-advanced-node-15.webp)

**「Switch 分支…」（Switch On …）**节点会根据输入数据触发对应的流程出口。如果没有对应的流程出口，则触发默认出口。以下蓝图会在按下 Space 键时 roll 一个骰子，roll 到 6 时显示「666！」，否则显示「没有 roll 到 6。」：

![](/doc-img/zh-blueprint-advanced-node-16.webp)

**「For 循环」（ForLoop）**节点与编程中的 for 循环类似，等同于 `for (int i = 起始索引; i <= 结束索引; i++) 循环体();` 。以下蓝图会 roll 10000 次骰子，并显示 roll 到 6 的次数：

![](/doc-img/zh-blueprint-advanced-node-17.webp)

**「延迟控制流」**节点会在给定的延迟后才触发流程出口。以下蓝图会在按下 Q 键的 3 秒后显示 Toast：

![](/doc-img/zh-blueprint-advanced-node-18.webp)

**「延迟数据流」**节点会缓冲收到的数据，并在给定的延迟后在出口给出数据。以下蓝图会延迟面捕数据 2 秒：

![](/doc-img/zh-blueprint-advanced-node-19.webp)
