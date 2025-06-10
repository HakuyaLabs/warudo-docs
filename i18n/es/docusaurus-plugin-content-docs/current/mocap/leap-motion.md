---
sidebar_position: 70
---

# Leap Motion Controller

Seguimiento de manos a través del [Leap Motion Controller](https://leap2.ultraleap.com/leap-motion-controller-2/).

## Configuración

Recomendamos usar un Leap Motion Controller 2 para un seguimiento más preciso y estable. El Leap Motion Controller original también está soportado.

Para conectar el Leap Motion Controller a Warudo, necesitas descargar e instalar el software Gemini más reciente desde [el sitio web de Leap Motion](https://leap2.ultraleap.com/gemini-downloads/).

Warudo soporta los 3 modos de seguimiento ofrecidos por el Leap Motion Controller: **Desktop**, **Screen Top**, y **Chest Mounted**. Recomendamos usar el modo **Chest Mounted** junto con un [soporte para cuello/pecho](https://www.etsy.com/market/leap_motion_mounting) para la mejor experiencia.

## Calibración {#Calibration}

Generalmente no hay necesidad de calibrar el Leap Motion Controller. Sin embargo, puedes ajustar **Controller Position Offset**, **Controller Rotation Offset**, y **Controller Scale** en el asset **Leap Motion Controller** para ajustar el seguimiento. Un Leap Motion Controller virtual se mostrará en la escena para ayudarte a visualizar el seguimiento.

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">Ajustar el Leap Motion Controller virtual.</p>

## Opciones

* **Controller Position Offset**: El desplazamiento de la posición del controlador. X positivo es un desplazamiento a la izquierda, Y positivo es un desplazamiento hacia arriba, y Z positivo es un desplazamiento hacia adelante.
* **Controller Rotation Offset**: El desplazamiento de la rotación del controlador.
* **Controller Scale**: La escala del controlador. Aumenta este valor si quieres que las manos estén más lejos del cuerpo. También puedes habilitar **Per-Axis Scale** para escalar el controlador en cada eje por separado.
* **Fix Finger Orientations Weight**: Debido a diferentes especificaciones de modelo, las orientaciones de los dedos del Leap Motion Controller pueden no coincidir con las orientaciones de los dedos del modelo. Esta opción te permite ajustar las orientaciones de los dedos del Leap Motion Controller para que coincidan con el modelo. 0 significa sin ajuste, 1 significa ajuste completo. Ajusta este valor hasta que los dedos se vean naturales.
* **Shoulder Rotation Weight**: Cuánto deberían rotarse los hombros. 0 significa sin rotación, 1 significa rotación completa. Ajusta este valor hasta que los hombros se vean naturales.

## Preguntas Frecuentes {#FAQ}

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### El asset Leap Motion Tracker dice "Tracker not started."

Por favor asegúrate de haber instalado el [software Gemini](https://leap2.ultraleap.com/gemini-downloads/) más reciente, y que esté ejecutándose en segundo plano.

### La muñeca/dedos de mi modelo se ven no naturales.

Intenta ajustar la opción **Fix Finger Orientations Weight** en el asset **Leap Motion Tracker**. También es posible que necesites ajustar las opciones **Wrist Rotation Offset** y **Global Finger Rotation Offset** (marca las casillas de la izquierda para habilitarlas).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
