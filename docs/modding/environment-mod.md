---
sidebar_position: 30
---

# Environment Mod

Any Unity [scene](https://docs.unity3d.com/Manual/CreatingScenes.html) can be imported into Warudo as an environment mod!

## Setup

### Step 1: Prepare Scene

Set up your Unity scene as you like. Note that [Post Processing Stack v2](https://docs.unity3d.com/Packages/com.unity.postprocessing@3.3/manual/index.html) is supported, so you can add post-processing effects to your scene.

We recommend you to optimize your scene, for example:
* Don't use too many high-poly models;
* Disable collision on models that don't need collision;
* If only a small part of the scene will be visible in your streams, disable or remove the rest of the scene if possible;
* Use as few realtime lights as possible, and use baked lights whenever possible.

### Step 2: Bake Lighting (Optional)

We generally recommend to bake lighting in the scene, as it can significantly improve the visual quality and performance of your environment mod.

#### Unity's Built-in Lightmapper

Most of the time, using Unity's built-in lightmapper is sufficient. Note that Warudo uses directional lightmaps, so make sure **Directional Mode** is set to Directional in **Windows → Rendering → Lighting**:

![](pathname:///doc-img/en-environment-mod-1.webp)

Otherwise, the lighting in the scene may be incorrect.

:::info
If the scene already has lightmaps baked, after switching the lightmapping directional mode, you need to click **Generate Lighting** to rebake the lightmaps.
:::

#### Bakery

You can also use [Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218), a third-party lightmapper, as long as you bake directional lightmaps. For example, in Bakery, [you can set **Directional Mode** to Dominant Direction or MonoSH](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode).

To ensure Bakery works correctly with Warudo, please follow these steps:

1. Copy the `Bakery` folder into your mod folder (by default it should be at the `Assets` root);
2. In Bakery settings, check **Use scene named output path**. This makes sure Bakery lightmaps are stored in the mod folder. For **Directional Mode**, you should choose one that would generate directional lightmaps, such as Dominant Direction or MonoSH;
3. Click **Render** to render the lightmaps. Then, click **Render reflection probes** if you want to bake reflection probes as well;
4. **Important:** Go to `Bakery/_tempScene` folder and delete the "_tempScene" Unity scene that was generated during baking.

### Step 3: Add `EnvironmentSettings` Script

Open the Unity scene you want to export and add the `EnvironmentSettings` script (included in Warudo SDK) to a new GameObject or any existing GameObject. Click the `Copy from current environment settings` button. This script stores Unity's environment settings so that skybox, shadow color, etc. are exported to the environment mod.

### Step 4: Rename Scene

Name the scene **"Environment"** and make sure the scene is placed in the mod folder (can be placed in any subfolder).

### Step 5: Export Mod

Select **Warudo → Build Mod** and make sure the generated `.warudo` file is put into the `Environments` data folder.

## Troubleshooting

Creating an environment mod is definitely trickier than creating other types of mods, so if you notice the environment in Warudo does not look like the one in your editor, you can go through this checklist to see if you missed anything:

* Did you place the `EnvironmentSettings` script on a GameObject in the scene?
* Did you make sure the scene is named **"Environment"**?
* Did you make sure all the materials, shaders, etc. are included in the mod folder?
* If you use baked lighting, did you make sure the lightmaps and the `LightingSettings` asset are included in the mod folder?
* If you use baked lighting, was the lightmap directional mode set to Directional? (Or Dominant Direction / MonoSH if you use Bakery)
* Did you have more than one Unity scene in the mod folder? If so, please delete the other scenes. (There may be scenes inside subfolders, so make sure to check all your subfolders!)
* Did your scene have prefabs with unapplied changes? If so, please apply the changes. If you see the vertical lines (which means the changes could not be fully applied), right click on them and select **Prefab → Unpack Completely** to unpack the prefabs, and export the mod again.
  ![](pathname:///doc-img/en-environment-mod-2.webp)
