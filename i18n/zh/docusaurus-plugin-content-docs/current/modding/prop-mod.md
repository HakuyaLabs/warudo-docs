---
sidebar_position: 40
---

# 道具 Mod

Warudo 支持任意 Unity [Prefab](https://docs.unity3d.com/Manual/Prefabs.html) 作为[道具](https://tira.gitbook.io/warudo/assets/prop)的模型源。

## 步骤

命名 Prefab 为 **Prop**，并确保 Prefab 放在 Mod 文件夹内（可以放在任意子文件夹），选择「Warudo」->「Build Mod」，然后将生成的 `.warudo` 文件放进 Warudo 数据文件夹的 Props 子文件夹里即可。

## 角色配件

如果你的道具是应该绑定在角色身上的（例如配饰），可以在 Prefab 上放置 `CharacterAttachmentSettings` 脚本，指定道具默认绑定的骨骼。

你还可以在 Prefab 的骨骼关节上放置 `CharacterAttachmentRotationConstraint` 脚本，指定该骨骼关节要绑定的角色骨骼关节，这样该骨骼关节的旋转会和指定的角色骨骼关节保持一致（例如手套的关节应绑定手指的关节）。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
}} />