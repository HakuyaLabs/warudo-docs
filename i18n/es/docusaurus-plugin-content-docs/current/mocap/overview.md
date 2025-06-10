---
sidebar_position: 10
---

# Resumen

![](/doc-img/mocap-cover.jpg)

Ya sea que estés transmitiendo desde casa o en un estudio de mocap profesional, Warudo te tiene cubierto. Actualmente, Warudo soporta los siguientes sistemas de captura de movimiento:

* Webcam
  * Seguimiento integrado a través de [MediaPipe](./mediapipe) o [OpenSeeFace](./openseeface).
* iPhone
  * Requiere que esté instalada la aplicación [iFacialMocap / FaceMotion3D](./ifacialmocap) o [RhyLive](./rhylive) en el iPhone.
* [SteamVR](./steamvr)
* [Leap Motion Controller](./leap-motion)
* [Sony Mocopi](./mocopi)
* [Rokoko](./rokoko)
* [Xsens MVN](./xsens-mvn)
* [Virdyn Studio (VDMocapStudio)](./virdyn)
* [Noitom Axis](./noitom)
* [StretchSense Glove](./stretchsense)
* Aplicaciones externas que soportan el [protocolo VMC](./vmc), p. ej., [VSeeFace](https://www.vseeface.icu/), [VirtualMotionCapture](https://vmc.info/)
  * Los rastreadores VR son soportados usando la versión de pago (supporter) de [VirtualMotionCapture](https://www.patreon.com/sh_akira).

[Warudo Pro](../pro.md) también soporta los siguientes sistemas de captura de movimiento:

* Cualquier sistema de seguimiento óptico compatible con [Autodesk MotionBuilder](./motionbuilder), p. ej., [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)
* [OptiTrack Motive](./optitrack)
* [Chingmu Avatar](./chingmu)

## ¿Qué sistemas de captura de movimiento debería usar?

Si eres completamente nuevo en el VTubing 3D, recomendamos comenzar con [MediaPipe](./mediapipe) tanto para el seguimiento facial como para el seguimiento de manos. MediaPipe es un sistema de captura de movimiento integrado en Warudo, y solo necesitas una webcam para usarlo. Si tienes un iPhone, recomendamos usar la aplicación [iFacialMocap](./ifacialmocap) para el seguimiento facial en su lugar, ya que ofrece mucha mayor precisión que MediaPipe, y transferir el seguimiento facial al iPhone también reduce la carga en tu computadora.

Si buscas mejorar la calidad de tu seguimiento, aquí tienes algunas sugerencias:

* Usa un iPhone para el seguimiento facial (a través de la aplicación [iFacialMocap](./ifacialmocap)). Esta es también la mejor solución de seguimiento facial que puedes obtener. Si no tienes un iPhone, puedes considerar buscar un iPhone usado. Mientras sea compatible con Face ID, debería funcionar con iFacialMocap.

:::tip
Para obtener la mejor calidad de seguimiento, recomendamos usar un iPhone 12 o más reciente (iPhone mini también funciona). Los iPhones más antiguos pueden tener menor calidad de seguimiento.
:::
* Si encuentras que el seguimiento de manos de MediaPipe no es lo suficientemente preciso, puedes considerar usar un [Leap Motion Controller](./leap-motion) para el seguimiento de manos. Puedes usar un [soporte para cuello](https://www.etsy.com/market/leap_motion_mounting) para llevarlo en tu cuello, de modo que pueda rastrear tus manos.
* Si buscas una solución de seguimiento de cuerpo completo, puedes considerar usar [Sony Mocopi](./mocopi) o [rastreadores VR](./vmc.md). Si tienes el presupuesto, también puedes considerar usar un traje de mocap, como [Virdyn VDSuit](./virdyn), [Noitom Perception Neuron](./noitom), [Rokoko Smartsuit Pro](./rokoko), o [Xsens MVN Link](./xsens-mvn). Puedes agregar seguimiento de dedos a estos trajes de mocap usando [guantes StretchSense](./stretchsense).
* Si buscas una solución más profesional, puedes considerar usar un sistema de seguimiento óptico, como [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/), o [Chingmu](https://www.chingmu.com/).

## Configuración {#setup}

Hay dos maneras de configurar la captura de movimiento en Warudo. La primera y preferida manera es usar el asset **Onboarding Assistant** que viene con cada escena. Simplemente haz clic en **Basic Setup → Get Started** para iniciar el proceso de incorporación y seguir las instrucciones.

![](/doc-img/en-getting-started-2.png)
<p class="img-desc">Configurando la captura de movimiento en el asset del asistente de incorporación.</p>

Después de que el proceso de incorporación esté completo, puedes seleccionar los assets de captura de movimiento relevantes para personalizar aún más tu seguimiento. Por ejemplo, si estás usando iFacialMocap, puedes notar que Warudo agrega algo de movimiento al cuerpo de tu personaje cuando tu cabeza se mueve. Si esto no es deseable, puedes establecer **Body Movement Intensity** en 0 en el asset **iFacialMocap Receiver**.

![](/doc-img/en-mocap-1.png)
<p class="img-desc">Ajustando la intensidad del movimiento corporal de iFacialMocap.</p>

La segunda manera de configurar la captura de movimiento es usar **Character → Setup Motion Capture**. Esto te permite configurar el seguimiento facial y/o el seguimiento de pose directamente. Sin embargo, algunos pasos de verificación en el proceso de incorporación también se omiten.

![](/doc-img/en-mocap-2.png)
<p class="img-desc">Configurando la captura de movimiento en el asset del personaje.</p>

Este método es útil si necesitas configurar múltiples sistemas de seguimiento facial o de seguimiento de pose, ya que el asistente de incorporación siempre elimina la configuración de captura de movimiento existente cuando inicias un nuevo proceso de incorporación.

Cualquiera que sea el método que elijas, los blueprints de seguimiento correspondientes serán generados y agregados a tu escena. Por ejemplo, si has elegido iFacialMocap para el seguimiento facial y MediaPipe para el seguimiento de pose, podrás ver dos blueprints generados: **Face Tracking - iFacialMocap** y **Pose Tracking - MediaPipe**. Puedes modificar estos blueprints para personalizar tu seguimiento.

:::caution
Casi nunca deberías crear un asset de captura de movimiento manualmente, es decir, haciendo clic en **Add Asset** y seleccionando un asset de captura de movimiento, como **iFacialMocap Receiver**. Esto es porque el asset de captura de movimiento por sí solo solo recibe o proporciona los datos de seguimiento, pero no conecta los datos de seguimiento a tu personaje, lo cual necesita ser hecho por blueprints. El asistente de incorporación y la función **Setup Motion Capture** automáticamente crean los blueprints necesarios para ti.
:::

## Preguntas Frecuentes {#FAQ}

### Mi personaje no se está moviendo.

Si estás usando un sistema de captura de movimiento que requiere una aplicación externa, como iFacialMocap, asegúrate de que la aplicación esté ejecutándose y que los datos de seguimiento se estén enviando a Warudo. También, asegúrate de que el firewall de tu computadora no esté bloqueando a Warudo de recibir los datos de seguimiento; puede que necesites agregar Warudo a la lista blanca, o temporalmente deshabilitar el firewall.

También puedes querer establecer tu red como una red privada, ya que Windows puede bloquear conexiones entrantes de redes públicas. Ve [esta guía](https://support.microsoft.com/en-us/windows/make-a-wi-fi-network-public-or-private-in-windows-0460117d-8d3e-a7ac-f003-7a0da607448d) para más información.

Algunos receptores de captura de movimiento tienen una opción **Port**. Asegúrate de que el número de puerto coincida con el número de puerto en la aplicación externa.

### Mi seguimiento es demasiado suave / demasiado entrecortado.

Por favor ve al blueprint de seguimiento (p. ej., **Face Tracking - iFacialMocap**) y localiza los nodos **Smooth Rotation List** / **Smooth Position List** / **Smooth Transform** / **Smooth BlendShape List**. Aumenta el valor de **Smooth Time** para hacer el seguimiento más suave, o disminuye el valor para hacer el seguimiento más responsivo.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
