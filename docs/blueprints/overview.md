---
sidebar_position: 10
---

# Overview

Blueprints are a flexible and powerful visual scripting system enabling anyone to create unique interactions for their VTubing setup, utilizing concepts and tools that are typically reserved for programmers. Blueprints are created and edited using the Warudo editor, and all changes are reflected in realtime in the scene.

A blueprint is, boiled down, a flowchart. It defines **"When X happens, do Y."** Let's take a look at some toy examples:

* When I press the Esc key, shake the camera.
* When I receive a Twitch message that contains "beep boop", play a beep boop sound.
* When I yell out loud, my character is launched into the air.

Uninspiring? How about:

* When I open my mouth, my character [starts fire breathing](https://twitter.com/MVjagaimo/status/1725869971845333173/video/1). (By [@MVjagaimo](https://twitter.com/MVjagaimo))
* When I press a key, my character [walks to another place in the room, with the camera following the character](https://twitter.com/FelineEntity/status/1730225167572615582). (By [@FelineEntity](https://twitter.com/FelineEntity))
* When I press WASD, my character [drives a truck around](https://twitter.com/sablokato/status/1731679138677768700). (By [@sablokato](https://twitter.com/sablokato))
* When I receive a Twitch redeem, my character [spins and ragdolls into the air](https://twitter.com/Shellbunny_/status/1712629869488853260). (By [@Shellbunny_](https://twitter.com/Shellbunny_))
* When I touch my index fingers together, a [electric spark is generated between them](https://twitter.com/hakuyalabs/status/1724364814158360767). (By [@HakuyaTira](https://twitter.com/hakuyatira))
* When my character hits a prop with hand, the prop is [propelled away](https://twitter.com/FelineEntity/status/1727379837185319176). (By [@FelineEntity](https://twitter.com/FelineEntity))
* When I push my hands together, the [Ring Fit prop is squeezed](https://twitter.com/VanJiha_Vtuber/status/1737645095095341397/video/1). (By [@VanJiha_Vtuber](https://twitter.com/VanJiha_Vtuber))
* When I press buttons on my MIDI controller, the [buttons on my virtual MIDI controller light up](https://twitter.com/ChiuYukina/status/1734913824086729149). (By [@ChiuYukina](https://twitter.com/ChiuYukina))
  ...

The possibilities are endless! You can find and share pre-made blueprints in our community [Discord](https://discord.gg/warudo), or create your own blueprints from scratch. This section of the handbook will guide you through the basics of blueprints, provide you with some examples to get you started, and dive into more advanced topics.

:::tip
Blueprints in Warudo are not just a novelty; rather, they are a crucial part of its architecture. For example, motion capture in Warudo is implemented entirely using blueprints. This ensures continuous updates and improvements to the blueprint system, providing an expanding variety of node types for endless combination possibilities.
:::

:::info
If you are a developer, you will be happy to find out that you can extend Warudo's blueprint system by adding new node types! Please refer to the [Scripting](http://localhost:3002/docs/scripting/overview) section for more details.
:::

## Interface

In the **Blueprints** tab, you can see a list of all the blueprints in the scene. You can select a blueprint to edit it in the node editor; then, you can drag nodes from the **Node Palette** tab, or modify the properties of the selected blueprint in the **Properties** tab.

![](pathname:///doc-img/en-blueprints-1.png)
<p class="img-desc">Overview.</p>

The toolbar has the following buttons:
* **Add Blueprint**: Add a new blueprint to the scene.
* **Remove Blueprint**: Remove the selected blueprint from the scene.
* **Duplicate Blueprint**: Duplicate the selected blueprint.
* **Rename Blueprint**: Rename the selected blueprint.
* **Format Blueprint**: Format the selected blueprint, i.e., automatically arrange the nodes.
* **Import Blueprint From Clipboard**: Import a blueprint from the clipboard.
* **Export Blueprint To Clipboard**: Export the selected blueprint to the clipboard.
* **Import Blueprint From File**: Import a blueprint from a JSON file.
* **Export Blueprint To File**: Export the selected blueprint to a JSON file.

:::tip
You can use the import/export feature to copy blueprints between scenes.
:::

To navigate the node editor, you can use **Mouse LMB** to pan, **Mouse Wheel** to zoom, and **Mouse RMB** to select multiple nodes. When one or more nodes are selected, you can use **Mouse LMB** to drag them around, and **Delete** to delete them. You can also use **Ctrl+C** and **Ctrl+V** to copy and paste selected nodes.
