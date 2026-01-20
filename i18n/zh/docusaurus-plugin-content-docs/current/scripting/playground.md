---
sidebar_position: 50
translate_from_version: 2024-06-18
---

# Playground

在 Warudo 中，Playground 是一个允许你加载自定义脚本，而无需创建 [插件 Mod](plugin-mod) 的开发环境。Warudo 会自动编译并加载放置在 `Playground` 文件夹中的 C# 脚本 (`.cs` 文件)，并且对脚本的任何更改也会自动重新加载。

:::tip
查看我们的 [创建你的第一个脚本](creating-your-first-script) 教程来开始尝试 Playground！
:::

你可以在 Playground 中放入任何 C# 脚本，但为了让 Warudo 识别，需要存在至少一个继承于 [实体 (Entities)](api/entities.md) 的类，即一个 `Node`、`Asset` 或 `Plugin`。

## 环境设置

IDE 对于 Playground 并不是必需的，但是我们建议使用 IDE 以进行代码补全和语法高亮。例如 [JetBrains Rider](https://www.jetbrains.com/rider/) 或 [Visual Studio Code](https://code.visualstudio.com/)。

然后，下载 [这个](/scripts/Playground.csproj) `.csproj` 文件并将其放入你 Warudo 数据文件夹中的 `Playground` 目录中 (菜单 → 打开数据文件夹)。再使用你的 IDE 打开该文件，就可以开始了！

## 实体热重载

热重载通过序列化实体数据，卸载旧实体类型，加载和实例化新的实体类型，然后反序列化旧实体数据来工作。这个过程通常只需要几秒钟。

当热重载完成时，你应该看到一个弹窗消息，指示有多少资源、节点或插件被重载。

:::tip
如果你看到 Error，你可以点击弹窗消息以查看具体的编译报错信息。
:::

## 限制

Playground 有以下限制：

*  在 Playground 脚本中，你不能（很容易地）使用第三方 DLL 或 NuGet 包。我们将会在未来改进这一点。
*  在 Playground 脚本中，你不能添加或引用 Unity 资源（例如：预制件、材质、纹理）。要实现这一点，请使用 [插件 Mod](plugin-mod) 代替)。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'Hane', github: 'hanekit'}
  ],
}} />
