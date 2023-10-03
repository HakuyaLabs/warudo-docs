---
sidebar_position: 30
---

# 环境 Mod

Warudo 支持任意 Unity [场景](https://docs.unity3d.com/Manual/CreatingScenes.html)作为[环境](https://tira.gitbook.io/warudo/assets/environment)源。

## 前置条件

由于 Unity 的[限制](https://docs.unity3d.com/Manual/LightmappingDirectional.html)，场景的 Lighting 设置中，**Directional Mode** 必须为 **Directional**，如下图所示：

![](pathname:///doc-img/en-environment-mod-1.webp)

否则场景的光照可能会出现错误。

:::info
如果场景本身已经烘培了 Lightmap，切换 Directional Mode 之后，需要点击 Generate Lighting 重新烘培 Directional Lightmap。
:::

:::info
你也可以使用 [Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218) 等第三方 Lightmapper，只要确保烘培的 Lightmap 是 Directional 即可。以 Bakery 为例，[可以设置 Directional Mode 为 Baked Normal Maps。](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode)
:::

## 步骤

打开想要导出的 Unity 场景，在一个新 GameObject 或任何现有 GameObject 上放置 `EnvironmentSettings` 脚本，点击 `Copy from current environment settings` 按钮。

:::info
如果不放置 `EnvironmentSettings` 脚本，那么天空盒、阴影颜色等渲染设置将不会导出到环境 Mod 里，请务必留意。
:::

命名场景为 **Environment**，并确保场景放在 Mod 文件夹内（可以放在任意子文件夹），选择「Warudo」->「Build Mod」，然后将生成的 `.warudo` 文件放进 Warudo 数据文件夹的 Environments 子文件夹里即可。
