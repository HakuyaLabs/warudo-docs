---
sidebar_position: 42
---

# Viento

El asset de viento se usa para simular viento en la escena. Puede usarse para hacer que el cabello, la ropa, y otros objetos con componentes de [VRM Spring Bones](https://vrm.dev/en/univrm/springbone/univrm_secondary/) o [Magica Cloth](https://magicasoft.jp/en/magica-cloth-2/) reaccionen al viento.

:::info
¿Cómo sé si mi modelo tiene componentes VRM Spring Bones o Magica Cloth? Puedes preguntarle al creador del modelo, pero usualmente la regla general es que si el modelo tiene cabello o ropa en movimiento, entonces probablemente tiene componentes VRM Spring Bones o Magica Cloth. Nota que solo un modelo `.warudo` exportado usando el [Mod SDK](../modding/mod-sdk.md) puede tener componentes Magica Cloth.
:::

![](/doc-img/en-wind-1.png)
<p class="img-desc">Viento soplando el cabello y la chaqueta del personaje.</p>

## Configuración {#setup}

Crea un asset **Wind (VRM)** o **Wind (Magica Cloth)** dependiendo del tipo de componentes de física que tenga tu modelo. Luego, juega con los parámetros para ajustar el efecto del viento.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
