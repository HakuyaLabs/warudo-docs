---
sidebar_position: 10
---

# Alternando Ropa y Accesorios

A menudo los modelos de personajes tendrán múltiples meshes para diferentes ropas y accesorios. Este tutorial te mostrará cómo alternar estos meshes encendidos y apagados usando teclas de acceso rápido.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/toggle-meshes.mp4" /></div>
<p class="img-desc">Alternando meshes de personaje con teclas de acceso rápido.</p>

## Alternando Meshes

¡Sin más preámbulos, empecemos! Primero, vamos a crear un nuevo blueprint. Justo como en el tutorial [Creando Tu Primer Blueprint](../understanding-blueprints.md), necesitamos agregar un nodo **On Keystroke Pressed**. Configuraré la tecla de acceso rápido a **Ctrl+Shift+J** (J por "jacket"), pero puedes usar lo que quieras.

![](/doc-img/en-blueprint-toggle-meshes-1.png)

Después, necesitamos agregar un nodo **Toggle Character Meshes**——el nombre se explica por sí mismo, ¿no es así? Agrégalo al blueprint, y conecta los nodos así:

![](/doc-img/en-blueprint-toggle-meshes-2.png)

Selecciona tu personaje del menú desplegable **Character**. Luego, haz clic en el botón **+** para agregar una nueva entrada a la lista **Meshes**, y selecciona el mesh que quieres alternar. En este caso, quiero alternar la chaqueta de mi personaje, así que selecciono el mesh "jacket". Puedes agregar tantos meshes como quieras a esta lista.

:::info
Nota que los modelos exportados por [VRoid Studio](https://vroid.com/en/studio) solo tienen dos meshes: `Body` y `Face`. Los modelos más detallados a menudo dividen la ropa del personaje, accesorios, cola, orejas de animal, etc. en meshes separados. Si no tienes ropa o accesorios para alternar, puedes saltarte este tutorial, ¡o seguir adelante para alternar todo el mesh de tu cuerpo solo por diversión!
:::

Oye, ¿puedes creerlo? ¡Ya terminamos! Ahora, cuando presione **Ctrl+Shift+J**, la chaqueta de mi personaje se alternará encendida y apagada.

## Copiar y Pegar

Quiero configurar una tecla de acceso rápido para alternar mis audífonos también. En lugar de arrastrar los nodos otra vez, simplemente copiemos y peguemos los nodos que ya tenemos. Mantén **Mouse RMB** y arrastra una caja alrededor de los nodos para seleccionarlos así:

![](/doc-img/en-blueprint-toggle-meshes-3.png)

Luego, presiona **Ctrl+C** para copiar los nodos, y **Ctrl+V** para pegarlos. Los nodos serán pegados en la ubicación de tu cursor del mouse. Estoy cambiando la tecla de acceso rápido a **Ctrl+Shift+H** (H por "headphones"), y seleccionando el mesh "headphones" del menú desplegable, pero por supuesto puedes configurar estos a lo que quieras.

![](/doc-img/en-blueprint-toggle-meshes-4.png)

Ahora, cuando presione **Ctrl+Shift+H**, los audífonos de mi personaje se alternarán encendidos y apagados.

## Nodos de Evento

Los nodos como el nodo On Keystroke Pressed son llamados **nodos de evento**. Los nodos de evento no tienen una entrada de flujo **Enter**, así que no puedes activarlos; son activados por Warudo automáticamente, en este caso, cuando presionas la tecla de acceso rápido.

Hay otros nodos de evento, como el nodo **On YouTube Super Chat Received**. Si has conectado Warudo a tu stream de YouTube, este nodo es activado cuando recibes un Super Chat. En el ejemplo de abajo, estoy usando el nodo **On YouTube Super Chat Received** para alternar la chaqueta de mi personaje cuando recibo un Super Chat.

![](/doc-img/en-blueprint-toggle-meshes-5.png)

Este paradigma "si X, entonces Y" es la fundación de los blueprints. La X es un evento, como presionar una tecla de acceso rápido o recibir un Super Chat, y la Y son todo tipo de interacciones interesantes, como hacer que tu personaje baile, o hacer ragdoll a tu personaje. De hecho, eso es exactamente lo que veremos en el siguiente tutorial...

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
