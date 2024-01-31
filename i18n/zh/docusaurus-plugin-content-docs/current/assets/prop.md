---
sidebar_position: 20
---

# 道具

道具是场景内自由摆放的任意 3D 模型；也可以绑定在角色骨骼上，实现配饰的效果。除了自带的模型外，外部的模型可以使用 [Mod SDK](https://tiger-tang.gitbook.io/warudo/advanced/sdk) 导出为 `.warudo` 格式，即可加载到 Warudo 中。

![](/doc-img/zh-prop-1.webp)
<p class="img-desc">猫猫手</p>

<div className="video-box"><video controls src="/zh/doc-img/zh-prop-1.mp4" />
<p>利用道具资源以及角色配件设置实现的玫瑰 + 指尖粒子效果。</p>
</div>

## 属性

* 源：模型文件的路径。

### 角色配件

* 角色：设置道具绑定的角色。绑定后，道具会跟随角色移动。
* 绑定类型：道具绑定的方式。
  * 人体骨骼：
    * 绑定骨骼：道具绑定的人体骨骼。
    * （绑定骨骼为左手 / 右手时）覆盖手势：道具启用时，模型手部应该摆出的姿势。
      * 权重：姿势的权重，即模型手部根据姿势移动的幅度。
  * 变换路径：
    * 绑定变换路径：道具绑定的变换在模型层级中的相对路径，用来将道具绑定在非标准 Unity Humanoid 人体骨骼（例如模型的尾巴上）。

### 网格

* 默认 BlendShape 列表：模型默认设置的 BlendShape。
  * 列表元素：
    * 目标蒙皮网格：BlendShape 位于的蒙皮网格（Skinned Mesh）。
    * BlendShape：要设置的 BlendShape。
    * 默认值：BlendShape 的默认值。
* 默认材质属性（实验性功能）：模型默认设置的材质属性。
* 网格：模型的网格（Mesh）或蒙皮网格（Skinned Mesh）信息。
  * 列表元素：
    * 显示：是否显示此网格。

:::info
道具的位置和旋转可以在主窗口中使用 Gizmo 进行调整。
:::
