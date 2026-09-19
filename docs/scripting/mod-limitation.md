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

### Members with Modified Runtime Behavior

This version introduces a new security mechanism. Some Unity APIs will be removed from the restricted API list, but calls to these APIs will still be subject to certain restrictions. We will continue working to make more APIs available.

* `UnityEngine.Application.OpenURL`
  (The deprecated restricted API `Warudo.Core.Utils.ApplicationHelper.SafeOpenURL` now directly calls `UnityEngine.Application.OpenURL` without modification.)

  * This API now only allows the `http`, `https`, `mailto`, and `file` protocols.
  * The URL must be a fully qualified URL.
  * When using the `file` protocol, only existing files and directories located within the Warudo data directory may be accessed.
  * Access to the `Binaries`, `Clients`, `Playground`, and `Plugins` directories within the Warudo data directory, including all of their subdirectories, is prohibited.
  * Parent-directory traversal using paths such as `.` or `..` is prohibited.

### Members Allowed in Relaxed Mode

As this version introduces a new mod loading mechanism, certain potentially risky APIs may now be used with the user's consent.

*None yet.*

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
