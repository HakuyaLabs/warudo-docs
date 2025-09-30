---
sidebar_position: 100
---

# Tomando una Siesta

Es común tomar un descanso durante un stream. En Warudo, cuando tu cara ya no es rastreada, tu personaje transicionará lentamente de vuelta a una pose y expresión idle. En este tutorial, haremos que el personaje transite a una pose y expresión de dormir en su lugar, agregando un poco de realismo sutil a tu personaje.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/nap.mp4" /></div>
<p class="img-desc">¡Durmiendo en el trabajo!</p>

:::info
Este tutorial asume que estás usando iFacialMocap o MediaPipe para seguimiento facial. Otros sistemas de seguimiento facial pueden no funcionar porque no proporcionan una señal cuando tu cara ya no es rastreada.
:::

## El Blueprint de Seguimiento Facial

¡Abramos nuestro blueprint de seguimiento facial! Dependiendo de las opciones de blueprint que hayas seleccionado durante el proceso de configuración inicial, tu blueprint puede verse diferente al de abajo, pero la idea general es la misma. Además, se ven igualmente aterradores—¡hay tantos nodos y conexiones!

![](/doc-img/en-blueprint-nap-1.png)

No revisaremos cada nodo en este blueprint, pero vamos a desglosarlo en algunas partes. Primero deberías ver esta secuencia de nodos a la izquierda:

![](/doc-img/en-blueprint-nap-2.png)

