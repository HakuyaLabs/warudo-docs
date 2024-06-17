---
sidebar_position: 10
---

# 角色 Mod

Warudo 支持任意 Humanoid Rig 作为[角色](https://tira.gitbook.io/warudo/assets/character)的模型源。

:::info
如果模型未设置成 Humanoid Rig，在 Unity 的模型导入选项设置模型的 Animation Type（动画类型）为 Humanoid，点击 Apply（应用）即可。

![](/doc-img/en-character-mod-1.webp)
:::

Warudo 原生支持的组件：

* [VRM](https://vrm.dev/en/univrm/) 的组件
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones)（会在运行时被转换为 Dynamic Bones）
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11

:::tip
由于 Warudo 支持将 C# 脚本打包进 Mod 内，你可以随意添加其他第三方组件，不过有部分[限制](https://tira.gitbook.io/warudo/advanced/mod-sdk)。
:::

## 前置条件

1. 如果模型是外部导入的（例如 FBX 模型），需要确认导入设置的 R/W Enabled 为勾选状态。

![](/doc-img/en-character-mod-2.webp)

2\. 模型 GameObject 上必须有 [Animator](https://docs.unity3d.com/ScriptReference/Animator.html) 组件。

## 自动配置（推荐）

放置角色在场景里，确保选中了 GameObject，然后选择「Warudo」->「Setup Character...」->「Setup selected GameObject as character mod」。

![](/doc-img/en-character-mod-3.webp)

等待片刻后，即可看到名为 **Character** 的 Prefab 出现在 Mod 文件夹里：

![](/doc-img/en-character-mod-4.webp)

选择「Warudo」->「Build Mod」，然后将生成的 `.warudo` 文件放进 Warudo 数据文件夹的 Characters 子文件夹里即可。

## 手动配置

如果出于某种原因，自动配置无法正常运作，你也可以命名任意角色 Prefab 为 **Character**，并确保放在 Mod 文件夹内（可以放在任意子文件夹），然后选择「Warudo」->「Build Mod」，将生成的 `.warudo` 文件放进 Warudo 数据文件夹的 Characters 子文件夹里即可。

:::info
手动配置且角色使用 [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 的情况下，必须（导入 Unity 之前）保证模型的骨骼在 T-pose 下，关节的旋转均为 0。否则导入到 Warudo 后，Magica Cloth 将无法正常运作。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />