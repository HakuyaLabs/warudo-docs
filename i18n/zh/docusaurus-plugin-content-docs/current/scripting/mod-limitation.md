---
sidebar_position: 30
translate_from_version: 2026-08-11
---

# Mod 开发限制

## API 限制

出于安全或技术原因，当前版本限制 Mod 在运行时访问部分 API。

### 运行时禁止访问的包

* `UnityEditor`
* `Mono.Cecil`
* `UMod-ModTools`

### 运行时禁止访问的命名空间

* `System.IO.*`
* `System.Reflection`
* `System.Reflection.Emit`
* `Vexe.Fast.Reflection`
* `System.Runtime.InteropServices`
* `RoslynCSharp`
* `RoslynCSharp.*`
* `UMod.AssetSharing`
* `UMod.Bridge`
* `UMod.Debugging`
* `UMod.Moddable`
* `UMod.Moddable.Providers`
* `UMod.Scripting`
* `UMod.Scripting.Runtime`
* `UMod.Settings`

### 运行时禁止访问的类型

* `System.AppDomain`
* `System.Threading.Process`
* `System.Diagnostics.Process`
* `UMod.Mod`（`UMod.ModHost` 除外）

### 运行时禁止访问的成员

* `UnityEngine.Application.Quit`
* `UMod.ModHost.AllLoadedModHosts`
* `UMod.ModHost.AllModHosts`
* `UnityEngine.Application.OpenURL`（请改用 `Warudo.Core.Utils.ApplicationHelper.SafeOpenURL`）

:::caution

P/Invoke 已被全局禁用。

:::

## 着色器限制

在内置渲染管线（BiRP）模式下，您可以使用自定义着色器。

在 Warudo Pro 的通用渲染管线（URP）模式下，使用 Render Feature 的着色器目前无法直接使用。着色器作者需要联系我们的技术支持团队进行适配。此限制将来可能会调整。

目前支持的 URP 着色器包括：

* Unity 官方 URP 着色器
* NiloToon
* PotaToon

## 关于限制

我们正在持续改善 Warudo 的 Mod 开发体验。未来，我们可能会移除部分限制，或通过重写相关函数来控制访问，并提供更多替代方案。对于部分需要绕过现有限制的特殊场景，我们也计划在后续版本中提供解决方案。

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [
  ],
}} />
