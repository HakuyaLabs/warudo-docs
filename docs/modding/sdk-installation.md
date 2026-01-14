---
sidebar_position: 1
version: 2026-01-14
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

![](/doc-img/en-sdk-installation-1.png)

Run the downloaded UnityHubSetup.exe and install it to your preferred path.  
After installation, confirm that it can be opened correctly.

![](/doc-img/sdk-installation-2.png)

After logging in, it will automatically suggest you download the latest Long-Term Support (LTS) version of the Unity Editor,  
Warudo does not use this version, it is recommended to click **Skip installation**.

But if you do indeed want to install that version, we strongly recommended you to change the installation path to `...\<version>` (for example, `D:\Softwares\Unity\2021.3.18f1`),  
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

Next, you need to download the installer of Unity Editor, and the version must strictly be **2021.3.45f2**.

This specific patch release is required for compatibility with the Warudo SDK and cannot be substituted. To install it:

1. Go to [Unity Download Archive](https://unity.com/releases/editor/archive);
2. Under the **2021** tab, find Version **2021.3.45f2 (Oct 3, 2025)**;
3. Click **INSTALL**;
![](/doc-img/sdk-installation-9.png)
4. The browser will try to open your Unity Hub, choose **Open**;
5. In the opened Unity Hub window, click **Continue**, then click **Install**;
6. The installation can take a long time, please be patient.

**If `4.` failed or you want to install it manually, back to `2.` , then:**

3. Click **See all**;
4. Click **Windows** to download the installer (file name similar to `UnitySetup64-2021.3.45f2.exe`, ~3–4 GiB);
![](/doc-img/sdk-installation-13.png)
5. Run the downloaded installer to start installation.  
The default installation location may be `C:\Program Files\Unity 2021.3.45f2`; you may change it, but we recommend including the version number in the path (for example `D:\Softwares\Unity\2021.3.45f2`) to avoid confusion when managing multiple Unity versions.  
The installation can take a long time, please be patient.
6. After installation:  Open Unity Hub;
7. Go to **Installs → Locate**;
8. Browse to the editor folder you installed and select `Unity.exe` inside the `Editor` subfolder;
9. Click **Select Editor**.

After the above steps, the required Unity version (2021.3.45f2) should now appear in Unity Hub.

![](/doc-img/sdk-installation-10.png)


## Step 3 - Download & Import Warudo SDK

There are two ways to set up the Warudo SDK in Unity:

- Use the Unity Package Manager to import the package (recommended)
- Download our modding project template

We strongly recommend the Package Manager method because it makes it easy to keep your project in sync with the latest Warudo Mod SDK releases. If your connection to GitHub is unreliable, you can fall back to the template project.

### Method A — Unity Package Manager (recommended)

Before installation, confirm **File → Build Settings... → Player Settings... → Other Settings → Api Compatibility Level** is set to **.NET Framework**, and **Assembly Version Validation** is unchecked.  
(This page is also accessible via **Edit → Project Settings → Player → Other Settings**)

![](/doc-img/en-mod-sdk-2.webp)

Open your Unity project, then choose **Window → Package Manager**. In the Package Manager window click the **+** button (top-left) and choose **Add package from git URL...**. Enter the following URL:

```
https://github.com/HakuyaLabs/Warudo-Mod-Tool.git#0.14.3.5
```

If you cannot access GitHub reliably, you can download a tarball:

<div className="file-box">
<a href="/sdk/Warudo-Mod-Tool-0.14.3.5.tgz" target="_blank">Warudo-Mod-Tool-0.14.3.5.tgz</a>
</div>

and use **Add package from tarball...** instead.

Click **Add** and Unity will download and install the package. If Unity prompts about prebuilt packages or conversion, choose **Yes** and wait for the package to import.

:::caution

If you see an error like `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`, then Git is not installed on your system. Install Git from https://git-scm.com/download, then restart Unity and Unity Hub.  
![](/doc-img/en-mod-sdk-1.webp)

:::

### Method B — Modding Project Template

[Warudo SDK 0.14.3.5 Modding Project.zip](https://files.warudo.app/modsdk/Warudo%20SDK%200.14.3.5%20Modding%20Project.zip)

1. Download and extract the above zip to a folder (for example `D:\Softwares\Unity\2021.3.45f2\Projects\WarudoModding`).
2. In Unity Hub click **Add** (or **Open**) and select that folder.
3. Open the project. Unity may take several minutes to import assets on the first run.

When the project finishes loading, check the Console for any Errors (a few Warnings are normal). If there are no Errors, the SDK is installed correctly and you're ready to create your first mod.

![](/doc-img/sdk-installation-11.png)

:::tip

If you see Errors in the Console, try clicking **Clear** and re-checking. If problems persist, please contact us on [Discord](https://discord.gg/warudo) or the community channels.

:::

:::caution

If you import the SDK into an **existing** project that already contains any of the following assets, uncheck the corresponding folders during import to avoid replacing them with stub files:

- Dynamic Bones → `Packages/DynamicBone`
- Final IK → `Plugins/RootMotion/FinalIK`
- PuppetMaster → `Plugins/RootMotion/PuppetMaster`

:::

If everything imported without Errors, you can start with [creating your first mod](creating-your-first-mod).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'hanekit', github: 'hanekit'}
  ],
  translators: [
  ],
}} />
