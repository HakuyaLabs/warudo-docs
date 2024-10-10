---
sidebar_position: 0
---

# 概述

Warudo 的脚本系统允许您通过编写 C# 代码来扩展 Warudo 的功能，从而将新资产和节点添加到您的直播设置中。您可以通过创建[ Mod（Plugin mod）](plugin-mod)在 Steam 创意工坊上共享您的自定义[资产（Assets）](../assets/overview)和[节点（Nodes）](../blueprints/overview)。

这是 Warudo 社区创建的一些精彩插件：

* [猫科动物的拍头节点](https://steamcommunity.com/sharedfiles/filedetails/?id=3010238299&searchtext=)
* [用于鼠标/笔/游戏手柄的输入接收器和工具](https://steamcommunity.com/sharedfiles/filedetails/?id=3221461980&searchtext=) 
* [来自 X 消息的表情 + 表情滴管](https://steamcommunity.com/sharedfiles/filedetails/?id=3070622133&searchtext=)
* [Rainbow Color 节点](https://steamcommunity.com/sharedfiles/filedetails/?id=3016521495&searchtext=)
* [Streamer.bot 集成](https://steamcommunity.com/sharedfiles/filedetails/?id=3260939914&searchtext=)

:::tip
**Warudo 在构建时考虑了自定义脚本。** 事实上，Warudo 的全部功能都是与创建自定义节点、资产和插件时可用的相同 API（`Warudo.Core`命名空间）构建的。

例如，Warudo 中的 Stream Deck 集成实际上是一个内置插件！我们在[此处](https://github.com/HakuyaLabs/WarudoPluginExamples)提供了其源代码供您参考。
:::

为了让您了解 Warudo 的脚本系统的工作原理，下面是一个自定义节点的简单示例，该节点在触发时角色会播放随机的表情动画：

![](/doc-img/en-scripting-overview.png)
<p class="img-desc">左边绿色节点：输入；右边绿色节点：输出；下：角色；</p>

以及其相应的 C# 代码 `暂未翻译`：

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;
using Warudo.Plugins.Core.Assets.Character;

// Define a custom node type that will be shown in the note palette
[NodeType(Id = "95cd88ae-bebe-4dc0-b52b-ba94799f08e9", Title = "Character Play Random Expression")]
public class CharacterPlayRandomExpressionNode : Node {

    [DataInput]
    public CharacterAsset Character; // Let the user select a character

    [FlowInput]
    public Continuation Enter() { // When the node is triggered via the "Enter" flow input
        if (Character.Expressions.Length == 0) return Exit; // If the character has no expressions, exit

        Character.ExitAllExpressions(); // Exit all current expressions

        var randomExpression = Character.Expressions[Random.Range(0, Character.Expressions.Length)];
        Character.EnterExpression(randomExpression.Name, transient: false); // Play a random expression
        
        return Exit; // Continue the flow and trigger whatever connected to the "Exit" flow output
    }
    
    [FlowOutput]
    public Continuation Exit;
    
}
```

感兴趣吗？请[继续阅读](creating-your-first-script)！

:::tip
翻译：很显然这个章节的学习需要一些编程基础，如果你拥有C#或Unity基础，学习这些就相当于了解一些API，但如果你连编程都不会，那我建议你先去学习Unity编程。
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'Eco', github: 'EcoFur'},
],
}} />

