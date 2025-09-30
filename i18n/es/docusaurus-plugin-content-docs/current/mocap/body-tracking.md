---
sidebar_position: 30
---

# Personalizando el Seguimiento de Pose

## Personalización de Blueprint

Durante el proceso de incorporación, puedes hacer clic en **Customize Pose Tracking...** para personalizar el blueprint de seguimiento.

![](/doc-img/en-mocap-4.png)
<p class="img-desc">Personalizando el seguimiento de pose.</p>

### Rastreadores de Parte Superior del Cuerpo

Para rastreadores de la parte superior del cuerpo (ej., MediaPipe, RhyLive, Leap Motion Controller), las siguientes opciones están disponibles:

* **Use Keyboard/Trackpad:** Si generar animaciones para el personaje usando un teclado o trackpad, incluso cuando las manos no están siendo rastreadas.
  
  ![](/doc-img/zh-keyboard-1.webp)
  
  Después de la incorporación, puedes ajustar la configuración del teclado/touchpad haciendo clic en **Character → Motion Capture → Blueprint Navigation → Input Interfaces Animation Settings**.
  
  El teclado y el touchpad pueden ser desactivados por separado deshabilitando cualquiera de los assets:
  
  ![](/doc-img/zh-keyboard-3.webp)
  :::danger
  Cuando el teclado está habilitado, por favor evita ingresar información sensible como contraseñas.
  :::
* **Track Fingers Only:** Si está habilitado, solo los dedos serán rastreados por este sistema de seguimiento. Esto es útil si estás usando un sistema de seguimiento de pose de cuerpo completo que ya rastrea las manos.

### Rastreadores de Cuerpo Completo

Para rastreadores de cuerpo completo, las siguientes opciones están disponibles:

* **Track Full Body / Tracked Body Parts:** Si **Track Full Body** está establecido en **No**, solo las partes del cuerpo que están seleccionadas en **Track Full Body** serán rastreadas por este sistema de seguimiento. Esto es útil si estás usando múltiples sistemas de seguimiento de pose de cuerpo completo, y quieres usar diferentes sistemas para rastrear diferentes partes del cuerpo.

## Personalización del Tracker

Después de la incorporación, puedes ir al asset de seguimiento de pose correspondiente (ej., MediaPipe Tracker, VMC Receiver) para personalizar los datos de seguimiento en sí. Las siguientes opciones están disponibles:

* **Mirrored Tracking:** Si está habilitado, Warudo reflejará los datos de seguimiento.
* **Head Rotation Intensity/Offset:** Ajustar la intensidad y desplazamiento de la rotación de cabeza.

## Preguntas Frecuentes {#FAQ}

### ¿Cómo puedo combinar múltiples sistemas de seguimiento de pose?

Si quieres configurar un seguimiento de pose secundario, puedes usar la opción **Secondary Pose Tracking** durante el proceso de incorporación; esto es útil si estás usando rastreadores VR/Mocopi para seguimiento primario y te gustaría usar [MediaPipe](../mocap/mediapipe.md) o [Leap Motion Controller](../mocap/leap-motion.md) o [StretchSense Gloves](../mocap/stretchsense.md) para seguimiento de dedos adicional.

![](/doc-img/en-getting-started-8.png)
<p class="img-desc">Configurando seguimiento de pose secundario.</p>

Si quieres combinar más de dos sistemas de seguimiento de pose, puedes configurar el seguimiento de pose primario primero usando el asistente de incorporación, y luego configurar los sistemas de seguimiento de pose subsecuentes usando **Character → Setup Motion Capture** con **Track Full Body** establecido en **No** y **Tracked Body Parts** establecido en las partes específicas del cuerpo que quieres rastrear con ese sistema.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
