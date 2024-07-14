---
sidebar_position: 0
---

# 概要

Warudoのスクリプトシステムでは、あなたのVTuber活動向けに新しい[アセット](../assets/overview)と[ノード](../blueprints/overview)を追加するC#コードを記述することで、Warudoの機能を拡張できます。[プラグインMod](plugin-mod)を作成し、カスタムアセットとノードをSteamワークショップで共有することもできます。

以下は、Warudoコミュニティによって作成された素晴らしいプラグインの一部です。

* [Feline's Headpat Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3010238299&searchtext=)
* [Input Receiver and Tools for Mouse/Pen/Gamepad](https://steamcommunity.com/sharedfiles/filedetails/?id=3221461980&searchtext=) 
* [Emotes From Twitch Message + Emote Dropper](https://steamcommunity.com/sharedfiles/filedetails/?id=3070622133&searchtext=)
* [Rainbow Color Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3016521495&searchtext=)
* [Streamer.bot integration](https://steamcommunity.com/sharedfiles/filedetails/?id=3260939914&searchtext=)

:::tip
**Warudoはカスタムスクリプトを念頭に置いて構築されています。** 実際、Warudoのすべての機能は、カスタムノード、アセット、プラグインを作成するときに使用できるものと同じAPI (`Warudo.Core`名前空間) を使用して構築されています。

たとえば、WarudoのStream Deck連携は、実は組み込みプラグインです。ソースコードは[こちら](https://github.com/HakuyaLabs/WarudoPluginExamples)で公開していますので、参考にしてください。
:::

Warudoのスクリプトシステムがどのように機能するかを体験していただくために、トリガーされたときにキャラクターにランダムな表現を再生するカスタムノードの簡単な例を示します。

![](/doc-img/en-scripting-overview.png)

対応するC#コード:

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

興味がありますか？ぜひ続きを読んでください！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
