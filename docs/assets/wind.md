---
sidebar_position: 42
---

# Wind

The wind asset is used to simulate wind in the scene. It can be used to make hair, clothes, and other objects with [VRM Spring Bones](https://vrm.dev/en/univrm/springbone/index.html) or [Magica Cloth](https://magicasoft.jp/en/magica-cloth-2/) components react to wind.

:::info
How do I know if my model has VRM Spring Bones or Magica Cloth components? You can ask the model creator, but usually the rule of thumb is that if the model has moving hair or clothes, then it probably has VRM Spring Bones or Magica Cloth components. Note that only a `.warudo` model exported using the [Mod SDK](../modding/mod-sdk.md) can have Magica Cloth components.
:::

![](/doc-img/en-wind-1.png)
<p class="img-desc">Wind blowing the character's hair and jacket.</p>

## Setup

Create a **Wind (VRM)** or **Wind (Magica Cloth)** asset depending on the type of physics components your model has. Then, play with the parameters to adjust the wind effect.
