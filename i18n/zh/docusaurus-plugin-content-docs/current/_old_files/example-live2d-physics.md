---
sidebar_position: 60
---

# 示例：仿 Live2D 物理（果冻眼）

Live2D 中人人都有，但是 3D 模型中（几乎）人人没有的效果，就是「果冻眼」了：

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832326-e54d9982-92dc-4046-83f2-9b156bb243d4.mp4" />
<p>来源：<a href="https://twitter.com/mauracoma/status/1441799850048176138" target="_blank">https://twitter.com/mauracoma/status/1441799850048176138</a></p>
</div>

给模型添加几个 BlendShape，再利用 Warudo 提供的**「Float 摆锤物理」**节点，就可以给你的 3D 模型实现果冻眼的效果啦！

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832672-049792b0-1bbf-46ec-8ed9-7f5989eb4166.mp4" />
<p>由于我不是模型师，这里只拆了一层高光出来。正如 Live2D 一样，拆得越多效果越好哦！</p>
</div>

### 准备工作

首先，你需要为模型准备高光拆分出来的 BlendShape，像下面这样：

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832935-946222b5-e9a3-4efa-b9dc-7bdd04b9a3f2.mp4" /></div>

这里我使用了[頼鳥ミドリ（@yoridrill）](https://twitter.com/yoridrill)老师提供的 VRoid BlendShape 数据，可以用 HANA\_Tool 一键导入 VRoid Studio 制作的模型：

<a href="https://note.com/yoridrill/n/nfc15a0760a26" target="_blank">
<div className="file-box">
<p>
[Unity]VRoidの瞳孔に奥行きを付けよう！(HANA Tool用データ無料配布)
</p></div>
</a>

四个 BlendShape 分别为：

* `Highlight_Down_L`：左边高光往下
* `Highlight_Down_R`：右边高光往下
* `Highlight_Rotate`：高光逆时针旋转
* `Highlight_Scale`：高光扩大

### 蓝图配置

打开面部跟踪蓝图，找到最右边的「平滑 BlendShape 列表」及「覆盖角色 BlendShape 列表」节点。在中间插入以下节点及连接即可：

![](pathname:///doc-img/zh-blueprint-example-live2d-physics-1.webp)

上方的节点是较好理解的——我们根据两只眼睛闭上的程度（`eyeBlinkLeft` 和 `eyeBlinkRight`），乘以 1.5，然后设置两个高光下移 BlendShape 的值：

![](pathname:///doc-img/zh-blueprint-example-live2d-physics-2.webp)

下面的节点就是「果冻眼」的核心了。我们获取眼睛闭上的程度（这里只取左眼 `eyeBlinkLeft`），然后输入「Float 摆锤物理」这个神奇的节点，输出值再用来设置高光旋转和高光扩大的 BlendShape：

![](pathname:///doc-img/zh-blueprint-example-live2d-physics-3.webp)

「Float 摆锤物理」节点和 [Live2D 的物理模拟](https://docs.live2d.com/en/cubism-editor-manual/physics-operation/)的原理是相同的。通过制定一个多段式的摆锤（见下），摆锤最上方节点的 X 坐标为输入值，而输出值就是摆锤最下方节点的 X 坐标。节点的**摆臂**属性规定了摆锤每一节的长度以及物理属性。

<div className="video-box"><video loop controls src="/zh/doc-img/zh-blueprint-example-live2d-physics-video-4.mp4" />
<p>来源：<a href="https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/" target="_blank">https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/</a></p>
</div>

你可以通过设置节点的「显示」为「是」来预览摆锤的物理效果：

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196835467-8eec329f-176f-47ba-af4e-fb4d0c4361d6.mp4" /></div>

以上的蓝图配置仅仅对应了一层高光动起来的情况——你可以使用多个「Float 摆锤物理」节点和更细致的高光 BlendShape 来实现更精致的果冻眼效果！

:::tip
当然了，「Float 摆锤物理」节点的作用并不只局限于此。你能想到的常见 Live2D 物理效果，几乎都可以移植到 Warudo——不过有些物理效果是否更适合用 3D 原生的方式实现（比如头发的物理效果），就是另一个话题啦。
:::
