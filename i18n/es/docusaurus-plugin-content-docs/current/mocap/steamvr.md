---
sidebar_position: 68
---

# SteamVR

Seguimiento a través de resolver datos de rastreador VR desde [SteamVR](https://store.steampowered.com/app/250820/SteamVR/).

## Configuración

### Seguimiento de Personaje

Warudo actualmente soporta seguimiento de personaje de 6 puntos. Después de [configurar captura de movimiento](body-tracking) para usar SteamVR, ve al asset **SteamVR Character Tracker** y haz clic en el botón **Setup / Calibrate**. Verás una lista de rastreadores que puedes asignar a diferentes partes del cuerpo. Luego, se te pedirá realizar una T-pose para calibrar los rastreadores.

:::tip
Agregaremos soporte para rastreadores de codo, rodilla y pecho en el futuro.
:::

Después de calibrar, puedes expandir cada rastreador para visualizar la esfera de seguimiento y ajustar su **Position Offset** y **Rotation Offset**. Esto es especialmente útil si los rastreadores no están colocados en el lugar exacto de tu cuerpo. Por ejemplo, si tu rastreador de cabeza está puesto encima de tu cabeza, debes ajustar el **Position Offset** para mover la esfera de seguimiento hacia abajo, para que coincida con la posición de tu cabeza relativa al rastreador.

### Seguimiento de Props

En Warudo, crea un nuevo asset **SteamVR Prop Tracker** y selecciona el **Device** VR que te gustaría rastrear. También es posible que quieras seleccionar el **Reference Frame** para que sea tu asset de personaje. Luego, para **Target Asset**, selecciona el prop/cámara de Warudo que te gustaría controlar.

:::tip
Si te gustaría acceder a datos de seguimiento de props en blueprints, puedes usar el nodo **Get SteamVR Prop Tracker Data**.
:::

## Acceder a Datos de Dispositivo Sin Procesar

Si te gustaría acceder a datos de dispositivo sin procesar en blueprints, puedes usar el nodo **Get SteamVR Device Data**. Este nodo devuelve la posición y rotación del dispositivo VR especificado (ej., rastreador, controlador, HMD).

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
