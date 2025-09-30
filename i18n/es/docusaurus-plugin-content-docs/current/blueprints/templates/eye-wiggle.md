---
sidebar_position: 30
---

# Movimiento de Ojos Live2D

:::caution
A partir de Warudo 0.12.3, este blueprint ya no es necesario; se recomienda configurar el movimiento de ojos con el editor de física de péndulo en su lugar. Consulta [Física de Péndulo](../../mocap/pendulum-physics) para más información.
:::

El movimiento de ojos es un efecto común en modelos Live2D para hacer que los ojos del personaje se vean más vivos. ¡Este blueprint te permite agregar este popular efecto a tu modelo 3D!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/eye-wiggle.mp4" /></div>
<p class="img-desc">¡Física de movimiento de ojos estilo Live2D!</p>

## Requisitos Previos

Para agregar ojos con movimiento a tu modelo 3D, necesitas preparar blendshapes que separen los brillos de los ojos de la pupila del ojo, como estos:

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832935-946222b5-e9a3-4efa-b9dc-7bdd04b9a3f2.mp4" /></div>
<p class="img-desc"></p>

:::tip
Si tienes un modelo VRoid, puedes usar los datos de blendshape creados por [頼鳥ミドリ (@yoridrill)](https://twitter.com/yoridrill) que se pueden agregar a tu modelo con [HANA_Tool](https://booth.pm/en/items/2604269). Por favor consulta [esta entrada de blog](https://note.com/yoridrill/n/nfc15a0760a26).
:::

Este blueprint asume que tienes los siguientes seis blendshapes:

* `highlight_down_left`: Brillo del ojo izquierdo trasladándose hacia abajo
* `highlight_down_right`: Brillo del ojo derecho trasladándose hacia abajo
* `highlight_rotate_left`: Brillo del ojo izquierdo rotando en sentido antihorario
* `highlight_rotate_right`: Brillo del ojo derecho rotando en sentido horario
* `highlight_scale_left`: Brillo del ojo izquierdo aumentando de tamaño
* `highlight_scale_right`: Brillo del ojo derecho aumentando de tamaño

Si tus blendshapes tienen nombres diferentes, puedes modificar el blueprint en consecuencia.

Finalmente, ya deberías haber configurado el seguimiento facial para tu personaje.

## Configuración {#setup}

Descarga el blueprint de abajo e impórtalo a tu escena.

<a href="/blueprints/eye-wiggle.json" target="_blank" download>
<div className="file-box">
<p>
eye-wiggle.json
</p></div>
</a>

Sigue las instrucciones en los nodos **Comment** para configurar este blueprint.

:::tip
Si has creado otro asset de personaje, es posible que necesites actualizar la opción **Character** en los nodos.
:::

## Observaciones

El nodo **"Float Pendulum Physics"** funciona bajo el mismo principio que [la simulación de física de Live2D](https://docs.live2d.com/en/cubism-editor-manual/physics-operation/). Al especificar un péndulo de múltiples segmentos (como se muestra abajo), la coordenada X del nodo superior del péndulo se usa como valor de entrada, y la coordenada X del nodo inferior del péndulo se usa como valor de salida. La opción **Arms** determina la longitud y propiedades físicas de cada segmento del péndulo.

<div className="video-box"><video loop controls src="/doc-img/zh-blueprint-example-live2d-physics-video-4.mp4" />
</div>
<p class="img-desc">Fuente：<a href="https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/" target="_blank">https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/</a></p>

Puedes previsualizar la física del péndulo configurando **Visualize** en Sí:

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196835467-8eec329f-176f-47ba-af4e-fb4d0c4361d6.mp4" /></div>
<p class="img-desc"></p>

Este blueprint solo implementa el movimiento de una capa de brillos; sin embargo, se pueden usar múltiples nodos Float Pendulum Physics y más capas de blendshapes de brillos para producir un efecto de movimiento de ojos más sofisticado.

:::tip
¡Ten en cuenta que el nodo "Float Pendulum Physics" no se limita solo a crear física de movimiento de ojos! Otros efectos físicos que se ven en Live2D también se pueden implementar en Warudo de esta manera, como la física de rebote de brazos.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
