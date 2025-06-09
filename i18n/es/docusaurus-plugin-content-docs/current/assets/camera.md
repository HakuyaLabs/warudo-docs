---
sidebar_position: 50
---

# Cámara

Las cámaras se usan para controlar la vista de la escena. ¡Puedes agregar hasta 8 cámaras en una sola escena!

## Configuración

Por defecto, tu escena ya debería tener una cámara. Para agregar una nueva cámara, usa el menú **Add Asset**. Notarás que la ventana principal aún muestra la escena desde la cámara original; esto es porque la **cámara principal** sigue siendo la cámara original. Para cambiar la cámara principal, puedes hacer cualquiera de las siguientes:

1. Haz clic en el ícono de cámara en frente del nombre de la cámara para establecer la cámara como la cámara principal.
2. Presiona **Tab** para cambiar a la siguiente cámara en la escena, o **Ctrl+Tab** para cambiar a la cámara anterior en la escena.

![](/doc-img/en-camera-1.png)
<p class="img-desc">El ícono de cámara sólido en frente del nombre de la cámara indica que esta cámara es la cámara principal.</p>

La cámara está configurada por defecto en modo **Free Look**. Puedes establecer **Control Mode** a **Orbit Character** para hacer que la cámara orbite alrededor del personaje. También puedes establecer **Control Mode** a **None** para fijar la cámara en su lugar.

:::tip
Para hacer que la cámara orbite alrededor de un personaje diferente, establece el **Focus Character** al personaje en el que te gustaría enfocarte.
:::

Para aumentar o disminuir la velocidad de movimiento de la cámara, puedes ajustar la **Control Sensitivity**.

## Salida

Por defecto, la salida NDI/Spout/cámara virtual de Warudo muestra la vista de la ventana principal (puedes habilitarlas/deshabilitarlas en **Menu → Settings**). También puedes habilitar **NDI/Spout/Virtual Camera Output** en cada cámara individualmente. Esto te permite mostrar la escena desde múltiples cámaras al mismo tiempo.

![](/doc-img/en-camera-1.webp)
<p class="img-desc">Al habilitar la salida Spout/NDI/cámara virtual en las cámaras, puedes mostrar la escena desde múltiples cámaras al mismo tiempo.</p>

