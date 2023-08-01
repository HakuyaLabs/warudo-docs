# Mod SDK

By using Unity + Warudo Mod SDK, you can create mods including [characters](character-mod.md), [character animations](character-animation-mod.md), [props](prop-mod.md), [environments](environment-mod.md), and even [write C# plugins](#user-content-fn-1)[^1] to add new resource types and blueprint node types to Warudo.

The mods exported by the Mod SDK have a `.warudo` extension and can be recognized by Warudo when placed in the corresponding subfolder of the Warudo data folder.

## Setup

First, make sure you have installed [Unity 2021.3.18f1](https://unity.com/).

### **Option 1 (NEW): Download our mod project template**

Download the following project and extract the contents anywhere, say `C:\WarudoModding`.

{% file src="/images/Warudo SDK 0.10.0 Mod Project.zip" %}

In Unity Hub, click on **"Open"** and select the mod project folder (such as `C:\WarudoModding`). Then wait for Unity to launch the project.

<div className="hint hint-info">
When you open the mod project for the first time, Unity can take 5-10 minutes to download dependencies and set up the project.
</div>

Check the console for any errors. If there are none, you are all set! Now you may [create your first mod.](mod-sdk.md#creating-your-first-mod)

<div className="hint hint-success">
If you see some errors, keep in mind that some "errors" are really just warnings that can be cleared. Try click on "Clear" to see if these errors can be removed.
</div>

### **Option 2: Manually import Mod SDK into your project**

You can also import Warudo Mod SDK into an existing Unity project, but we **strongly recommend creating a new project instead, and copying assets from your old projects to the new project.** Mod SDK may override many of your project's settings (e.g. tags, layers, quality levels) which may be undesired.

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

<div className="hint hint-warning">
If you encounter an error with the message `An error occurred while resolving packages / Error adding package` and clicking on it reveals a message similar to `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`, it means that Git is not installed on your system.

![](</images/image(8)(1)(1)(1).jpg>)\
\
To resolve this issue, you need to download Git from [https://git-scm.com/download](https://git-scm.com/download) and then restart both Unity and Unity Hub.
</div>

Confirm that the "Api Compatibility Level" in "File -> Build Settings... -> Player Settings... -> Other Settings" is set to .NET Framework.

<figure><img src="/images/image(40).jpg" alt="" /><figcaption></figcaption></figure>

Download the SDK and import it into your Unity project, either by creating a new project or using an existing one.

{% file src="/images/WarudoSDK 0.10.0.unitypackage" %}

<div className="hint hint-warning">
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

</div>

Check the console for any errors. If there are none, you are all set! Now you may [create your first mod.](mod-sdk.md#creating-your-first-mod)

<div className="hint hint-success">
If you see some errors, keep in mind that some "errors" are really just warnings that can be cleared. Try click on "Clear" to see if these errors can be removed.
</div>

## Creating Your First Mod

To create a new Mod, go to the menu bar and select "Warudo" -> "New Mod":

![](https://user-images.githubusercontent.com/3406505/181208455-9ab46a52-4edd-401c-807e-2d2d6ae24eec.png)

Give your mod a name, and click "Create Mod!" to create it:

![](https://user-images.githubusercontent.com/3406505/181208739-8916bccd-a669-4f48-aa41-3baf61670ef4.png)

You should be able to see that a folder for your mod has been created under the Assets folder:

![](https://user-images.githubusercontent.com/3406505/181209065-a63e4ba1-005a-45d3-853c-3aa4013f66a5.png)

Now you can start creating mods! How does a [prop mod](prop-mod.md) sound?

## FAQ

> Q: Can I use custom shaders?

A: Yes! However, please note that Warudo's Steam version only supports the built-in (legacy) rendering pipeline. If you need to use the URP/HDRP pipeline, please contact [tiger@warudo.app](mailto:tiger@warudo.app).

> Q: Can I use C# scripts?

A: Yes! For example, in an [environment mod](environment-mod.md), the `EnvironmentSettings` script placed in the scene will be exported and packaged into the mod and will be activated (`Awake()`) when the environment is loaded. Another example would be a custom C# script put on your [character mod](character-mod.md) to animate your character's ears.

However, please note the following limitations:

* [Assembly definitions (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) are not currently supported. C# scripts covered by the assembly definitions will not be packaged into the mod.
* [ScriptableObjects ](https://docs.unity3d.com/ScriptReference/ScriptableObject.html)are not currently supported.

[^1]: Pending documentation.
