---
sidebar_position: 30
---

# Environment Mod

Warudo can use any Unity [scene](https://docs.unity3d.com/Manual/CreatingScenes.html) as an [environment](../assets/environment.md)'s source.

## Prerequisites

Due to Unity's [limitations](https://docs.unity3d.com/Manual/LightmappingDirectional.html), you must confirm "(Lightmapping) Directional Mode" is set to "Directional" for your scene's lighting settings:

![](pathname:///doc-img/en-environment-mod-1.webp)

Otherwise, the lighting in the scene may be incorrect.

:::info
If the scene already has lightmaps baked, after switching the lightmapping directional mode, you need to click "Generate Lighting" to rebake the lightmaps.
:::

:::info
You can also use third-party lightmappers like [Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218), as long as the lightmaps baked are directional. For example, in Bakery, [you can set the Directional Mode to "Baked Normal Maps."](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode)
:::

## Setup

Open the Unity scene you want to export and place the `EnvironmentSettings` script (included with Mod SDK) on a new GameObject or any existing GameObject. Click the `Copy from current environment settings` button.

:::caution
If you do not place the `EnvironmentSettings` script, rendering settings such as the skybox and shadow color will not be exported to the environment mod.
:::

Name the scene **"Environment"** and make sure the scene is placed in the mpd folder (can be placed in any subfolder). Select "Warudo" -> "Build Mod," and place the generated `.warudo` file into the "Environments" subfolder in the Warudo data folder.

## FAQ

Q: My Unity scene in Warudo doesn't look like the one in my editor.

A: Check if your scene has prefabs with unapplied changes, like these.

![](pathname:///doc-img/en-environment-mod-2.webp)

Try to apply the changes. If you still see the vertical lines (which means the changes could not be fully applied), right click on them and select "Prefab -> Unpack Completely" to unpack the prefabs, and export the mod again.
