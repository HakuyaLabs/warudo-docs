---
sidebar_position: 999
---

# 动作录制器（导出 FBX / BVH）

录制角色的动画数据并输出 FBX 或 BVH 格式的动画文件。

## 属性

* 角色：要录制动画数据的角色。
* 录制帧数：录制动画的帧数。注意目前会同时限制渲染的帧数。
* 导出格式：FBX / BVH。
  * 格式为 FBX：
    * 导出 BlendShape：是否导出 BlendShape。
  * 格式为 BVH：
    * 导出到 Blender：是否使用 Blender 的坐标系，即 Z 轴作为上方，Y 轴作为前方，而不使用 BVH 惯常的约定方向。从 Blender 3.0 起，无需启用此选项也可正确导入 BVH。
    * 导出为 Humanoid 骨骼：是否仅导出符合 [Unity Humanoid 规范](https://docs.unity3d.com/Manual/AvatarCreationandSetup.html)的骨骼。
* 导出文件名：导出的动画文件名。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
