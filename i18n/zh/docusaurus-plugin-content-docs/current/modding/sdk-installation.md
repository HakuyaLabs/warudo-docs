---
sidebar_position: 1
---

# Unity & Warudo SDK 安装

该页面将引导您逐步安装 **Unity Editor** 和 **Warudo SDK**。

---

:::info

目前仅支持 **64 位 Windows** 系统。

:::

## Step 1 - 安装 Unity Hub

首先，你需要下载 **Unity Hub**（一般最新版本即可），  
Unity Hub 是用于管理不同版本的 Unity Editor 和不同版本的项目的软件。

打开 [**Unity 官网**](https://unity.com/cn/download) 可在下图中两个红框处选一点击，下载可能需要注册 Unity 帐号。

![](/doc-img/sdk-installation-1.png)

运行下载好的 UnityHubSteup.exe，安装到你习惯的路径。  
安装完毕后，确认可以正确打开。

![](/doc-img/sdk-installation-2.png)

登录后会自动建议你下载最新的长期支持版本 (Long-Term Support, LTS) Unity Editor，  
Warudo 不使用该版本，建议点击 **Skip installation**。  

但是如果你确实想要安装该版本，也强烈建议将安装路径更改为 `...\<版本号>` （例如 `D:\Softwares\Unity\2021.3.18f1`），  
更方面后续管理**多版本**的 Unity Editor，  
而**不要**使用默认的安装路径 `C:\Program Files\Unity\Hub\Editor` 。

![](/doc-img/sdk-installation-3.png)

如果你满足 Unity 的 Person Edition 条款，可以在此处选择激活并获取个人版许可证。

![](/doc-img/sdk-installation-4.png)

如果你在上一步跳过了激活或者激活失败，也可以后续在 Unity Hub 中手动激活许可证。

![](/doc-img/sdk-installation-5.png)

![](/doc-img/sdk-installation-6.png)

![](/doc-img/sdk-installation-7.png)

你可以在【偏好设置 (Preferences)】-【外观 (Appearance)】中更改 Unity Hub 的语言。

![](/doc-img/sdk-installation-8.png)

## Step 2 - 安装 Unity Editor

接下来，你需要下载 Unity Editor 的安装包，且版本必须严格为 **Unity 2021.3.18f1** 。

该版本不能使用 Unity Hub 直接下载，你需要：

1. 前往 [Unity Download Archive](https://unity.com/releases/editor/archive) ；
2. 在 **【Unity 2021.X】** 选项卡 下，找到【Unity **2021.3.18** (February 1, 2023)】 ；
3. 点击 【Downloads (Win)】；
4. 选择 **【Unity Editor (64-bit)】**；
5. 等待【 `UnitySteup 64-2021.3.18f1.exe` 】下载完成 （大小约 2.3 GiB）；

![](/doc-img/sdk-installation-9.png)

接下来，运行 `UnitySteup 64-2021.3.18f1.exe` 开始安装。

此时默认安装位置为 `C:\Program Files\Unity 2021.3.18f1`，你可以自行修改，但是建议在路径中**保留版本号**，以避免版本冲突。

该安装会消耗较长时间，请耐心等待。

安装完毕后，你需要：

1. 打开 Unity Hub；
2. 点击【安装 (Installs)】-【选择位置 (Locate)】；
3. 找到刚才选择的安装路径，然后进入【Editor】子文件夹，找到【Unity.exe】；
4. 选择后点击【选择编辑器 (Select Editor)】。

此时，在 Unity Hub 中便能正确地显示出 `2021.3.18f1` 版本的 Unity.exe

![](/doc-img/sdk-installation-10.png)


## Step 3 - 下载并导入 Warudo SDK

在 Unity 中设置 Warudo SDK 有两种方法：

- 下载我们的模组项目模板；
- 手动将 SDK .unitypackage 导入到您的项目中。

我们推荐第一个选项，因为它更容易且不易出错。  
第二个选项更适合更新现有的 modding 项目。

### 方法一 直接导入模板项目（推荐）

[Warudo SDK 0.12.0 Modding Project.zip](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0%20Modding%20Project.zip)

1. **下载** 以上项目压缩包并将内容 **解压** 到自定义位置，例如 `D:\Softwares\Unity\2021.3.18f1\Projects\WarudoModding` ；
2. 打开 【Unity Hub】，在【Projects】中选择【Open】；
3. 找到刚才解压出来的文件夹并且打开，点击【Open】；
4. 此时，【Warudo SDK 0.12.0 Modding Project】就会出现在 Projects 列表中，并且分配正确的版本号；  
（如果此时在版本号右侧出现了黄色感叹号，说明项目存在问题，建议重新检查第二步是否安装了**完全一致**的版本号。）
6. Unity 此时可能会自动开始打开该项目，第一次打开可能会进行 Importing，会消耗一段时间，请耐心等待。

![](/doc-img/sdk-installation-11.png)

成功打开之后，顶部会出现【Warudo】选项卡，Assets 文件夹中会出现【Warudo】和【Warudo SDK】文件夹。

点击打开下方通知栏，可能会出现少数【warning】，是正常现象。但是请检查是否存在【Error】。

![](/doc-img/sdk-installation-12.png)

如果没有 Error，那么一切都准备好了！你可以开始 [创建你的第一个模组](creating-your-first-mod) 了！

:::tip

如果您在控制台中看到 Error，请尝试单击 “Clear” 以查看是否可以删除这些错误。  
如果仍然存在问题，请通过 [Discord](https://discord.gg/warudo) 或者 QQ 频道 与我们联系。

:::

### 方法二 手动导入 `*.unitypackage` （不推荐）

:::caution

仅当您要**更新现有模组项目**时才应使用此选项，或者在极少数方法一不适合您的情况下。

:::

打开 Unity 项目后，打开 Unity 项目文件夹下的 `Packages/manifest.json` 文件（注意，该文件在 Unity 编辑器中不可见），并在 `dependencies` 部分添加以下 **9** 个依赖项：

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

返回 Unity 并等待项目重新加载；确保没有 errors 。

:::caution

如果您遇到消息错误 `An error occurred while resolving packages / Error adding package`，
单击它会显示类似以下内容的消息： 
`No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`，
这意味着您的系统上尚未安装 Git。
![](/doc-img/en-mod-sdk-1.webp)
要解决此问题，您需要从 https://git-scm.com/download 下载 Git，然后重新启动 Unity 和 Unity Hub。

:::

确认 **File → Build Settings... → Player Settings... → Other Settings** 中的 **Api Compatibility Level** 被设置为 `.NET Framework`。

![](/doc-img/en-mod-sdk-2.webp)

下载以下 `.unitypackage` 并将其导入到您的 Unity 项目中：

<a href="/sdk/Warudo SDK 0.12.0.unitypackage" target="_blank">
<div className="file-box">
<p>
Warudo SDK 0.12.0.unitypackage
</p></div>
</a>

:::caution

如果您要导入到**已经存在**的项目安装了以下任一项：

* [Animancer](https://assetstore.unity.com/packages/tools/animation/animancer-pro-116514)
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)
* [Final IK](https://assetstore.unity.com/packages/tools/animation/final-ik-14290)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)
* [PuppetMaster](https://assetstore.unity.com/packages/tools/physics/puppetmaster-48977)

请取消选中导入的相应文件夹，否则您的组件将被 stub files 替换：

* `Plugins/Animancer`
* `Packages/DynamicBone`
* `Plugins/RootMotion/FinalIK`
* `Plugins/MagicaCloth`
* `Plugins/RootMotion/PuppetMaster`

:::

点击打开下方通知栏，检查是否存在【Error】。

![](/doc-img/sdk-installation-12.png)

如果没有，那么一切都准备好了！你可以开始 [创建你的第一个模组](creating-your-first-mod) 了！

:::tip

如果您在控制台中看到 Error，请尝试单击 “Clear” 以查看是否可以删除这些错误。  
如果仍然存在问题，请通过 [Discord](https://discord.gg/warudo) 或者 QQ 频道 与我们联系。

:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'hanekit', github: 'hanekit'}
  ],
  translators: [
    {name: 'hanekit', github: 'hanekit'}
  ],
}} />