---
sidebar_position: 70
---

# Animando la Cámara

¡Suficiente diversión con nuestro personaje! Veamos cómo podemos incorporar algunos movimientos de cámara cinematográficos en nuestro stream. En este tutorial, aprenderemos cómo agregar animaciones de cámara simples pero efectivas.

:::tip
Si eres un usuario de Warudo Pro, también puedes usar el asset [director](../../assets/director) para crear animaciones de cámara.
:::

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera-2.mp4" /></div>
<p class="img-desc">¡Nuestro personaje está bailando, y la cámara se mueve junto!</p>

## Animando una Cámara de Órbita de Personaje

El protagonista de este tutorial es el nodo **Camera Orbit Character**. Arrastrémoslo al editor de nodos, y echemos un vistazo más de cerca:

![](/doc-img/en-blueprint-camera-1.png)

El nodo Camera Orbit Character esencialmente graba y reproduce los parámetros de la cámara bajo el modo de control Orbit Character. Simplemente usaremos nuestro ratón para mover la cámara alrededor, y dejaremos que el nodo grabe a dónde movemos la cámara, cuánto hacemos zoom y panorámica, etc. Luego, podemos activar el nodo en cualquier momento para que la cámara se mueva a la posición y orientación grabadas.

:::info
Si aún no lo has hecho, establece **Camera → Control Mode** a **Orbit Character**.
:::

¡Probémoslo! Por ejemplo, quiero mostrar la cola esponjosa de mi personaje a mis espectadores, así que roto la cámara alrededor hacia la parte trasera de mi personaje:

![](/doc-img/en-blueprint-camera-2.png)

Luego, hago clic en el botón **Align Target With Main Camera** en el nodo; el nodo entonces graba la posición y orientación de la cámara en la entrada de datos **Target**. Ahora, puedo rotar mi cámara de vuelta al frente, ¡pero cada vez que active el nodo, la cámara se moverá a la parte trasera de mi personaje y mostrará mi cola!

Podemos fácilmente crear un blueprint como este:

![](/doc-img/en-blueprint-camera-3.png)

¡Esto me permite presionar B para alternar entre el frente y la parte trasera de mi personaje en cualquier momento!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera.mp4" /></div>
<p class="img-desc"></p>

¡Ahora es tu turno! Intenta crear un blueprint de cámara propio, y ve qué movimientos de cámara interesantes puedes crear para tu personaje.

:::tip
¡Juega con las opciones **Transition Time** y **Transition Easing** para ver cómo afectan el movimiento de la cámara! Para Transition Easing, **InOutSine** es una gran opción inicial para movimientos de cámara naturales.
:::

## Bucleando la Animación

Todo está genial, pero hay un problema: necesitamos activar manualmente la animación de ida y vuelta. ¿Hay una forma de dejar que la cámara se mueva automáticamente por sí sola?

¡Bueno sí, la hay! Veamos cómo podemos hacer esto. Primero, configura dos nodos Camera Orbit Character con dos posiciones y orientaciones de cámara diferentes. Esto es lo que tengo para el primer nodo:

![](/doc-img/en-blueprint-camera-4.png)

Y esto es lo que tengo para el segundo nodo:

![](/doc-img/en-blueprint-camera-5.png)

Entonces, activar el primer nodo mueve la cámara al lado izquierdo de mi personaje, mientras que activar el segundo nodo mueve la cámara al lado derecho de mi personaje. Ahora, si queremos que la cámara se mueva a la izquierda primero, luego a la derecha, todo lo que necesitamos hacer es conectar **On Transition End** a **Enter**, como abajo:

![](/doc-img/en-blueprint-camera-13.png)

:::info
Nota que estamos conectando desde **On Transition End**, no **Exit**. Esto es porque la salida de flujo Exit se activa cuando el nodo se activa, es decir, cuando la cámara empieza a moverse, mientras que la salida de flujo On Transition End se activa cuando la cámara termina de moverse.
:::

Ahora, cuando hacemos clic en la entrada de flujo Enter del nodo Camera Orbit Character de la izquierda, veremos la cámara moviéndose al lado izquierdo de nuestro personaje, luego automáticamente moviéndose al lado derecho de nuestro personaje. ¡Se ve bien hasta ahora! ¿Qué deberíamos hacer después?

"Eso es fácil," dices. "¡Puedo simplemente conectar el On Transition End del nodo Camera Orbit Character derecho al Enter del nodo Camera Orbit Character izquierdo, y ya terminamos!"

