---
sidebar_position: 140
---

# Agarrando la Cola

¿Tu personaje tiene cola? ¡Si es así, este tutorial es para ti! En este tutorial, haremos que nuestro personaje agarre su cola cuando presionemos una tecla de acceso rápido.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/tail.mp4" /></div>
<p class="img-desc">¡Voy a agarrar esa cola!</p>

:::tip
Si tu personaje no tiene cola, ¡eso también está bien! Puedes leer el tutorial de todos modos y aprender cómo usar los nodos **Set Asset Property** e **Invoke Asset Trigger**.
:::

## IK de Cola

¡Antes de empezar a trabajar en el blueprint, configuremos nuestra escena primero! Primero, crea un asset [Anchor](../../assets/anchor) y adjúntalo a la mano derecha del personaje:

![](/doc-img/en-blueprint-tail-2.png)

Esto será útil más tarde cuando queramos apuntar la cola hacia la mano derecha de nuestro personaje.

Después, crea un asset [Tail](../../assets/tail) y [configúralo](../../assets/tail#setup) en tu personaje. En la sección **Inverse Kinematics**, establece **Enabled** a Yes, y establece **IK Target** al anchor que acabamos de crear:

![](/doc-img/en-blueprint-tail-3.png)

:::info
Si ya has creado una cola, nota que necesitas deshabilitar waving y additional shaping para este tutorial.
:::

Esto configura la cola para usar cinemática inversa (IK) para apuntar al anchor. En otras palabras, la cola siempre intentará alcanzar la mano derecha de nuestro personaje, así:

![](/doc-img/en-blueprint-tail-1.png)

## Set Asset Property

Actualmente, para alternar entre agarrar y no agarrar la cola, necesitamos activar/desactivar manualmente **Tail → Inverse Kinematics → Enabled**.

![](/doc-img/en-blueprint-tail-4.png)

¿Hay una forma de hacer esto en un blueprint? La mala noticia es que no hay un nodo llamado "Toggle Tail IK" o algo así. ¡La buena noticia es que el poderoso y versátil nodo **Set Asset Property** puede hacer exactamente lo que queremos!

Como su nombre sugiere, el nodo Set Asset Property establece una propiedad (opción) de un asset. Simplemente podemos seleccionar la propiedad Inverse Kinematics → Enabled del menú desplegable **Data Path** después de seleccionar el asset de cola del menú desplegable **Asset**:

![](/doc-img/en-blueprint-tail-9.png)

Luego, en lugar de especificar un **Target Value**, podemos simplemente establecer **Toggle** a Yes para que el nodo alterne la propiedad entre Yes y No cada vez que se active:

![](/doc-img/en-blueprint-tail-5.png)

¡Ahora cuando presionemos Ctrl+Shift+X, el IK de la cola se alternará encendido/apagado! Simple, ¿no?

Alternar el IK de la cola está bien, pero puede que notes que el IK se activa/desactiva instantáneamente. Sería mejor si pudiéramos gradualmente activar/desactivar el IK, para que la cola gradualmente alcance la mano en lugar de alcanzar instantáneamente la mano.

Para hacer esto, podemos establecer **Tail → Inverse Kinematics → Enabled** a Yes, y controlar la opción **Tail → Inverse Kinematics → Weight** en su lugar:

![](/doc-img/en-blueprint-tail-6.png)

Si arrastras el weight de 0 a 1, verás la cola gradualmente alcanzando la mano. ¿Cómo hacemos esto en un blueprint? ¡Bueno, el nodo **Set Asset Property** nuevamente! Esta vez seleccionamos la propiedad Tail → Inverse Kinematics → Weight:

![](/doc-img/en-blueprint-tail-8.png)

Y establecemos **Target Value** a 1 y 0 respectivamente en los dos nodos. Recuerda que el nodo Flip Flop alternará entre sus dos salidas de flujo Exit cada vez que se active, así que cuando presionemos Ctrl+Shift+X, el IK de la cola gradualmente se activará/desactivará.

![](/doc-img/en-blueprint-tail-7.png)

:::tip
Como puedes ver, ¡el nodo Set Asset Property puede establecer casi cualquier cosa que veas en la pestaña Assets! Algunas veces, incluso puede reemplazar un nodo dedicado. Por ejemplo, el nodo Set Asset Property puede establecer la opción **Enabled** de un prop, así que parece que ya no necesitas usar el nodo **Toggle Asset Enabled**.

Sin embargo, como Set Asset Property es más general, su rendimiento es peor que los nodos dedicados como Toggle Asset Enabled. Debes tener especial cuidado de no activar un nodo Set Asset Property muy frecuentemente (como después de un nodo **On Update**), o puede causar problemas de rendimiento. La regla general es, si hay un nodo dedicado para lo que quieres hacer, úsalo en lugar de Set Asset Property.
:::

## Invoke Asset Trigger

Ahora sabemos cómo automatizar ajustes de deslizadores y alternancia de interruptores, pero ¿cómo automatizamos clics de botones? Por ejemplo, ¿hay una forma de automáticamente "hacer clic" en el botón **Tail → Reset Tail** con una tecla de acceso rápido?

![](/doc-img/en-blueprint-tail-11.png)

¡La hay! El nodo **Invoke Asset Trigger** puede hacer exactamente eso. Es similar al nodo Set Asset Property, pero en lugar de establecer una propiedad, invoca un trigger (botón) de un asset. Podemos seleccionar el trigger Tail → Reset Tail del menú desplegable **Trigger Path**:

![](/doc-img/en-blueprint-tail-10.png)

¡Hay bastantes botones en Warudo, así que este nodo puede ser útil a veces! Por ejemplo, si usas iFacialMocap o MediaPipe para seguimiento facial, personalmente encuentro útil asignar una tecla de acceso rápido a **iFacialMocap Receiver / MediaPipe Tracker → Calibrate** para poder calibrar mi seguimiento facial con una tecla de acceso rápido.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
