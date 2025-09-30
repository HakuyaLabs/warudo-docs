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

Los mods de plugin tienen las siguientes limitaciones:

- No puedes usar DLLs de terceros ni paquetes NuGet.
- No puedes exportar scripts C# que formen parte de un ensamblado, es decir, no puedes tener archivos `.asmdef` en la carpeta de tu mod.
- No puedes usar reflexión (`System.Reflection`) ni acceder al sistema de archivos (`System.IO`).
  * Para invocar métodos en componentes `MonoBehaviour`, considera usar los métodos [`SendMessage`](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html) o [`BroadcastMessage`](https://docs.unity3d.com/ScriptReference/Component.BroadcastMessage.html) de Unity.
  * Para almacenar y recuperar datos, consulta [Guardado y Carga de Datos](api/io).

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