¡Esta es fácil! Ya has visto el nodo On Disable Blueprint en un [tutorial anterior](balloon#resetting-bone-scale). Se activa cuando el blueprint se deshabilita, y este blueprint de seguimiento facial se deshabilita cuando apagas **Character → Motion Capture**. Entonces, cuando deshabilitas la captura de movimiento, la expresión facial del personaje (blendshapes) se reinicia por el nodo **Reset Character Tracking BlendShapes**, y los huesos del personaje (ej., cabeza, ojos) se reinician por el nodo **Reset Overridden Character Bones**.

Ahora echemos un vistazo al lado derecho del blueprint:

![](/doc-img/en-blueprint-nap-3.png)

Ya estás familiarizado con el [nodo On Update](balloon#on-update); se activa cada frame que Warudo está funcionando. Esta secuencia de nodos está diciendo: para cada frame, queremos actualizar los blendshapes del personaje (**Set Character Tracking BlendShapes**), huesos (**Override Character Bone Rotation Offsets**), y posición raíz (**Override Character Root Position**). ¿Pero qué blendshapes? ¿Qué huesos? ¿Y qué posición raíz? Estos son los trabajos de los nodos en el medio del blueprint:

![](/doc-img/en-blueprint-nap-16.png)

## Switch BlendShape List

Afortunadamente, para el propósito de este tutorial, solo necesitamos ver algunos nodos. Localiza el nodo **Get iFacialMocap Receiver Data** (o, si estás usando MediaPipe, el nodo **Get MediaPipe Receiver Data**); este es el nodo "fuente" que proporciona datos de seguimiento facial.

![](/doc-img/en-blueprint-nap-4.png)

Las conexiones de nodos están actualmente muy cerca unas de otras, así que para claridad, movamos el nodo Get iFacialMocap Receiver Data hacia la parte inferior izquierda, así:

![](/doc-img/en-blueprint-nap-5.png)

Haz zoom y panorámica del blueprint hasta que veas los siguientes 3 nodos: Get iFacialMocap Receiver Data, Empty BlendShape List, y Switch BlendShape List. Sin saber nada sobre el nodo **Switch BlendShape List** aún, solo inspeccionando las conexiones a él, ¿puedes adivinar qué hace?

![](/doc-img/en-blueprint-nap-6.png)

Descubramos esto. Primero, vemos que **Get iFacialMocap Receiver Data → Is Tracked** está conectado a **Switch BlendShape List → Condition**. Esto significa que el nodo Switch BlendShape List se preocupa por si la cara es rastreada o no. Si la cara es rastreada, la Condition es Yes; de lo contrario, la Condition es No.

Después, vemos que **Empty BlendShape List → Output** está conectado a **Switch BlendShape List → If False**, y **Get iFacialMocap Receiver Data → BlendShapes** está conectado a **Switch BlendShape List → If True**. ¡Hmm, creo que estoy empezando a entenderlo!

En efecto, el nodo Switch BlendShape List esencialmente verifica si la cara está siendo rastreada en el momento; si la cara es rastreada, pasará los blendshapes de seguimiento a la salida, reflejando nuestra expresión facial en el personaje; de lo contrario, pasará una lista vacía de blendshapes a la salida, resultando en que el personaje no tenga ninguna expresión facial.

Lo que hace este nodo aún más poderoso es su capacidad de cambiar entre dos listas de blendshapes con _transiciones suaves_: las opciones **To True/False Transition Time**, **To True/False Transition Delay**, y **To True/False Transition Easing** te permiten controlar precisamente cómo cambia la expresión facial del personaje cuando la cara es rastreada o no rastreada. Por ejemplo, si To False Transition Time está configurado a 0.5 segundos y To False Transition Delay está configurado a 1 segundo, entonces 1 segundo después de que tu cara ya no sea rastreada, la expresión facial del personaje transicionará suavemente a la lista vacía de blendshapes (es decir, una expresión natural) ¡en 0.5 segundos!

De cualquier manera, si queremos cambiar la expresión del personaje cuando nuestra cara ya no es rastreada, podemos simplemente modificar la entrada a Switch BlendShape List → If False, que actualmente es apenas una lista vacía de blendshapes. Podemos agregar un nodo **BlendShape List Set BlendShape** en el medio para agregar un blendshape a la lista:

![](/doc-img/en-blueprint-nap-7.png)

En el ejemplo de arriba, estoy creando una lista de blendshapes con solo una entrada: `Blink` configurado a 1. Esta lista de blendshapes será pasada a la salida cada vez que se pierda el seguimiento facial, resultando en que el personaje cierre los ojos.

:::tip
Si tu personaje no tiene un blendshape `Blink`, puedes usar los blendshapes de parpadeo que vienen con tu personaje, por ejemplo, `eyeBlinkLeft` y `eyeBlinkRight`. Para configurar múltiples blendshapes, simplemente agrega otro nodo BlendShape List Set BlendShape en el medio.
:::

Ahora intenta poner tu mano frente a la cámara frontal de tu iPhone para bloquear el rastreo facial (o si estás usando MediaPipe, simplemente aleja tu cara de la cámara), ¡y deberías ver a tu personaje cerrar los ojos!

![](/doc-img/en-blueprint-nap-13.png)

Las configuraciones predeterminadas cerrarán los ojos bastante rápido, así que podrías querer ajustar las opciones **To False Transition Time** y **To False Transition Delay** para hacer la transición más natural. Las he configurado a 2 y 1 segundos respectivamente:

![](/doc-img/en-blueprint-nap-8.png)

## Switch Rotation List

:::tip
Antes de leer esta sección, si has habilitado la animación idle de cabeza durante el proceso de configuración inicial (que está habilitada por defecto cuando no se está rastreando), necesitas deshabilitarla primero. Localiza el nodo **Generate Idle Head Animation** y configura **Enabled** a No:

![](/doc-img/en-blueprint-nap-12.png)
:::


Para hacer que el personaje transite a una pose de dormir, como inclinar la cabeza hacia un lado, el proceso es en realidad muy similar a lo que acabamos de hacer. Movamos una vez más el nodo Get iFacialMocap Receiver Data hacia abajo:

![](/doc-img/en-blueprint-nap-9.png)

Hasta que puedas ver los nodos **Default Character Rotation List** y **Switch Rotation List** a la derecha:

![](/doc-img/en-blueprint-nap-10.png)
![](/doc-img/en-blueprint-nap-11.png)

La pose de un personaje 3D está definida por cuánto está rotado cada hueso, por lo que en lugar de blendshapes, estamos viendo "rotaciones de huesos" en todas partes. El nodo Switch Rotation List aquí verifica si la cara está siendo rastreada, y pasa los datos de rotación de huesos (es decir, movimiento de cabeza) a la salida si la cara es rastreada, y pasa la lista de rotación predeterminada (es decir, la cabeza no se mueve en absoluto) a la salida de lo contrario.

Para inclinar la cabeza hacia un lado, podemos simplemente agregar un nodo **Offset Character Bone Rotation List** en el medio para compensar la rotación de la cabeza:

![](/doc-img/en-blueprint-nap-15.png)

He agregado **Head** a la lista **Character Bones** y configuré **Rotation Offset** a (15, 0, -20), lo que significa que la cabeza será rotada 15 grados hacia adelante y 20 grados hacia la derecha. ¡Por supuesto eres bienvenido a ajustar la rotación a tu gusto, o incluso agregar más huesos a la lista para hacer la pose de dormir del personaje más compleja!

:::tip
En lugar de ingresar manualmente los números, puedes hacer clic y arrastrar las etiquetas X/Y/Z hacia la izquierda y derecha para ajustar los números. ¡Este truco funciona para cualquier entrada numérica!
:::

¡Ahora cuando tu cara ya no sea rastreada, tu personaje inclinará la cabeza hacia un lado!

![](/doc-img/en-blueprint-nap-14.png)


<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
