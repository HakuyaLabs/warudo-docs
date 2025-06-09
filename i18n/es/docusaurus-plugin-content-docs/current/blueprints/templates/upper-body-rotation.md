---
sidebar_position: 5
---

# Rotación del Torso

:::caution
A partir de Warudo 0.12.0, este blueprint ya no es necesario, ya que la rotación del torso ahora está habilitada por defecto. Consulta [Personalizando Seguimiento Facial](../../mocap/face-tracking) para más información.
:::

Este blueprint te permite agregar una rotación sutil pero realista del torso a tu personaje, agregando matices a la expresión corporal de tu personaje.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/upper-body-rotation.mp4" /></div>
<p class="img-desc">Rotando naturalmente el torso al girar la cabeza.</p>

## Requisitos Previos

Ya deberías haber configurado el seguimiento facial para tu personaje.

## Configuración {#setup}

Descarga el blueprint de abajo e impórtalo a tu escena.

<a href="/blueprints/upper-body-rotation.json" target="_blank" download>
<div className="file-box">
<p>
upper-body-rotation.json
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
