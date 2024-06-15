---
sidebar_position: 0
---

# Overview

Warudo's scripting system allows you to extend Warudo's functionality by writing C# code that adds new [assets](../assets/overview) and [nodes](../blueprints/overview) to your VTubing setup. You can share your custom assets and nodes on the Steam workshop by creating a [plugin mod](plugin-mod).

Here are just a few wonderful plugins created by the Warudo community:

* [Feline's Headpat Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3010238299&searchtext=)
* [Input Receiver and Tools for Mouse/Pen/Gamepad](https://steamcommunity.com/sharedfiles/filedetails/?id=3221461980&searchtext=) 
* [Emotes From Twitch Message + Emote Dropper](https://steamcommunity.com/sharedfiles/filedetails/?id=3070622133&searchtext=)
* [Rainbow Color Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3016521495&searchtext=)
* [Streamer.bot integration](https://steamcommunity.com/sharedfiles/filedetails/?id=3260939914&searchtext=)

:::tip
**Warudo is built with custom scripting in mind.** In fact, the entirety of Warudo's features is built with the same APIs (the `Warudo.Core` namespace) that are available to you when creating custom nodes, assets, and plugins.

For example, the Stream Deck integration in Warudo is actually a built-in plugin! We have made its source code available [here](https://github.com/HakuyaLabs/WarudoPluginExamples) for your reference.
:::

To give you a taste of how Warudo's scripting system works, here is a simple example of a custom node that plays a random expression on a character when triggered:

![](/doc-img/en-scripting-overview.png)

And the corresponding C# code:

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

Intrigued? Read on!
