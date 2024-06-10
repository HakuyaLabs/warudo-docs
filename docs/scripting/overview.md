---
sidebar_position: 0
---

# Overview

Warudo's scripting system allows you to extend Warudo's functionality by writing C# code that adds new [assets] and [nodes] to your VTubing setup. You can [distribute] your custom assets and nodes on the Steam workshop by creating a [plugin] using the Modding SDK.

Here's what a custom node would look like:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;
using Warudo.Plugins.Core.Assets.Character;

namespace Warudo.Docs {
    [NodeType(Id = "95cd88ae-bebe-4dc0-b52b-ba94799f08e9", Title = "Character Play Random Expression")]
    public class CharacterPlayRandomExpressionNode : Node {

        [DataInput]
        public CharacterAsset Character;

        [FlowInput]
        public Continuation Enter() {
            if (Character.Expressions.Length == 0) return Exit;

            Character.ExitAllExpressions();

            var randomExpression = Character.Expressions[Random.Range(0, Character.Expressions.Length)];
            Character.EnterExpression(randomExpression.Name, transient: false);
            
            return Exit;
        }
        
        [FlowOutput]
        public Continuation Exit;
        
    }
}
```

This node plays a random expression on the character when the `Enter` input flow is triggered.

