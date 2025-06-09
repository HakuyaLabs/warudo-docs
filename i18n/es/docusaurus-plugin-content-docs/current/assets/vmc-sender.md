---
sidebar_position: 50
---

# Transmisor VMC

¡Envía los datos de animación de un personaje a cualquier software que soporte el [protocolo VirtualMotionCapture](https://protocol.vmc.info/english)!

:::tip
Se puede encontrar una lista de programas compatibles [aquí](https://protocol.vmc.info/Reference).
:::

## Propiedades

* Dirección IP: A qué dirección IP se enviarán los datos.
* Puerto: A qué puerto se enviarán los datos.
* Personaje: Selecciona el personaje cuyos datos de animación se enviarán.
* Enviar a VirtualMotionCapture: Si los datos se están enviando a [VirtualMotionCapture](https://akira.works/VirtualMotionCapture-en/) (el software con el mismo nombre, no el protocolo VMC). Esta opción debe estar habilitada debido a un error en VirtualMotionCapture al analizar datos de animación.
  * Calibrando (VirtualMotionCapture): Habilita esta opción durante la calibración T-Pose en VirtualMotionCapture; deshabilítala después.

:::caution
Esta función requiere que todas las rotaciones iniciales de los huesos en el modelo sean 0, de lo contrario los datos enviados a otro software pueden no ser compatibles. Si tu modelo está en [formato VRM](https://vrm.dev/), entonces en la mayoría de los casos no debería haber problema. Sin embargo, en casos muy raros, el modelador puede no haber marcado la opción Enforce T-Pose al exportar, y puede arreglarse re-exportando con esta opción marcada.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
