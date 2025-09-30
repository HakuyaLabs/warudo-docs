---
sidebar_position: 0
---

# Resumen

![](/doc-img/mod-cover.jpg)

Warudo proporciona un sistema completo de modding que te permite importar tus propios assets 3D a Warudo, incluyendo:

* [Personajes](character-mod)
* [Animaciones de Personaje](character-animation-mod)
* [Props](prop-mod)
* [Partículas](particle-mod)
* [Entornos](environment-mod)

Los mods en Warudo se crean usando el **Warudo SDK**. Un SDK es básicamente una forma elegante de decir "un conjunto de herramientas que te ayudan a crear mods", ¡en este caso, nuestro proyecto de Unity! Los mods exportados por el Warudo SDK tienen una extensión de archivo `.warudo` y pueden ser reconocidos por Warudo cuando se colocan en las carpetas de datos correspondientes. Puedes compartir tus archivos de mod con otros directamente, o subirlos a nuestro [Steam Workshop](https://steamcommunity.com/app/2079120/workshop/) a través de la pestaña **Discover**.

![](/doc-img/en-mod-8.png)
<p class="img-desc">Navegando y compartiendo mods en la pestaña Discover.</p>

## Configurar el SDK

Para configurar el SDK, necesitas configurar Unity correctamente primero.  
Puedes verificar los pasos detallados en: [Instalación de Unity y Warudo SDK](sdk-installation.md)

## Shaders Personalizados {#custom-shaders}

Puedes usar cualquier shader que sea compatible con el pipeline de renderizado integrado de Unity, como [lilToon](https://lilxyzw.github.io/lilToon/#/) y [Poiyomi Shader](https://www.poiyomi.com/).

[Warudo Pro](../pro.md) también soporta el [Universal Render Pipeline](https://docs.unity3d.com/Manual/com.unity.render-pipelines.universal.html) (URP), que te permite usar shaders compatibles con URP.

## Scripts C# Personalizados {#custom-scripts}

Lo que hace únicos a los mods de Warudo es que pueden incluir [scripts MonoBehaviour de C#](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html), permitiéndote agregar interactividad a tus mods. Por ejemplo, puedes agregar un script a tu mod de personaje para animar las orejas de tu personaje, o agregar un script a tu mod de entorno para controlar la iluminación. Para interactuar con los componentes integrados de Warudo, por favor consulta la sección [Scripting](../scripting/overview).

Cualquier script de C# colocado en la carpeta del mod será compilado e incluido en el mod. Puedes adjuntar estos scripts a tu personaje, prop o entorno tal como lo harías en un proyecto normal de Unity.

Sin embargo, ten en cuenta las siguientes limitaciones:

* [Definiciones de ensamblado (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) no están soportadas actualmente. Los scripts de C# cubiertos por las definiciones de ensamblado no serán empaquetados en el mod.
* [ScriptableObjects](https://docs.unity3d.com/ScriptReference/ScriptableObject.html) no están soportados actualmente.
* DLLs compilados no están soportados actualmente. Solo puedes incluir archivos fuente `.cs`.
* Cualquier script que referencie el namespace `UnityEditor` no está soportado.

Si estás incluyendo scripts en tu mod, recomendamos establecer **Log Level** en All y desmarcar **Clear Console On Build** en la ventana de Configuración de Mod:

![](/doc-img/en-mod-13.png)

Esto proporciona más información al construir el mod, para que puedas verificar la consola por cualquier error. Si has verificado que los scripts están colocados en la carpeta del mod pero el log de construcción establece que no se encontraron scripts por lo que la compilación se omite, es probable que los archivos `.csproj` no se generaron correctamente en tu proyecto. Necesitas hacer clic en **Edit → Preferences → External Tools** y hacer clic en **Regenerate project files**:

![](/doc-img/en-mod-12.png)

Luego, intenta construir el mod nuevamente.

## Respaldo de tu Proyecto de Modding

Recomendamos hacer un respaldo de tu proyecto de modding regularmente o usar [Unity Version Control](https://unity.com/solutions/version-control). Especialmente, si estás creando mods regularmente, debes respaldar el archivo `Asset/Packages/UMod/ExportSettings.asset` (nota que este archivo no es visible en el editor de Unity). Este archivo almacena las configuraciones de exportación de mod, como el directorio de exportación de mod y el ícono del mod. Si pierdes este archivo, necesitarás crear manualmente todos tus mods nuevamente.

:::caution
Hemos recibido reportes de que algunos usuarios han perdido su configuración de exportación después de exportar un mod. Esto está actualmente bajo investigación. Mientras tanto, recomendamos respaldar el archivo `ExportSettings.asset` regularmente.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
