---
sidebar_position: 11
---

# 角色动画 Mod

Warudo 支持导入 Unity 的 [AnimationClip](https://docs.unity3d.com/ScriptReference/AnimationClip.html)，目前可作为[角色待机动画](https://tira.gitbook.io/warudo/assets/character)使用。

## 步骤

:::info
如果你是在 Blender 或其他工具制作动画并导出了 `.fbx`，在导入到 Unity 之后，你必须展开 `.fbx`，选中里面的 AnimationClip（前面有三角的图标），并按下 Ctrl+D 复制出来一份：

![](/doc-img/en-character-animation-mod-1.webp)

然后再对复制出来的 AnimationClip 进行以下操作。
:::

命名 AnimationClip 为 **Animation**，并确保 AnimationClip 放在 Mod 文件夹内（可以放在任意子文件夹），选择「Warudo」->「Build Mod」，然后将生成的 `.warudo` 文件放进 Warudo 数据文件夹的 CharacterAnimations（角色待机动画）子文件夹里即可。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />