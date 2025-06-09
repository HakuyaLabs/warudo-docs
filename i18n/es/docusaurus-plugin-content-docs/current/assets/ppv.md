---
sidebar_position: 503
---

# Volumen de Post-Procesamiento

:::info
Esta función Simula el desenfoque que ocurre en una imagen cuando una cámara del mundo real filma objetos moviéndose más rápido que el tiempo de exposición de la cámara.olo está disponible en [Warudo Pro](../pro). Para agregar un volumen de post-procesamiento a la escena, debes tener Universal RP habilitado en **Settings → URP**.
:::

El asset de volumen de post-procesamiento se usa para agregar efectos de post-procesamiento a la escena. Es similar a los efectos de post-procesamiento en la [cámara](camera#post-processing), pero un volumen de post-procesamiento afecta toda la escena en lugar de solo una cámara.

Un asset de volumen de post-procesamiento es un envoltorio alrededor del [URP Volume](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@17.0/manual/volumes-landing-page.html) de Unity, por lo tanto tiene los mismos parámetros. A continuación proporcionamos una breve descripción de los efectos de post-procesamiento disponibles; puedes consultar [la documentación de Unity](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@17.0/manual/EffectList.html) para más detalles.

## Configuración

Puedes hacer clic en **Import From Environment** para importar la configuración de post-procesamiento del entorno (si existe). Luego, puedes ajustar la configuración de post-procesamiento como gustes. Ten en cuenta que para que una configuración tenga efecto, debes habilitarla marcando la casilla junto a ella. Esto te permite anular selectivamente la configuración de post-procesamiento del entorno.

## Bloom

Bloom es un efecto de post-procesamiento que hace que las áreas brillantes de la escena "brillen".

![](/doc-img/bloom-off.png)
<p class="img-desc">Bloom deshabilitado.</p>

![](/doc-img/bloom.png)
<p class="img-desc">Bloom habilitado.</p>

:::info
Si estás usando NiloToon, se recomienda usar el bloom del [volumen de NiloToon](nilotoon-volume) en lugar de este efecto bloom. El volumen de NiloToon puede aplicar bloom por separado al personaje y al entorno con diferentes valores de intensidad y umbral.
:::

## Mezclador de Canales

El mezclador de canales modifica la influencia de cada canal de color de entrada en la mezcla general del canal de salida. Por ejemplo, si aumentas la influencia del canal verde en la mezcla general del canal rojo, todas las áreas de la imagen final que son verdes (incluyendo neutro/monocromático) se tiñen a un tono más rojizo.

## Aberración Cromática

Imita el efecto producido cuando una lente no puede mezclar todos los colores al mismo punto.

![](/doc-img/chromatic-aberration-off.png)
<p class="img-desc">Aberración cromática deshabilitada.</p>

![](/doc-img/chromatic-aberration.png)
<p class="img-desc">Aberración cromática habilitada.</p>

## Ajustes de Color

Usa este efecto para ajustar el tono general, brillo y contraste de la imagen final renderizada.

![](/doc-img/color-adjustments-off.png)
<p class="img-desc">Ajustes de color deshabilitados.</p>

![](/doc-img/color-adjustments.png)
<p class="img-desc">Ajustes de color habilitados.</p>

## Profundidad de Campo

Desenfoca objetos que no están en foco. Si anulas **Focus Distance**, podrás establecer **Auto Focus Character** para que la distancia de enfoque siga automáticamente al personaje.

![](/doc-img/dof-gaussian.png)
<p class="img-desc">Profundidad de campo con modo Gaussiano.</p>

![](/doc-img/dof-bokeh.png)
<p class="img-desc">Profundidad de campo con modo Bokeh.</p>

## Grano de Película

Simula la textura óptica aleatoria de la película fotográfica, usualmente causada por pequeñas partículas presentes en la película física.

![](/doc-img/film-grain-off.png)
<p class="img-desc">Grano de película deshabilitado.</p>

![](/doc-img/film-grain.png)
<p class="img-desc">Grano de película habilitado.</p>

## Distorsión de Lente

Distorsiona la imagen final renderizada para simular la forma de una lente de cámara del mundo real.

![](/doc-img/lens-distortion-off.png)
<p class="img-desc">Distorsión de lente deshabilitada.</p>

![](/doc-img/lens-distortion.png)
<p class="img-desc">Distorsión de lente habilitada.</p>

## Lift Gamma Gain

Realiza corrección de color de tres vías. 

## Desenfoque de Movimiento

Simulates the blur that occurs in an image when a real-world camera films objects moving faster than the camera’s exposure time.

![](/doc-img/motion-blur-off.png)
<p class="img-desc">Desenfoque de movimiento deshabilitado.</p>

![](/doc-img/motion-blur.png)
<p class="img-desc">Desenfoque de movimiento habilitado.</p>

## Proyección Panini

Ayuda a renderizar vistas en perspectiva en escenas con un campo de visión muy amplio. 

![](/doc-img/panini-off.png)
<p class="img-desc">Proyección Panini deshabilitada.</p>

![](/doc-img/panini.png)
<p class="img-desc">Proyección Panini habilitada.</p>

## Sombras Medios Tonos Luces

Controla por separado las sombras, medios tonos y luces del renderizado.

## Tonalización Dividida

Tiñe diferentes áreas de la imagen basándose en valores de luminancia, para ayudarte a lograr un aspecto más distintivo. Puedes usar esto para agregar diferentes tonos de color a las sombras y luces en tu escena.

## Mapeo Tonal

El mapeo tonal es el proceso de remapear los valores HDR de una imagen a un nuevo rango de valores. Su propósito más común es hacer que una imagen con un rango dinámico bajo parezca tener un rango más alto.

:::tip
Se recomienda el modo de mapeo tonal **ACES** para lograr un aspecto más cinematográfico para la mayoría de entornos.
:::

## Viñeta

Oscurecimiento y/o desaturación hacia los bordes de una imagen comparado con el centro, para dirigir la atención hacia el centro de la imagen.

## Balance de Blancos

Aplica un efecto de balance de blancos que elimina matices de color poco realistas, para que los elementos que aparecerían blancos en la vida real se rendericen como blancos en tu imagen final. También puedes usar el balance de blancos para crear una sensación general más fría o más cálida en el renderizado final.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
