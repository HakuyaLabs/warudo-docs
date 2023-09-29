---
sidebar_position: 10
sidebar_label: Warudo 介绍
---

# Warudo 介绍

## Warudo 是什么？

Warudo 是一款专为 VTuber 直播设计的虚拟形象动画软件，可以自由导入并使用外部 3D 素材（包括[场景](modding/environment-mod.md)、[道具](modding/prop-mod.md)等），使用[蓝图](/docs/mocap/blueprints/overview)深入配置你的虚拟形象，并支持[第三方 C# 插件](modding/mod-sdk.md)。丰富的功能再加上极高的可自定义性，力求为你的 3D 虚拟形象打造最理想的直播效果。

## 为什么使用 Warudo？

现有的 3D 直播方案可分为四类：

* 简单易上手的 VTuber 软件（[Luppet](https://luppet.appspot.com/)、[VSeeFace](https://www.vseeface.icu/) 等）
  * 优点：使用门槛低。
  * 缺点：功能少，拓展性受限，即使是提供开发者 SDK 的 VSeeFace，依然有许多「两行代码就能实现」但是软件不支持就是做不了的事情。
* 自研、针对 VTuber 企划客制化的直播软件
  * 优点：完全针对 VTuber 本人需求打造，只要开发水平足够，想要什么功能就有什么功能。
  * 缺点：从零开始造轮子，很贵！且通常没有太多自定义选项，想要做很小的修改也需要程序侧迭代并重新构建项目。
* 针对特定使用场景的 VTuber 软件（[VRoom](https://ojousamaya.booth.pm/items/3949561)、[Keyboard Stuvio](https://booth.pm/ja/items/2956377) 等）
  * 优点：做了很特别的功能，比如 Keyboard Stuvio 是一款透过摄像头实时动捕钢琴演奏的软件。
  * 缺点：除了这个很特别的功能以外，其余的功能基本缺失，因为开发者没有时间（也不想）从头造轮子；每个软件的渲染效果不一致。
* [VRChat](https://hello.vrchat.com/) / [Reborn VR](https://space.bilibili.com/470482044)
  * 优点：自带联机，本身也是一款 VR 游戏，[VTuber 本人也能玩得很开心。耶。](https://www.bilibili.com/video/BV1HW4y1q7aP)
  * 缺点：要支持眼球追踪 + 口型同步需要额外软 / 硬件支持。必须戴 VR 头显 + 使用 VR 手柄，直播内容只能在 VRChat 中进行，不适合长期 3D 直播使用。

Warudo 力求做到上述几种方案的平衡点：

* **针对家用 3D 优化：**[一台 iPhone 即可面捕 + 上半身动捕](mocap/rhylive.md)，也提供[摄像头动捕方案](mocap/mediapipe.md)。内置 [500+ 个待机动画](assets/character/#dong-hua)，配合 [IK 功能](assets/character/#shen-ti-ik)，可以让你的虚拟形象摆出任何想要的 Pose。
* **功能细致：**上至[动捕 + 动画的无缝融合](assets/character/#dong-hua)、[多摄像机输出](assets/camera.md#duo-she-xiang-ji)、同类软件中最强大的[面捕映射及表情切换系统](assets/character/blendshape-expression.md)，下至[动捕数据的平滑幅度](advanced/blueprints-intro.md)和[摄像机的 LUT 材质](assets/camera.md#se-tiao-ying-she-he-yan-se-fen-ji)，丰富的配置选项让你的虚拟形象动画更自然、也更具表现力。
* **简洁易用：**提供简洁但功能强大的配置界面，与渲染窗口分离，甚至可以在其他电脑 / 手机上远程控制。详细的使用文档，提供常见使用场景的配置示例。
* **模块化配置：**角色模型、环境模型、摄像机配置甚至互动逻辑等都保存在 Warudo 的场景文件内，可一键切换不同直播场景，也方便开发 / 运营人员调试好场景后发给 VTuber 直接使用。
* **易于拓展：**可导入[外部 3D 资源](modding/mod-sdk.md)，支持 [Steam 创意工坊](https://steamcommunity.com/app/2079740/workshop/)，兼容 [URP 渲染管线 / NiloToonURP](https://github.com/ColinLeung-NiloCat/UnityURPToonLitShaderExample)；提供 C# SDK，可自行开发或拓展功能，支持运行时热编译加载 C# 脚本调试。

<div className="hint hint-info">
联机、直播互动等功能还在紧张地开发中，敬请期待。
</div>

