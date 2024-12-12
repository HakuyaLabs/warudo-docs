---
sidebar_position: 15
translate_from_version: "2024.11.15"
---

# 环境 Mod

任何 Unity [场景](https://docs.unity3d.com/Manual/CreatingScenes.html) 都可以导入 Warudo 作为环境 Mod！

## 设置

### 步骤 1：准备场景

按你喜欢的方式设置你的 Unity 场景。我们支持 [Post Processing Stack v2](https://docs.unity3d.com/Packages/com.unity.postprocessing@3.3/manual/index.html) ，所以你可以添加后处理效果到你的场景中。

我们建议你优化你的场景，例如：

* 不要使用太多高面数模型；
* 禁用不需要碰撞的模型的碰撞；
* 如果只有场景的一小部分在你的直播中可见，尽可能禁用或移除场景的其余部分；
* 尽可能少地使用实时光照，尽可能使用烘焙光照。

:::warning

**不要在场景中添加多于一个“相机”** 资源，否则它将增加环境的性能负担，甚至可能引起错误。

:::

### 步骤 2：烘焙光照（可选）

我们通常建议在场景中烘焙光照，因为它可以显著提高你的环境 Mod 的视觉质量和性能。

:::warning

目前，我们 **不支持** 在 Unity 的内置渲染管线（BiRP）中烘焙 **"Standard"** 材料。  
如果你需要烘焙光照贴图，建议使用其他材料以获得最佳效果。

:::

#### Unity 的内置光照贴图器

大多数情况下，使用 Unity 的内置光照贴图器就足够了。

注意 Warudo 使用方向光照贴图，所以确保在 **Windows → Rendering → Lighting** 中将 **Directional Mode** 设置为 **Directional** ：

![](/doc-img/en-environment-mod-1.webp)

否则，场景中的照明可能会不正确。

:::info

如果场景已经烘焙了光照贴图，在切换光照贴图方向模式后，你需要点击 **Generate Lighting** 来重新烘焙光照贴图。

:::

#### Bakery

如果你烘培的是 Directional lightmap，你还也可以使用 [Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218)，一个第三方光照贴图器。例如，在 Bakery 中, [你可以将 **Directional Mode** 设置为 Dominant Direction 或者 MonoSH](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode).

为了确保 Bakery 与 Warudo 正常工作，请按照以下步骤操作：

1. 将 Bakery 文件夹复制到您的 mod 文件夹中（默认情况下它应该位于 Assets 根目录下）；
2. 在烘焙设置中，检查 **Use scene named output path**。这可确保 Bakery 光照贴图存储在 Mod 文件夹中。对于 **Directional Mode**，您应该选择一种能够生成 irectional lightmaps 的模式，例如 Dominant Direction 或 MonoSH；
3. 点击 **Render** 以渲染光照贴图。然后，如果您还想烘焙反射探针，再点击 **Render reflection probes** ；
4. **重要**：转到 `Bakery/_tempScene` 文件夹并删除烘焙过程中生成的名为 `_tempScene` 的 Unity 场景。

### 步骤 3：添加 `EnvironmentSettings` 脚本

打开要导出的 Unity 场景，并将 `EnvironmentSettings` 脚本（包含在 Warudo SDK 中）添加到新 GameObject 或任何现有 GameObject 中。点击 `Copy from current environment settings` 按钮。该脚本存储 Unity 的环境设置，以便将天空盒、阴影颜色等导出到环境 Mod 中。

### 步骤 4：重命名场景

将场景命名为 **“Environment”** 并确保场景放置在 Mod 文件夹中（可以放置在任何子文件夹中）。

### 步骤 5：导出 Mod

选择 **Warudo → Build Mod**，并确保生成的 `.warudo` 文件被放入 `Environments` 数据文件夹中。

## 故障排除

创建环境 Mod 绝对比创建其他类型的 Mod 要棘手，所以如果你注意到 Warudo 中的环境与你在编辑器中的不一样，你可以通过这个清单来查看是否错过了什么：

* 你是否在场景中的一个 GameObject 上放置了 `EnvironmentSettings` 脚本？
* 你是否确保场景被命名为 **"Environment"** ？
* 你是否确保所有的材料、着色器等都包含在 Mod 文件夹中？
* 如果你使用烘焙光照，你是否确保光照贴图和 `LightingSettings` 资产包含在 Mod 文件夹中？
* 如果你使用烘焙光照，你是否确保在 Mod 文件夹中只有 **一套** 光照贴图和 `LightingSettings` 资产？

:::caution

一些用户报告说，有多套光照贴图和 `LightingSettings` 资产可能会导致问题，即使它们在 Mod 文件夹外。如果其他方法都失败了，尝试删除除一套光照贴图和 `LightingSettings` 资产以外的所有其他资产。

:::

* 如果你使用烘焙光照，光照贴图方向模式是否设置为 Directional ？（或者如果你使用 Bakery，为 Dominant Direction / MonoSH）
* 你是否在 Mod 文件夹中有多于一个 Unity 场景？如果是，请删除其他场景。（可能在子文件夹中有场景，所以确保检查你所有的子文件夹！）
* 你的场景中是否有未应用更改的预制件？如果是，请应用更改。如果你看到垂直线（这意味着更改不能完全应用），右键点击它们并选择 **Prefab → Unpack Completely** 来解包预制件，并再次导出 Mod 。

![](/doc-img/en-environment-mod-2.webp)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'hanekit', github: 'hanekit'}
  ],
  translators: [
    {name: 'hanekit', github: 'hanekit'}
  ],
}} />
