---
sidebar_position: 10
---

# 角色 Mod

你可以将任何角色模型导入 Warudo，只要它们能够导入 Unity！这包括 FBX 模型或 [VRChat 模型](https://booth.pm/zh-cn/search/avatar?tags%5B%5D=3D+Character)。即使你使用的是 VRM 模型，创建角色 Mod 仍然有优势，例如可以添加自定义 Shader，或者使用更高级的物理组件，如 [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 和 [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)。

## 设置

### 步骤 1：准备模型

首先，将角色模型导入 Mod 项目。模型必须是 Humanoid Rig，并且带有 [Animator](https://docs.unity3d.com/ScriptReference/Animator.html) 组件。如果你的模型没有 Animator 组件，请在模型导入设置中将 **Animation Type** 设置为 Humanoid，然后点击 **Apply**。

![](/doc-img/en-character-mod-1.webp)

如果你使用的是 FBX 模型，请确保在模型导入设置中 **R/W Enabled** 选项已勾选。

![](/doc-img/en-character-mod-2.webp)

:::caution

注意，模型必须具有完整的骨骼结构，缺少手指或面部骨骼的模型将无法正常工作。

:::

### 步骤 2：配置角色

将角色放入场景并选中它。在菜单栏中选择 **Warudo → Setup Character...**，然后在弹出的窗口中选择 **Setup selected GameObject as character mod**：

![](/doc-img/en-character-mod-3.webp)

此时，你会在 Mod 文件夹中看到一个名为 **Character** 的 Prefab 被生成：

![](/doc-img/en-character-mod-4.webp)

:::tip
如果你发现角色的骨骼发生了扭曲，或者模型在导入前后出现视觉上的差异，请参考[骨骼归一化](#normalize-bones)部分。
:::

### 步骤 3：导出 Mod

选择 **Warudo → Build Mod**，确保生成的 `.warudo` 文件被放入 `Characters` 数据文件夹。

## 角色缩放

你可以在 Warudo 中通过 **角色 → 变换 → 缩放比率** 来缩放角色。然而，这可能会影响某些功能，例如布娃娃（Ragdoll）、IK 以及部分动捕系统（如 [Leap Motion](../mocap/leap-motion)）。如果你需要缩放角色，建议在 3D 建模软件中进行调整，即在导入 Unity 或 Warudo 之前完成缩放。

## 第三方组件

Warudo 内置了一些第三方组件，你可以在角色 Mod 中使用。以下是一些常用组件：

* [VRM](https://vrm.dev/en/univrm/) 组件，例如 VRM Spring Bones、VRM Spring Bone Colliders
* [Animation Rigging](https://docs.unity3d.com/Packages/com.unity.animation.rigging@latest) 组件，例如 Rotation Constraint
* [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones)（运行时自动转换为 Dynamic Bone）
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11
* [Magica Cloth 2](https://assetstore.unity.com/packages/tools/physics/magica-cloth-2-242307) 2.6.0

请注意，Dynamic Bone 和 Magica Cloth 等需要你手动导入相应的 Unity 资源包，它们不包含在 Warudo SDK 内。

由于 Warudo 允许你将 C# 脚本打包进 Mod，你还可以使用其他第三方 Unity 组件！但请注意 [自定义 C# 脚本](mod-sdk#custom-scripts)部分描述的限制。

## 动画

你可能希望为角色添加自定义动画，例如改变头发颜色或扇动角色翅膀。根据动画的不同性质，可以使用以下方法之一：

* **动画仅控制人体骨骼**：创建一个[角色动画 Mod](character-animation-mod)，并使用 Warudo 的任意角色动画节点或 **角色 → 叠加动画** 播放动画。你也可以直接将原始的 Unity `.anim` 文件放入 `CharacterAnimations` 文件夹中使用。
* **动画控制材质属性**：使用 Warudo 的角色表情系统（**角色 → 表情**）。
* **动画控制非骨骼变换**：在 Animator 组件中添加[动画控制器](https://docs.unity3d.com/Manual/class-AnimatorController.html)，并使用 Warudo 内置的动画控制器节点控制 Animator 参数。

:::info
如果你使用的是 VRChat 角色模型，也可以直接使用模型自带的动画控制器。然而，前两种方法与 Warudo 的动捕和动画系统兼容性更好，因此更推荐使用它们。
:::

## 骨骼归一化 {#normalize-bones}

骨骼归一化是指确保模型的骨骼在 T-pose 下的旋转为零。在导入 Unity 之后，你可以检查模型是否符合以下条件：

1. 模型是否为 T-pose
2. 所有骨骼的旋转值是否为 (0, 0, 0)

在使用 Warudo SDK 进行角色设置之前，确保模型符合上述要求。如果模型的骨骼没有归一化，**Setup Character** 窗口会发出警告：

![](/doc-img/en-mod-11.png)

如果在设置角色后，角色的骨骼发生了扭曲，很可能是模型未经过骨骼归一化，并且 Warudo SDK 不能在不破坏模型的前提下自动归一化骨骼。可以尝试以下解决方案：

### 手动归一化

如果你是自己制作的模型，建议在导入 FBX 之前手动归一化骨骼。

在 Blender 或 Maya 等建模工具中，有多种方法可以归一化骨骼。然而，最可靠的方法是先将 FBX 转换为 [VRM](https://vrm.dev/en/univrm/) 模型，然后再导入 Unity。由于 VRM 模型默认进行过骨骼归一化，你可以确保角色在 Warudo SDK 里不会出现骨骼扭曲的问题。但这种方法的缺点是，每次修改 FBX 后都需要重新生成 VRM，较为繁琐。

如果你使用 Blender，并希望手动归一化骨骼，可以使用 [Cats Blender 插件](https://github.com/absolute-quantum/cats-blender-plugin) 的 **Set Rest Pose** 选项。在导出 FBX 时，建议使用以下设置：

![](/doc-img/en-mod-15.png)
<p class="img-desc">Credit: [@Kana_Fuyuko](https://twitter.com/Kana_Fuyuko)</p>

:::warning
Blender 自带的 FBX 导出器可能无法正确导出归零的骨骼旋转。如果遇到问题，建议使用第三方插件，如 [Better FBX Importer & Exporter](https://blendermarket.com/products/better-fbx-importer--exporter)（推荐）或 [Cats](https://github.com/absolute-quantum/cats-blender-plugin) 进行导出。
:::

### 使用 Denormalized Avatar Exporter

[Denormalized Avatar Exporter] 是由 [@vr_hai](https://x.com/vr_hai) 开发的 Unity 插件。它可以导出原本用于 VRChat 的模型，以便在 Warudo 等虚拟直播应用中使用，同时也适用于非 VRChat 模型。

如果你的模型不是自己制作的，并且遇到了骨骼归一化的问题，我们推荐你使用该插件。详情请参考 [官方文档](https://docs.hai-vr.dev/docs/products/denormalized-avatar-exporter#usage-in-warudo)。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
