---
sidebar_position: 20
---
# Prop

Un prop es un modelo 3D que puede ser colocado libremente dentro de una escena o adjuntado a un personaje como un accesorio. Además de los modelos integrados, los modelos externos pueden ser exportados como formato `.warudo` usando el [Mod SDK](../modding/mod-sdk.md) y luego cargados en Warudo.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '48%'}}>
<img src="/doc-img/zh-prop-1.webp"  />
<p class="img-desc">Patas de gato</p>
</div>

<div style={{width: '52%'}} className="video-box"><video controls src="/doc-img/zh-prop-1.mp4" />
<p>La rosa y el efecto de partículas en las puntas de los dedos se logran usando assets de prop y configuraciones de adjunto de personaje.</p>
</div>
</div>

## Steam Workshop

Además de los props integrados, puedes descargar props oficiales y de la comunidad desde el Steam Workshop de Warudo. Haz clic en la pestaña **Discover** y selecciona la categoría **Props**:

![](/doc-img/en-prop-3.png)
<p class="img-desc">Navegando props desde el Steam Workshop.</p>

## Configuración

Para configurar un prop, simplemente selecciona un **Source** como el modelo para el prop. Luego, usa los gizmos de transformación para mover/rotar/escalar el prop, para que esté en la posición deseada.

![](/doc-img/en-prop-1.png)
<p class="img-desc">El árbol de Navidad, sombrero de Navidad, y piano eléctrico aquí son todos props.</p>

## Adjunto de Transformación

Puedes usar las configuraciones de **Transform Attachment** para adjuntar el prop a un personaje u otros objetos de escena. Esto es útil para props que son sostenidos por el personaje, como una espada o un micrófono. Cuando se adjunta a la mano de un personaje, también puedes especificar un **Override Hand Pose**, para que el personaje pueda agarrar firmemente una espada, por ejemplo.

![](/doc-img/en-prop-2.png)
<p class="img-desc">El prop katana está adjuntado a la mano del personaje con **Override Hand Pose** establecido en **Grab**.</p>

Si te gustaría adjuntar el prop a un hueso de cuerpo humano no estándar (ej., el hueso de cola de tu personaje), puedes usar el **Transform Path** para la opción **Attachment Type**. Esto te permite adjuntar el prop a cualquier transformación en la jerarquía del modelo.

## Detección de Colisión

Por defecto, los colisionadores en el prop están deshabilitados. Puedes habilitar **Collision Detection** para habilitar los colisionadores, lo cual es útil cuando tienes **Character → Ragdoll** habilitado.

:::info
Por favor ten en cuenta que no todos los props integrados tienen colisionadores.
:::

## Mallas

Similar al asset de personaje, puedes ajustar **Default BlendShapes**, **Default Material Properties**, y alternar **Meshes** para el asset de prop.

## Preguntas Frecuentes

### ¿Cómo puedo lanzar un prop a mi personaje cuando mis viewers redimen una recompensa de puntos de canal de Twitch / envían un Super Chat / ...?

Por favor usa **Onboarding Assistant → Interactions Setup → Get Started** para configurar interacciones. Durante el proceso de configuración, tendrás la opción de especificar las condiciones para lanzar un prop a tu personaje, junto con otras interacciones divertidas.

Ten en cuenta que el "prop" lanzado por el nodo **Throw Prop At Character** en el blueprint de interacciones es un objeto temporal; no es un asset de prop. Un asset de prop es un modelo persistente en la escena, y no tiene un cuerpo de física.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
