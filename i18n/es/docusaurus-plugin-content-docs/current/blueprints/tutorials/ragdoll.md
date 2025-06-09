---
sidebar_position: 20
---

# Lanzado al Cielo

¿Quieres ser lanzado al cielo? Yo tampoco. ¡Pero es divertido, así que hagámoslo de todos modos! En este tutorial, aprenderemos cómo activar la física ragdoll en tu personaje cuando sea golpeado por un prop.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/ragdoll.mp4" /></div>
<p class="img-desc">Haciendo ragdoll a tu personaje.</p>

## Lanzando Props

Creemos un nuevo blueprint. Para el activador, usaremos una vez más el nodo **On Keystroke Pressed**, pero puedes usar cualquier nodo de evento que quieras. Estableceré la tecla de acceso rápido a **Space** solo para facilitar las pruebas. Luego, agrega un nodo **Throw Prop At Character** justo al lado, y conecta los nodos como abajo. Establece la opción **Character** a nuestro personaje, y la opción **Prop Source** al modelo de prop que quieres lanzar a tu personaje (elegiré "Sea Lion").

![](/doc-img/en-blueprint-ragdoll-1.png)

Dios, este nodo es enorme. Hay muchas opciones en el nodo **Throw Prop At Character**, así que vamos a desglosarlo un poco.

* **Impact Particle Source** e **Impact Particle Scale** determinan el efecto de partículas que se reproduce cuando el prop golpea al personaje; elegiré "Basic Impact 02" aquí, pero puedes abrir la galería de vista previa haciendo clic en el ícono de galería para ver todas las partículas disponibles.
* **Launch Sound Source**, **Impact Sound Source** y **Sound Volume** son bastante autoexplicativos.
* El menú desplegable **From** te permite elegir desde dónde se lanza el prop. Puedes elegir de las siguientes opciones:
  * Viewport Bounds Random Position: En cualquier lugar de la pantalla, es decir, simulando un prop siendo lanzado desde la cámara.
  * Screen Edge: En cualquier lugar del borde de la pantalla, es decir, simulando un prop siendo lanzado desde fuera de la cámara.
  * Above Character Head: Justo arriba de la cabeza del personaje.
  * Scene Object: Un objeto de escena, puede ser otro prop, un personaje, o un [anchor](../../assets/anchor).
  * World Position: Un punto 3D en la escena.
  
  El predeterminado "Viewport Bounds Random Position" funciona bien para nosotros.
* El menú desplegable **To** te permite elegir hacia dónde se lanza el prop. Puedes elegir de las siguientes opciones:
  * Body Random Position: En cualquier lugar del cuerpo del personaje.
    * Human Body Bone: Un hueso estándar en el cuerpo del personaje, ej., la cabeza, la mano izquierda, etc.
  * Transform Path: Cualquier transform hijo del personaje. Por ejemplo, si quieres lanzar a la cola de tu personaje, puedes elegir el transform de la cola aquí.
  
  Cambiaré esto a "Human Body Bone" y elegiré el hueso "Head", ya que eso parece más, bueno, satisfactorio.
* **Scale**, **Mass**, **Speed** y **Gravity** son las propiedades físicas del prop y determinan cómo reacciona el personaje al prop. Puedes ajustarlas a tu gusto; cambiaré Scale a 2 y Speed a 10.
* **Launch Torque** y **Randomize Launch Rotation** determinan la rotación del prop cuando se lanza.
* **Alive Time** determina cuánto tiempo permanecerá el prop en la escena antes de que desaparezca.

Ahora, cuando presiones Space, el prop será lanzado a la cabeza de nuestro personaje, y nuestro personaje reacciona a ello.

## Activando Ragdoll

¡Pero queríamos hacer ragdoll a nuestro personaje, no solo hacer que se estremezca! Agreguemos un nodo **Activate Character Ragdoll**, y conectemos la salida de flujo **On Collide** del nodo Throw Prop At Character a la entrada de flujo **Enter** del nodo Activate Character Ragdoll. Luego, establece la opción **Character** a nuestro personaje y **Launch Force** a (0, 300, -600).

![](/doc-img/en-blueprint-ragdoll-2.png)

:::caution
¡Nota que conectamos desde la salida de flujo On Collide, no la salida Exit! Esto es porque queremos activar el ragdoll _cuando_ el prop colisiona con el personaje. Si conectamos desde la salida Exit, el ragdoll se activará inmediatamente después de que se lance el prop, lo cual no es lo que queremos.
:::

Presionemos Space nuevamente. El prop se lanza, pero esta vez, cuando golpea al personaje, el personaje es lanzado en la clásica moda ragdoll. Incluso puedes presionar Space múltiples veces para lanzar props a tu personaje nuevamente, cada vez golpeándolos con más fuerza. ¡Genial!

:::tip
Otros nodos de interacción, como **Launch Liquid At Character** y **Spawn Sticker From Local/Online Image**, pueden configurarse de manera similar. ¡Intenta jugar con ellos y ve qué puedes crear!
:::

## Reiniciando Ragdoll

Notarás que el personaje se reinicia después de 5 segundos, lo cual se puede cambiar ajustando la opción **Reset Wait Time** en el nodo Activate Character Ragdoll. También puedes deshabilitar el reinicio automático estableciendo **Auto Reset** a No, y activar la entrada de flujo **Reset** manualmente. Por ejemplo, el siguiente blueprint solo reiniciará el personaje cuando presiones la tecla **R**.

![](/doc-img/en-blueprint-ragdoll-3.png)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
