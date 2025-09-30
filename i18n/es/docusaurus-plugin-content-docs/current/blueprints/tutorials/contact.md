---
sidebar_position: 130
---

# Encendiéndolo

¡Es hora de encender tu stream! Este tutorial te introduce al poderoso sistema de contacto de Warudo, que te permite activar una variedad de efectos divertidos cuando los objetos están en _contacto_ con otros objetos.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/contact.mp4" /></div>
<p class="img-desc">Generando chispas entre los dedos y sacando una katana usando el sistema de contacto.</p>

:::info
Necesitas seguimiento de manos o seguimiento de cuerpo completo para este tutorial. Para seguimiento de manos, [MediaPipe](../../mocap/mediapipe) debería estar bien, pero recomendamos usar [Leap Motion](../../mocap/leap-motion) para mejor precisión.
:::

## Sistema de Contacto

El sistema de contacto es simple en concepto: cuando dos objetos están en contacto, puedes activar un flujo. Un ejemplo es detectar cuando las puntas de nuestros dedos índice están en contacto, y luego generar chispas entre ellos. ¡Veamos cómo podemos implementar esto!

Primero, echemos un vistazo al nodo **On Contact**. ¡No lo creerás, pero este nodo solo es todo el sistema de contacto! En esencia, este nodo automáticamente verifica si los objetos en **Contact Senders** están en contacto con los objetos en **Contact Receivers**, y activa las salidas de flujo **On Contact Enter** (el instante que los objetos están en contacto), **On Contact Stay** (mientras los objetos están en contacto), y **On Contact Exit** (el instante que los objetos ya no están en contacto) en consecuencia.

![](/doc-img/en-blueprint-contact-2.png)

Agreguemos una entrada a **Contact Senders** y configuremos como abajo:

![](/doc-img/en-blueprint-contact-4.png)

Ahora cuando levantes tu mano derecha, deberías ver una esfera roja aparecer en la punta de tu dedo índice:

![](/doc-img/en-blueprint-contact-3.png)

Después, agreguemos una entrada a **Contact Receivers** y configuremos como abajo:

![](/doc-img/en-blueprint-contact-5.png)

Levanta tus manos, y deberías ver una esfera verde aparecer en la punta de tu dedo índice izquierdo:

![](/doc-img/en-blueprint-contact-6.png)

¡Ahora lo único que queda por hacer es generar las chispas eléctricas! Afortunadamente, podemos usar el nodo **Spawn Particle** para hacer exactamente eso. Agrégalo al editor de nodos, selecciona tu partícula favorita (estoy usando "Basic Impact 3") en la opción **Source** así como seleccionar una **Scale** adecuada (estoy usando 0.1). Luego, conecta **On Contact → On Contact Stay** a **Spawn Particle → Enter**, y conecta **On Contact → Contact Position** a **Spawn Particle → Position Offset**, como abajo:

![](/doc-img/en-blueprint-contact-7.png)

¡Ahora cuando juntes tus manos, deberías ver chispas volando entre las puntas de tus dedos! Eso es más fácil de lo que pensaste, ¿verdad?

![](/doc-img/en-blueprint-contact-1.png)

:::tip
Después de que termines con las configuraciones, puedes configurar **Visualized** a No para ocultar las esferas rojas y verdes.
:::

## Throttle Flow

Puedes notar que las partículas se generan a una tasa muy alta, resultando en un efecto de chispas muy denso. Esto es porque la salida de flujo **On Contact Stay** es activada cada frame que los objetos están en contacto—¡si estás corriendo Warudo a 60 FPS, entonces 60 partículas serán generadas cada segundo!

Para reducir la tasa de flujo, podemos usar el nodo **Throttle Flow**. Un throttle es una válvula que regula la tasa de flujo de agua, y el nodo Throttle Flow hace la misma cosa: regula la tasa de flujo de una salida de flujo. En el siguiente ejemplo, el nodo Throttle Flow con **Interval** configurado a 0.1 segundo solo activará la salida de flujo como máximo una vez cada 0.1 segundo:

![](/doc-img/en-blueprint-contact-8.png)

Puedes ajustar el intervalo a tu gusto. Por ejemplo, si quieres generar chispas a una tasa de 20 chispas por segundo, puedes configurar el intervalo a 0.05 en su lugar.

## Sacando una Katana

¡Veamos otro ejemplo: sacando una katana de detrás de nuestra espalda! Agrega un prop de katana (o una espada, un cuchillo, o cualquier otra arma que te guste), y adjúntala a la mano izquierda del personaje como abajo:

![](/doc-img/en-blueprint-contact-9.png)

Oculta la katana por ahora configurando **Prop → Enabled** a No. Ahora configuremos nuestro sistema de contacto: en un nuevo nodo On Contact, agrega lo siguiente a la lista Contact Senders:

![](/doc-img/en-blueprint-contact-12.png)

Y agrega lo siguiente a la lista Contact Receivers:

![](/doc-img/en-blueprint-contact-13.png)

Deberías ver una esfera roja en tu hombro derecho, y una esfera verde en tu mano izquierda. Ajusta las opciones **Position Offset** hasta que puedas alcanzar cómodamente la esfera roja con tu mano (esfera verde).

![](/doc-img/en-blueprint-contact-11.png)

Finalmente, solo necesitamos agregar un **Toggle Asset Enabled** cada vez que nuestra mano esté en contacto con nuestro hombro:

![](/doc-img/en-blueprint-contact-10.png)

¡Ahora cuando alcances tu mano izquierda a tu hombro derecho, deberías ver la katana aparecer en tu mano! También puedes agregar un nodo **Play Sound** para reproducir un efecto de sonido cuando la katana aparece, o una partícula, o cualquier cosa que te guste—¡esa es la belleza del sistema de contacto!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
