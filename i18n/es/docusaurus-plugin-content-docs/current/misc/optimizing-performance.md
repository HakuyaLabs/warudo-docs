---
sidebar_position: 10
---

# Optimizando Rendimiento

Warudo debería ejecutarse sin problemas en la mayoría de PCs. Sin embargo, si estás experimentando problemas de rendimiento, especialmente cuando otros juegos/aplicaciones se ejecutan simultáneamente, puedes probar los siguientes métodos para mejorar el rendimiento.

## Resolución de Ventana

La resolución de la ventana de Warudo es uno de los factores más importantes que afecta el rendimiento de Warudo. Mientras más alta sea la resolución, menor será la tasa de frames. Casi nunca deberías usar resolución 4K a menos que tengas un PC muy potente. La resolución recomendada es 1920 x 1080, y la mayoría de plataformas de transmisión en vivo solo soportan hasta 1080p de todos modos.

Si 1920 x 1080 sigue siendo muy demandante para tu GPU, puedes probar 1280 x 720. Puedes establecer manualmente la resolución de la ventana de Warudo ajustando **Menu → Settings → Window Width/Height**.

## Entorno

Los [Entornos](../assets/environment), o los fondos 3D en Warudo, también son un factor importante que afecta el rendimiento. Mientras más complejo sea el entorno, menor será la tasa de frames. Por ejemplo, el entorno [Tokyo City](https://steamcommunity.com/sharedfiles/filedetails/?id=3004012790) es conocido por ser muy demandante en la mayoría de GPUs. Puedes probar usar un entorno más simple, o incluso ningún entorno en absoluto.

## Personaje

¿Hay demasiados mesh renderers en tu personaje? Los modelos exportados de [VRoid Studio](https://vroid.com/en/studio) a menudo tienen este problema si olvidaste optimizar la configuración de exportación para reducir el conteo de mallas. (¡Hemos visto modelos con más de 100 mallas solo para el cabello!) Puedes ya sea re-exportar el modelo o combinar las mallas en Blender.

Similarmente, asegúrate de que no haya demasiados materiales en tu personaje.

## Limitar FPS

Si estás transmitiendo a una plataforma que solo soporta 30 FPS, o estás ejecutando un juego pesado junto con Warudo, puedes limitar los FPS a 30 para reducir la carga en tu GPU. Puedes hacer esto ajustando **Menu → Settings → Limit FPS**. Si has habilitado VSync, apágalo primero.

## Seguimiento MediaPipe

El seguimiento de manos de [MediaPipe](../mocap/mediapipe) puede ser bastante demandante en tu CPU o GPU, dependiendo de si has habilitado **MediaPipe Tracker → GPU Acceleration**. Si estás experimentando problemas de rendimiento, trata de desactivar el seguimiento de manos de MediaPipe, o deshabilita la aceleración GPU para usar seguimiento por CPU en su lugar.

## Otras Aplicaciones Compitiendo por Recursos de GPU

Si estás ejecutando un juego o aplicación intensiva en GPU junto con Warudo como Apex Legends, puedes notar que la tasa de frames de Warudo baja significativamente. Esto es porque el otro juego/aplicación solicita una prioridad de GPU más alta, así que Warudo no puede renderizar tan suavemente como debería.

Para permitir que Warudo tenga una prioridad de GPU más alta, primero debes ejecutar Warudo como administrador. Ve a tu biblioteca de Steam, haz clic derecho en Warudo y selecciona **Manage → Browse local files**:

![](/doc-img/zh-faq-1.webp)

Haz clic derecho en Warudo.exe y haz clic en **Properties**:

![](/doc-img/zh-faq-2.webp)

Luego ve a la pestaña **Compatibility**, marca **Run this program as an administrator**, y haz clic en OK.

![](/doc-img/en-performance-1.png)

Finalmente, abre Warudo y habilita **Menu → Settings → Increase GPU Priority**.

:::caution
El aumento de prioridad de GPU para Warudo puede a su vez disminuir las tasas de frames de otras aplicaciones/juegos 3D ejecutándose simultáneamente.
:::

:::info
Si estás experimentando problemas de rendimiento con otras aplicaciones/juegos, puedes probar ejecutarlos como administrador también.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