:::info
Para dar salida Spout a [OBS](https://obsproject.com/), instala el [obs-spout2-plugin](https://github.com/Off-World-Live/obs-spout2-plugin/releases) y agrega una fuente Spout2 Capture. Para dar salida NDI a [OBS](https://obsproject.com/), instala el plugin [obs-ndi](https://github.com/Palakis/obs-ndi) y agrega una fuente NDI™ Source.

Debes usar NDI si necesitas dar salida de Warudo a otro dispositivo dentro de la misma red y usar Spout si solo necesitas dar salida a otra aplicación en la misma PC (como OBS). Spout es recomendado por su menor uso de recursos y latencia.
:::

:::tip
Todos los métodos de salida soportan salida de transparencia. Para habilitar fondo transparente, simplemente habilita **Basic Properties → Transparent Background**.

Cuando uses salida Spout en OBS, establece el **Composite Mode** en las propiedades de Spout2 Capture a **Premultiplied Alpha** para habilitar transparencia.

![](/doc-img/en-camera-3.webp)

Cuando uses salida de cámara virtual en OBS, establece el **Video Format** en las propiedades de Video Capture Device a **ARGB** para habilitar transparencia.

![](/doc-img/en-camera-4.webp)
:::

También puedes tomar una captura de pantalla de la vista de esta cámara haciendo clic en el botón **Screenshot**.

:::tip
Para configurar una tecla de acceso rápido para tomar capturas de pantalla, usa el nodo **Take Screenshot** en blueprints.
:::


## Propiedades Básicas

Puedes establecer un **Chroma Key** para la cámara, de modo que el fondo de la escena sea reemplazado por un color. Si deseas que el fondo sea transparente, puedes establecer el **Chroma Key Color** en (0, 0, 0, 0) o simplemente habilitar **Transparent Background**.

:::caution
Incluso cuando **Chroma Key** o **Transparent Background** están habilitados, el [entorno](environment.md) en la escena seguirá siendo visible.
:::

La cámara se puede configurar para renderizar personajes/props/entorno o no. Por ejemplo, si desactivas **Render Environment**, el entorno ya no aparecerá en la vista de la cámara, pero la iluminación del entorno sobre los personajes/props seguirá siendo visible. Esto es especialmente útil si necesitas un fondo transparente pero aún deseas usar la iluminación del entorno; en lugar de apagar el entorno, simplemente puedes apagar **Render Environment** en la cámara.

Otro parámetro útil es **Field Of View**, que controla cuán amplio puede ver la cámara. Cuanto mayor sea el valor, más amplia será la vista de la cámara. **Orthographic Projection** es útil si deseas que la vista se vea lo más plana posible.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-ortho-off.webp"  />
<p class="img-desc">Proyección ortográfica desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-ortho-on.png"  />
<p class="img-desc">Proyección ortográfica habilitada.</p>
</div>
</div>

## Movimiento de Mano

Si deseas simular que la cámara está siendo sostenida por una persona, puedes habilitar **Handheld Movement**. Esto añadirá un ligero temblor al movimiento de la cámara. Ajusta la **Intensity** y **Speed** para controlar la fuerza y velocidad del temblor.

## Efectos de Post-Procesamiento {#post-processing}

:::info
Ten en cuenta que los siguientes efectos de post-procesamiento no están disponibles cuando Universal RP está habilitado en [Warudo Pro](../pro). En su lugar, debes usar el asset [Post Processing Volume](ppv).
:::

### Tonemapping & Color Grading

Establecer una **LUT Texture** puede cambiar completamente la atmósfera de la escena.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-lut-off.png"  />
<p class="img-desc">LUT desactivado.</p>
</div>
<div>
<img src="/doc-img/en-camera-lut-on.png"  />
<p class="img-desc">LUT habilitado.</p>
</div>
</div>

:::tip
¡Warudo tiene más de 200 texturas LUT integradas! ¡Elige una que se adapte a tu escena!
:::

También puedes habilitar **ACES Tonemapping**. ACES es un sistema de gestión de color que se utiliza ampliamente en la industria cinematográfica. Puede hacer que el entorno se vea más realista, pero puede que no funcione bien con personajes estilo anime con colores vibrantes.

Finalmente, **Vibrance**, **Contrast**, **Brightness**, **Tint** se pueden usar para ajustar el color de la escena a tu gusto.

:::info
Ten en cuenta que Warudo por defecto establece **Vibrance**, **Contrast**, **Brightness** en 1, 1.02 y 1.05 respectivamente, lo que hace que la escena se vea más vívida. Si deseas preservar los colores originales, debes establecer estos valores en 0, 1 y 1.
:::

### Bloom

El efecto de bloom crea un efecto de halo alrededor de las partes brillantes de la imagen. La **Strength** controla la intensidad del efecto de bloom, y el **Threshold** controla el límite inferior del brillo de la imagen que emitirá un efecto de bloom.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-bloom-off.png"  />
<p class="img-desc">Bloom desactivado.</p>
</div>
<div>
<img src="/doc-img/en-camera-bloom-on.png"  />
<p class="img-desc">Bloom habilitado.</p>
</div>
</div>

### Ambient Occlusion

Agrega más sombra a la escena para un aspecto más realista. El **Radius** controla el radio de la sombra, y la **Intensity** controla la intensidad de la sombra.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-ssao-off.png"  />
<p class="img-desc">Oclusión ambiental desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-ssao-on.png"  />
<p class="img-desc">Oclusión ambiental habilitada.</p>
</div>
</div>

:::info
Para modelos de personajes estilo anime (especialmente cuando la malla de la cara no es completamente plana), no se recomienda habilitar la oclusión ambiental. Si deseas habilitar la oclusión ambiental pero la sombra de tu personaje se ve extraña, intenta ajustar el valor de **Max Radius Pixels**.
:::

### Anamorphic Flares

Proporciona el efecto de destello horizontal/vertical de una lente distorsionada. La **Intensity** controla la intensidad de los destellos, y el **Threshold** controla el límite inferior del brillo de la imagen que emitirá un destello. Si deseas que los destellos se desborden más, puedes aumentar el valor de **Spread**. Los destellos son por defecto horizontales, pero puedes habilitar **Vertical Flares** para hacerlos verticales en su lugar.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-flare-off.png"  />
<p class="img-desc">Destellos anamórficos desactivados.</p>
</div>
<div>
<img src="/doc-img/en-camera-flare-on.png"  />
<p class="img-desc">Destellos anamórficos habilitados.</p>
</div>
</div>

### Depth Of Field

Desenfoca los objetos que no están enfocados. Puedes establecer una **Focus Distance** específica, o habilitar **Focus Character** para enfocar automáticamente en el personaje seleccionado en **Controls → Focus Character**.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-dof-off.png"  />
<p class="img-desc">Profundidad de campo desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-dof-bokeh-off.png"  />
<p class="img-desc">Profundidad de campo con bokeh desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-dof-on.png"  />
<p class="img-desc">Profundidad de campo con bokeh habilitada.</p>
</div>
</div>

### Chromatic Aberration

Imita el efecto producido cuando una lente no puede mezclar todos los colores en el mismo punto. La **Intensity** controla la intensidad del efecto.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-color-abb-off.webp"  />
<p class="img-desc">Aberración cromática desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-color-abb-on.png"  />
<p class="img-desc">Aberración cromática habilitada.</p>
</div>
</div>

### Lens Dirt

Simula la suciedad y las manchas en la lente. Primero necesitas seleccionar una **Texture** para la suciedad de la lente. La **Intensity** controla la intensidad de la suciedad de la lente, y el **Threshold** controla el límite inferior del brillo de la imagen que emitirá un efecto de suciedad en la lente.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-lens-dirt-off.webp"  />
<p class="img-desc">Suciedad de lente desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-lens-dirt-on.png"  />
<p class="img-desc">Suciedad de lente habilitada.</p>
</div>
</div>

### Vignetting

Oscurece los bordes de la imagen.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-vignette-off.webp"  />
<p class="img-desc">Viñeteado desactivado.</p>
</div>
<div>
<img src="/doc-img/en-camera-vignette-on.webp"  />
<p class="img-desc">Viñeteado habilitado.</p>
</div>
<div>
<img src="/doc-img/en-camera-vignette-blink.png"  />
<p class="img-desc">Viñeteado habilitado con parpadeo.</p>
</div>
</div>

### Night Vision

Simula las gafas de visión nocturna.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-nightvision-off.png"  />
<p class="img-desc">Visión nocturna desactivada.</p>
</div>
<div>
<img src="/doc-img/en-camera-nightvision-on.webp"  />
<p class="img-desc">Visión nocturna habilitada.</p>
</div>
</div>

### Blur

Desenfoca la imagen.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-blur-off.webp"  />
<p class="img-desc">Desenfoque desactivado.</p>
</div>
<div>
<img src="/doc-img/en-camera-blur-on.webp"  />
<p class="img-desc">Desenfoque habilitado.</p>
</div>
</div>

### Pixelate

¡Agrega un efecto de mosaico a la imagen!

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-pixelate-off.webp"  />
<p class="img-desc">Pixelar desactivado.</p>
</div>
<div>
<img src="/doc-img/en-camera-pixelate-on.png"  />
<p class="img-desc">Pixelar habilitado.</p>
</div>
</div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
