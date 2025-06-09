---
sidebar_position: 10
---

# Balanceo de Brazos Live2D

:::caution
A partir de Warudo 0.12.3, este blueprint ya no es necesario, ya que el balanceo de brazos ahora está habilitado por defecto con la configuración de física de péndulo. Consulta [Física de Péndulo](../../mocap/pendulum-physics) para más información. Este blueprint es útil como referencia para agregar manualmente física de péndulo a tu personaje usando blueprints.
:::

El balanceo de brazos es un efecto común en modelos Live2D que añade un poco de vida al personaje haciendo que los brazos se balanceen de un lado a otro. ¡Este blueprint te permite agregar este popular efecto a tu modelo 3D!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/arm-sway.mp4" /></div>
<p class="img-desc">¡Balanceo de brazos estilo Live2D!</p>

## Configuración {#setup}

Descarga el blueprint de abajo e impórtalo a tu escena.

<a href="/blueprints/arm-sway.json" target="_blank" download>
<div className="file-box">
<p>
arm-sway.json
</p></div>
</a>

Este blueprint debería funcionar directamente. Sigue las instrucciones en los nodos **Comment** para ajustar la configuración.

:::tip
Si has creado otro asset de personaje, es posible que necesites actualizar la opción **Character** en los nodos.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
