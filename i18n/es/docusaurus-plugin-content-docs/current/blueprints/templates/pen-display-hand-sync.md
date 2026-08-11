---
sidebar_position: 3
translate_from_version: 2026-08-11
---

# Sincronización de Mano con Tableta de Dibujo

## Introducción

![](/doc-img/pen-display-hand-sync-9.png)

Esta página proporciona una escena de ejemplo para ayudarte a **construir tu propio live para dibujo o diseño**.  
¡Te permitirá **sostener el lápiz** y hacer que **siga tu cursor en el asset de pantalla** perfectamente en el mundo de Warudo!

<div style={{width: '100%'}} className="video-box">
<video controls loop src="/doc-img/pen-display-hand-sync-10.mp4" />
</div>
<p class="img-desc">¡Demostración!</p>

## Tutoriales

###  Paso 1 - Preparación

1. Primero, necesitas suscribirte a los siguientes elementos en Steam workshop para continuar con los siguientes tutoriales:

	| Elemento    | URL de Steam workshop                                                                      |
	|:----------- |:------------------------------------------------------------------------------------------ |
	| Environment | [🔗 Loft Apartment](https://steamcommunity.com/sharedfiles/filedetails/?id=3033191267)        |
	| Character   | [🔗 VRoid Avatar Sample A](https://steamcommunity.com/sharedfiles/filedetails/?id=3003820352) |
	| Prop 1      | [🔗 Square Grid](https://steamcommunity.com/sharedfiles/filedetails/?id=3295273541)           |
	| Prop 2      | [🔗 Drawing Tablet Set](https://steamcommunity.com/sharedfiles/filedetails/?id=3146409616)    |
	| Node        | [🔗 Mouse Position Nodes](https://steamcommunity.com/sharedfiles/filedetails/?id=3159188937)  |

2. Después, necesitas descargar el siguiente archivo y ponerlo en la carpeta `<WARUDO_DATA_FOLDER>\Scenes`:

<ol style={{ "list-style-type": "none" }}><li>
<ul><li>
    <a
    target="_blank"
    href="/scenes/Warudo_PenDisplay_SampleScene_v20240828.json"
    download="Warudo_PenDisplay_SampleScene_v20240828.json">
      🔗 Warudo_PenDisplay_SampleScene_v20240828.json
    </a> 
</li></ul>
</li></ol>

3. Luego, puedes abrir la escena que descargaste usando la opción `Open scene` en Warudo.

:::warning[Para Usuarios de Warudo Pro]

Necesitas cambiar de URP (Nilotoon) a BiRP para seguir este tutorial.  
Puedes cambiarlo de vuelta después de que la configuración esté completa, y reemplazar el environment y character a la versión URP.

:::

### Paso 2 - Asignar Pantalla (Para Usuarios de Multi-Pantalla)

1. Determina el monitor donde quieres que se ubique la ventana principal de Warudo.  
(llamado **Monitor A**)
2. Determina el monitor que quieres mostrar en Warudo.  
(llamado **Monitor B**)

Si Monitor A = Monitor B, puedes saltar directamente al **paso 3**, de lo contrario:

3. ✨ Cambia los valores `Output Offset X/Y` en el nodo `Mouse Position Relative To Screen` para asegurarte de que el `Output` sea `(0,0)` cuando tu mouse esté ubicado en la **esquina superior izquierda** del Monitor B.

	![](/doc-img/pen-display-hand-sync-1.png)

:::tip[Cómo determinar tus valores de offset]

1. Mueve tu mouse a la **esquina superior izquierda** del Monitor B. 
2. Ingresa el ❗ **Valor Opuesto** ❗ del `Output` actual en `Output Offset X/Y`.  
**ej.** Si el Output es (1920, -1080) cuando el mouse está en la esquina superior izquierda, necesitas completar:
`Output Offset X` = `-1920`  
`Output Offset Y` = `+1080`
3. Verifica el ✨ paso otra vez.

:::

:::warning

Cada vez que cambies tu selección del Monitor A o B, necesitas re-ajustar los valores de offset.

:::

### Paso 3 - Ingresar Resolución de Pantalla

Ingresa la resolución (en píxeles) del **Monitor B** en el nodo `Decompose Vector2`.

![](/doc-img/pen-display-hand-sync-2.png)

:::note[Resoluciones 16:9 comunes]

| Tamaño |  X   |  Y   |
|:------:|:----:|:----:|
| 1080p  | 1920 | 1080 |
|   2K   | 2560 | 1440 |
|   4K   | 3840 | 2160 |
|   ⋯    |  ⋯   |  ⋯   |

:::

### Paso 4 - Seleccionar Pantalla

Selecciona la **Pantalla para Monitor B** como el `Content` - `Display` en `Prop - Drawing Screen`.

![](/doc-img/pen-display-hand-sync-3.png)

### Paso 5 - (Opcional) Personalizar Assets

:::info

**Recomendamos saltarse este paso para el primer intento.**

:::

Puedes usar el **Asistente de Configuración** para configurar tu propio personaje, entorno, y captura de movimiento.

También puedes personalizar las posiciones del personaje y la pantalla.

Para diferentes personajes, es posible que necesites ajustar los valores de **`Transform` - `Position`** en **`Anchor - Right Hand IK`** para hacer que el personaje sostenga mejor el lápiz.

:::warning

¡Necesitas **deshabilitar la física de péndulo de `Finger Movements` en tus configuraciones de captura de movimiento!**  

![](/doc-img/pen-display-hand-sync-6.png)

- También recomendamos desactivar otras físicas de péndulo relacionadas con el cuerpo (como `Arm Movements` y `Body Lean`).

:::

### Paso 6 - Calibrar Mapeo

Ajusta los valores **`X`** e **`Y`** en el `Scale` de `Prop - Calibration Border`, respectivamente.   
Asegúrate de que la pantalla se ajuste al **Borde Interior** de la caja roja lo más perfectamente posible.

:::note

Necesitas desbloquear el 🔗 **`Uniform Scaling`** antes de ajustar la escala cada vez.

:::

![](/doc-img/pen-display-hand-sync-4.png)

### Paso 7 - Ocultar Borde de Calibración

Finalmente, puedes ocultar el asset **`Prop - Calibration Border`** cambiando su opción `Enabled` a `No`.

![](/doc-img/pen-display-hand-sync-5.png)

:::warning

No borres `Prop - Calibration Border`, si lo haces, no podrás calibrar la próxima vez.

:::

## Cosas a tener en cuenta

- Es posible que necesites cambiar **`Mirrored Tracking`** o **`Invert Hands`** en el asset de captura de movimiento para elegir el método de seguimiento que prefieras.

- Si quieres cambiar la selección del Monitor A o Monitor B, necesitas repetir los Pasos 2–6.

- Puedes ajustar el grosor de **`Prop - Drawing Screen`** o habilitar y ajustar la escala de **`Prop - Tablet`** para incrementar aún más el realismo.

## Problemas Conocidos

### Intersección Mano-Lápiz

Ya que la primera prioridad de este blueprint es **alinear la punta del lápiz con el cursor**, limitado por el principio de implementación del IK de mano, cuando la mano está muy lejos del centro de la pantalla, el lápiz puede no ajustarse perfectamente a tu mano.

Así que recomendamos no ajustar la escala de la pantalla demasiado grande.

![](/doc-img/pen-display-hand-sync-7.png)

Vincular el lápiz al hueso del dedo puede evitar este problema, pero el lápiz no podrá seguir perfectamente el cursor, lo cual es más adecuado para tableta de lápiz en lugar de pantalla de lápiz.  
(Esta escena actualmente no soporta este modo)

### Desaparición de Pantalla

Si haces clic en el botón de cerrar en la esquina superior derecha de la ventana principal de Warudo pero sin salir, la pantalla desaparecerá (Porque la lista de opciones de pantalla se vuelve nula).

Este es un error esperando ser arreglado, y actualmente solo puede ser resuelto saliendo de warudo y reabriéndolo. (Aún puedes guardar tus cambios)

![](/doc-img/pen-display-hand-sync-8.png)

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
