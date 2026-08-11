---
sidebar_position: 1
translate_from_version: 2026-08-11
---

# Unity & Warudo SDK 安装

该页面将引导你逐步安装 **Unity Editor** 和 **Warudo SDK**。

---

:::info

目前仅支持 **64 位 Windows** 系统。

:::

:::note

Unity 官网 与 Unity Hub 的界面会随版本更新，因此部分按钮名称和位置可能与本页截图略有不同。

:::

## Step 1 - 安装 Unity Hub

首先，你需要下载 **Unity Hub**（一般最新版本即可）。  
Unity Hub 是用于管理不同版本的 Unity Editor 和不同版本的项目的软件。

打开 [**Unity 官网**](https://unity.com) 可在下图中两个红框处选一点击，下载可能需要注册 Unity 帐号。

![](/doc-img/zh-doc-img/zh-sdk-installation-1.png)

运行下载好的 UnityHubSetup.exe，安装到你习惯的路径。  
安装完毕后，确认可以正确打开。

![](/doc-img/sdk-installation-2.png)

登录后会自动建议你下载最新的长期支持版本 (Long-Term Support, LTS) Unity Editor，  
Warudo 不使用该版本，建议点击 **Skip installation**。  

但是如果你确实想要安装该版本，我们强烈建议你将安装路径更改为 `...\<版本号>` （例如 `D:\Softwares\Unity\2021.3.18f1`），  
更方便后续管理**多版本**的 Unity Editor，  
而**不要**使用默认的安装路径 `C:\Program Files\Unity\Hub\Editor` 。

![](/doc-img/sdk-installation-3.png)

如果你满足 Unity 的 Personal Edition 条款，可以在此处选择激活并获取个人版许可证。

![](/doc-img/sdk-installation-4.png)

如果你在上一步跳过了激活或者激活失败，也可以后续在 Unity Hub 中手动激活许可证。

![](/doc-img/sdk-installation-5.png)

![](/doc-img/sdk-installation-6.png)

![](/doc-img/sdk-installation-7.png)

你可以在【偏好设置 (Preferences)】-【外观 (Appearance)】中更改 Unity Hub 的语言。

![](/doc-img/sdk-installation-8.png)

## Step 2 - 安装 Unity Editor

接下来，你需要下载 Unity Editor 的安装包，且版本必须严格为 **2021.3.45f2** 。

此特定补丁版本是与 Warudo SDK 兼容所必需的，不可替代。安装方法如下：

1. 前往 [Unity Download Archive](https://unity.com/releases/editor/archive) ；
2. 在 **【2021】** 选项卡 下，找到版本【**2021.3.45f2** (2025年10月3日)】 ；
3. 点击 【INSTALL】；
![](/doc-img/sdk-installation-9.png)
4. 浏览器会尝试打开 Unity Hub，选择“打开Unity Hub”；
5. 在打开的 Unity Hub 窗口中，点击“继续”，然后点击“安装”；
6. 安装过程可能需要较长时间，请耐心等待。

**如果 `4.` 失败，或者你希望手动安装，请返回 `2.`，然后：**

3. 点击“See all”；
4. 点击“Windows”下载安装程序（文件名类似于 `UnitySetup64-2021.3.45f2.exe`，大小约为 3-4 GiB）；
![](/doc-img/sdk-installation-13.png)
5. 运行下载的安装程序开始安装。  
默认安装位置可能是 `C:\Program Files\Unity 2021.3.45f2`；你可以更改安装位置，但我们建议在路径中包含版本号（例如 `D:\Softwares\Unity\2021.3.45f2`），以便在管理多个 Unity 版本时避免混淆。
安装过程可能需要较长时间，请耐心等待。
6. 安装完成后：打开 Unity Hub；
7. 点击【安装 (Installs)】-【选择位置 (Locate)】；
8. 找到刚才选择的安装路径，然后进入【Editor】子文件夹，找到【Unity.exe】；
9. 选择后点击【选择编辑器 (Select Editor)】。

完成以上步骤后，所需的 Unity 版本（2021.3.45f2）应该会出现在 Unity Hub 中。

:::warning

如果你发现安装到的版本带有 `c1` 后缀，代表你下载到了地区版本，但该区别通常不会影响使用。  
你可以尝试使用上文的 `exe` 安装方法进行安装避免该版本。

:::

![](/doc-img/sdk-installation-10.png)

## Step 3 - 下载并导入 Warudo SDK

在 Unity 中设置 Warudo SDK 有两种方法：

- 使用 Unity Package Manager 导入
- 下载我们的模组项目模板

我们推荐第一个选项，因为它可以轻易保持你的工程与 Warudo Mod SDK 的最新版本同步。  
如果你与 GitHub 之间连接不佳，可以尝试使用第二个选项。

### 方法一 使用 Unity Package Manager 导入（推荐）

:::tip

使用该方法可以保持你的工程与 Warudo Mod SDK 的最新版本同步。

:::

首先，需要确认 **File → Build Settings... → Player Settings... → Other Settings** 中的 **Api Compatibility Level** 被设置为 `.NET Framework`，并将 **Assembly Version Validation** 取消选中。
(该设置也可以通过 **Edit → Project Settings → Player → Other Settings** 到达)

![](/doc-img/en-mod-sdk-2.webp)

打开 Unity 项目后，点击菜单栏上的 **Window → Package Manager** 。在 Package Manager 窗口中，点击左上角的 **+** 按钮，选择 **Add package from git URL...** 。
在弹出的对话框中，输入以下 URL：

```
https://github.com/HakuyaLabs/Warudo-Mod-Tool.git#upm/latest
```

如果你无法稳定访问 GitHub，也可以下载 tarball：

<div className="file-box">
<a href="/sdk/Warudo-Mod-Tool-0.14.5.1.tgz" target="_blank">Warudo-Mod-Tool-0.14.5.1.tgz</a>
</div>

然后改用 **Add package from tarball...** 导入。

点击 **Add**，Unity 将下载并安装该包。如果 Unity 询问是否处理预构建包或转换，请选择 **Yes**，然后等待导入完成。

:::warning

如果看到类似 `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub` 的错误，说明系统中尚未安装 Git。请从 [Git 官方网站](https://git-scm.com/download)安装 Git，然后重新启动 Unity 和 Unity Hub。
![](/doc-img/en-mod-sdk-1.webp)

:::

:::tip

如果你通过 Package Manager 安装了 Warudo SDK，请选中该包并点击 **Update**，即可升级到最新版本。

:::

### 方法二：模组项目模板

[Warudo SDK 0.14.5.1 Modding Project.zip](https://files.warudo.app/modsdk/Warudo%20SDK%200.14.5.1%20Modding%20Project.zip)

1. 下载上述 zip 并解压到一个文件夹中（例如 `D:\Softwares\Unity\2021.3.45f2\Projects\WarudoModding`）。
2. 在 Unity Hub 中点击 **Add**（或 **Open**），然后选择该文件夹。
3. 打开项目。Unity 首次导入资源时可能需要几分钟。

项目加载完成后，检查 Console 中是否存在错误（出现少量警告是正常的）。如果没有错误，说明 SDK 已正确安装，你可以开始创建第一个模组。

![](/doc-img/sdk-installation-11.png)

:::tip

如果 Console 中存在错误，请点击 **Clear** 后重新检查。如果问题仍然存在，请通过 [Discord](https://discord.gg/warudo) 或 QQ 频道联系我们。

:::

:::warning

如果将 SDK 导入一个**现有项目**，而该项目已经包含以下任一资源，请在导入时取消选择对应文件夹，以免它们被存根文件替换：

- [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) → `Packages/DynamicBone`
- [Final IK](https://assetstore.unity.com/packages/tools/animation/final-ik-14290) → `Plugins/RootMotion/FinalIK`
- [PuppetMaster](https://assetstore.unity.com/packages/tools/physics/puppetmaster-48977) → `Plugins/RootMotion/PuppetMaster`

:::

如果所有内容均已成功导入且没有错误，你可以开始[创建第一个模组](creating-your-first-mod)。

---

## 版本历史

### Warudo SDK 0.14.5.1（最新）

- Unity Version: **2021.3.45f2** (Oct 3, 2025)
- Unity Package (Tarball): [Warudo-Mod-Tool-0.14.5.1.tgz](https://docs.warudo.app/sdk/Warudo-Mod-Tool-0.14.5.1.tgz)
- Unity Project: [Warudo SDK 0.14.5.1 Modding Project.zip](https://files.warudo.app/modsdk/Warudo%20SDK%200.14.5.1%20Modding%20Project.zip)

### Warudo SDK 0.14.3.10

- Unity Version: **2021.3.45f2** (Oct 3, 2025)
- Unity Package (Tarball): [Warudo-Mod-Tool-0.14.3.10.tgz](https://docs.warudo.app/sdk/Warudo-Mod-Tool-0.14.3.10.tgz)
- Unity Project: [Warudo SDK 0.14.3.10 Modding Project.zip](https://files.warudo.app/modsdk/Warudo%20SDK%200.14.3.10%20Modding%20Project.zip)

### Warudo SDK 0.12.0

- Unity Version: **2021.3.18f1** (Feb 1, 2023)
- Unity Package (File): [Warudo SDK 0.12.0.unitypackage](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0.unitypackage)
- Unity Project: [Warudo SDK 0.12.0 Modding Project.zip](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0%20Modding%20Project.zip)


<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'},
    {name: 'LiYin', github: 'cubesky'},
  ],
  translators: [
    {name: 'Hane', github: 'hanekit'},
  ],
}} />
