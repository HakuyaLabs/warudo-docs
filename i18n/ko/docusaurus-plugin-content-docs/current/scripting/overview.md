---
sidebar_position: 0
---

# 개요

Warudo의 스크립팅 시스템을 사용하면 C# 코드를 작성해 새로운 [에셋](../assets/overview)과 [노드](../blueprints/overview)를 VTubing 설정에 추가하여 Warudo의 기능을 확장할 수 있어요. [plugin mod](plugin-mod)를 만들어 Steam 워크샵에 여러분의 커스텀 에셋과 노드를 공유할 수 있어요.

다음은 Warudo 커뮤니티에서 제작한 몇 가지 멋진 플러그인들이에요:

* [Feline's Headpat Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3010238299&searchtext=)
* [Input Receiver and Tools for Mouse/Pen/Gamepad](https://steamcommunity.com/sharedfiles/filedetails/?id=3221461980&searchtext=) 
* [Emotes From Twitch Message + Emote Dropper](https://steamcommunity.com/sharedfiles/filedetails/?id=3070622133&searchtext=)
* [Rainbow Color Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3016521495&searchtext=)
* [Streamer.bot integration](https://steamcommunity.com/sharedfiles/filedetails/?id=3260939914&searchtext=)

:::tip
**Warudo는 기본적으로 커스텀 스크립팅**을 염두에 두고 제작되었어요. 사실 Warudo의 모든 기능은 여러분이 커스텀 노드, 에셋, 플러그인을 만들 때 사용하는 API(`Warudo.Core` 네임스페이스)를 기반으로 만들어졌어요.

예를 들어, Warudo의 Stream Deck 통합 기능은 실제로 내장된 플러그인으로 이 플러그인의 소스 코드를 [여기](https://github.com/HakuyaLabs/WarudoPluginExamples) 참조용으로 공개해 두었어요.
:::

Warudo의 스크립팅 시스템이 어떻게 작동하는지 간단히 맛보기로, 트리거될 때 캐릭터에 무작위 표정을 재생하는 커스텀 노드 예시를 보여드릴게요:

![](/doc-img/en-scripting-overview.png)

그리고 이에 해당하는 C# 코드:

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

흥미로워 보이나요? 계속 읽어보세요!

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
