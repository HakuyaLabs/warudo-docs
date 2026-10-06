---
sidebar_position: 5
version: 2024-06-14
---

# 创建你的第一个 Mod

让我们来创建你的第一个 Mod！
在本教程中，我们将创建一个简单的白色立方体 [道具 Mod](prop-mod)。

:::info
开始之前，请确保你已经设置好了 [Warudo SDK](mod-sdk.md)。
:::

如果你没有使用 Unity 的经验，我们建议你先学习一些入门教程，以熟悉 Unity 编辑器。[Unity Learn](https://learn.unity.com/) 是一个很好的起点！

:::tip
第一次创建 Mod 可能会让人有些不知所措。如果你需要帮助，欢迎在 [Discord](https://discord.gg/warudo) 上联系我们！
:::


## 教程

要创建一个新的 Mod，请在菜单栏中选择 **Warudo → New Mod**：

![](/doc-img/en-mod-sdk-3.webp)

在 **Mod Name** 中输入“WhiteCube”，然后点击“Create Mod!”：

![](/doc-img/en-mod-1.png)

此时，你应该会看到 Assets 文件夹下刚刚创建了一个属于你的 Mod 的文件夹：

![](/doc-img/en-mod-2.png)

这个与 Mod 同名的文件夹称为 **Mod 文件夹**。
:::tip
请记住，**Mod 所需的所有资源（例如预制件、着色器和材质）以及脚本都应该放在 Mod 文件夹中。** 如果将它们放在 Mod 文件夹之外，它们将不会被包含在 Mod 中。
:::

接下来，让我们在场景中创建一个立方体。在菜单栏中选择 **GameObject → 3D Object → Cube**：

![](/doc-img/en-mod-3.png)

要将立方体导出为 Mod，我们必须在 Mod 文件夹中创建一个预制件。选中场景中的立方体，将其拖到 Mod 文件夹中以创建预制件。创建出的预制件图标是一个蓝色立方体：

![](/doc-img/en-mod-4.png)

Warudo 需要知道你正在创建哪种类型的 Mod。由于我们正在创建道具 Mod，因此需要将预制件重命名为“Prop”。右键点击预制件，然后选择 **Rename**：

![](/doc-img/en-mod-5.png)

我们快完成了！导出 Mod 之前，让我们检查一下 Mod 设置是否正确。选择 **Warudo → Mod Settings** 打开 Mod 设置窗口。在这里，你可以设置 Mod 的名称、版本、作者和描述。你还可以指定一个 Mod 图标，该图标会显示在 Warudo 的预览库中。

![](/doc-img/en-mod-6.png)

默认情况下，**Mod Export Directory** 为空；在这种情况下，Mod 将被导出到项目的根文件夹。通常，将它设置为对应的 Warudo 数据文件夹会更加方便，这样导出后就可以立即在 Warudo 中测试你的 Mod！

在 Warudo 中选择 **Menu → Open Data Folder**，打开数据文件夹。然后复制数据文件夹的路径，并将其粘贴到 **Mod Export Directory** 字段中。由于我们正在创建道具 Mod，因此需要在路径末尾添加 `\Props`。例如，如果数据文件夹是 `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets`，那么 **Mod Export Directory** 应设置为 `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Props`。

:::tip
同样地，如果你正在创建角色 Mod，就应该将 **Mod Export Directory** 设置为 `Characters` 数据文件夹，以此类推。
:::

最后，选择 **Warudo → Build Mod** 导出 Mod。Mod 导出后，你应该会在 props 数据文件夹中看到一个 `WhiteCube.warudo` 文件。现在，在 Warudo 中创建一个道具资产，并从 **Source** 下拉菜单中选择“WhiteCube”。如果你在场景中看到了一个白色立方体，恭喜你！你刚刚创建了自己的第一个 Mod！

![](/doc-img/en-mod-7.png)

创建其他 Mod 的过程与此类似：使用 **Warudo → New Mod** 创建新的 Mod，将资源和脚本放入 Mod 文件夹中，然后使用 **Warudo → Build Mod** 导出 Mod。有关创建不同类型 Mod 的更多信息，请参阅侧边栏中的相应章节。

## 为 Mod 命名

创建新的 Mod 时，你需要为它指定一个名称。Mod 的名称非常重要，因为 Warudo 会使用它来识别你的 Mod。请不要使用“My Mod”或“Test Mod”之类的通用名称，因为这不仅会让其他人难以找到你的 Mod，还可能与其他 Mod 产生冲突。

我们建议使用独特且具有描述性的名称；名称中可以包含空格，但不能包含特殊字符。

:::caution
请注意，同一时间只能加载一个同名的 Mod，这意味着你不应该重复使用同一个 Mod 文件夹来导出不同的 Mod！
:::

## 热重载

Warudo 支持热重载，也就是说，当你从 Unity 导出 Mod 的新版本并覆盖现有的 Mod 文件后，Warudo 会自动重新加载 Mod，并在场景中反映更改。例如，如果你将立方体的材质改为红色，然后再次导出 Mod，你应该会立即在 Warudo 中看到立方体变成红色！

:::info
请注意，热重载不一定总能按预期工作。如果遇到任何问题，请重启 Warudo。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'LunaroakF', github: 'LunaroakF'},
  ],
}} />
