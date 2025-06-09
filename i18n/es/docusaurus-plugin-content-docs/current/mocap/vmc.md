---
sidebar_position: 500
---

# VMC

Seguimiento a través de una aplicación externa, que envía datos a Warudo vía el [protocolo VirtualMotionCapture](https://protocol.vmc.info/english). Los rastreadores VR también son soportados usando la versión de pago (supporter) de [VirtualMotionCapture](https://www.patreon.com/sh_akira).

## Configuración

### Rastreadores VR

Primero, asegúrate de tener la versión de pago (supporter) de [**VirtualMotionCapture**](https://vmc.info/) instalada. Puede ser descargada desde el [Patreon](https://www.patreon.com/sh_akira) o [pixivFANBOX](https://akira.fanbox.cc/) del desarrollador.

:::tip
¿Cuál es la diferencia entre VirtualMotionCapture y VMC? Simplemente, son la misma cosa, pero pueden referirse a dos cosas diferentes. Una es la aplicación original VirtualMotionCapture, una es el protocolo que es usado por VirtualMotionCapture y otras aplicaciones. (Un protocolo es básicamente cómo las aplicaciones se comunican entre sí.) En este manual, usamos "VMC" para referirnos al protocolo, y "VirtualMotionCapture" para referirnos a la aplicación.
:::

Asegúrate de haber conectado tus rastreadores VR a SteamVR. Luego, abre VirtualMotionCapture; carga tu modelo VRM, y realiza la calibración. Finalmente, marca **Enable OSC motion sender** en **Settings → VMCProtocol Motion sender**. El puerto por defecto 39539 también es el puerto por defecto que usa el receptor VMC de Warudo.

![](/doc-img/en-vmc-1.png)

### VSeeFace

El siguiente ejemplo demuestra cómo aplicar datos VMC al personaje usando [VSeeFace](https://www.vseeface.icu/). Otro software que soporte VMC puede ser configurado de manera similar.

En **General settings**, asegúrate de que **VMC Protocol → Send datawith VMC protocol** esté marcado. El puerto por defecto 39539 también es el puerto por defecto que usa el receptor VMC de Warudo.

![](/doc-img/zh-vmc-1.webp)

### Otras Aplicaciones

Para otras aplicaciones que soporten VMC, puedes verificar la documentación de la aplicación para ver cómo habilitar el seguimiento VMC. Asegúrate de estar enviando al puerto correcto (por defecto 39539).

## Calibración

La calibración de sistemas de seguimiento compatibles con VMC se realiza en la aplicación externa.

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### Mi personaje está en poses extremadamente extrañas.

Primero, asegúrate de haber cargado el mismo modelo en Warudo y en la aplicación externa.

También requerimos que los modelos tengan huesos normalizados, es decir, todos los huesos en el modelo deben tener rotación cero (0, 0, 0) cuando el modelo esté en T-pose. Si tu modelo está en [formato VRM](https://vrm.dev/), entonces en la mayoría de los casos no debería haber problemas. Sin embargo, en casos muy raros, el modelador puede no haber marcado la opción Enforce T-Pose al exportar, y puede ser corregido re-exportando con esta opción marcada. Por favor consulta [esta página](../misc/normalizing-model-bones) para más detalles.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
