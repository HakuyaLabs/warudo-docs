---
sidebar_position: 10
---

# Creando Tu Primer Blueprint

Es completamente normal sentirse abrumado cuando abres el editor de nodos por primera vez. ¡Hay tantos nodos y tantas cosas que puedes hacer con ellos! Pero no te preocupes, te guiaremos a través de los conceptos básicos de los blueprints en esta sección.

## Tu Primer Blueprint

Comencemos con un ejemplo simple. Supón que quieres sacudir la cámara cuando se presiona la tecla Esc. Primero, haz clic en el botón **Add Blueprint** en la barra de herramientas para agregar un nuevo blueprint. Opcionalmente puedes renombrar el blueprint a algo más significativo, ej. "Shake Camera On Esc", pero podemos dejarlo por ahora.

![](/doc-img/en-understanding-blueprints-1.png)
<p class="img-desc">Agregando un nuevo blueprint.</p>

Este es un blueprint hermoso, pero también es completamente inútil. Necesitamos agregarle algunos nodos. Escribe "on keystroke" en la barra de búsqueda, y deberías ver el nodo **On Keystroke Pressed**. Arrástralo al editor de nodos, y deberías ver algo así:

![](/doc-img/en-understanding-blueprints-2.png)
<p class="img-desc">Agregando el nodo On Keystroke Pressed.</p>

:::tip
Si accidentalmente arrastraste el nodo equivocado, puedes hacer clic para seleccionar el nodo y presionar **Delete** para eliminarlo. Alternativamente, también puedes usar el botón **Undo**.
:::

¡Genial! Ahora, necesitamos agregar un nodo que sacuda la cámara. Escribe "shake camera" en la barra de búsqueda, y deberías ver el nodo **Shake Camera**. Arrástralo junto al nodo On Keystroke Pressed, y aquí tienes un desafío: intenta conectar el nodo On Keystroke Pressed al nodo Shake Camera como se muestra a continuación.

![](/doc-img/en-understanding-blueprints-3.png)
<p class="img-desc">Agregando el nodo Shake Camera y conectándolo al nodo On Keystroke Pressed.</p>

Si hiciste clic en el punto verde junto al **Exit** en el nodo On Keystroke Pressed y lo arrastraste al punto verde junto al **Enter** en el nodo Shake Camera, ¡felicitaciones! Tienes gran intuición. Por cierto, puedes eliminar la conexión haciendo clic en cualquier extremo de la conexión y arrastrándola lejos.

:::tip
Los puntos verdes en el lado derecho de un nodo se llaman <b style={{color: "green"}}>salidas de flujo</b>, mientras que los puntos verdes en el lado izquierdo de un nodo se llaman <b style={{color: "green"}}>entradas de flujo</b>. Así que acabas de conectar la salida de flujo **Exit** del nodo On Keystroke Pressed a la entrada de flujo **Enter** del nodo Shake Camera.

Una conexión de flujo determina el orden en que los nodos se activan. En este ejemplo, estamos diciendo que cuando el nodo On Keystroke Pressed se activa, el nodo Shake Camera debería activarse a continuación.
:::

Ya terminamos, ¿verdad? Intentemos presionar la tecla Esc y veamos si la cámara se sacude.

Hmm, la cámara no se sacudió para nada. Me pregunto por qué.

Echemos un vistazo más de cerca al nodo Shake Camera. ¡Tiene una entrada de datos **Camera**, pero no está configurada a nada! Seleccionemos nuestra cámara del menú desplegable:

![](/doc-img/en-understanding-blueprints-4.png)
<p class="img-desc">Configurando la entrada de datos **Camera**.</p>

Intentemos presionar la tecla Esc nuevamente. Si la cámara se sacude, ¡felicitaciones! Has creado exitosamente tu primer blueprint.

## Pasando Datos Entre Nodos

Ahora, puedes preguntarte qué son estos puntos negros junto a las entradas de datos en el nodo Shake Camera. En efecto, se ven sospechosamente similares a los puntos verdes junto a la entrada de flujo **Enter**. ¿Tal vez también se pueden conectar a algo?

¡En efecto, sí pueden! Arrastremos un nodo **Get Main Camera** de la paleta de nodos al editor de nodos, hagamos clic en el punto negro junto a la salida de datos **Camera** del nodo Get Main Camera, y arrastrémoslo al punto negro junto a la entrada de datos **Camera** del nodo Shake Camera, así:

![](/doc-img/en-understanding-blueprints-5.png)
<p class="img-desc">Conectando el nodo Get Main Camera al nodo Shake Camera.</p>

