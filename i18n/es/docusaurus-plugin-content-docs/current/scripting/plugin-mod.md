---
sidebar_position: 100
---

# Mod de Plugin

Un mod de plugin es un tipo de [mod de Warudo](../modding/mod-sdk) que agrega assets y nodos personalizados a Warudo.

:::tip
¡Consulta nuestro tutorial [Creando tu primer mod de plugin](creating-your-first-plugin-mod) para comenzar a crear un mod de plugin!
:::

:::info
Esta página discute las pautas generales para crear un mod de plugin. Por favor, consulta también la página de la API de scripting de [Plugins](api/plugins).
:::

## Configuración del Entorno {#environment-setup}

Un plugin mod es simplemente un mod regular que contiene un script C# que hereda de `Plugin`. Puedes crear un nuevo mod siguiendo el tutorial [Creando Tu Primer Mod](../modding/creating-your-first-mod). Luego, crea un nuevo script C# en la carpeta del mod y hereda de `Plugin`. Si tienes algún tipo de asset o nodo personalizado, asegúrate de que estén registrados en las propiedades `AssetTypes` y `NodeTypes` del atributo `[PluginType]` (consulta [API de Plugin](api/plugins)).

## Incluyendo Assets de Unity

Puedes incluir assets de Unity (ej., prefabs, materiales, texturas) en tu plugin mod colocándolos en la carpeta del mod. Warudo automáticamente incluirá estos assets al exportar el mod.

:::caution
Si tus prefabs o materiales usan shaders o scripts personalizados, asegúrate de incluir esos shaders o scripts en la carpeta del mod también.
:::

Luego, puedes cargar estos assets en scripts durante el tiempo de ejecución. Consulta [Cargando Assets de Unity](api/plugins#loading-unity-assets) para más información.

## Limitaciones {#limitations}

Plugin mods have the following limitations:

- You cannot use third-party DLLs or NuGet packages.
- You cannot export C# scripts that are part of an assembly, i.e., you cannot have any `.asmdef` files in your mod folder.
- You cannot use reflection (`System.Reflection`) or access the file system (`System.IO`).
  * To invoke methods on `MonoBehaviour` components, consider using Unity's [`SendMessage`](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html) or [`BroadcastMessage`](https://docs.unity3d.com/ScriptReference/Component.BroadcastMessage.html) methods.
  * To store and retrieve data, see [Saving and Loading Data](api/io).

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
