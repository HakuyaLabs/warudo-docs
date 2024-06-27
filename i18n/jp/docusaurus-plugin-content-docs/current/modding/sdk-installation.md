---
sidebar_position: 1
---

# Unity & Warudo SDK Installation

This page will guide you to install the **Unity Editor** and the **Warudo SDK** step by step.

---

:::info

Currently only **64-bit Windows** systems are supported.

:::

## Step 1 - Install Unity Hub

Firstly, you need to download **Unity Hub** (usually the latest version is OK).  
Unity Hub is a software used to manage different versions of the Unity Editor and projects at these different versions.

Open the [**Unity official website**](https://unity.com/download) and click one of the two red boxes in the image below to download Unity Hub. Downloading may require registering a Unity account.

![](/doc-img/sdk-installation-13.png)

Run the downloaded UnityHubSetup.exe and install it to your preferred path.  
After installation, confirm that it can be opened correctly.

![](/doc-img/sdk-installation-2.png)

After logging in, it will automatically suggest you download the latest Long-Term Support (LTS) version of the Unity Editor,  
Warudo does not use this version, it is recommended to click **Skip installation**.

But if you do indeed want to install that version, we strongly recommended you to change the installation path to `...\<version>` (for example, `D:\Softwares\Unity\2022.3.17f1`),  
to more conveniently manage **multiple versions** of the Unity Editor,  
and **not** to use the default installation path `C:\Program Files\Unity\Hub\Editor`.

![](/doc-img/sdk-installation-3.png)

If you meet the terms for Unity's Personal Edition, you can choose to activate and obtain a personal license here.

![](/doc-img/sdk-installation-4.png)

If you skipped activation in the previous step or activation failed, you can also manually activate the license later in Unity Hub.

![](/doc-img/sdk-installation-5.png)

![](/doc-img/sdk-installation-6.png)

![](/doc-img/sdk-installation-7.png)

You can change the language of Unity Hub in 【Preferences】-【Appearance】.

![](/doc-img/sdk-installation-8.png)

## Step 2 - Install Unity Editor

Next, you need to download the installer of Unity Editor, and the version must strictly be **Unity 2021.3.18f1**.

This version cannot be downloaded directly via Unity Hub, you need to:

1. Go to [Unity Download Archive](https://unity.com/releases/editor/archive);
2. Under the **【Unity 2021.X】** tab, find 【Unity **2021.3.18** (February 1, 2023)】;
3. Click on 【Downloads (Win)】;
4. Select **【Unity Editor (64-bit)】**;
5. Wait for 【 `UnitySetup 64-2021.3.18f1.exe` 】 to finish downloading (approximately 2.3 GiB);

![](/doc-img/sdk-installation-9.png)

Next, run `UnitySetup 64-2021.3.18f1.exe` to start the installation.

The default installation location is `C:\Program Files\Unity 2021.3.18f1`, you may change it, but it is recommended to **contain the version number in the path** to avoid version conflicts.

The installation will take a long time, please be patient.

After installation, you need to:

1. Open Unity Hub;
2. Click on 【Installs】-【Locate】;
3. Find the installation path you selected earlier, then enter the 【Editor】 subfolder, and find 【Unity.exe】;
4. After selecting, click on 【Select Editor】.

At this point, `2021.3.18f1` version of Unity.exe will be correctly displayed in Unity Hub.

![](/doc-img/sdk-installation-10.png)

## Step 3 - Download & Import Warudo SDK

There are two ways to set up the Warudo SDK in Unity: 

- Download our modding project template, 
- Manually import the SDK `.unitypackage` into your project. 

We recommend the first option, as it is easier and less error-prone.  
The second option is more suitable for updating an existing modding project.

### Option 1: Modding Project Template (Recommended)

[Warudo SDK 0.12.0 Modding Project.zip](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0%20Modding%20Project.zip)

1. **Download** the zip package file above and **Extract** the contents anywhere, say `D:\Softwares\Unity\2022.3.17f1\Projects\WarudoModding`.
2. In Unity Hub, click on **"Add"** and select the folder above.
3. Then wait for Unity to launch the project. When you open the mod project for the first time, Unity can take 5-10 minutes to set up the project.

![](/doc-img/en-mod-9.png)

Check the console for any errors, a few warnings may appear, which is normal:

![](/doc-img/en-mod-10.png)

If there are no errors, you are all set! Now go ahead and [create your first mod](creating-your-first-mod).

:::tip

If you see errors in the console, try click on "Clear" to see if these errors can be removed. If you are still having trouble, please reach out to us on [Discord](https://discord.gg/warudo).

:::

### Option 2: Manual Installation (Not recommended)

:::caution

You should only use this option if you are **updating an existing modding project**, or in the very rare case, the first option does not work for you.

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

If you encounter an error with the message `An error occurred while resolving packages / Error adding package` clicking on it reveals a message similar to `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`, it means that Git is not installed on your system.

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

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
