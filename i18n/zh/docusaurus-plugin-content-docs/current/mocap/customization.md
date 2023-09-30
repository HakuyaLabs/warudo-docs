---
sidebar_position: 110
---

# 自定义

Warudo 的动作捕捉都是用[蓝图](/docs/mocap/blueprints/overview)实现的。在[配置角色动作捕捉](../assets/character/#dong-zuo-bu-zhuo)的时候，根据选择的方案，Warudo 会自动生成对应的蓝图。例如，选择了 iFacialMocap + MediaPipe 的方案，便会生成两张蓝图：「面部追踪 - iFacialMocap」及「姿态追踪 - MediaPipe」。

## 调整平滑程度

如果你发现动捕有掉帧的情况，或者动捕太过平滑，导致无法做出快速的动作，可以调整动捕数据的平滑程度。所有的动作捕捉蓝图都必定有一个或多个节点用来平滑数据。以下以 iFacialMocap 的面部追踪蓝图为例：

![](/doc-img/zh-custom-1.webp)

「平滑旋转列表」节点对应角色骨骼的更新，而「平滑位置」对应角色根位置的更新。你可以调节平滑时长来让动捕变得更加丝滑或敏捷。

## BlendShape 映射

利用蓝图提供的节点，你可以映射动捕数据到任何角色模型上，而无需担心模型的 BlendShape 命名并非遵从标准的 VRM / ARKit 命名。详情请参考[这篇文档](../blueprints/mocap-nodes.md)。

## 仿 Live2D 眼睛物理

使用「Float 摆锤物理」节点，你可以轻易实现 Live2D 中的眼睛物理效果。详情请参考[这篇文档](../blueprints/example-live2d-physics.md)。

