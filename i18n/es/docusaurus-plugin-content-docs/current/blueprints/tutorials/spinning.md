---
sidebar_position: 110
---

# Girando en Silla

¿Alguna vez quisiste girar en una silla como un niño? ¡Ahora puedes! Este tutorial te muestra cómo agregar giro controlable a tu personaje y silla.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/spinning.mp4" /></div>
<p class="img-desc">¡Mareado mareado!</p>

## Preparando el Prop de Silla

Técnicamente no necesitas un prop de silla para este tutorial, pero será más divertido si tienes uno. Puedes descargar nuestro prop Computer Chair del Steam Workshop usando la pestaña **Discover** en Warudo. (¡Por supuesto, también puedes importar tu propio prop de silla usando nuestro [Mod SDK](../../modding/mod-sdk)!)

![](/doc-img/en-blueprint-spinning-16.png)

Configura tu personaje y prop de silla para que el personaje esté sentado en la silla:

![](/doc-img/en-blueprint-spinning-1.png)

## Rotando Nuestro Personaje

Puedes recordar el nodo Set Asset Transform del tutorial [Animando la Cámara](camera). Sin embargo, ya que solo nos importa la rotación del personaje, podemos usar el nodo **Set Asset Rotation** en su lugar. (Recuerda que un transform es una combinación de posición, rotación y escala.) ¿Puedes adivinar qué hace el siguiente nodo cuando es activado?

![](/doc-img/en-blueprint-spinning-2.png)

Rota el personaje a (0, 180, 0). Ya que el eje Y está apuntando hacia arriba, puedes imaginar el personaje rotado 180 grados por un poste pasando por su cabeza y saliendo por sus pies. ¡El resultado es que ahora están mirando hacia la parte trasera de la silla!

:::tip
¿Puedes adivinar qué pasa si rotas el personaje a (180, 0, 0)? ¿Qué tal (0, 0, 180)? ¡Inténtalo!
:::

![](/doc-img/en-blueprint-spinning-3.png)

