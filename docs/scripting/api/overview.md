---
sidebar_position: 0
---

# Overview

:::tip
This section deep dives into Warudo's scripting APIs. You don't need to be familiar with every detail to start scripting in Warudo, but we recommend at the very least skimming through this section to get a sense of how things work!
:::

Warudo is two applications in one: the editor and the runtime (we called it the _main window_ in the non-programmer sections of this handbook). The editor is where you create and edit scenes: update asset and plugin settings, add and connect nodes in blueprints, etc. The runtime acts as a rendering/scripting engine and runs the scenes you create.

![](/doc-img/en-scripting-concepts-1.png)
<p class="img-desc">The editor (right) and the runtime (left).</p>

The editor and runtime communicate with each other via a WebSocket connection. When you make changes in the editor, the changes are sent to the runtime, which then updates the scene accordingly. This architecture allows you to see the changes you make in real-time. Conversely, when you make changes in the runtime (e.g., changing a node's data input programmatically), the changes need to be sent back to the editor (see [Accessing Data Inputs](ports-and-triggers#accessing-data-inputs)).

The Warudo runtime is built using [Unity 2021.3](https://unity.com/); however, the core framework is designed to be as engine-agnostic as possible, which allows nodes, assets, and plugins to interact with each other and with the user through a set of simple and clean APIs, as well as enabling features such as [hot-reloading](../playground).

Instead of writing C# classes that derive from `MonoBehaviour` in typical Unity projects, you will write classes that derive from Warudo's base classes such as `Node` and `Asset`. These classes are then instantiated and managed by Warudo's runtime. Then, inside these classes, you can call Unity APIs to interact with the Unity scene, such as creating GameObjects, adding components, etc.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
