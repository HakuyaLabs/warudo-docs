---
sidebar_position: 400
---

# Director

:::info
Esta característica solo está disponible en [Warudo Pro](../pro).
:::

El asset director proporciona un control cinematográfico de cámara simple pero poderoso, permitiéndote entregar presentaciones en vivo de alta calidad con facilidad.

![](/doc-img/en-director-1.png)
<p class="img-desc">El conmutador de video en el director.</p>

:::tip
El director está basado en [Cinemachine](https://unity.com/unity/features/editor/art-and-design/cinemachine) de Unity, un sistema de cámara procedimental galardonado. Los usuarios de Cinemachine deberían encontrar familiares la mayoría de los conceptos de cámara virtual.
:::

## Configuración {#setup}

Una escena de muestra con un asset director preconfigurado está incluida en tu licencia Pro. Te recomendamos que comiences con esta escena de muestra para tener una idea de cómo funciona el director. Luego, puedes usar el botón **Export Asset** para exportar el asset director a una cadena JSON, e importarlo a tu propia escena usando el botón **Import Asset**.

Un asset director controla y anima un asset de [cámara](./camera). Puedes seleccionar la cámara que quieres controlar en el menú desplegable **Camera**. Para alternar el control de la cámara entre el director y el usuario (ej., orbitar personaje, vista libre), presiona **`** (la tecla arriba de Tab).

La lista **Virtual Cameras** contiene una lista de cámaras virtuales entre las que el director puede cambiar. Una cámara virtual determina cómo se posiciona, orienta y anima la cámara, cuando el director cambia a ella. Puedes presionar la tecla de acceso rápido mostrada junto al nombre de la cámara virtual para cambiar a esa cámara virtual; también puedes establecer la opción **Live Camera** directamente.

![](/doc-img/en-director-2.png)
<p class="img-desc">Presiona la tecla de acceso rápido para cambiar a la cámara virtual.</p>

Por defecto, el **Switcher** está habilitado. La UI del conmutador proporciona una forma intuitiva de previsualizar una cuadrícula de cámaras virtuales y cambiar entre ellas. Puedes usar **Flecha Izquierda/Derecha** para ir a la página anterior/siguiente, y **Clic Izquierdo del Mouse** para cambiar a la cámara virtual seleccionada. Por supuesto, aún puedes usar las teclas de acceso rápido para cambiar entre cámaras virtuales.

:::tip
Enabling the switcher can affect performance. If you are experiencing low FPS, try to reduce the **Grid Size** and **Update Rate**, or disable the switcher altogether.
:::

## Virtual Cameras

To add a new virtual camera, simply click the **+** button below the **Virtual Cameras** list. You can then configure the virtual camera as you like.

### Blend Animation

This option determines how the camera is animated when the director switches to this virtual camera. By default, the camera **Cut**s to the virtual camera, which means that the camera is instantly moved to the position and orientation of the virtual camera. You can choose to smoothly blend to the virtual camera instead, by selecting a **Default Blend** such as **EaseIn** or **EaseOut**.

### Camera Animation

To add animation to the virtual camera, first enable **Camera Animation** and specify the **Single Duration**. Then, all options in this virtual camera with the checkbox next to them checked will be animated over the specified duration.

For example, if you want to animate the **Field Of View** of the camera from 35 to 60, first check the checkbox next to **Field Of View**. Then, in the **Offset** field, specify the offset from the default value, which is 25 in this case.

![](/doc-img/en-director-3.png)
<p class="img-desc">Animando el campo de visión de 35 a 60.</p>

Puedes animar virtualmente cualquier opción en la cámara virtual, incluyendo el **Follow Offset**, **Look At Offset**, etc. de la cámara. Consulta las secciones de abajo para más detalles.

También puedes establecer el **Loop Type** de la animación. **Play Once** significa que la animación solo se reproducirá una vez. **Repeat** significa que la animación se repetirá indefinidamente. **Back And Forth** significa que la animación se reproducirá en bucle, pero la dirección de la animación se invertirá cada vez que llegue al final (usando el ejemplo de arriba, el campo de visión animará de 35 a 60, luego de 60 a 35, luego de 35 a 60, y así sucesivamente).

Finalmente, puedes concatenar múltiples animaciones de cámara habilitando **Auto Switch Camera On Animation End**. Esto te permite crear una secuencia de animaciones de cámara que se reproducen una tras otra.

### Campo de Visión

El campo de visión de la cámara, en grados. Un campo de visión más pequeño significa una vista más estrecha, y viceversa.

:::tip
Esto usualmente se establece en un valor bajo (\<35) para escenas de concierto, imitando lentes que se usan comúnmente en conciertos de la vida real.
:::

### Posición

La posición de la cámara.

* El modo **Manual** te permite especificar la posición directamente.
* El modo **Follow Target** pone la cámara en la misma posición que el **Target**; el objetivo puede ser un personaje, prop, o anchor. Puedes usar la opción **Damping** para suavizar el movimiento de la cámara.
* El modo **Transposer** pone la cámara en la misma posición que el **Target**, pero con un desplazamiento especificado por la opción **Follow Offset**. También puedes establecer el **Binding Mode** (documentación [aquí](https://docs.unity.cn/Packages/com.unity.cinemachine@2.8/manual/CinemachineBindingModes.html)). Las opciones de amortiguación están disponibles para cada eje de traslación/rotación.
* El modo **Orbital Transposer** es similar al modo **Transposer**, pero la cámara está en una órbita alrededor del objetivo, con la posición especificada por **Angular Offset**.

En la práctica, **Manual**, **Transposer**, y **Orbital Transposer** son los modos de posición más comúnmente usados.

:::caution
Un error común es establecer el **Target** a un hueso del personaje (ej., cabeza). Puede verse bien cuando el personaje no se está moviendo, pero cuando el personaje se mueve, la cámara se moverá rigurosamente con el personaje, ¡causando una cámara muy temblorosa! Para evitar esto, deberías establecer el **Target Character Mode** en **Root Position**, y habilitar **Fixed Rotation**. O, aún mejor en la mayoría de los casos, ¡simplemente usa el modo de posición **Manual** en su lugar!
:::

### Orientación

La orientación de la cámara.

* El modo **Manual** te permite especificar la orientación directamente.
* El modo **Follow Target** pone la cámara en la misma orientación que el **Target**; el objetivo puede ser un personaje, prop, o anchor. Puedes usar la opción **Damping** para suavizar el movimiento de la cámara.
* El modo **First Person** te permite mirar alrededor usando el mouse. Haz clic en el botón **Set Initial Rotation** para asegurarte de que la cámara comience en la orientación actual cuando la escena se cargue la próxima vez.
  :::caution
  El modo de orientación **First Person** no es compatible con la UI del **Switcher** en este momento. Debes deshabilitar el **Switcher** para usar el modo de orientación **First Person**.
  :::
* El modo **Hard Look At Character** fuerza a la cámara a siempre mirar al **Target**.
* El modo **Composer** rota la cámara para mirar al **Target**, pero con un desplazamiento especificado por la opción **Look At Offset**. Además, puedes cambiar **Screen X** y **Screen Y** para poner el objetivo en una posición diferente en la pantalla, diferente al centro.
  - Los parámetros de **Composition** te permiten ajustar la **Dead Zone**, **Soft Zone** y **Bias** de la composición de la cámara, asegurando que la cámara no se mueva demasiado cuando el objetivo se mueve ligeramente.
  - Los parámetros de **Lookahead** permiten que la cámara mire hacia adelante del objetivo, para que la cámara pueda anticipar el movimiento del objetivo.
  :::tip
  Lee esta [entrada de blog](https://blogs.unity3d.com/2019/07/24/understanding-cinemachine-fundamentals/) para una explicación visual del composer.
  :::

En la práctica, **Manual** y **Composer** son los modos de orientación más comúnmente usados.

:::caution
Un error común es olvidar configurar la **Dead Zone** y **Soft Zone** en el modo **Composer**. ¡Esto puede causar que la cámara se mueva demasiado cuando el objetivo se mueve solo ligeramente, causando una cámara muy temblorosa! Nota que deberías configurar la **Dead Zone** y **Soft Zone** después de que te hayas asegurado de que la cámara está en una buena posición.
:::

:::tip
Las cámaras fijas con ambos modos **Position** y **Orientation** establecidos en **Manual** son a menudo más útiles de lo que piensas——pueden reducir la carga cognitiva de los espectadores, asegurando que no sufran de mareo por movimiento. Puedes agregar **Handheld Movement** (ver abajo) para hacer que las cámaras fijas sean más naturales.
:::

### Desplazamiento de Posición/Orientación

El desplazamiento desde la posición/orientación por defecto de la cámara. Esto es útil cuando quieres animar la posición/orientación de la cámara desde su posición/orientación actual.

### Movimiento de Mano

Simula que la cámara está siendo sostenida por una persona. Esto agregará un ligero temblor al movimiento de la cámara. Puedes ajustar la **Intensity** y **Speed** para controlar la fuerza y velocidad del temblor.

### Detección de Colisiones

Habilita la detección de colisiones para la cámara, para que la cámara no atraviese paredes u otros colliders. Puedes ajustar el **Camera Collision Radius** y **Damping** para controlar el tamaño de la cámara y la fuerza de la detección de colisiones.

## Desplazamientos Globales

La sección **Global Offsets** te permite especificar desplazamientos globales para todas las cámaras virtuales, incluyendo **Camera Animation Speed**, **Field Of View**, **Position**, **Orientation**, y **Zoom**. Esto puede ser especialmente útil para implementar efectos como acercar y alejar basado en el volumen de audio, independientemente de qué cámara virtual esté actualmente activa.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
