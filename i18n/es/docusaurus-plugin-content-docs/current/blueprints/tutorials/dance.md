---
sidebar_position: 50
---

# Baila Baila Baila

¿Buscas una forma divertida de agradecer a tus espectadores por su apoyo? En este tutorial, haremos que el personaje baile cuando recibas una donación, ya sea un Super Chat de YouTube o un redeem de Twitch.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/dance.mp4" /></div>
<p class="img-desc">¡Baila para agradecer a tus espectadores por su apoyo!</p>

## Conectando a Plataformas de Streaming

Antes de empezar, necesitas usar el asistente de configuración inicial para conectar Warudo a tu cuenta de Twitch, YouTube o Bilibili. Si no lo has hecho, por favor consulta el tutorial [Comenzando](../../tutorials/getting-started.md#interaction-setup). Asumiremos que haces streaming en Twitch en este tutorial, pero los pasos son similares para otras plataformas.

:::tip
También puedes usar integraciones de terceros como [Streamer.bot](Streamer.bot) que pueden enviar un mensaje WebSocket a Warudo cuando recibes una donación u otros eventos de stream. En ese caso, no necesitas usar el asistente de configuración inicial.
:::

Empecemos con un ejemplo mínimo: cuando recibo un redeem de Twitch, quiero que mi personaje baile. Necesitamos solo dos nodos:

![](/doc-img/en-blueprint-dance-1.png)

:::info
El nodo **Play Character One Shot Overlay Animation** reproduce una animación de una sola vez en el personaje, así que en lugar de cambiar la animación idle del personaje, la animación se reproduce encima de la animación idle que se está reproduciendo. Cuando la animación termina, el personaje automáticamente regresará a la animación idle.
:::

:::tip
En lugar del nodo **On Twitch Channel Points Redeemed**, por supuesto puedes usar cualquier nodo de evento que quieras. Por ejemplo, si haces streaming en YouTube, podrías usar el nodo **On YouTube Super Chat Received** en su lugar. O, si estás usando una integración de terceros que puede comunicarse usando WebSockets, podrías usar el nodo **On WebSocket Message Received**.
:::

¿Cómo lo probamos? Bueno, podemos simplemente esperar a que alguien redimiera un reward de Twitch, pero eso no es muy eficiente. En su lugar, Warudo te permite activar un nodo manualmente. Haz clic en la entrada de flujo **Enter** del nodo Play Character One Shot Overlay Animation:

![](/doc-img/en-blueprint-dance-2.png)

¡Tu personaje ahora debería empezar a bailar!

## Rama If

Ahora mismo, nuestro personaje empieza a bailar sin importar qué redeem de Twitch recibamos. Pero ¿qué tal si queremos bailar solo cuando recibamos un redeem específico llamado "Dance"? Te presento el nodo **If Branch**—agreguémoslo entre los dos nodos, así:

![](/doc-img/en-blueprint-dance-3.png)

Como el nodo Flip Flop que hemos visto antes, el nodo If Branch tiene dos salidas de flujo, **If True** y **If False**. En lugar de alternar entre las dos salidas de flujo, la salida de flujo que se activa depende del valor de la entrada de datos **Condition**. Si la Condition es Yes, la salida de flujo If True se activa; de lo contrario, la salida de flujo If False se activa.

Para probar esto, podemos hacer clic en la entrada de flujo Enter del nodo If Branch. Como la Condition está actualmente establecida en No, la salida de flujo If False se activa, pero no hay nada después de ella, así que no pasa nada.

Establecemos la Condition en Yes, y hacemos clic en la entrada de flujo Enter nuevamente. Esta vez, la salida de flujo If True se activa, ¡y el personaje empieza a bailar!

Ahora, lo único que queda por hacer es establecer la Condition a algo significativo. En este caso, queremos verificar si el nombre del redeem de Twitch es igual a "Dance". Hay un nodo para hacer exactamente eso: el nodo **String Equal**. Agrégalo al editor de nodos, y conecta la salida de datos **String Equal → Output Boolean** a **If Branch → Condition**, como abajo:

![](/doc-img/en-blueprint-dance-4.png)

El nodo String Equal es bastante simple: compara dos strings, emite Yes si son iguales, y No de lo contrario. (Un string es una forma elegante de decir "texto".) En este caso, conectamos **On Twitch Channel Points Redeemed → Reward Title** a **String Equal → A**, y establecemos **String Equal → B** a "Dance". Entonces, cuando el nodo String Equal se activa, verificará si el nombre del redeem de Twitch es igual a "Dance", y pasará el resultado al nodo If Branch. (Un boolean es una forma elegante de decir "sí o no".)

:::tip
También puedes conectar Reward Title a B, y establecer A a "Dance". El orden no importa en este caso.
:::

![](/doc-img/en-blueprint-dance-5.png)

¡Ahí tienes! Intenta redimir el reward "Dance" en tu canal de Twitch, ¡y tu personaje debería empezar a bailar!

## Aleatorizando el Baile

¿Qué tal si queremos elegir una animación de baile aleatoria en lugar de siempre reproducir la misma? Bueno, si aún recuerdas el nodo Get Random Prop del [tutorial anterior](buried), no es sorprendente que también haya un nodo **Get Random Character Animation**. Así, podemos configurar nuestro blueprint como abajo:

![](/doc-img/en-blueprint-dance-6.png)

Cuando el nodo Play One Shot Overlay Animation se activa, el nodo Get Random Character Animation se activará y emitirá una animación aleatoria de la lista **Character Animations**, en mi caso, cualquiera de "Short Dance 1", "Short Dance 2" y "Short Dance 3".

## Aleatorizando el Resultado

Como VTuber, puede que quieras mantener un elemento de sorpresa cuando recibes una donación. En lugar de solo empezar a bailar, tal vez quieras tener una posibilidad de hacer algo más, como [lanzarte al aire](ragdoll) o [generar un montón de peluches](buried). ¡Intentemos implementar esto!

:::tip
Abajo hemos removido el nodo **Get Random Character Animation** por simplicidad, pero puedes mantenerlo si quieres.
:::

Primero, removamos la conexión entre If Branch ↔ Play Character One Shot Overlay Animation. Agrega un nodo **Switch On Integer** justo después del nodo If Branch, y agrega 3 entradas a la lista **Cases**, así:

![](/doc-img/en-blueprint-dance-7.png)

El nodo Switch On Integer funciona así: cuando el nodo se activa, verificará el valor de la entrada de datos **Input Integer**, y activará la salida de flujo correspondiente. Por ejemplo, si Input Integer es 1, la salida de flujo etiquetada 1 se activará; si Input Integer es 2, la salida de flujo etiquetada 2 se activará; y así sucesivamente.

Conectemos cada salida de flujo a un resultado diferente. Por ejemplo, he conectado la salida de flujo etiquetada 1 al nodo Play Character One Shot Overlay Animation, 2 a un nodo **Play Sounds**, y 3 a un nodo **Spawn Particle**. Recuerda establecer la opción **Source** de ambos nodos:

![](/doc-img/en-blueprint-dance-8.png)

¡Ahora probémoslo! Establece manualmente **Switch On Integer → Input Integer** a cualquier número entre 1 y 3, y haz clic en la entrada de flujo Enter. Si todo va bien, deberías ver el nodo correspondiente siendo activado.

![](/doc-img/en-blueprint-dance-9.png)

Lo último que necesitamos hacer es aleatorizar el Input Integer. Puede que ya lo hayas adivinado: ¡hay un nodo **Generate Random Integer**! Establecemos **Value Min** a 1 y **Value Max** a 3, para que emita un entero entre 1 y 3.

![](/doc-img/en-blueprint-dance-10.png)

Abajo está el blueprint final. ¡Ahora ve a divertirte con tus espectadores!

![](/doc-img/en-blueprint-dance-11.png)

## Más sobre Rama If

Usamos el nodo String Equal para la condición de If Branch, pero hay otras condiciones que puedes usar. Por ejemplo, puedes usar el nodo **Integer Greater Than Or Equal** para verificar si **On Twitch Channel Points Redeemed → Reward Cost** es mayor o igual a 1,000, de tal manera que el personaje bailará cada vez que recibas un redeem de Twitch que cueste 1,000 puntos o más.

También puedes combinar múltiples condiciones usando los nodos **Boolean AND** y **Boolean OR**. El siguiente blueprint verifica si el nombre del redeem de Twitch es igual a "DJ", **_y_** si el usuario que redimió tiene "bot" en su nombre:

![](/doc-img/en-blueprint-dance-12.png)

El siguiente blueprint hará que el personaje baile cuando recibas un redeem de Twitch que cueste 500 puntos o más, **_o_** cuando ese redeem venga del usuario "hakuyatira":

![](/doc-img/en-blueprint-dance-13.png)

## Blueprints de Interacción

Si has usado el asistente de configuración inicial para configurar un blueprint de interacción, ¡puede que hayas notado que está haciendo cosas muy similares al blueprint que acabamos de crear! Puede contener más nodos, pero la lógica central es la misma: cuando recibes un evento de stream, haz algo interesante.

Con tu nuevo conocimiento, ¡ahora puedes crear tus propios blueprints de interacción! Siéntete libre de incorporar lo que has aprendido de los tutoriales anteriores y crear algo único para tu canal. O, si aún buscas más diversión, ¡sigue leyendo!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