:::tip
Recuerda que Warudo soporta [múltiples cámaras](../assets/camera), y la cámara principal es la cámara que se muestra actualmente en la ventana principal.
:::

Intenta presionar la tecla Esc nuevamente. ¡Oye, la cámara aún se sacude! Pero esta vez, nota que el menú desplegable **Camera** ha desaparecido. Significa que el nodo Shake Camera está tomando la cámara del nodo Get Main Camera en su lugar, y la cámara que seleccionamos del menú desplegable es ignorada (aunque técnicamente son la misma cámara de todas formas).

Creemos otra cámara en la pestaña Assets, cambiemos a esa cámara, y luego presionemos la tecla Esc nuevamente. ¡Notarás que la nueva cámara es la que se sacude, no la que seleccionamos del menú desplegable!

:::tip
Similar a las <b style={{color: "green"}}>entradas/salidas de flujo</b>, los puntos negros en el lado derecho de un nodo se llaman <b style={{color: "black"}}>salidas de datos</b>, mientras que los puntos negros en el lado izquierdo de un nodo se llaman <b style={{color: "black"}}>entradas de datos</b>. Así que acabas de conectar la salida de datos **Camera** del nodo Get Main Camera a la entrada de datos **Camera** del nodo Shake Camera.

Una conexión de datos es responsable de pasar datos entre nodos. En este ejemplo, estamos diciendo que la entrada de datos **Camera** del nodo Shake Camera debería configurarse a la salida de datos **Camera** del nodo Get Main Camera, cuando el nodo Shake Camera se activa.
:::

Ahora, aunque este es solo un ejemplo de juguete, esto es de lo que se trata crear un blueprint: encontrar los nodos que necesitamos y conectarlos juntos, para que podamos decirle a Warudo qué hacer (sacudir cámara) cuando algo sucede (presionar Esc).

Resumamos lo que hemos aprendido hasta ahora:

* Un blueprint consiste en **nodos** y **conexiones**. Las conexiones vienen en dos tipos: <b style={{color: "green"}}>conexiones de flujo</b> y <b style={{color: "black"}}>conexiones de datos</b>, mientras que cada nodo puede tener tanto entradas y salidas de flujo como de datos. Una entrada de datos puede configurarse directamente en el nodo, o conectarse a una salida de datos de otro nodo.

* Para crear una conexión, haz clic en el puerto de entrada/salida y luego arrástralo al puerto de salida/entrada de otro nodo. Las <b style={{color: "green"}}>conexiones de flujo</b> determinan el orden en que los nodos se activan, de izquierda a derecha. Las <b style={{color: "black"}}>conexiones de datos</b> son responsables de pasar datos entre nodos, también de izquierda a derecha.

:::info
Una entrada de flujo puede conectarse a múltiples salidas de flujo, pero una salida de flujo solo puede conectarse a una entrada de flujo. De lo contrario, no estaría claro qué nodo debería activarse primero.

Similarmente, una salida de datos puede conectarse a múltiples entradas de datos, pero una entrada de datos solo puede conectarse a una salida de datos. De lo contrario, no estaría claro desde qué nodo deberían pasarse los datos.
:::

¿Te sientes un poco abrumado? No te preocupes, pasaremos por muchos más ejemplos en las siguientes secciones.

## Tipos de Datos

Como nota al margen, los tipos de datos de los dos extremos de una conexión de datos deben ser compatibles. En el ejemplo anterior, no puedes conectar **Get Main Camera → Camera** (tipo de datos: asset de cámara) a **Shake Camera → Sustain Time** (tipo de datos: "float," la forma elegante de decir un número decimal). Puedes pasar el cursor sobre el puerto para ver su tipo de datos:

![](/doc-img/en-blueprints-2.png)
<p class="img-desc">Pasando el cursor sobre un puerto para ver su tipo de datos.</p>

¡La mayoría de las veces no necesitas preocuparte por los tipos de datos, porque todos sabemos que una cámara no puede ser un número!

## Deshabilitando Blueprints

Un blueprint puede deshabilitarse haciendo clic en el icono del ojo junto al nombre del blueprint. Cuando un blueprint está deshabilitado, los nodos en el blueprint no recibirán eventos. Por ejemplo, en el ejemplo anterior, si se presiona la tecla Esc cuando el blueprint está deshabilitado, el nodo On Keystroke Pressed no recibirá un evento y el flujo no se activará, y como resultado la cámara no se sacudirá.

:::info
Puedes determinar si un flujo se está activando o si se están pasando datos verificando si hay una pelota rodando en la conexión:

![](/doc-img/en-blueprints-overview-5.webp)
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
