---
sidebar_position: 20
---
# Prop

A prop is a 3D model that can be placed freely within a scene or attached to a character as an accessory. Besides the built-in models, external models can be exported as `.warudo` format using the [Mod SDK](../modding/mod-sdk.md) and then loaded into Warudo.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '48%'}}>
<img src="/doc-img/zh-prop-1.webp"  />
<p class="img-desc">Cat paws</p>
</div>

<div style={{width: '52%'}} className="video-box"><video controls src="/doc-img/zh-prop-1.mp4" />
<p>The rose and fingertip particle effect are achieved using prop assets and character attachment settings.</p>
</div>
</div>

## Steam Workshop

In addition to the built-in props, you can download official and community props from Warudo's Steam Workshop. Click on the **Discover** tab and select the **Props** category:

![](/doc-img/en-prop-3.png)
<p class="img-desc">Browsing props from the Steam Workshop.</p>

## Setup

To set up a prop, simply select a **Source** as the model for the prop. Then, use the transform gizmos to move/rotate/scale the prop, so that it is in the desired position.

![](/doc-img/en-prop-1.png)
<p class="img-desc">The Christmas tree, Christmas hat, and electric piano here are all props.</p>

## Transform Attachment

You can use the **Transform Attachment** settings to attach the prop to a character or other scene objects. This is useful for props that are held by the character, such as a sword or a microphone. When attached to a character's hand, you can also specify an **Override Hand Pose**, so that the character can tightly grip a sword, for example.

![](/doc-img/en-prop-2.png)
<p class="img-desc">The katana prop is attached to the character's hand with **Override Hand Pose** set to **Grab**.</p>

If you would like to attach the prop to a non-standard human body bone (e.g. the tail bone of your character), you can use the **Transform Path** for the **Attachment Type** option. This allows you to attach the prop to any transform in the model's hierarchy.

## Collision Detection

By default, the colliders on the prop are disabled. You can enable **Collision Detection** to enable the colliders, which is useful when you have **Character → Ragdoll** enabled.

:::info
Please note that not all built-in props have colliders.
:::

## Meshes

Similar to the character asset, you can adjust **Default BlendShapes**, **Default Material Properties**, and toggle **Meshes** for the prop asset.

## Frequently Asked Questions

### How can I throw a prop at my character when my stream viewers redeems a Twitch channel point reward / sends a Super Chat / ...?

Please use **Onboarding Assistant → Interactions Setup → Get Started** to set up interactions. During the setup process, you will have the option to specify the conditions for throwing a prop at your character, along with other fun interactions.

Note that the "prop" thrown by the **Throw Prop At Character** node in the interactions blueprint is a temporary object; it is not a prop asset. A prop asset is a persistent model in the scene, and it does not have a physics body.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