Para ahora, probablemente deberías saber intuitivamente nuestro siguiente paso: necesitamos conectar algo a la entrada de datos **Rotation** de este nodo. Este _algo_ debería ser un valor que cambie con el tiempo, para que el personaje rote con el tiempo. Puedes pensar en usar [variables](squashing#variables), pero hay una manera más fácil.

Pensemos sobre esto por un momento. Digamos que el personaje originalmente tiene rotación (0, 0, 0). Queremos rotarlos a (0, 180, 0). ¿Cómo hacemos eso? Bueno, podemos rotarlos directamente a (0, 180, 0), pero eso es solo un cambio súbito en rotación como arriba, lo cual no es muy interesante. Tal vez tomaremos un paso más en el medio: rotar a (0, 90, 0) primero, luego a (0, 180, 0) unos momentos después. O incluso más pasos en el medio: (0, 30, 0), (0, 60, 0), (0, 90, 0), (0, 120, 0), (0, 150, 0), (0, 180, 0). ¿Qué tal incluso más pasos? (0, 10, 0), (0, 20, 0), (0, 30, 0), ..., (0, 180, 0). La esencia es: ¡mientras tengamos suficientes pasos, se verá como si el personaje estuviera rotando suavemente!

Ahora cuando vemos esta secuencia: (0, 10, 0), (0, 20, 0), (0, 30, 0), ..., (0, 180, 0), podemos ver que el eje Y está aumentando por 10 cada paso. En otras palabras, para cada paso, mientras me digas la rotación actual, ¡te diré la siguiente rotación: solo agregar 10 al eje Y!

Esto es exactamente lo que hace el siguiente blueprint:

![](/doc-img/en-blueprint-spinning-5.png)

Desglosemos esto. Estamos diciendo que en lugar de una rotación fija, queremos usar una rotación cambiante. Esta rotación cambiante está basada en la rotación actual del personaje; la rotación actual (X, Y, Z) se descompone en tres números X, Y, Z, así podemos leer cada número (el nodo **Decompose Vector3**); agregamos 10 a Y (el nodo **Float Addition**); luego, creamos una nueva rotación (X, Y, Z) con nuestro nuevo Y, mientras X y Z permanecen 0 (el nodo **Vector3**); finalmente, configuramos la rotación del personaje a la nueva rotación (el nodo **Set Asset Rotation**).

¡Trata de hacer clic en la entrada de flujo Enter del nodo Set Asset Rotation, y encontrarás que el personaje rota por 10 grados cada vez que haces clic!

Para hacer que el personaje rote automáticamente, podemos simplemente usar el nodo **On Update** que es activado cada frame:

![](/doc-img/en-blueprint-spinning-6.png)

:::tip
¿Qué deberías cambiar si quieres que el personaje gire más rápido? ¿Qué tal más lento? ¿Puedes pensar en una manera de controlar la velocidad de giro por teclas de acceso rápido? (Pista: puedes usar una [variable](squashing#variables) para almacenar la velocidad de giro.)
:::

Pero eso rota solo el personaje, así que rotemos la silla también:

![](/doc-img/en-blueprint-spinning-7.png)

¡Ahora tanto nuestro personaje como silla giran como un trompo!

![](/doc-img/en-blueprint-spinning-8.png)

:::info
El prop de silla que seleccionaste debería por defecto tener la misma orientación que el personaje; de lo contrario, puedes necesitar nodos adicionales para rotar la silla a la orientación correcta.
:::

## Gate

Ahora nuestro personaje está girando a toda velocidad, ¿cómo lo hacemos parar? Bueno, podemos desconectar el nodo On Update:

![](/doc-img/en-blueprint-spinning-9.png)

Eso no es conveniente, sin embargo. También podemos deshabilitar el blueprint, pero intentemos un enfoque alternativo: encontremos una manera de parar el flujo del nodo On Update.

Imagina que vives in un castillo, y quieres parar el _flujo_ de gente entrando a tu castillo. ¿Qué harías? ¡Construir una _puerta_!

Similarmente, podemos usar... el nodo **Gate** para parar el _flujo_ del nodo On Update:

![](/doc-img/en-blueprint-spinning-10.png)

El nodo Gate tiene un nombre muy apropiado: un flujo que pasa por la entrada de flujo Enter solo se permite pasar por la salida de flujo Exit si la puerta está "abierta." Por defecto, la puerta está abierta (**Opened** está configurado a Yes), pero si haces clic en la entrada de flujo **Close**, la puerta se cerrará (**Opened** está configurado a No), y ningún flujo se permitirá pasar por la salida de flujo Exit.

![](/doc-img/en-blueprint-spinning-11.png)

¡Esto significa que podemos configurar una tecla de acceso rápido para alternar la puerta! Usando el siguiente blueprint, puedo presionar R para alternar la puerta en cualquier momento, y el personaje empezará o parará de girar en consecuencia:

![](/doc-img/en-blueprint-spinning-12.png)

## Reseteando Rotación

Un problema con lo que tenemos hasta ahora es que cuando presionas R para parar el giro, el personaje y silla pararán inmediatamente, incluso si están en el medio de un giro. Probablemente queremos rotarlos de vuelta a su rotación original.

Agreguemos los siguientes nodos para arreglar esto:

![](/doc-img/en-blueprint-spinning-13.png)

Lo que hacen es simple: cuando presionamos T, rotar suavemente el personaje y silla de vuelta a la rotación original. Nota que **Transition Time** está configurado a 0.5 y **Transition Easing** está configurado a OutBack, lo que permite un poco de "rebote" al final de la transición.

¿Pero espera, por qué estamos rotando a (0, 360, 0)? ¿Por qué no simplemente configuramos la rotación a (0, 0, 0)? Esto es porque el nodo Set Asset Rotation siempre rotará la distancia más corta a la rotación objetivo. Imagina que actualmente estás rotado en sentido horario por 90 grados; si quieres rotar de vuelta a 0 grados, puedes ya sea rotar en sentido anti-horario por 90 grados, o rotar en sentido horario por 270 grados. El nodo Set Asset Rotation siempre elegirá la distancia más corta, que es rotar en sentido anti-horario por 90 grados. ¡Pero cuando giras en una silla, no piensas sobre la distancia más corta; solo quieres seguir rotando en sentido horario hasta que estés de vuelta a la rotación original!

Por lo tanto, "engañamos" al nodo Set Asset Rotation configurando la rotación objetivo a (0, 360, 0), y ya que la rotación devuelta por el nodo Get Asset Rotation siempre es menor o igual a 360 grados, el nodo Set Asset Rotation siempre rotará en sentido horario a 360 grados.

## Sequence

Esto es casi perfecto, excepto por una cosa pequeña. En este momento, si queremos parar de girar, necesitamos primero presionar R, luego presionar T. ¿No podemos hacer que solo necesitemos presionar R para parar de rotar?

A primera vista, esto parece una tarea simple. Estamos bastante familiarizados con el nodo Flip Flop, que alterna entre dos salidas de flujo. Así, solo necesitamos alternar entre "abrir la puerta y empezar a girar," y "cerrar la puerta y parar de girar, pero también rotar de vuelta a la rotación original." Lo primero es fácil: podemos solo conectar Flip Flop → A a Gate → Open.

¿Pero qué tal lo segundo? Si conectamos Flip Flop → B a Gate → Close, ¿cómo también activamos el nodo Set Asset Rotation para rotar de vuelta a la rotación original? Recuerda, una salida de flujo solo puede ser conectada a una entrada de flujo, así que no podemos conectar Flip Flop → B tanto a Gate → Close como a Set Asset Rotation → Enter.

![](/doc-img/en-blueprint-spinning-14.png)

Ahí es cuando necesitamos el nodo **Sequence**. El nodo Sequence tiene un número variable de salidas de flujo; cuando es activado, activará cada salida de flujo en orden. Usando el nodo Sequence, ahora podemos cerrar la puerta primero, luego rotar de vuelta a la rotación original:

![](/doc-img/en-blueprint-spinning-15.png)

¡Ahora solo necesitas presionar R para empezar o parar graciosamente el giro!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
