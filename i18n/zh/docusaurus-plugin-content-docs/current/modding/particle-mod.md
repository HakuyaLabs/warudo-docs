---
sidebar_position: 41
version: 2024-06-14
---

# 粒子 Mod

粒子 Mod 通常是一个[粒子系统](https://docs.unity3d.com/Manual/PartSysReference.html)，可用于 **Spawn Particle** 等节点。

## 设置

### 第 1 步：准备模型

将粒子 GameObject 放置到场景中，然后调整到所需的位置和旋转角度。右键点击它并选择 **Create Empty Parent**，创建一个空的 GameObject 作为道具的根节点。

进入播放模式并移动父级 GameObject，确保粒子系统能够正常发射粒子。如果不能正常发射，你可能需要调整粒子系统的设置，例如将 **Simulation Space** 从 World 改为 Local。

### 第 2 步：创建预制件

选中粒子 GameObject 的根节点，将其拖到 Mod 文件夹中以创建预制件。将预制件命名为 **“Particle”**，并确保它位于 Mod 文件夹中（可以放在任意子文件夹内）。

### 第 4 步：导出 Mod

选择 **Warudo → Build Mod**，并确保生成的 `.warudo` 文件被放入 `Particles` 数据文件夹中。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'LunaroakF', github: 'LunaroakF'},
  ],
}} />
