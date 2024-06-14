---
sidebar_position: 40
---

# Environment

Often referred to as a "3D background," an environment is a 3D scene that is displayed behind the characters. You can import your own environments using the [Mod SDK](../modding/mod-sdk.md).

![](/doc-img/zh-environment-1.webp)
<p class="img-desc">The Onsen environment.</p>

## Steam Workshop

In addition to the built-in environments, you can download official and community environments from Warudo's Steam Workshop. Click on the **Discover** tab and select the **Environments** category:

![](/doc-img/en-environment-1.png)
<p class="img-desc">Browsing environments from the Steam Workshop.</p>

## Setup

To set up an environment, simply select a **Source** as the model for the environment.

:::tip
It is recommended to turn off **Allow Lights To Affect Characters** so that you have more control over the lighting of your character using the [**Directional Light**](light) asset.
:::

:::tip
To build up the atmosphere of your scene, an environment is just the beginning. You should look into the post processing effects offered by the [camera](camera) asset, or in the case of Warudo Pro users using Universal RP, the [post processing volume](ppv) and [NiloToon volume](nilotoon-volume) assets. 
:::

:::caution
Although you are allowed to move and rotate the environment, it is not recommended to do so; instead, you should move and rotate the character. This is because most environments are not designed to be moved or rotated, and doing so may cause visual glitches in the environment.
:::

## Override Environment Settings

You can override the environment settings such as **Ambient Lighting Source**, **Environment Reflections Intensity**, etc. Note that not all these settings are supported by all environments; for example, if an environment use baked lighting, then **Ambient Lighting Source** will be ignored.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
