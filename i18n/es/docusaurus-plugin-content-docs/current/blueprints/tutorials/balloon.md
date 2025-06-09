---
sidebar_position: 80
---

# Cabeza de Globo

En este tutorial, ¡inflaremos la cabeza de nuestro personaje como un globo usando seguimiento facial!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/balloon.mp4" /></div>
<p class="img-desc">Inflando mis mejillas para inflar mi cabeza.</p>

## Escalando Huesos

Para inflar la cabeza de nuestro personaje, esencialmente necesitamos escalar algunos huesos en nuestro personaje. Un personaje en Warudo (o realmente, en cualquier aplicación/juego de Unity) tiene 55 huesos, algunos de los cuales son opcionales. El hueso de la cabeza es el que nos interesa, y se llama "Head" (obviamente). Agreguemos un nodo **Set Character Bone Scale** al editor de nodos, establecemos **Bone** a "Head", y **Scale** a 1.1.

:::tip
Por defecto, cuando estableces la opción Scale, todos los ejes XYZ se establecen a la misma cantidad. Esto se llama escalado uniforme. Si quieres escalar cada eje del hueso individualmente, puedes hacer clic en el botón **Uniform Scaling** junto a la opción Scale para desactivarlo.
:::

![](/doc-img/en-blueprint-balloon-1.png)

Haz clic en Enter para probar el nodo. ¡Deberías ver que la cabeza de tu personaje se hace ligeramente más grande!

## Leyendo Datos de Seguimiento Facial

Ahora que tenemos una forma de escalar el hueso de la cabeza, necesitamos descubrir cuándo escalarlo. ¡Una forma divertida de activar el escalado es inflar nuestras mejillas!

Para saber cuándo estamos inflando nuestras mejillas, podemos usar el nodo **Get Character BlendShape**. Agreguémoslo al editor de nodos:

![](/doc-img/en-blueprint-balloon-2.png)

Para la opción **BlendShape** aquí, debes seleccionar el blendshape que corresponde a inflar las mejillas; si tienes un modelo de personaje compatible con ARKit, el blendshape generalmente se llama "cheekPuff" o "CheekPuff".

:::tip
Si no tienes un modelo de personaje compatible con ARKit, o no estás usando un iPhone para rastrear tu cara, entonces no tendrás el blendshape o datos de seguimiento de inflado de mejillas. En ese caso, puedes cambiar el activador para usar tu boca en su lugar. Por ejemplo, puedes usar el blendshape "jawOpen" (para modelos con blendshapes ARKit) o "A" (para modelos con solo blendshapes VRM) para activar la inflación.
:::

Puedes usar el nodo **Inspect Value** para ver el valor del blendshape, así:

![](/doc-img/en-blueprint-balloon-3.png)

Intenta inflar tus mejillas, y deberías ver el valor fluctuar entre 0 (cuando no estás inflando tus mejillas) y 1 (cuando estás inflando tus mejillas).

Ahora estamos listos para conectar los nodos juntos. Solo necesitamos conectar el valor del blendshape a **Set Character Bone Scale → Scale**, ¿verdad? Espera...

![](/doc-img/en-blueprint-balloon-4.png)

¡Warudo no nos está permitiendo conectar los nodos juntos! ¿Qué está pasando? Bueno, **Get Character BlendShape → Value** emite un número decimal, ¡pero la opción **Set Character Bone Scale → Scale** son tres números, X, Y, y Z! Más formalmente, necesitamos crear un _vector_ a partir del número decimal 0-1. (Un vector es solo una palabra elegante para "más de un número".) Para hacer esto, podemos usar el nodo **Scale Vector**:

![](/doc-img/en-blueprint-balloon-7.png)

Este nodo toma un Vector3 (es decir, tres números decimales X, Y, y Z) y un float (es decir, un número decimal) y emite un Vector3 escalado. Por ejemplo, si las entradas son (1, 2, 3) y 5, entonces la salida será (5, 10, 15); si las entradas son (2, 2, 2) y 0.5, entonces la salida será (1, 1, 1).

Por ahora, establece la opción **Vector3** a (2, 2, 2) y conecta los nodos juntos como arriba, y veamos qué pasa cuando inflamos nuestras mejillas.

¿Eh, no está pasando nada...? ¡Eso es porque el nodo Get Character Bone Scale nunca se activa! Por ahora, vamos a activarlo manualmente. Infla tus mejillas nuevamente, pero esta vez también haz clic en **Get Character Bone Scale → Enter**. ¡Deberías ver que la cabeza de tu personaje se hace más grande!

![](/doc-img/en-blueprint-balloon-5.png)

Pero aquí hay un problema: si dejas de inflar tus mejillas y haces clic en **Get Character Bone Scale → Enter** nuevamente, la cabeza de tu personaje se verá así:

![](/doc-img/en-blueprint-balloon-6.png)

:::tip
Antes de seguir leyendo, ¿puedes adivinar por qué está pasando esto?
:::

## Introducción a la Aritmética

Tomemos un paso atrás y pensemos en lo que estamos haciendo aquí. Estamos tomando el valor del blendshape de inflado de mejillas, que es un número decimal entre 0 y 1, y lo estamos usando para escalar tres números (2, 2, 2). ¿Cuál sería el valor máximo y el valor mínimo de los tres números?

