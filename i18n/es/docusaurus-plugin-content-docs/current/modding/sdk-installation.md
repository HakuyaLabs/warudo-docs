---
sidebar_position: 1
translate_from_version: 2024-10-18
---

# Instalación de Unity y Warudo SDK

:::warning

This translation may be **out of date**.  
Please refer to the **English version** for the latest information.

:::

---

Esta página te guiará para instalar el **Editor de Unity** y el **Warudo SDK** paso a paso.

---

:::info

Actualmente solo se soportan sistemas **Windows de 64 bits**.

:::

## Paso 1 - Instalar Unity Hub

Primero, necesitas descargar **Unity Hub** (usualmente la versión más reciente está bien).  
Unity Hub es un software usado para gestionar diferentes versiones del Editor de Unity y proyectos en estas diferentes versiones.

Abre el [**sitio web oficial de Unity**](https://unity.com/download) y haz clic en una de las dos cajas rojas en la imagen de abajo para descargar Unity Hub. La descarga puede requerir registrar una cuenta de Unity.

![](/doc-img/en-sdk-installation-1.png)

Ejecuta el UnityHubSetup.exe descargado e instálalo en tu ruta preferida.  
Después de la instalación, confirma que se puede abrir correctamente.

![](/doc-img/sdk-installation-2.png)

Después de iniciar sesión, automáticamente te sugerirá descargar la versión más reciente de Soporte a Largo Plazo (LTS) del Editor de Unity,  
Warudo no usa esta versión, se recomienda hacer clic en **Skip installation**.

Pero si realmente quieres instalar esa versión, recomendamos fuertemente que cambies la ruta de instalación a `...\<versión>` (por ejemplo, `D:\Softwares\Unity\2021.3.18f1`),  
para gestionar más convenientemente **múltiples versiones** del Editor de Unity,  
y **no** usar la ruta de instalación por defecto `C:\Program Files\Unity\Hub\Editor`.

![](/doc-img/sdk-installation-3.png)

Si cumples los términos para la Edición Personal de Unity, puedes elegir activar y obtener una licencia personal aquí.

![](/doc-img/sdk-installation-4.png)

Si omitiste la activación en el paso anterior o la activación falló, también puedes activar manualmente la licencia más tarde en Unity Hub.

![](/doc-img/sdk-installation-5.png)

![](/doc-img/sdk-installation-6.png)

![](/doc-img/sdk-installation-7.png)

Puedes cambiar el idioma de Unity Hub en 【Preferences】-【Appearance】.

![](/doc-img/sdk-installation-8.png)

## Paso 2 - Instalar Editor de Unity

A continuación, necesitas descargar el instalador del Editor de Unity, y la versión debe ser estrictamente **Unity 2021.3.18f1**.

Esta versión no puede descargarse directamente vía Unity Hub, necesitas:

1. Ir a [Unity Download Archive](https://unity.com/releases/editor/archive);
2. Bajo la pestaña **【Unity 2021.X】**, encontrar 【Unity **2021.3.18** (February 1, 2023)】;
3. Hacer clic en 【Downloads (Win)】;
4. Seleccionar **【Unity Editor (64-bit)】**;
5. Esperar a que 【 `UnitySetup 64-2021.3.18f1.exe` 】 termine de descargarse (aproximadamente 2.3 GiB);

![](/doc-img/sdk-installation-9.png)

A continuación, ejecuta `UnitySetup 64-2021.3.18f1.exe` para iniciar la instalación.

La ubicación de instalación por defecto es `C:\Program Files\Unity 2021.3.18f1`, puedes cambiarla, pero se recomienda **incluir el número de versión en la ruta** para evitar conflictos de versión.

La instalación tomará mucho tiempo, por favor ten paciencia.

Después de la instalación, necesitas:

1. Abrir Unity Hub;
2. Hacer clic en 【Installs】-【Locate】;
3. Encontrar la ruta de instalación que seleccionaste antes, luego entrar a la subcarpeta 【Editor】, y encontrar 【Unity.exe】;
4. Después de seleccionar, hacer clic en 【Select Editor】.

En este punto, la versión `2021.3.18f1` de Unity.exe se mostrará correctamente en Unity Hub.

![](/doc-img/sdk-installation-10.png)

## Paso 3 - Descargar e Importar Warudo SDK

Hay dos maneras de configurar el Warudo SDK en Unity: 

- Descargar nuestra plantilla de proyecto de modding, 
- Importar manualmente el `.unitypackage` del SDK en tu proyecto. 

Recomendamos la primera opción, ya que es más fácil y menos propensa a errores.  
La segunda opción es más adecuada para actualizar un proyecto de modding existente.

### Opción 1: Plantilla de Proyecto de Modding (Recomendado)

[Warudo SDK 0.12.0 Modding Project.zip](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0%20Modding%20Project.zip)

1. **Descarga** el archivo zip de arriba y **Extrae** el contenido en cualquier lugar, digamos `D:\Softwares\Unity\2021.3.18f1\Projects\WarudoModding`.
2. En Unity Hub, haz clic en **"Add"** y selecciona la carpeta de arriba.
3. Luego espera a que Unity lance el proyecto. Cuando abres el proyecto de mod por primera vez, Unity puede tomar 5-10 minutos para configurar el proyecto.

![](/doc-img/en-mod-9.png)

Revisa la consola para cualquier error, pueden aparecer algunas advertencias, lo cual es normal:

![](/doc-img/en-mod-10.png)

Si no hay errores, ¡estás listo! Ahora ve y [crea tu primer mod](creating-your-first-mod).

:::tip

Si ves errores en la consola, intenta hacer clic en "Clear" para ver si estos errores pueden eliminarse. Si sigues teniendo problemas, por favor contáctanos en [Discord](https://discord.gg/warudo).

:::

### Opción 2: Instalación Manual (No recomendado)

:::caution

Solo debes usar esta opción si estás **actualizando un proyecto de modding existente**, o en el caso muy raro de que la primera opción no funcione para ti.

:::

Después de abrir el proyecto de Unity, abre el archivo `Packages/manifest.json` bajo tu carpeta de proyecto de Unity (nota que este archivo no es visible en el editor de Unity) y agrega las siguientes **9** dependencias en la sección `dependencies`:

```
{
  "dependencies": {
    "com.unity.burst": "1.7.2",
    "com.unity.cinemachine": "2.8.9",
    "com.unity.collections": "1.4.0",
    "com.unity.postprocessing": "3.2.2",
    "com.unity.nuget.newtonsoft-json": "3.0.2",
    "com.vrmc.gltf": "https://github.com/vrm-c/UniVRM.git?path=/Assets/UniGLTF#v0.107.0",
    "com.vrmc.univrm": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRM#v0.107.0",
    "com.vrmc.vrmshaders": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRMShaders#v0.107.0",
    "com.cysharp.unitask": "https://github.com/Cysharp/UniTask.git?path=src/UniTask/Assets/Plugins/UniTask",
    // ...
```

Regresa a Unity y espera a que el proyecto se recargue; asegúrate de que no haya errores.

:::caution

Si encuentras un error con el mensaje `An error occurred while resolving packages / Error adding package` al hacer clic en él revela un mensaje similar a `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`, significa que Git no está instalado en tu sistema.

![](/doc-img/en-mod-sdk-1.webp)

Para resolver este problema, necesitas descargar Git de [https://git-scm.com/download](https://git-scm.com/download) y luego reiniciar tanto Unity como Unity Hub.

:::

Confirma que el **Api Compatibility Level** en **File → Build Settings... → Player Settings... → Other Settings** esté configurado en .NET Framework.

![](/doc-img/en-mod-sdk-2.webp)

Descarga el siguiente `.unitypackage` e impórtalo en tu proyecto de Unity:

<a href="/sdk/Warudo SDK 0.12.0.unitypackage" target="_blank">
<div className="file-box">
<p>
Warudo SDK 0.12.0.unitypackage
</p></div>
</a>

:::caution

Si estás importando en un proyecto **existente**, y tienes cualquiera de los siguientes instalados:

* [Animancer](https://assetstore.unity.com/packages/tools/animation/animancer-pro-116514)
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)
* [Final IK](https://assetstore.unity.com/packages/tools/animation/final-ik-14290)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)
* [PuppetMaster](https://assetstore.unity.com/packages/tools/physics/puppetmaster-48977)

Por favor desmarca las carpetas correspondientes de la importación, o tus componentes serán reemplazados por archivos stub:

* `Plugins/Animancer`
* `Packages/DynamicBone`
* `Plugins/RootMotion/FinalIK`
* `Plugins/MagicaCloth`
* `Plugins/RootMotion/PuppetMaster`

:::

Revisa la consola para cualquier error. Si no hay ninguno, ¡estás listo! Ahora ve y [crea tu primer mod](creating-your-first-mod).

:::tip

Si ves errores en la consola, intenta hacer clic en "Clear" para ver si estos errores pueden eliminarse. Si sigues teniendo problemas, por favor contáctanos en [Discord](https://discord.gg/warudo).

:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'}
  ],
}} />
