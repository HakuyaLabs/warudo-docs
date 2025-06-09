---
sidebar_position: 110
---

# Virdyn Studio (VDMocapStudio)

Seguimiento corporal a través de [VDMocapStudio](https://www.virdynm.com/virdyn-vdmocap-studio-motion-capture-software-system-for-vdsuit-full-product/). Requiere un traje [VDSuit](https://www.virdynm.com/virdyn-vdsuit-full-for-full-body-function-inertia-motion-capture-suit-product/).

## Configuración

Abre VDMocapStudio y habilita la transmisión de datos haciendo clic en **Broadcast → OpenShare**. Asegúrate de que la IP seleccionada sea accesible desde Warudo.

![](/doc-img/en-virdyn-1.png)

## Calibración

La calibración del hardware de Virdyn se realiza en VDMocapStudio. También puedes usar **Virdyn Studio Receiver → Calibrate Root Transform** para restablecer la posición y rotación raíz del personaje en Warudo.

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
