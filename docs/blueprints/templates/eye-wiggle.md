---
sidebar_position: 30
---

# Live2D Eye Wiggle

Eye wiggle is a common effect in Live2D models to make the character's eyes look more lively. This blueprint allows you to add this popular effect to your 3D model!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/eye-wiggle.mp4" /></div>
<p class="img-desc">Live2D-like eye wiggle physics!</p>

## Prerequisites

To add wiggly eyes to your 3D model, you need to prepare blendshapes that separate the eye highlights from the eye pupil, like these:

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832935-946222b5-e9a3-4efa-b9dc-7bdd04b9a3f2.mp4" /></div>
<p class="img-desc"></p>

:::tip
If you have a VRoid model, you can use the blendshape data created by [頼鳥ミドリ (@yoridrill)](https://twitter.com/yoridrill) which can be added to your model with [HANA_Tool](https://booth.pm/en/items/2604269). Please refer to [this blog post](https://note.com/yoridrill/n/nfc15a0760a26).
:::

This blueprint assumes you have the following six blendshapes:

* `highlight_down_left`: Left eye highlight translating downwards
* `highlight_down_right`: Right eye highlight translating downwards
* `highlight_rotate_left`: Left eye highlight rotating counterclockwise
* `highlight_rotate_right`: Right eye highlight rotating clockwise
* `highlight_scale_left`: Left eye highlight enlarging
* `highlight_scale_right`: Right eye highlight enlarging

If your blendshapes have different names, you can modify the blueprint accordingly.

Finally, you should have already set up face tracking for your character.

## Setup

Download the blueprint below and import it into your scene.

<a href="/blueprints/eye-wiggle.json" target="_blank">
<div className="file-box">
<p>
eye-wiggle.json
</p></div>
</a>

Follow the instructions on the **Comment** nodes to set up this blueprint.

:::tip
If you have created another character asset, you may need to update the **Character** option on the nodes.
:::

## Remarks

The **"Float Pendulum Physics"** node works on the same principle as [the physics simulation of Live2D](https://docs.live2d.com/en/cubism-editor-manual/physics-operation/). By specifying a multi-segment pendulum (as shown below), the X coordinate of the topmost node of the pendulum is used as the input value, and the X coordinate of the bottommost node of the pendulum is used as the output value. The **Arms** option determines the length and physical properties of each segment of the pendulum.

<div className="video-box"><video loop controls src="/doc-img/zh-blueprint-example-live2d-physics-video-4.mp4" />
</div>
<p class="img-desc">Source：<a href="https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/" target="_blank">https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/</a></p>

You can preview the pendulum physics by setting **Visualize** to Yes:

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196835467-8eec329f-176f-47ba-af4e-fb4d0c4361d6.mp4" /></div>
<p class="img-desc"></p>

This blueprint only implements the movement of one layer of highlights; however, multiple Float Pendulum Physics nodes and more layers of highlight blendshapes can be used to produce a more sophisticated eye wiggle effect.

:::tip
Keep in mind that the "Float Pendulum Physics" node is not limited to just creating eye wiggle physics! Other physical effects seen in Live2D can be implemented in Warudo this way as well, such as arm bouncing physics.
:::
