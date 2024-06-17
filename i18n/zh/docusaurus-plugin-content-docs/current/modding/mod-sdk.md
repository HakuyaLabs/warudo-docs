---
sidebar_position: 0
---

# 简介

你可以使用 Unity + Warudo Mod SDK 制作 Mod，包括[角色](https://tira.gitbook.io/warudo/advanced/character-mod)、[角色动画](https://tira.gitbook.io/warudo/advanced/character-animation-mod)、[道具](https://tira.gitbook.io/warudo/advanced/prop-mod)、[环境](https://tira.gitbook.io/warudo/advanced/environment-mod)等，甚至可以编写 C# 插件，给 Warudo 添加新的资源类型和蓝图节点类型。

Mod SDK 导出的 Mod 后缀名为 `.warudo`，放在 Warudo 数据文件夹相应的子文件夹下即可被识别。

## 配置 SDK

要配置 SDK 你需要先安装好 Unity，详细步骤请查看：[Unity & Warudo SDK 安装](sdk-installation.md)

## 创建 Mod

要创建一个新的 Mod，菜单栏选择「Warudo」->「New Mod」：

![](/doc-img/en-mod-sdk-3.webp)

在 Mod Name 处给你的 Mod 起个名，再点击「Create Mod!」即可：

![](/doc-img/en-mod-sdk-4.webp)

你应该能看到 Assets 文件夹下创建了 Mod 数据文件夹：

![](/doc-img/en-mod-sdk-5.webp)

这样就可以开始制作 Mod 了！

## FAQ

> Q：Mod 可以使用自定义 Shaders（着色器）吗？

A：可以！不过请注意，Warudo 的 Steam 版本仅支持 Built-in（Legacy）管线，如有需求使用 URP/HDRP 管线，请联系我。

> Q：Mod 可以使用 C# 脚本（MonoBehavior）吗？

A：可以！以[环境 Mod](https://tira.gitbook.io/warudo/advanced/environment-mod)为例，在 GameObject 上放置的 MonoBehavior 脚本也会被打包进 Mod 里，在环境加载后即会被激活（`Awake()`）。

不过，要留意以下限制：

* 暂不支持 [Assembly Definitions (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html)。被涵盖在 Assembly Definition 里的 C# 脚本不会导出到 Mod 里。
* 暂不支持 [ScriptableObject](https://docs.unity3d.com/ScriptReference/ScriptableObject.html)。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
}} />