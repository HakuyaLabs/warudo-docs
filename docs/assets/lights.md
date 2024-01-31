---
sidebar_position: 41
---

# Directional/Point/Volumetric Light

Light assets are used to illuminate the scene. There are three types of light assets:
* **Directional Light**: A directional light that illuminates the entire scene from a specific direction.
* **Point Light**: A point light that illuminates the scene from a specific point.
* **Volumetric Light**: A spotlight that illuminates the scene from a specific point, with volumetric lighting effects.

![](/doc-img/en-light-1.png)
<p class="img-desc">Volumetric light.</p>

:::info
Light assets are great for illuminating characters or adjusting existing environmental lighting. However, it is not recommended to add too many lights to the scene, as this may cause performance issues.
:::

## Setup

By default, your scene should already have a directional light. To add a new light, use the **Add Asset** menu.

You can adjust the position and rotation of the light asset using the transform gizmos. (Note that the position of a directional light does not matter.) The light's **Color** and **Intensity** can be changed in the asset settings, where you can also enable or disable the light from affecting characters, props, and the environment.

:::tip
When you are using an [environment](environment), we recommend turning off **Environment → Allow Lights To Affect Characters** and **Directional Light → Affect Environment**. Essentially, this means the environment lighting will not affect the character, and the directional light will not affect the environment. This gives you separate control over the character and environment lighting, which is usually desired.
:::

### Shadow

You can enable **Shadow** to make the light cast shadows. Note that in order to cast a character's shadow on the environment (e.g., the floor), you need to enable **Main Properties → Affect Environment**.
