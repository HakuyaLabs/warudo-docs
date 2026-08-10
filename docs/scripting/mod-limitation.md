---
sidebar_position: 30
version: 2026-08-11
---

# Mod Development Limitations

## API Limitations

For security or technical reasons, the current version restricts mods from accessing certain APIs at runtime.

### Packages Blocked at Runtime

* `UnityEditor`
* `Mono.Cecil`
* `UMod-ModTools`

### Namespaces Blocked at Runtime

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

### Types Blocked at Runtime

* `System.AppDomain`
* `System.Threading.Process`
* `System.Diagnostics.Process`
* `UMod.Mod` (except `UMod.ModHost`)

### Members Blocked at Runtime

* `UnityEngine.Application.Quit`
* `UMod.ModHost.AllLoadedModHosts`
* `UMod.ModHost.AllModHosts`
* `UnityEngine.Application.OpenURL` (use `Warudo.Core.Utils.ApplicationHelper.SafeOpenURL` instead)

:::caution

P/Invoke is disabled globally.

:::

## Shader Limitations

You can use custom shaders in Built-in Render Pipeline (BiRP) mode.

In Warudo Pro's Universal Render Pipeline (URP) mode, shaders that use Render Features are not currently supported out of the box. The shader author must contact our technical support team to arrange compatibility support. This limitation may change in the future.

The following URP shaders are currently supported:

* Unity's built-in URP shaders
* NiloToon
* PotaToon

## About These Limitations

We are continually improving the Warudo mod development experience. In future releases, we may remove some restrictions, control access by rewriting affected functions, and provide more alternatives. We also plan to offer solutions for special use cases that currently require bypassing these limitations.

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [
  ],
}} />