Bueno, el valor máximo sería (2, 2, 2), lo que significa que nuestra cabeza será el doble de grande que el tamaño original. ¡Pero el valor mínimo sería (0, 0, 0), lo que significa que nuestra cabeza desaparecerá! Por eso cuando dejamos de inflar nuestras mejillas, la cabeza de nuestro personaje desaparece.

Para arreglar esto, necesitamos asegurarnos de que el valor mínimo sea (1, 1, 1), para que la cabeza de nuestro personaje nunca desaparezca. ¿Cómo podemos hacer esto? Bueno, ¿qué tal si siempre agregamos 1 a cada número? Podemos usar el nodo **Offset Vector3** para hacer esto:

![](/doc-img/en-blueprint-balloon-8.png)

Nota que hemos cambiado **Scale Vector3 → Vector3** a (1, 1, 1), y **Offset Vector3 → Offset** a (1, 1, 1). Ahora, cuando inflamos nuestras mejillas y hacemos clic en Enter, la cabeza de nuestro personaje se hará más grande, pero cuando dejemos de inflar nuestras mejillas y hagamos clic en Enter nuevamente, la cabeza de nuestro personaje volverá a su tamaño original.

Para ver por qué esto funciona, repasemos los cálculos nuevamente. Cuando inflamos nuestras mejillas, el valor máximo sería (1, 1, 1) + (1, 1, 1) = (2, 2, 2), y el valor mínimo sería (0, 0, 0) + (1, 1, 1) = (1, 1, 1). ¡Eso es exactamente lo que queremos!

## En Actualización {#on-update}

Espero que hayas odiado activar manualmente el nodo Get Character Bone Scale tanto como yo. De hecho, no podemos estar haciendo clic en nuestro blueprint cada vez que queremos inflar la cabeza de nuestro personaje. Si tan solo hubiera una forma de activar automáticamente el nodo... ¿Espera, la hay?

![](/doc-img/en-blueprint-balloon-9.png)

El nodo **On Update** es un nodo de evento que se activa cada frame cuando Warudo está funcionando. Por ejemplo, si Warudo funciona a 60 FPS, entonces el nodo On Update se activará 60 veces por segundo. Este nodo nos salvó de hacer clic 60 veces por segundo, uf.

:::tip
¡Recuerda que puedes agregar nodos después del nodo Get Character Bone Scale para activar más efectos usando tus mejillas! Intenta agregar un nodo **Set Character BlendShape** para activar un blendshape en tu personaje cuando infles tus mejillas. Pista: Set Character BlendShape → Target Value es un número decimal entre 0 y 1, así que puedes conectar Get Character BlendShape → Value directamente a él.
:::

## Reiniciando Escala de Hueso {#resetting-bone-scale}

Ahora puedes usar este blueprint para inflar la cabeza de tu personaje en tus streams, pero probablemente no quieras habilitar este efecto todo el tiempo. Entonces, porque sabes que los nodos de evento en un blueprint deshabilitado no se activarán, decides solo habilitar el blueprint cuando lo quieras y deshabilitarlo después.

Pero hay un pequeño problema: cuando deshabilites el blueprint, la escala del hueso de la cabeza puede no ser (1, 1, 1). ¡Tal vez estabas inflando las mejillas en ese momento! Usemos el nodo **On Disable Blueprint** para arreglar esto:

![](/doc-img/en-blueprint-balloon-10.png)

El nodo On Disable Blueprint es un nodo especial que se activa cuando el blueprint se deshabilita. Ahora, cuando deshabilites el blueprint, la escala del hueso de la cabeza se reiniciará a (1, 1, 1). ¡Problema resuelto!

## Más sobre Lectura de Datos de Seguimiento Facial

:::info
Esta sección está destinada para usuarios avanzados. Siéntete libre de omitirla si se lee como galimatías para ti.
:::

En este tutorial, usamos el nodo **Get Character BlendShape** para leer los datos de seguimiento facial. Pero eso no es completamente cierto: no estamos realmente leyendo datos de seguimiento facial, sino que estamos leyendo el valor del blendshape que es generado y aplicado en el personaje _por_ los datos de seguimiento facial. Esta es una distinción sutil pero importante. Por ejemplo, digamos que el valor crudo del blendshape `cheekPuff` de iFacialMocap es 0.5, pero puede que hayamos configurado en iFacialMocap Receiver → Configure BlendShapes Mapping tal que el blendshape `cheekPuff` aplicado en el personaje se multiplica esencialmente por 2 = 1.0. En este caso, incluso si solo inflamos nuestras mejillas a la mitad, la cabeza del personaje aún se inflará al tamaño máximo. También considera esto: ¡si deshabilitamos **Character → Motion Capture**, el blendshape `cheekPuff` en el personaje siempre será 0, incluso si estamos inflando nuestras mejillas!

En muchos casos, esto estaría bien, pero si quieres depender de los datos reales de seguimiento facial, debes usar el nodo **Get Receiver/Tracker Data** para tu sistema de seguimiento facial. Por ejemplo, como estoy usando iFacialMocap, puedo usar el nodo **Get iFacialMocap Receiver Data** y el nodo **BlendShape List Get BlendShape** para obtener el valor real del blendshape `cheekPuff`:

![](/doc-img/en-blueprint-balloon-11.png)

La desventaja de este enfoque es que este blueprint no funcionará si no estamos usando iFacialMocap. La ventaja es que ya no dependemos de ningún blendshape del personaje; ¡el personaje ni siquiera necesita tener un blendshape `cheekPuff`, y aún podemos usar inflar nuestras mejillas como un activador para una variedad de efectos divertidos!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
