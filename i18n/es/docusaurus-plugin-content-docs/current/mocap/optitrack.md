---
sidebar_position: 515
---

# OptiTrack Motive

:::info
Esta característica solo está disponible en [Warudo Pro](../pro).
:::

Seguimiento corporal a través de [OptiTrack Motive](https://optitrack.com/software/motive/). Requiere acceso a un sistema de seguimiento óptico [OptiTrack](https://optitrack.com).

Además del seguimiento de personaje, también se soporta el seguimiento de props. Por ejemplo, puedes querer rastrear una silla o una cámara de mano usando tu sistema de seguimiento óptico y transmitir los datos de movimiento a Warudo, animando un prop de silla o cámara en Warudo acordemente.

## Configuración

En Warudo, ve a **Menu -> Settings -> OptiTrack**. Asegúrate de que la **Server Address** y **Local Address** sean ambas correctas. La Server Address debería ser la IP de la PC OptiTrack, y la Local Address debería ser la IP de la PC Warudo. Si ejecutas Warudo y OptiTrack Motive ambos en la misma computadora, ingresa `127.0.0.1` para ambos. Luego, establece **Enabled** en Yes. Deberías ver un mensaje de estado que dice "Connected to OptiTrack Motive".

![](/doc-img/en-optitrack-1.png)

### Seguimiento de Personaje

Para conectar OptiTrack Motive a Warudo, por favor habilita **Streaming** en OptiTrack Motive y establece **Transmission Type** en **Unicast**. Por favor también selecciona la IP correcta en el menú desplegable Local Interface. Esta IP debería tener la misma subred que la PC ejecutando Warudo. Si ejecutas Warudo y OptiTrack Motive ambos en la misma computadora, selecciona "loopback".

![](/doc-img/en-optitrack-2.png)

En el asset **OptiTrack Skeleton Receiver**, asegúrate de que el nombre coincida con el de OptiTrack Motive:

![](/doc-img/en-optitrack-3.png)

### Seguimiento de Props

En Warudo, crea un nuevo asset **OptiTrack Rigid Body Receiver** y establece **OptiTrack Rigid Body ID** al ID del rigidbody que te gustaría rastrear. Luego, para **Target Asset**, selecciona el prop/cámara de Warudo que te gustaría controlar.

:::tip
Si te gustaría acceder a datos de seguimiento de props en blueprints, puedes usar el nodo **Get OptiTrack Rigid Body Receiver Data**.
:::

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
