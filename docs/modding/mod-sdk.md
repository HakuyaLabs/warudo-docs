---
sidebar_position: 0
---

# Overview

![](/doc-img/mod-cover.jpg)

Warudo provides a complete modding system that allows you to import your own 3D assets into Warudo, including:

* [Characters](character-mod)
* [Character Animations](character-animation-mod)
* [Props](prop-mod)
* [Particles](particle-mod)
* [Environments](environment-mod)

Mods in Warudo are created using the **Warudo SDK**. A SDK is basically a fancy way of saying "a set of tools that help you create mods," in this case, our Unity project! Mods exported by the Warudo SDK have a `.warudo` file extension and can be recognized by Warudo when placed in the corresponding data folders. You can share your mod files with others directly, or upload to our [Steam Workshop](https://steamcommunity.com/app/2079120/workshop/) via the **Discover** tab.

![](/doc-img/en-mod-8.png)
<p class="img-desc">Browsing and sharing mods in the Discover tab.</p>

## Setup

Let's get started! First, make sure you have installed [Unity 2021.3.18f1](https://unity.com/). Newer or older versions of Unity are not supported, so please make sure you have the correct version installed.

If you have no experience with Unity, we recommend going through a few beginner tutorials to get familiar with the Unity editor. [Unity Learn](https://learn.unity.com/) is a great place to start!

There are two ways to set up the Warudo SDK in Unity: you can either download our modding project template, or manually import the SDK `.unitypackage` into your project. We recommend the first option, as it is easier and less error-prone. The second option is more suitable for updating an existing modding project.

### Option 1: Modding Project Template

Download the following project and extract the contents anywhere, say `C:\WarudoModding`.

<a href="/sdk/Warudo SDK 0.12.0 Modding Project.zip" target="_blank">
<div className="file-box">
<p>
Warudo SDK 0.12.0 Modding Project.zip
</p></div>
</a>

In Unity Hub, click on **"Add"** and select the mod project folder (such as `C:\WarudoModding`):

![](/doc-img/en-mod-9.png)

Then wait for Unity to launch the project. When you open the mod project for the first time, Unity can take 5-10 minutes to set up the project.

Check the console for any errors:

![](/doc-img/en-mod-10.png)

If there are none, you are all set! Now go ahead and [create your first mod](creating-your-first-mod).

:::tip
If you see errors in the console, try click on "Clear" to see if these errors can be removed. If you are still having trouble, please reach out to us on [Discord](https://discord.gg/warudo).
:::

### Option 2: Manual Installation

:::caution
You should only use this option if you are updating an existing modding project, or in the very rare case, the first option does not work for you.
:::

After opening the Unity project, open the `Packages/manifest.json` file under your Unity project folder (note that this file is not visible in the Unity editor) and add the following **9** dependencies in the `dependencies` section:

```
{
  "dependencies": {
    "com.unity.burst": "1.7.2",
    "com.unity.cinemachine": "2.8.9",
    "com.unity.collections": "1.4.0",
    "com.unity.postprocessing": "3.2.2",
    "com.unity.nuget.newtonsoft-json": "3.0.2",
    "com.vrmc.gltf": "https://github.com/vrm-c/UniVRM.git?path=/Assets/UniGLTF#v0.107.0",
    "com.vrmc.univrm": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRM#v0.107.0",
    "com.vrmc.vrmshaders": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRMShaders#v0.107.0",
    "com.cysharp.unitask": "https://github.com/Cysharp/UniTask.git?path=src/UniTask/Assets/Plugins/UniTask",
    // ...
```

Return to Unity and wait for the project to reload; make sure there are no errors.

:::caution
If you encounter an error with the message `An error occurred while resolving packages / Error adding package` and clicking on it reveals a message similar to `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`, it means that Git is not installed on your system.

![](/doc-img/en-mod-sdk-1.webp)

To resolve this issue, you need to download Git from [https://git-scm.com/download](https://git-scm.com/download) and then restart both Unity and Unity Hub.
:::

Confirm that the **Api Compatibility Level** in **File → Build Settings... → Player Settings... → Other Settings** is set to .NET Framework.

![](/doc-img/en-mod-sdk-2.webp)

Download the following `.unitypackage` and import it into your Unity project:

<a href="/sdk/Warudo SDK 0.12.0.unitypackage" target="_blank">
<div className="file-box">
<p>
Warudo SDK 0.12.0.unitypackage
</p></div>
</a>

:::caution
If you are importing into an **existing** project, and you have any of the following installed:

* [Animancer](https://assetstore.unity.com/packages/tools/animation/animancer-pro-116514)
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)
* [Final IK](https://assetstore.unity.com/packages/tools/animation/final-ik-14290)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)
* [PuppetMaster](https://assetstore.unity.com/packages/tools/physics/puppetmaster-48977)

Please uncheck the corresponding folders from import, or your components will be replaced by stub files:

* `Plugins/Animancer`
* `Packages/DynamicBone`
* `Plugins/RootMotion/FinalIK`
* `Plugins/MagicaCloth`
* `Plugins/RootMotion/PuppetMaster`
:::

Check the console for any errors. If there are none, you are all set! Now go ahead and [create your first mod](creating-your-first-mod).

:::tip
If you see errors in the console, try click on "Clear" to see if these errors can be removed. If you are still having trouble, please reach out to us on [Discord](https://discord.gg/warudo).
:::

## Custom Shaders {#custom-shaders}

You can use any shader that is compatible with Unity's built-in rendering pipeline, such as [lilToon](https://lilxyzw.github.io/lilToon/#/) and [Poiyomi Shader](https://www.poiyomi.com/).

[Warudo Pro](../pro.md) also supports the [Universal Render Pipeline](https://docs.unity3d.com/Manual/com.unity.render-pipelines.universal.html) (URP), which allows you to use URP-compatible shaders.

## Custom C# Scripts {#custom-scripts}

What makes Warudo mods unique is that they can include [C# MonoBehaviour scripts](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html), enabling you to add interactivity to your mods. For example, you can add a script to your character mod to animate your character's ears, or add a script to your environment mod to control the lighting. To interact with Warudo's built-in components, please refer to the [Scripting](../scripting/overview) section.

Any C# scripts placed in the mod folder will be compiled and included in the mod. You can attach these scripts to your character, prop, or environment just like how you would do in a normal Unity project.

However, please note the following limitations:

* [Assembly definitions (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) are not currently supported. C# scripts covered by the assembly definitions will not be packaged into the mod.
* [ScriptableObjects](https://docs.unity3d.com/ScriptReference/ScriptableObject.html) are not currently supported.
* Compiled DLLs are not currently supported. You can only include `.cs` source files.
* Any scripts that reference the `UnityEditor` namespace are not supported.

If you are including scripts in your mod, we recommend to set **Log Level** to All and uncheck **Clear Console On Build** in the Mod Settings window:

![](/doc-img/en-mod-13.png)

This provides more information when building the mod, so you can check the console for any errors. If you have checked scripts are placed in the mod folder but the build log states that no scripts are found so the compilation is skipped, it is likely that `.csproj` files were not generated correctly in your project. You need to click on **Edit → Preferences → External Tools** and click **Regenerate project files**:

![](/doc-img/en-mod-12.png)

Then, try building the mod again.

## Backing Up Your Modding Project

We recommend making a backup of your modding project regularly or use [Unity Version Control](https://unity.com/solutions/version-control). Especially, if you are creating mods regularly, you should back up the `Asset/Packages/UMod/ExportSettings.asset` file (note this file is not visible in the Unity editor). This file stores the mod export settings, such as the mod export directory and the mod icon. If you lose this file, you will need to manually create all your mods again.

:::caution
We have received reports that some users have lost their export setting after exporting a mod. This is currently under investigation. In the meantime, we recommend backing up the `ExportSettings.asset` file regularly.
:::