Bueno, no exactamente. Si intentamos hacer eso:

![](/doc-img/en-blueprint-camera-6.png)

¡Aparecerá un mensaje de error!

![](/doc-img/en-blueprint-camera-7.png)

No pudimos agregar esta conexión porque crearía un bucle en el blueprint, lo cual no está permitido. Esto es para prevenir bucles infinitos accidentales, que causarían que Warudo se congele.

:::info
Para ver qué podría pasar si permitimos bucles, si ambos nodos tienen Transition Time establecido a 0, ¡entonces la cámara se moverá de ida y vuelta infinitamente rápido, causando que Warudo se bloquee!
:::

Pero hay una forma de sortear esto, usando **funciones**. Una función es esencialmente un punto de entrada que puedes activar desde cualquier lugar en el blueprint, incluso desde otros blueprints. Aprendamos esto con un ejemplo; ve y agrega un nodo **Define Function** a la izquierda del nodo Camera Orbit Character izquierdo, y establece el **Name** de la función a `AnimateCamera`:

![](/doc-img/en-blueprint-camera-8.png)

¡Acabamos de definir una función! Cada vez que se active la función `AnimateCamera`, activará el primer nodo Camera Orbit Character. ¿Pero cómo activamos esta función `AnimateCamera`? ¡Usando el nodo **Flow Function**! Agrégalo al editor de nodos, selecciona nuestra función del menú desplegable, e intenta hacer clic en la entrada de flujo Enter:

![](/doc-img/en-blueprint-camera-9.png)

Deberías ver que la cámara se mueve al lado izquierdo de tu personaje, luego automáticamente se mueve al lado derecho de tu personaje. Eso significa que nuestra función está funcionando. Finalmente, activemos la función automáticamente cuando el nodo Camera Orbit Character derecho termine de moverse. Conecta **Camera Orbit Character → On Transition End** a **Flow Function → Enter**:

![](/doc-img/en-blueprint-camera-10.png)

Ahora, cuando hacemos clic en **Flow Function → Enter** nuevamente, la cámara empieza a moverse al lado izquierdo de nuestro personaje, luego automáticamente se mueve al lado derecho de nuestro personaje, luego automáticamente se mueve al lado izquierdo de nuestro personaje, y así sucesivamente. ¡Eso es exactamente lo que queremos!

Nota que la animación de cámara generada por el nodo Camera Orbit Character se detiene inmediatamente cuando intentamos tomar control de la cámara. Para iniciar la animación más convenientemente, podemos asignar una tecla de acceso rápido a la función `AnimateCamera`:

![](/doc-img/en-blueprint-camera-11.png)

## Animando Otros Parámetros de Cámara

Además de la posición y orientación de la cámara, también podemos animar otros parámetros de cámara, como el **Field of View**. Por ejemplo, el blueprint de abajo también inicia una animación de zoom cuando la cámara empieza a moverse:

![](/doc-img/en-blueprint-camera-12.png)

¡Siéntete libre de experimentar con otros nodos de cámara!

## Animando una Cámara de Vista Libre

Hasta ahora hemos animado la cámara bajo el modo de control Orbit Character, pero algunos movimientos de cámara cinematográficos no orbitan alrededor del personaje, o simplemente quieres que la cámara se mueva entre dos posiciones fijas sin importar dónde esté el personaje. En este caso, puedes usar el nodo **Set Asset Transform**:

![](/doc-img/en-blueprint-camera-15.png)

Funciona igual que el nodo Camera Orbit Character, excepto que graba y reproduce los parámetros de la cámara bajo el modo de control Free Look. Para grabar una posición y orientación objetivo, usa el botón **Align Target With Asset**.

:::tip
Nota que el nodo se llama Set Asset Transform, no Set Camera Transform. ¡Eso significa que también puedes usar este nodo para mover y animar otros assets, como props y personajes!
:::

## Alternando entre Cámaras

¿Mencioné que hay un nodo **Switch Main Camera**? Hace exactamente lo que dice: alterna entre dos cámaras con una transición de desvanecimiento opcional. Por ejemplo, el blueprint de abajo alterna entre dos cámaras cuando presiono Ctrl+1 y Ctrl+2:

![](/doc-img/en-blueprint-camera-14.png)

Aquí está el resultado:

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera-3.mp4" /></div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
