---
sidebar_position: 30
---

# 自定义节点

## Hello World！

要开始创建一个自定义节点，让我们从最简单的开始。  
创建一个纯文本文件，将其命名为 `HelloWorldNode.cs`  并放进 Warudo **数据文件夹**的 Playground 文件夹中。  
其内容如下：

```cs title="...\Warudo\Warudo_Data\StreamingAssets\Playground\HelloWorldNode.cs"
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(
    Id = "examples-node-guid-must-bechanged001",
    Title = "Hello World Title",
    Category = "Hello World Category")]
public class HelloWorldNode : Node {

    /* DATA OUTPUTS */
    [DataOutput]
    [Label("输出字符串")]
    public string OutputString() {
        return "Hello World!";
    }
}
```

然后在蓝图搜索框 `Hello` 你就能找到你的**第一个**自定义节点了！

将其拖放到一个空白的蓝图中。  
然后搜索 `bug` 找到 `检查值` 节点，将其与 `Hello World Title` 节点连接。  
就可以发现，节点顺利的输出了 `Hello World!` ！！

![](/doc-img/custom-node-1.png)

恭喜你！你成功创建了你的第一个自定义节点。



现在需要做的，就是跟随下面的教程，创建符合你需求的节点了⸺

## 代码组成

一个含有单个节点的 C# 文件的通用结构如下：

```cs
【using】

[NodeType(
    【节点属性】
    【节点属性】
    【节点属性】
)]
public class 【节点名】 : Node {
    【节点成员】
    【节点成员】
    【节点成员】
}
```

我们接下来开始分别介绍：

## using

最基础的 using，这保证了你的节点可以被编译并且被 Warudo 识别。

```cs
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;
```

但是我们的节点需要和其他节点连接，需要很多定义好的类型，如果你不想纠结哪些类型在哪个包中，可以直接全部导入，  
以下是 [ExampleNode](https://github.com/HakuyaLabs/WarudoPlaygroundExamples/blob/master/ExampleNode.cs) 的 using 部分：

```cs
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;
using Warudo.Core.Scenes;
using Warudo.Plugins.Core.Assets;
using Warudo.Plugins.Core.Assets.Cinematography;
```

你当然也可以导入自己需要的其他包。

## 节点属性

在节点开头我们需要定义节点的几个属性：

```cs
[NodeType(
    Id = "examples-node-guid-must-bechanged001",
    Title = "Hello World Title",
    Category = "Hello World Category")]
```

- `Id`  
每个节点的位置识别符号，会影响蓝图导入、软件加载、节点连接等**所有方面**。  
所以必须是**独一无二**的，并且定义之后**不要更改**。  
可以在 [Free Online GUID Generator](https://guidgenerator.com/) 处随机生成。
- `Title`  
节点的标题，搜索节点的时候就会检索其标题。
- `Category`  
节点在节点池中的分类，同样可以方便检索。

## 节点名

建议以驼峰命名法以 `XxxNode` 命名，并且与文件名保持一致。

## 节点成员

一个节点的定义由多个部分组成，这些部分被称为类的**成员**。
我们这里介绍最重要的几种：

### 输入接口

最简单的输入接口如下：

```cs
[DataInput]
public 类型 变量名;
```

此时接口默认会以变量名命名。

你也可以给输入接口加上**名字**、**注释**和**默认值**：

```cs
[DataInput]
[Label("接口名字")]
[Description("这是一句注释。")]
public 类型 变量名 = 默认值;
```

对于 `int` 和 `float` 类型，还可以给输入框加上**滑杆**：

```cs
[DataInput]
[IntegerSlider(0, 10)]
public int InputInt = 5;

[DataInput]
[FloatSlider(0, 1)]
public float InputFloat = 0.5f;
```

![](/doc-img/custom-node-2.png)

:::caution

用户仍然可以通过手动输入来设置超过滑杆范围的值。

:::

### 输出接口

最简单的输出接口如下：

```cs
[DataOutput]
public 类型 函数名() {
    return 输出值;
}
```

你可以在 `{}` 内编写你需要的代码，让它在每次被调用的时候根据输入接口的数据输出需要的数据。

:::info
输出接口暂时不支持添加注释。
:::

### 文本块

你可以通过一个或者多个 `[markdown]` 字段来为节点添加一段文字。这些文字会出现在节点的**底部**。

该字段可以用来说明节点作用、**动态展示**节点内部变量数据等各种功能。

```
[Markdown]
public string Info = "这是一段描述文字。";
```

除了使用纯文本，该字段还支持基础的 markdown 语法。

使用 `空格+空格+换行` 进行**换行**：

```
[Markdown]
public string Info2 = "第一行。  \n第二行。";
```

```
[Markdown]
public string Info3 = @"
第一行。[空格][空格]  
第二行。";
```

使用**两个**换行符进行**分段**：  
（严格 markdown 的单个换行符只会被视为空格）

```
[Markdown]
public string Info4 = "第一段。\n\n第二段。";
```

```
[Markdown]
public string Info5 = @"
第一段。

第二段。";
```

其他 markdown 语法（列表、代码块...）可自行尝试。

###  其他成员写法

大部分支持的功能都展示在了 [ExampleNode](https://github.com/HakuyaLabs/WarudoPlaygroundExamples/blob/master/ExampleNode.cs) 中，  
你可以下载该文件，将其放置在 Playground 中，然后在蓝图中查看和尝试其对应的作用。

或者你也可以参考文末我们提供的其他范例。

## 接口类型

要与其他节点进行连接，则接口的类型必须一致（或者兼容）。

以下是一些在 Warudo 中常用的类型介绍。

- `string` 字符串
- `int` 整数
- `float` 浮点数
- `Vector3` X-Y-Z 三维向量
- `Quaternion` X-Y-Z-W 四元数
- `HumanBodyBones` Unity 定义的角色骨骼 [Unity - Scripting API: HumanBodyBones](https://docs.unity3d.com/ScriptReference/HumanBodyBones.html)
- ⋯⋯

## 范例

### 基础

- [StructuredDataExampleNode.cs](https://gist.github.com/TigerHix/81cfa66a8f810165c426d1b5157677b5)  
创建“内部”数据类型。(StructuredData)

- [GetRandomSoundNode.cs](https://gist.github.com/TigerHix/f0f1a7e3c53ca65450fdca1ff06eb343)  
【获取随机音效】节点。

- [LiteralCharacterAnimationSourceNode.cs](https://gist.github.com/TigerHix/2dc58213defe400ddb280a8cc1e6334b)  
【角色动画源】节点。

- [SmoothTransformNode.cs](https://gist.github.com/TigerHix/eaf8e05e5e1b687b8265420b9943903d)  
【平滑变化】节点。

### 进阶

- [FindAssetByTypeNode.cs](https://gist.github.com/TigerHix/ab3522bb25669457cc583abc4fb025d2)  
自动填充（下拉）列表示例。

- [MultiGateNode.cs](https://gist.github.com/TigerHix/8747793a68f0aa15a469f9823812e221)  
动态数据 / 流端口示例。

- [ThrowPropAtCharacterNode.cs](https://gist.github.com/TigerHix/18e9f20152c0cfac38fd5528c7af16b6)  
【向角色投掷道具】节点。

- [SpawnStickerNode.cs](https://gist.github.com/TigerHix/fe35442e9052cd8c4ea80e0261349321)  
【从本地图片生成贴纸】和【从网络图片生成贴纸】节点。
