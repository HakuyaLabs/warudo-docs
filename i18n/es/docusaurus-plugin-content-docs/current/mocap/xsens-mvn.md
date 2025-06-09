---
sidebar_position: 100
---

# Xsens MVN

Seguimiento corporal a través de [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US).

## Configuración

Abre **Xsens MVN → Options → Network Streamer** y configura como se muestra abajo.

![](/doc-img/zh-xens-1.webp)

Luego, actualiza **Actor ID** en el asset **Xsens MVN Receiver** al Actor de Xsens cuyos datos de captura de movimiento te gustaría recibir. El valor por defecto es 1.

:::caution
Nota: Necesitas una suscripción MVN Animate Plus o Pro para usar la característica Network Streamer.
:::

:::info
Para más detalles, ve la [documentación oficial](https://base.xsens.com/s/article/MVN-Unity-Live-Plugin?language=en\_US).
:::

## Calibración

La calibración del hardware de Xsens se realiza en Xsens MVN.

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### Mi seguimiento se va desviando con el tiempo.

Este es un problema común con los sistemas de captura de movimiento inerciales, que se desvían con el tiempo debido a errores acumulativos. Para reducir la deriva, asegúrate de que no haya interferencia magnética o eléctrica cerca de los sensores de seguimiento.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
