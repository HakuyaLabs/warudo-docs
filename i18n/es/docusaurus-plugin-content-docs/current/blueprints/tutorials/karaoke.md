---
sidebar_position: 40
---

# Hora de Karaoke

¿A quién no le gusta hacer karaoke en stream? Pero ahora que estamos en el mundo 3D, agreguemos algo de realismo haciendo que nuestro personaje sostenga un micrófono. Este tutorial te mostrará cómo hacer exactamente eso: alternar una pose de cantar y un prop de micrófono con una tecla de acceso rápido.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/karaoke.mp4" /></div>
<p class="img-desc">¡Cantando con todo mi corazón!</p>

:::tip
Si quieres usar este ambiente de sala de karaoke, puedes descargarlo desde nuestro Steam Workshop usando la pestaña **Discover** en Warudo.
:::

## Reproduciendo Animaciones Idle

Primero, agrega un prop de micrófono y adjúntalo a la mano izquierda de tu personaje. Consulta el tutorial de [Empezando](../../tutorials/getting-started.md#assets-tab) si no estás seguro de cómo hacer esto. Luego, en el asset del prop, configura **Enabled** a No para ocultar el micrófono por ahora.

Después, trata de recrear el blueprint de abajo usando el nodo On Keystroke Pressed que ya conocemos muy bien, con dos nodos nuevos: **Toggle Asset Enabled** y **Play Character Idle Animation**. (Sus nombres son bastante reveladores, ¿no es así?) Recuerda configurar **Toggle Asset Enabled → Asset** al prop del micrófono, y **Play Character Idle Animation → Animation** a una pose de cantar. Estoy usando "010_0970," pero siéntete libre de experimentar con otras poses.

![](/doc-img/en-blueprint-karaoke-1.png)

¡Ahí tienes! Ahora cuando presiono la tecla de acceso rápido M, el micrófono aparece, y mi personaje lo levanta, listo para cantar.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/karaoke-2.mp4" /></div>

Esto es demasiado fácil para ti, así que hagámoslo más interesante. ¿Puedes pensar en una manera de reproducir un efecto de sonido "whoosh" cuando aparece el micrófono?

"Eso es fácil," dices. Escribes "sound" en la barra de búsqueda, y ¡ah-ha! Hay un nodo **Play Sound**. Lo agregas al editor de nodos, configuras el **Sound Source** a un efecto de sonido whoosh, y lo conectas junto al nodo Play Character Idle Animation:

![](/doc-img/en-blueprint-karaoke-2.png)

Presionas M, y el sonido se reproduce bien. ¡Buen trabajo! Pero nota que el efecto de sonido se reproduce sin importar si estás sacando el micrófono o guardándolo. ¿Hay una manera de reproducir el efecto de sonido solo cuando estás sacando el micrófono?

## Flip Flop

La respuesta es el nodo **Flip Flop**. Usualmente, los nodos tienen una entrada de flujo Enter y una salida de flujo Exit; pero el nodo Flip Flop es especial: tiene dos salidas de flujo Exit, **A** y **B**. La primera vez que el nodo Flip Flop es activado, activará un flujo en **A**; la segunda vez que es activado, activará un flujo en **B**; la tercera vez que es activado, activará un flujo en **A** otra vez; y así sucesivamente. En otras palabras, el nodo Flip Flop alternará entre **A** y **B** cada vez que sea activado.

Eso es conveniente. ¡Reestructuremos nuestro blueprint como el de abajo!

![](/doc-img/en-blueprint-karaoke-3.png)

¡Ahora el efecto de sonido solo se reproducirá cuando estés sacando el micrófono!

## Perfiles de Animación

Es lindo y todo, pero hay una limitación de usar el nodo Play Character Idle Animation: solo puedes seleccionar una pose/animación predefinida. Por ejemplo, quiero que mi personaje solo levante su mano izquierda y nada más, pero no hay tal pose en la lista. Ahí es cuando **Character → Overlaying Animations** viene útil.

Abre el asset del personaje, configura **Idle Animation** a Generic para resetear a la pose predeterminada, y desplázate hacia abajo a **Overlaying Animations**. Haz clic en el botón **+** para agregar una nueva entrada a la lista, y selecciona "010_0970" del menú desplegable **Animation**:

![](/doc-img/en-blueprint-karaoke-8.png)

El personaje se posa como se esperaba:

![](/doc-img/en-blueprint-karaoke-9.png)

Ahora, para solo levantar la mano izquierda, configuramos **Masked** a Yes, y agregamos **Left Arm** a la lista **Masked Body Parts**, como abajo:

![](/doc-img/en-blueprint-karaoke-4.png)

También deberías ajustar la opción **Weight** hasta que estés satisfecho con la pose. En este caso, la configuré a 0.88; esto varía de personaje a personaje sin embargo.

Ahora el personaje solo levanta su mano izquierda:

![](/doc-img/en-blueprint-karaoke-5.png)

¿Pero cómo podemos activar esta pose desde un blueprint? Bueno, necesitamos primero guardar un perfil de animación. Un perfil de animación es esencialmente una captura de las configuraciones de animación actuales del personaje, es decir, Idle Animation, Overlaying Animations, Override Hand Poses, etc. Hagamos clic en el botón **Save Animation Profile**:

![](/doc-img/en-blueprint-karaoke-6.png)

![](/doc-img/en-blueprint-karaoke-6.png)

Dale un nombre, por ejemplo, "LeftHandMic," y haz clic en **OK**:

![](/doc-img/en-blueprint-karaoke-7.png)

¡Ahora que hemos guardado un perfil de animación, podemos usar el botón **Load Animation Profile** para cargarlo en cualquier momento!

Pronto veremos cómo podemos hacer esto desde un blueprint, pero primero, creemos otro perfil de animación para la pose idle. Lo mantengo simple: solo limpio la lista Overlaying Animations, y configuro Idle Animation a Generic. ¡Por supuesto eres bienvenido a crear una pose idle personalizada!

Guarda otro perfil de animación llamado "Idle," ¡y estamos listos para continuar! Ve a nuestro blueprint, y reemplaza los nodos "Play Character Idle Animation" con los nodos "Load Animation Profile". Recuerda seleccionar los perfiles correctos del menú desplegable **Profile**:

![](/doc-img/en-blueprint-karaoke-10.png)

¡Ahora, cuando presiono M, el perfil de animación "LeftHandMic" se cargará, y cuando presiono M otra vez, el perfil de animación "Idle" se cargará!

:::tip
Lo de arriba es solo un ejemplo simple de cómo puedes usar animaciones superpuestas y perfiles de animación; la lección es que te permiten mezclar y combinar diferentes poses y animaciones, para que puedas posar tu personaje como quieras.
:::

## Retrasando Flujos

Finalmente, arreglemos un pequeño problema. Nota que cuando tu personaje guarda el micrófono, el micrófono desaparece inmediatamente. Sería más realista si el micrófono desaparece después de que el personaje lo haya guardado. ¿Cómo podemos hacer eso?

:::tip
Pista: Puedes usar el nodo **Delay Control Flow** para lograr esto. ¡Inténtalo antes de seguir leyendo!
:::

Aquí hay una solución simple: simplemente volteamos el orden de los nodos Toggle Asset Enabled y Play Character Idle Animation, y agregamos un nodo Delay Control Flow en el medio. Configuramos el **Delay** a 1s, para que el micrófono desaparezca 1s después de que el personaje lo haya guardado.

![](/doc-img/en-blueprint-karaoke-11.png)

El nodo Delay Control Flow solo activa un flujo en el Exit después del retraso especificado. Usando este nodo, puedes crear secuencias de eventos que suceden uno tras otro. Por ejemplo, puedes usarlo para hacer que tu personaje baile por 5s, cuando de repente dejas caer un montón de props en su cabeza, con un efecto de partícula de explosión reproduciéndose al final. ¡Todo depende de tu imaginación!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
