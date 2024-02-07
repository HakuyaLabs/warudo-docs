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
The template of a basic plugin.

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)  
Including the **Stream Deck Plugin** and **VMC Plugin**.
    - **Stream Deck Plugin**: This plugin communicates with an external application (Warudo's [Stream Deck plugin](https://apps.elgato.com/plugins/warudo.streamdeck)) via WebSocket. It demonstrates the use of the WebSocket service base class `WebSocketService`.
    - **VMC Plugin**: This plugin adds [VMC](https://protocol.vmc.info/english) as a supported motion capture method via registering a `FaceTrackingTemplate` and a `PoseTrackingTemplate`.

### Advanced

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)  
Custom plugin to load AnimationClips from the mod folder and registers them as character animations.

- [KatanaAnimations.cs #Comment](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3?permalink_comment_id=4633225#gistcomment-4633225)  
Built in resource types and what URI resolvers are expected to return.  
( if you are looking to use `Context.ResourceManager.ResolveResourceUri<T>` )
