---
sidebar_position: 501
---

# Volumen NiloToon

:::info
Esta característica solo está disponible en [Warudo Pro](../pro). Para agregar un volumen NiloToon a la escena, debes tener Universal RP habilitado en **Settings → URP**.
:::

El volumen NiloToon agrega efectos de post-procesamiento específicos de NiloToon a la escena.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Volumen NiloToon deshabilitado.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-on.png"  />
<p class="img-desc">Volumen NiloToon habilitado.</p>
</div>
</div>

A continuación proporcionamos una breve descripción general de los efectos de post-procesamiento disponibles; por favor consulta la documentación de NiloToon para más detalles.

## Configuración {#setup}

Puedes hacer clic en **Import From Environment** para importar la configuración de post-procesamiento de NiloToon del entorno (si la hay). Luego, puedes ajustar la configuración de post-procesamiento como gustes. Nota que para que una configuración tome efecto, debes habilitarla marcando la casilla de verificación junto a ella. Esto te permite anular selectivamente la configuración de post-procesamiento de NiloToon del entorno.

## Anime

Agrega un degradado estilo anime a la vista de la cámara.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Anime deshabilitado.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-anime.png"  />
<p class="img-desc">Anime habilitado.</p>
</div>
</div>

## Bloom

Bloom es un efecto de post-procesamiento que hace que las áreas brillantes de la escena "brillen". Puedes aplicar bloom por separado al personaje y al entorno con diferentes valores de intensidad y umbral anulando **Character Area Overrided Threshold** y **Character Area Overrided Intensity**.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Bloom deshabilitado.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-bloom.png"  />
<p class="img-desc">Bloom habilitado.</p>
</div>
</div>

## Renderizado de Personaje

Anula la configuración de renderizado de NiloToon para el personaje para que el renderizado funcione bien con el entorno actual.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Anulación de renderizado de personaje deshabilitada.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-character.png"  />
<p class="img-desc">Anulación de renderizado de personaje habilitada.</p>
</div>
</div>

## Sombra

Anula la configuración de sombras de NiloToon para el personaje.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Anulación de sombra deshabilitada.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-shadow.png"  />
<p class="img-desc">Anulación de sombra habilitada.</p>
</div>
</div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
