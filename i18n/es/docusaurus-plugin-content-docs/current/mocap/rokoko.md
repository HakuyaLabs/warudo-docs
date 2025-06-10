---
sidebar_position: 90
---

# Rokoko

Seguimiento facial y corporal a través de [Rokoko](https://www.rokoko.com/).

## Configuración

Abre Rokoko Studio y habilita **Livestream → Activate streaming to Unity**:

![](/doc-img/zh-rokoko-1.webp)

Luego, actualiza **Profile Name** en el asset **Rokoko Receiver** al actor de Rokoko cuyos datos de captura de movimiento te gustaría recibir:

![](/doc-img/zh-rokoko-2.webp)

:::caution
Nota: Necesitas una suscripción Rokoko Plus o Pro para transmitir a Unity.
:::

:::info
Para más detalles, ve la [documentación oficial](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity).
:::

## Calibración

La calibración del hardware de Rokoko se realiza en Rokoko Studio.

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### Mi seguimiento se va desviando con el tiempo.

Este es un problema común con los sistemas de captura de movimiento inerciales, que se desvían con el tiempo debido a errores acumulativos. Para reducir la deriva, asegúrate de que no haya interferencia magnética o eléctrica cerca de los sensores de seguimiento.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />

