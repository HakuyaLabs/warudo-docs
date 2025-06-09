---
sidebar_position: 11
---

# Mod de Animación de Personaje

¿Tienes algunos [Animation Clips](https://docs.unity3d.com/Manual/AnimationClips.html) que quieres usar en Warudo? ¡Un mod de animación de personaje es lo que necesitas!

:::caution
Si tienes una animación que anima transformaciones que no son de huesos o propiedades de materiales, deberías considerar otros métodos para agregar estas animaciones a tu personaje. Consulta [Mod de Personaje](character-mod#animations) para más detalles.
:::

## Configuración {#setup}

### Paso 1: Preparar Animation Clip

Si ya tienes un **Animation Clip** (indicado por un ícono de triángulo cian) en tu proyecto, ¡genial! Puedes omitir este paso.

Si tu animación es un archivo FBX, primero asegúrate de que **Animation Type** esté establecido en Humanoid en la configuración de importación del rig:

![](/doc-img/en-mod-14.png)

Luego, expande el archivo FBX, selecciona el **Animation Clip** interno (indicado por un ícono de triángulo cian), y presiona Ctrl+D para crear una copia que esté fuera del archivo FBX.

![](/doc-img/en-character-animation-mod-1.webp)

### Paso 2: Renombrar Animation Clip

Renombra el Animation Clip a **"Animation"**, y asegúrate de que esté colocado en la carpeta del mod (puede colocarse en cualquier subcarpeta).

### Paso 3: Exportar Mod

Selecciona **Warudo → Build Mod** y asegúrate de que el archivo `.warudo` generado se coloque en la carpeta de datos `CharacterAnimations`.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
