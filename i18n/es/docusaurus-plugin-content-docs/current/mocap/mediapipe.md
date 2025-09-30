---
sidebar_position: 50
---

# MediaPipe

Seguimiento facial y de manos basado en webcam. Para el seguimiento facial, MediaPipe rastrea más de 40 blendshapes de ARKit, rotación de cabeza y traslación de cabeza. Para el seguimiento de pose, MediaPipe rastrea tus muñecas y dedos.

## Configuración

MediaPipe está integrado en Warudo, por lo que no necesitas instalar ningún software adicional. La mayoría de las webcams deberían funcionar con MediaPipe, pero si tienes problemas para hacerlo funcionar, consulta la sección de [Preguntas Frecuentes](#FAQ) más abajo.

MediaPipe puede ejecutarse tanto en CPU como en GPU. Se recomienda GPU para mejor rendimiento; por defecto, MediaPipe ya se ejecuta en GPU. Para usar CPU en su lugar, ve al asset **MediaPipe Tracker** y deshabilita **GPU Acceleration**.

:::tip
¿Cuándo usar CPU? Si estás jugando un juego que usa muchos recursos de GPU, puede que quieras usar CPU para MediaPipe en su lugar para evitar problemas de rendimiento.
:::

Si usas MediaPipe para el seguimiento de manos, por favor asegúrate de estar en el centro de la cámara y que tus manos estén completamente visibles en la vista de la cámara. Puedes habilitar **Show Camera** en el asset **MediaPipe Tracker** para ver la vista de la cámara; debería verse así:

![](/doc-img/en-mediapipe-1.png)

Generalmente, deberías colocar la cámara arriba de la pantalla de la computadora, con tu cabeza ligeramente arriba del centro de la vista de la cámara. También recomendamos calibrar el seguimiento de manos antes del uso. Ve [Calibración](#Calibration) para detalles.

## Calibración {#Calibration}

### Seguimiento Facial

Puedes calibrar el seguimiento facial de MediaPipe:
* haciendo clic en **Character → Motion Capture → Quick Calibration → Calibrate MediaPipe**, o
* haciendo clic en **Calibrate** en el asset **MediaPipe Tracker**.

Durante la calibración, debes mirar hacia adelante y mantener tu cabeza quieta. Después de la calibración, puedes mover tu cabeza libremente.

### Seguimiento de Manos

Puedes calibrar el seguimiento de manos de MediaPipe haciendo clic en **Calibrate Hand Tracking** en el asset **MediaPipe Tracker**. Levanta una de tus manos junto a tu oreja con la palma mirando hacia la cámara. Usa tu otra mano para presionar **OK** para calibrar.

![](/doc-img/en-mediapipe-2.png)
<p class="img-desc">Durante la calibración, las manos deben estar en una postura relajada con la palma mirando hacia la cámara, con los dedos ligeramente doblados si se desea.</p>

Si encuentras que tus manos se mueven demasiado rápido o demasiado lento, puedes ajustar la opción **Hand Movement Range**. También puedes ajustar la opción **Hand Movement Offset**, para mover las manos más cerca de tu cabeza, por ejemplo.

## Opciones

* **Hand Movement Range**: El rango de movimiento para las manos. X es izquierda y derecha, Y es arriba y abajo, y Z es adelante y atrás.
* **Hand Movement Offset**: El desplazamiento del rango de movimiento de las manos. X positivo es un desplazamiento a la izquierda, Y positivo es un desplazamiento hacia arriba, y Z positivo es un desplazamiento hacia adelante.
* **Arm Swivel Offset**: Rota el codo hacia adentro o hacia afuera.
* **Hand Horizontal Distance Compensation**: Acerca las manos del personaje, facilitando hacer gestos como cruzar los dedos.
* **Hand Y Threshold**: Si la distancia entre la muñeca y los bordes superior e inferior de la vista de la cámara es menor que este valor, el seguimiento de esa mano se ignora. Esto ayuda a evitar problemas de temblor causados por seguimiento inestable.
* **Camera Diagonal Field of View**: El campo de visión de la cámara. Un valor preciso ayuda a estimar la profundidad de las manos. Normalmente puedes encontrar el campo de visión listado por el fabricante en la página de la tienda de la cámara.
* **Hand Push Z Max**: Las manos serán empujadas hacia adelante para prevenir que atraviesen el cuerpo. Este valor determina la distancia máxima que las manos serán empujadas hacia adelante.
* **Hand Push Y Range**: Mientras más abajo estén las manos de los hombros, más serán empujadas hacia adelante. Cuando la distancia vertical de las manos a los hombros sea mayor o igual a este valor, serán empujadas hacia adelante al máximo.
* **Hand Push Y Offset**: Cuando este valor es 0, las manos comienzan a ser empujadas hacia adelante desde los hombros hacia abajo. Cuando este valor es positivo, las manos comienzan a ser empujadas hacia adelante desde arriba de los hombros.
* **Shoulder Rotation Weight**: Cuánto deberían rotar los hombros. 0 significa sin rotación, 1 significa rotación completa. Ajusta este valor hasta que los hombros se vean naturales.

## Preguntas Frecuentes {#FAQ}

Por favor consulta [Overview](overview#FAQ), [Customizing Face Tracking](face-tracking#FAQ), y [Customizing Pose Tracking](body-tracking#FAQ) para preguntas comunes.

### Mi ventana del rastreador MediaPipe está negra / atascada en "Loading...".

Algunas webcams solo son soportadas cuando **GPU Acceleration** está habilitado (p. ej., cámaras IP como [DroidCam](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)), mientras que algunas solo son soportadas cuando **GPU Acceleration** está deshabilitado. Puedes intentar alternar **GPU Acceleration** en el asset **MediaPipe Tracker** para ver si soluciona el problema.

Adicionalmente, algunos software antivirus pueden bloquear a Warudo de acceder a la cámara. Por favor deshabilita la función de protección de cámara de tu software antivirus, o agrega Warudo a la lista blanca.

### No puedo inflar mis mejillas / sacar mi lengua.

Esta es una limitación conocida de MediaPipe; estamos esperando a que Google lo [solucione](https://github.com/google/mediapipe/issues/4403).

### Mi seguimiento está entrecortado.

Primero, asegúrate de que tu webcam esté realmente ejecutándose a 30+ FPS. Puedes usar [este sitio web](https://webcamtests.com/fps) para verificar los FPS de tu webcam. Si tu webcam se está ejecutando a FPS bajos, tu habitación puede estar demasiado oscura; asegúrate de que tu habitación esté bien iluminada.

Si tu webcam se está ejecutando a 30+ FPS, pero la ventana del rastreador muestra FPS mucho más bajos, intenta alternar **GPU Acceleration** en el asset **MediaPipe Tracker**.

:::tip
Los FPS de seguimiento normalmente están entre 15-30. Cuando estás jugando un juego 3D, los FPS de seguimiento pueden bajar a ~10.
:::

### Mi seguimiento se ha congelado.

Si estás usando una laptop, asegúrate de que esté conectada y no funcionando con batería.

### ¿Debería usar MediaPipe o [Leap Motion](leap-motion.md) para el seguimiento de manos?

Generalmente recomendamos usar un Leap Motion Controller 2 con un soporte para cuello/pecho para el seguimiento de manos, si tienes el presupuesto. El seguimiento de Leap Motion es generalmente más estable y usa menos recursos de CPU/GPU que MediaPipe, especialmente cuando estás jugando un juego 3D.

No recomendamos el Leap Motion Controller 1 que tiende a perder el seguimiento fácilmente.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
