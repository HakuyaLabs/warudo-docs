---
sidebar_position: 55
---

# OpenSeeFace

Seguimiento facial basado en webcam. Rastrea un conjunto de blendshapes básicos, rotación de cabeza y traslación de cabeza. La calidad del seguimiento facial es similar a la de [VSeeFace](https://www.vseeface.icu/).

:::info
OpenSeeFace es la tecnología de seguimiento facial usada en [VSeeFace](https://www.vseeface.icu/), por lo que los usuarios familiarizados con VSeeFace pueden encontrarla bastante familiar.
:::

:::caution
Generalmente recomendamos usar [MediaPipe](./mediapipe.md) para seguimiento facial en su lugar, que rastrea más blendshapes y tiene mejor calidad de seguimiento. OpenSeeFace se proporciona principalmente para usuarios que no pueden usar MediaPipe por alguna razón.
:::

## Configuración

OpenSeeFace está integrado en Warudo, por lo que no necesitas instalar ningún software adicional.

:::tip
Después de que se inicia el rastreador OpenSeeFace, toma 10-15 segundos para la calibración interna. Durante este tiempo, la boca y los ojos del modelo pueden moverse aleatoriamente, lo cual es normal.
:::

## Calibración

Puedes calibrar el seguimiento de OpenSeeFace:
* haciendo clic en **Character → Motion Capture → Quick Calibration → Calibrate OpenSeeFace**, o
* haciendo clic en **Calibrate** en el asset **OpenSeeFace Tracker**.

Durante la calibración, debes mirar hacia adelante y mantener tu cabeza quieta. Después de la calibración, puedes mover tu cabeza libremente.

## Opciones

* **Eye Blinking Offset**: Si encuentras que los ojos del modelo no se están cerrando completamente, agrega 0.1 al valor hasta que encaje. De otra manera, resta 0.1 del valor.
* **Eye Wide Sensitivity**: **Requiere que los blendshapes de ARKit estén presentes en el modelo.** Aumentar este valor hace que los blendshapes EyeWideLeft/EyeWideRight sean más fáciles de activar.
* **Eyebrow Movement Sensitivity**: **Requiere que los blendshapes de ARKit estén presentes en el modelo.** Aumentar este valor hace que los blendshapes relacionados con las cejas sean más fáciles de activar.
* **Mouth Left Right Sensitivity**: **Requiere que los blendshapes de ARKit estén presentes en el modelo.** Aumentar este valor hace que los blendshapes MouthLeft/MouthRight sean más fáciles de activar.
* **Mouth Open Threshold**: Si encuentras que la boca del modelo se abre demasiado fácil, agrega 0.1 al valor hasta que encaje. De otra manera, resta 0.1 del valor.
* **Mouth Open Sensitivity**: Aumentar este valor hace que el blendshape JawOpen (o el clip de animación VRM "A") sea más fácil de activar.
* **Mouth Funnel Sensitivity**: Aumentar este valor hace que el blendshape MouthFunnel (o el clip de animación VRM "O") sea más fácil de activar.
* **Mouth Smile Sensitivity**: **Requiere que los blendshapes de ARKit estén presentes en el modelo.** Aumentar este valor hace que los blendshapes MouthSmileLeft/MouthSmileRight sean más fáciles de activar.
* **Body Movement Intensity**: El rango de movimiento corporal natural que sigue al movimiento de la cabeza.

## Preguntas Frecuentes {#FAQ}

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento Facial](face-tracking#FAQ) para preguntas comunes.

### Una ventana de consola vacía sigue apareciendo cuando uso OpenSeeFace, y mi seguimiento no está funcionando.

Esto es causado por un error en Windows. Para solucionarlo, busca **Terminal** en el Menú de Inicio y ábrelo. Haz clic en el ícono de flecha hacia abajo y selecciona **Settings**. Selecciona **Windows Console Host** para **Default terminal application** y haz clic en **Save**. Luego, reinicia Warudo.

### I can see the OpenSeeFace tracker window, but my tracking is not working.

Some antivirus software may block Warudo from accessing the camera. Please disable the camera protection function of your antivirus software, or add Warudo to the whitelist.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
