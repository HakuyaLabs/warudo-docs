---
sidebar_position: 501
---

# NiloToon Volume

:::info
This feature is only available in [Warudo Pro](../pro). To add a NiloToon volume to the scene, you must have Universal RP enabled in **Settings → URP**.
:::

The NiloToon volume adds NiloToon-specific post processing effects to the scene.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">NiloToon volume disabled.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-on.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">NiloToon volume enabled.</p>
</div>
</div>

Below we provide a brief overview of the post processing effects available; please refer to the NiloToon documentation for more details.

## Setup

You can click **Import From Environment** to import the NiloToon post processing settings from the environment (if any). Then, you can adjust the post processing settings as you like. Note that for a setting to take effect, you must enable it by checking the checkbox next to it. This allows you to selectively override the NiloToon post processing settings from the environment.

## Anime

Adds an anime-style gradient to the camera view.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Anime disabled.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-anime.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Anime enabled.</p>
</div>
</div>

## Bloom

Bloom is a post processing effect that makes bright areas of the scene "glow." You can separately apply bloom to the character and environment with different intensity and threshold values by overriding **Character Area Overrided Threshold** and **Character Area Overrided Intensity**.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Bloom disabled.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-bloom.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Bloom enabled.</p>
</div>
</div>

## Character Rendering

Overrides the NiloToon rendering settings for the character so that the rendering plays nice with the current environment.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Character rendering override disabled.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-character.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Character rendering override enabled.</p>
</div>
</div>

## Shadow

Overrides the NiloToon shadow settings for the character.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-nilotoon-off.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Shadow override disabled.</p>
</div>
<div>
<img src="/doc-img/en-nilotoon-shadow.png" style={{'padding-bottom': '10px'}} />
<p class="img-desc">Shadow override enabled.</p>
</div>
</div>
