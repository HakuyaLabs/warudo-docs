---
sidebar_position: 0
---

# 简介

Warudo 的脚本系统允许您通过编写 C# 代码来扩展 Warudo 的功能，从而将新资源和节点添加到您的直播设置中。您可以通过创建[ Mod（Plugin mod）](plugin-mod)在 Steam 创意工坊上共享您的自定义[资源（Assets）](../assets/overview)和[节点（Nodes）](../blueprints/overview)。

这是 Warudo 社区创建的一些精彩插件：

* [Feline 的摸头节点](https://steamcommunity.com/sharedfiles/filedetails/?id=3010238299&searchtext=)
* [用于鼠标/笔/游戏手柄的输入接收器和工具](https://steamcommunity.com/sharedfiles/filedetails/?id=3221461980&searchtext=) 
* [Emotes From Twitch Message + Emote Dropper](https://steamcommunity.com/sharedfiles/filedetails/?id=3070622133&searchtext=)
* [Rainbow Color 节点](https://steamcommunity.com/sharedfiles/filedetails/?id=3016521495&searchtext=)
* [Streamer.bot 集成](https://steamcommunity.com/sharedfiles/filedetails/?id=3260939914&searchtext=)

:::tip
**Warudo 在构建时考虑了自定义脚本。** 事实上，Warudo 的全部功能都是与创建自定义节点、资源和插件时可用的相同 API（`Warudo.Core` 命名空间）构建的。

例如，Warudo 中的 Stream Deck 集成实际上是一个内置插件！我们在[此处](https://github.com/HakuyaLabs/WarudoPluginExamples)提供了其源代码供您参考。
:::

为了让您了解 Warudo 的脚本系统的工作原理，下面是一个自定义节点的简单示例，该节点在触发时角色会播放随机的表情动画：

![](/doc-img/zh-scripting-overview.jpg)

以及其相应的 C# 代码：


```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;
using Warudo.Plugins.Core.Assets.Character;

// 定义将显示在控制板中的自定义节点类型
[NodeType(Id = "95cd88ae-bebe-4dc0-b52b-ba94799f08e9", Title = "随机播放角色表情")]
public class CharacterPlayRandomExpressionNode : Node
{

    [DataInput]
    public CharacterAsset Character; // 让用户选择一个角色资源

    [FlowInput]
    public Continuation Enter()
    { //  “入口” 有流输入时触发节点
        if (Character.Expressions.Length == 0) return Exit; // 如果角色没有表情，则退出

        Character.ExitAllExpressions(); // 退出当前表情

        var randomExpression = Character.Expressions[Random.Range(0, Character.Expressions.Length)];
        Character.EnterExpression(randomExpression.Name, transient: false); // 播放随机表情

        return Exit; // 继续流并触发连接到 “出口” 的所以流输出
    }

    [FlowOutput]
    public Continuation Exit;

}
```

感兴趣吗？请[继续阅读](creating-your-first-script)！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Eco', github: 'EcoFur'},
  ],
}} />
