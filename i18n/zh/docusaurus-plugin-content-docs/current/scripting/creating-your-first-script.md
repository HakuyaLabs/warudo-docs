---
sidebar_position: 1
---

# 创建您的第一个脚本

在 Warudo 中有两种编写脚本：使用 **Playground** 或创建 [Mod](distribution.md)。在本教程中，我们将探究如何使用 Playground 编写您的第一个自定义节点！

:::tip
**什么是 playground？** Playground 可以被看成一个沙盒，您可以在其中编写和测试自定义节点和资源。您可以直接在 Warudo 数据文件夹中 `Playground` 文件夹编写代码，而不需要编译和打包 C# 代码。这使您可以快速迭代和测试您的代码，而无需构建 Mod 或重启 Warudo。
:::

<b>Let's do it!</b>

:::info
中国社区：[QQ](http://warudo.app/qq)，[Bilibili](https://space.bilibili.com/3494370867153597)。 如果您有任何问题，我们的 [Discord 服务器](https://discord.gg/warudo)上有一个专门的 **#plugins-scripting** 频道，您可以在那里寻求帮助!
:::

## 第 1 步：环境设置
首先，确保您已安装 [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)。然后在编辑器窗口左下角菜单中打开 Warudo 数据文件夹，将[**此文件**](/scripts/Playground.csproj)下载到 `StreamingAssets\Playground` 文件夹并用您最喜欢的 C# IDE 打开（我们将使用 [JetBrains Rider](https://www.jetbrains.com/rider/)，但对于其他 IDE 如 [Visual Studio Code](https://code.visualstudio.com/) 也可以运行，只不过您可能需要安装 C# 语言扩展）。

最后在 `StreamingAssets\Playground` 文件夹中新建一个 `HelloWorldNode.cs` 脚本，将下面的代码复制进去并保存。

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660", Title = "Hello World")]
public class HelloWorldNode : Node {

    [FlowInput]
    public Continuation Enter() {
        Context.Service.PromptMessage("Hello World!", "这个节点运行正常！");
        return Exit;
    }
        
    [FlowOutput]
    public Continuation Exit;
    
}
```

## 第 2 步：自定义节点

再次启动 Warudo 时，您应该会看到一条弹出消息，如图：

![](/doc-img/zh-getting-started-playground-4.webp)

这表明 `HelloWorldNode.cs` 已成功编译并加载，而且由于上面的代码定义了自定义节点，所以可以消息中有 `节点：1` 的字样。

转到蓝图面板，从控制板中搜索并拖出 `Hello World` 节点，您应该可以看到如下内容：

![](/doc-img/zh-getting-started-playground-5.webp)

点击 `入口` 你应该可以看到这样的消息：

![](/doc-img/zh-getting-started-playground-6.webp)

如果一切正常，恭喜！您刚刚创建了您的第一个 Warudo 节点！

## 第 3 步：热重载

很棒的一件事是，您每次更改代码后都无需重启 Warudo。Warudo 会自动检测您在 `Playground` 目录中所做的任何更改并热重载您的代码！

让我们看看它的实际效果。替换原来 `HelloWorldNode.cs` 中的代码并保存：

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660", Title = "Hello World")]
public class HelloWorldNode : Node {

    // 这之间是新代码
    [DataInput]
    [IntegerSlider(1, 100)] 
    [Label("幸运数字")]
    public int LuckyNumber = 88;
    // 这之间是新代码

    [FlowInput]
    public Continuation Enter() {
        // 以下的代码被更改了
        Context.Service.PromptMessage("Hello World!", "这个节点运行正常！我的幸运数字是：" + LuckyNumber);
        return Exit;
    }
        
    [FlowOutput]
    public Continuation Exit;
    
}
```

:::tip
若显示编译失败或节点中有文字显示乱码，尝试更改 C# 代码文件的编码格式为 UTF-8。
:::

保存后，应该会立即显示另一条弹出消息，表示节点已成功编译并热重载。蓝图中的节点也会相应地更新：

![](/doc-img/zh-getting-started-playground-7.webp)

尝试设置一个幸运数字并验证节点仍然有效！

![](/doc-img/zh-getting-started-playground-8.webp)

## 第 4 步：自定义资源

Warudo 还可以检测新 `.cs` 文件。这次，我们尝试创建自定义资源。创建一个名为 `CookieClickerAsset.cs` 的脚本在 `Playground` 文件夹中，并粘贴以下代码：

```csharp
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;

[AssetType(Id = "82ae6c21-e202-4e0e-9183-318e2e607672", Title = "饼干计数器")]
public class CookieClickerAsset : Asset
{

    [Markdown]
    public string Status = "你还没有饼干。";

    [DataInput]
    [IntegerSlider(1, 10)]
    [Description("增加我的数值使每次给的饼干变多！")]
    [Label("单次给的个数")]
    public int Multiplier = 1;

    private int count;

    [Trigger]
    [Label("给我饼干")]
    public void GimmeCookie()
    {
        count += Multiplier;
        SetDataInput(nameof(Status), "你有" + count + "块饼干。", broadcast: true);
    }

    protected override void OnCreate()
    {
        base.OnCreate();
        SetActive(true);
    }

}
```

您应该会看到一条弹出消息，表明已成功加载一个自定义节点 （`HelloWorldNode.cs`） 和一个自定义资源 （`CookieClickerAsset.cs`）：

![](/doc-img/zh-getting-started-playground-9.webp)

您可以在 **添加资源** 菜单中找到新资源：

![](/doc-img/zh-getting-started-playground-10.webp)

并把它添加到场景中，有了这样有趣的脚本，谁还想直播呀！

![](/doc-img/zh-getting-started-playground-11.webp)

## 总结

在这个简短的教程中，我们学习了如何使用 Playground，并了解了自定义节点和自定义资源的工作原理。在下一个教程中，我们将看到如何创建一个 Mod 来分发我们刚刚创建的自定义节点和资源！

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'Eco', github: 'EcoFur'},
],
}} />