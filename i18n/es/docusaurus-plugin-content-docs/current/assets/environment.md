---
sidebar_position: 40
---

# Entorno

A menudo referido como un "fondo 3D", un entorno es una escena 3D que se muestra detrás de los personajes. Puedes importar tus propios entornos usando el [Mod SDK](../modding/mod-sdk.md).

![](/doc-img/zh-environment-1.webp)
<p class="img-desc">El entorno Onsen.</p>

## Steam Workshop

Además de los entornos integrados, puedes descargar entornos oficiales y de la comunidad desde el Steam Workshop de Warudo. Haz clic en la pestaña **Discover** y selecciona la categoría **Environments**:

![](/doc-img/en-environment-1.png)
<p class="img-desc">Navegando entornos desde el Steam Workshop.</p>

## Configuración

Para configurar un entorno, simplemente selecciona un **Source** como el modelo para el entorno.

:::tip
Se recomienda desactivar **Allow Lights To Affect Characters** para que tengas más control sobre la iluminación de tu personaje usando el asset [**Directional Light**](lights).
:::

:::tip
Para construir la atmósfera de tu escena, un entorno es solo el comienzo. Deberías explorar los efectos de post-procesamiento ofrecidos por el asset [camera](camera), o en el caso de usuarios de Warudo Pro usando Universal RP, los assets [post processing volume](ppv) y [NiloToon volume](nilotoon-volume).
:::

:::caution
Aunque se te permite mover y rotar el entorno, no se recomienda hacerlo; en su lugar, debes mover y rotar el personaje. Esto es porque la mayoría de los entornos no están diseñados para ser movidos o rotados, y hacerlo puede causar fallas visuales en el entorno.
:::

## Anular Configuraciones del Entorno

Puedes anular las configuraciones del entorno como **Ambient Lighting Source**, **Environment Reflections Intensity**, etc. Ten en cuenta que no todas estas configuraciones son soportadas por todos los entornos; por ejemplo, si un entorno usa iluminación horneada, entonces **Ambient Lighting Source** será ignorado.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
