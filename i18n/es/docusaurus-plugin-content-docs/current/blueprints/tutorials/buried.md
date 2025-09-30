---
sidebar_position: 30
---

# Enterrado por Peluches

Crear caos es crear alegría. En este tutorial, aprenderemos cómo generar un montón de peluches de animales y enterrar a nuestro personaje bajo ellos.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/buried.mp4" /></div>
<p class="img-desc">Enterrado por peluches de animales.</p>

## Múltiples Blueprints

Si has seguido los tutoriales anteriores, puede que hayas notado que hemos estado creando un nuevo blueprint para cada interacción. ¿No podríamos simplemente agregar todos los nodos al mismo blueprint?

De hecho, técnicamente hablando, si puedes hacer algo con múltiples blueprints, también puedes hacerlo con un solo blueprint. Sin embargo, es una buena práctica mantener las cosas organizadas; con múltiples blueprints más pequeños, puedes deshabilitar temporalmente una interacción específica sin afectar las otras. Además, si quieres compartir tus blueprints con otros, es mucho más fácil compartir un solo blueprint que un blueprint con un montón de nodos no relacionados.

También está la preocupación del rendimiento. El editor de Warudo no está exactamente construido para un gran número de nodos; empezarás a notar lag cuando tengas más de 100 nodos en un solo blueprint. Entonces, siempre es una buena idea dividir en múltiples blueprints más pequeños siempre que sea posible.

## Bucle For

¡Bien, creemos nuestro blueprint! Generar un peluche de animal es fácil: solo usa el nodo **Throw Prop At Character** con el que ya estamos [familiarizados](ragdoll.md). Pero ¿cómo generamos múltiples peluches?

La respuesta es el nodo **For Loop**. Como podrías haber adivinado por el nombre, este nodo nos permite hacer algo múltiples veces. Pero la explicación puede esperar. Ve y recrea el blueprint de abajo. Para el nodo For Loop, hemos establecido **Last Index** a 100, **Interval** a 0.01; para el nodo **Throw Prop At Character**, hemos establecido **Prop Source** a Tiger y **From** a Above Character Head, para que los peluches de tigre caigan sobre la cabeza del personaje.

![](/doc-img/en-blueprint-buried-1.png)

Sabemos lo que están haciendo los otros dos nodos: el nodo On Keystroke Pressed define una tecla de acceso rápido Ctrl+Shift+Z, mientras que el nodo Throw Prop At Character genera un prop de tigre y lo lanza al personaje. Pero ¿qué está haciendo el nodo For Loop? Presionemos Ctrl+Shift+Z y veamos qué pasa.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/buried-2.mp4" /></div>
<p class="img-desc">Auch.</p>

¡Esos son muchos tigres sin duda! Pero ¿cuántos? Echemos un vistazo más de cerca al nodo For Loop. En español simple, el nodo está diciendo: "Para cada número desde **First Index** (1) hasta **Last Index** (100), en un **Interval** de 0.01s, activa la salida de flujo **Loop Body**." Como la salida de flujo Loop Body está conectada al nodo Throw Prop At Character, en otras palabras, estamos diciendo: "Para cada número del 1 al 100, genera un prop de tigre cada 0.01s y lánzalo al personaje;" o aún más simple, "genera 100 props de tigre a lo largo de 1 segundo y lánzalos al personaje."

![](/doc-img/en-blueprint-buried-3.png)

:::tip
¿Puedes adivinar qué pasa si establecemos **Last Index** a 1000 en su lugar? ¿Y qué tal si establecemos **Interval** a 0?
:::

Para enterrar a nuestro personaje sin embargo, necesitamos convertirlo en un ragdoll. Ya conoces el procedimiento: el nodo **Activate Character Ragdoll**. Aquí establecemos la **Launch Force** a (0, -100, 0), que lanza al personaje hacia abajo.

![](/doc-img/en-blueprint-buried-4.png)

## Aleatorizando los Peluches

Hasta ahora todo está genial, pero hay un problema: todos los peluches son tigres. ¿Qué tal si queremos generar todo tipo de animales?

Bueno, echemos un vistazo al nodo **Throw Prop At Character**. Hemos establecido el **Prop Source** a Tiger, pero ¿ves ese punto negro al lado? Significa que podemos conectar algo a él. En otras palabras, en lugar de seleccionar un prop del menú desplegable nosotros mismos, podemos dejar que un nodo decida qué prop generar, siempre que ese nodo tenga una salida de datos que nos dé un prop. Eso es exactamente lo que hace el nodo **Get Random Prop**.

![](/doc-img/en-blueprint-buried-2.png)

En lo anterior, hemos conectado la salida de datos **Prop Source** del nodo Get Random Prop a la entrada de datos **Prop Source** del nodo Throw Prop At Character. El nodo Get Random Prop hace lo que dice: selecciona aleatoriamente un prop de la lista **Props**, o de cualquier colección de props en la lista **Collections**. En este caso, hemos agregado la colección "Quirky Animals" a la lista **Collections**, así que el nodo Get Random Prop seleccionará aleatoriamente un prop de peluche de animal, y lo emitirá al nodo Throw Prop At Character.

Presionemos Ctrl+Shift+Z nuevamente y veamos qué pasa. Si todo sale bien, deberías ver un montón de diferentes animales cayendo sobre la cabeza del personaje, enterrando al personaje bajo ellos. ¡Cosas divertidas!

:::info
Si estás interesado en detalles técnicos minuciosos, las entradas de datos de un nodo solo se evalúan (es decir, se obtienen de la salida de datos conectada) cuando el nodo se activa. Entonces, en este caso, lo que pasa detrás de escena es que el nodo Get Random Prop se activa cada vez que se activa el nodo Throw Prop At Character (por el nodo For Loop), emitiendo un prop diferente cada vez.
:::

## Más sobre Bucle For

Puede que hayas notado que el nodo For Loop tiene una salida de datos **Loop Index**. Esta salida de datos nos da el índice actual del bucle, empezando desde **First Index** y terminando en **Last Index**. En el ejemplo anterior, la salida de datos **Loop Index** nos da un número del 1 al 100. ¿Qué podemos hacer con este número?

Aquí hay una idea: conecta el **Loop Index** a la entrada de datos **Scale** del nodo Get Random Prop, como abajo. ¿Puedes adivinar qué pasará?

![](/doc-img/en-blueprint-buried-5.png)

¡Si adivinaste correctamente que los peluches que caen se harán cada vez más grandes, genial!

:::tip
¿Qué tal si queremos hacer que los peluches se hagan cada vez más pequeños en su lugar? ¿O en lugar de una escala del 1 al 100, queremos una escala del 0.1 al 10? ¡Intenta descubrir esto por ti mismo! Los nodos **Float Subtraction** y **Float Multiplication** pueden ser útiles.
:::

El nodo **For Loop** también tiene salidas de flujo **On Loop End** y **Exit**. La salida de flujo **On Loop End** se activa cuando el bucle termina, mientras que la salida de flujo **Exit** se activa inmediatamente después de que el bucle se inicia. Intenta agregar dos nodos **Show Toast** como abajo, y ve qué pasa.

![](/doc-img/en-blueprint-buried-6.png)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
