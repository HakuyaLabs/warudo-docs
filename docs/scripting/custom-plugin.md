---
sidebar_position: 40
---

# Custom Plugin

:::warning

This page is still under development and is not completed. We are working to improve the content.

:::

## Examples

### Basic

- [Example plugin](https://gist.github.com/TigerHix/b78aabffc2d03346ff3da526706ce2ca)  
The template of a plugin (single file) with the basic use of `Plugin` class.

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)  
The complete plugin examples (multiple files), including the **Stream Deck Plugin** and **VMC Plugin**.
    - **Stream Deck Plugin**: This plugin communicates with an external application (Warudo's [Stream Deck plugin](https://apps.elgato.com/plugins/warudo.streamdeck)) via WebSocket. It demonstrates the use of the WebSocket service base class `WebSocketService`.
    - **VMC Plugin**: This plugin adds [VMC](https://protocol.vmc.info/english) as a supported motion capture method via registering a `FaceTrackingTemplate` and a `PoseTrackingTemplate`.

### Advanced

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)  
Custom plugin to load AnimationClips from the mod folder and registers them as character animations.

- [KatanaAnimations.cs #Comment](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3?permalink_comment_id=4633225#gistcomment-4633225)  
Built in resource types and what URI resolvers are expected to return.  
( if you are looking to use `Context.ResourceManager.ResolveResourceUri<T>` )

## File Structure

The recommended file structure of a plugin project is as follows:  
Note that all files and folders except `*Plugin.cs` are optional, you can create them only when needed.

```
<PLUGIN_DIR>
│
├── <PLUGIN_NAME>Plugin.cs
│
├── Localizations
│   └── Warudo.<PLUGIN_NAME>.json
│
├── Assets
│   ├── Asset1.cs
│   ├── Asset2.cs
│   └── ...
│
├── Nodes
│   ├── Node1.cs
│   ├── Node2.cs
│   └── ...
│
└── ...
```

## Blueprints

Custom scripting in Warudo works best when it complements, not replaces, the [blueprint system](../blueprints/overview.md). If you find yourself writing a huge `Plugin` class that handles a lot of logic, think carefully if it can be written as a custom node instead. For example, if your idea is to play a fireworks effect when you receive a custom UDP packet over the LAN, instead of a `Plugin` class that does both, it is much better (and easier to maintain) to implement two custom nodes - one that triggers the output flow when the custom UDP packet is received, and one that straightly plays a firework effect when the input flow is received.