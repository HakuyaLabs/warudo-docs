---
sidebar_position: 20
---

# 贡献文档

:::tip
Warudo 文档站现在已经在 Github 开源！<br />
https://github.com/HakuyaLabs/warudo-docs/
:::

在使用 Warudo 灵活的功能同时，离不开简单易懂的文档和教程来降低使用门槛。

Warudo handbook 使用基于 React 的 [Docusaurus](https://docusaurus.io/) ，内容使用 [Markdown](https://www.markdownguide.org/) 格式编写，
同时我们对文档页面添加了一些方便的功能，也会用于 Warudo 软件中功能的帮助和提示。

Warudo handbook 是开源的，如果觉得有哪里难以理解，或者想要编写提供一些新的内容，提供独家的教程和指导，
欢迎在 Github issue 和 discord 中提出问题，或者直接向 Github 项目提交代码或添加翻译作出贡献，你的名字将会出现在文档底部的贡献者列表中！


## 参与贡献

### 使用 Github Issue 反馈问题和提出意见

在 Github Issue 中直接反馈是直接和简单的方式，我们已经设置了一些 issue 模板来帮助提出问题。<br />
https://github.com/HakuyaLabs/warudo-docs/issues

请注意，这里的反馈是针对 Warudo 文档进行的，对 Warudo 软件本身的讨论，欢迎在相关的 Discord 频道中联系。<br />
https://discord.gg/warudo

### 提交代码 成为贡献者

如果了解 Git 和前端开发的相关知识的话，可以直接在 Github 上向我们提交 Merge Request 贡献代码。<br />
不了解的话也没关系，下面的内容会带你尝试在本地运行一份 Warudo Handbook 并修改他。

## 技术细节

### 目录结构

| Path | Content |
|--|--|
| `/docs` | 英文文档 (主要) |
| `/i18n/zh/docusaurus-plugin-content-docs/current` |  中文文档 (翻译) |
| `/i18n/jp/docusaurus-plugin-content-docs/current` |  日文文档 (翻译) |

非英文翻译版本目录的文件结构应与英文版本完全相同，以便语言切换能够准确工作。

:::tip

网页左边的导航栏结构也是由英文版本文件生成的，建议将 `/docs` 文件夹中的每个文件复制到 `/i18n/[lang]/docusaurus-plugin-content-docs/current`，并确保每个文件的结构在不同语言中完全一致。

:::



### 常用命令

| Command | Description |
|--|--|
| `yarn` | 安装依赖 |
| `yarn start:en` |  运行英文文档开发模式 |
| `yarn start:zh` | 运行中文文档开发模式 |
| `yarn start:jp` | 运行日文文档开发模式 |
| `yarn start:all` | 在不同端口同时运行多个语言文档 |
|`yarn build` | 构建生产版本文档 |

 
## 在本地运行文档站开发环境

如果你不熟悉开发的一堆工具也不用担心，让我们试试看。

<details>

<summary>本地开发文档教程</summary>

### 准备环境

首先，下载所需的开发环境。

 - Node.js 下载: https://nodejs.org/en/download/  
	<small>Node.js 是文档站所需的编程语言</small> <br />
	<small>选择 LTS 版本安装 - 安装程序（.msi/.exe 适用于 Windows，.pkg 适用于 macOS）</small> 

 - GitHub Desktop 下载: https://desktop.github.com/  
    <small>GitHub Desktop 是 Github 官方的版本管理工具，可以帮助我们直接提交代码或者合并分支。</small>

 - VSCode 下载: https://code.visualstudio.com/  
	<small>VSCode 是一个常见的编辑器，很适合开发前端项目，当然有其他更熟悉的编辑器也可以使用。</small>

### 使用命令行

 - Windows用户，使用 `Win+R` 并运行 `cmd` 打开终端。

 - macOS用户，使用启动台中的 `Terminal` 应用。

安装上面的开发环境之后，你应该能够使用 node -v 命令在终端上看到目前安装的 node.js 版本。

### 在 Github Desktop 中添加项目

 - 登录 Github 账号

 - 搜索 `HakuyaLabs/warudo-docs` 

 - 将项目克隆到本地
   <small>这时候文档站的代码就被下载到你的电脑上啦。</small>

 - 点击 `当前分支` - `新分支` - 输入一个你的分支名称 - `创建分支`    
   <small>分支是Git的一个概念，你可以在自己的分支里修改文件内容而不影响别人的工作。</small>

 - 点击 `发布分支`  
   <small>这时候你已经发布了你自己的分支，可以开始编辑啦。</small>

### 在本地运行网站

先打开终端准备捣鼓：

 - **`cd <你的网站文件地址>`**  
   <small>让我们切换到你放置网站文件的文件夹</small>

 - **`corepack enable`**   
   <small>设置 Node.js 的包管理器</small><br />
   <small>*理论上来讲这条命令只需要用一次启用了就可以了，之后不需要重复运行*</small>

 - **`yarn`**  
   <small>安装依赖的包</small><br />
   <small>*每次看到项目中的package.json依赖文件更新的时候，需要重新运行这个命令安装依赖。*</small>

 - **`yarn start:en`** 运行英文文档站
   **`yarn start:zh`** 运行中文文档站
   **`yarn start:all`** 一口气把不同的几个语言文档站都运行起来

然后就已经准备好了，应该可以在浏览器中看到运行在你自己电脑上的文档站了，
当你修改了文档内容并保存的时候，浏览器会自动刷新页面，  
试试看开始编辑文档内容吧！  

### 开始编辑

 - 编辑 markdown 文件并在浏览器中检查实时页面

大部分文件夹中的文档会保存为 .md 和 .mdx 格式，这是 [Markdown](https://www.markdownguide.org/) 格式的文本,   
大概就是一些带着描述格式代码的文本文件，如果想要编写好看的文档，可以研究一下。

### 提交和上传更改

先保存之后：

 - 打开 Github Desktop，你可以在左侧看到所有更改。选中所有你想提交的更改文件。 
  在输入框中输入本次修改的描述（比如：添加了文档xx翻译），点击提交。 

 - 你已经提交了这次修改，应该能在历史列表中看到这次的提交。

 - 目前这个修改只在你自己的电脑上，让我们来点击 “Push Origin” 将他上传到 Github 上。 

 - 好耶！你完成了自己的第一次提交，你的修改已经保存下来了。

### 联系 Warudo Handbook 维护成员审核并发布修改

 - 提交 Pull request 或者在群里联系文档维护成员，合并你的修改，并且发布！

</details>

## 在文档中添加你自己的名字

每篇文档最下面都有一段代码来标记文档的编辑者，当你修改或完成了一处文档之后，别忘记在这里添加你的名字，头像会自动通过github id获取。
```
<AuthorBar authors={{
  creators: [
    {name: '你的名字', github: '你的 Github id'},
  ],
  translators: [
    {name: '你的名字', github: '你的 Github id'},
  ],
}} />
```

<AuthorBar authors={{
  creators: [
    {name: 'Nekotora', github: 'Nekotora'},
  ],
  translators: [
  ],
}} />
