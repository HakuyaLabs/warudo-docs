---
sidebar_position: 100
version: 2024-06-16
---

# Plugin Mod

A plugin mod is a type of [Warudo mod](../modding/mod-sdk) that adds custom assets and nodes to Warudo.

:::tip
Check out our [Creating Your First Plugin Mod](creating-your-first-plugin-mod) tutorial to get started with creating a plugin mod!
:::

:::info
This page discusses the general guidelines for creating a plugin mod. Please also refer to the [Plugins](api/plugins) scripting API page.
:::

## Environment Setup

A plugin mod is just a regular mod that contains a C# script that inherits from `Plugin`. You can create a new mod by following the [Creating Your First Mod](../modding/creating-your-first-mod) tutorial. Then, create a new C# script in the mod folder and inherit from `Plugin`. If you have any custom asset or node types, make sure they are registered in the `AssetTypes` and `NodeTypes` properties of the `[PluginType]` attribute (see [Plugin API](api/plugins)).

## Including Unity Assets

You can include Unity assets (e.g., prefabs, materials, textures) in your plugin mod by placing them in the mod folder. Warudo will automatically include these assets when exporting the mod.

:::caution
If your prefabs or materials use custom shaders or scripts, make sure to include those shaders or scripts in the mod folder as well.
:::

Then, you can load these assets in scripts during runtime. See [Loading Unity Assets](api/plugins#loading-unity-assets) for more information.

## Limitations {#limitations}

Plugin mods have the following limitations:

- You cannot use third-party DLLs or NuGet packages.
- You cannot export C# scripts that are part of an assembly, i.e., you cannot have any `.asmdef` files in your mod folder.
- You cannot use reflection (`System.Reflection`) or access the file system (`System.IO`).
  * To invoke methods on `MonoBehaviour` components, consider using Unity's [`SendMessage`](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html) or [`BroadcastMessage`](https://docs.unity3d.com/ScriptReference/Component.BroadcastMessage.html) methods.
  * To store and retrieve data, see [Saving and Loading Data](api/io).

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
