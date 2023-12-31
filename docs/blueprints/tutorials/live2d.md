---
sidebar_position: 200
---

# Live2D Eye Wiggle

:::caution
This page is a work in progress. Information may be incomplete or inaccurate.
:::

[//]: # ("Jiggly eyes" is an effect that is present on every Live2D model, but &#40;almost&#41; absent in 3D models.)

[//]: # ()
[//]: # (<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832326-e54d9982-92dc-4046-83f2-9b156bb243d4.mp4" />)

[//]: # (<p>Source：<a href="https://twitter.com/mauracoma/status/1441799850048176138" target="_blank">https://twitter.com/mauracoma/status/1441799850048176138</a></p>)

[//]: # (</div>)

[//]: # ()
[//]: # (To add this effect to your 3D model, simply add a few blendshapes to your model and use the **"Float Pendulum Physics"** node provided by Warudo!)

[//]: # ()
[//]: # (<div className="video-box"><video controls loop src="https://user-images.githubusercontent.com/3406505/196832672-049792b0-1bbf-46ec-8ed9-7f5989eb4166.mp4" />)

[//]: # (Because I'm not a modeler, I've only created one layer of highlight blendshapes here. Just like in Live2D, the more layers you have, the better the effect!)

[//]: # (</div>)

[//]: # ()
[//]: # (### Preparations)

[//]: # ()
[//]: # (You need to prepare blendshapes that separate the eye highlights from the eye pupil, like these:)

[//]: # ()
[//]: # (<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832935-946222b5-e9a3-4efa-b9dc-7bdd04b9a3f2.mp4" /></div>)

[//]: # ()
[//]: # (I am using blendshape data created by [頼鳥ミドリ &#40;@yoridrill&#41;]&#40;https://twitter.com/yoridrill&#41;, which can be added to a VRoid model with [HANA\_Tool]&#40;https://booth.pm/en/items/2604269&#41;.)

[//]: # ()
[//]: # (<a href="https://note.com/yoridrill/n/nfc15a0760a26" target="_blank">)

[//]: # (<div className="file-box">)

[//]: # (<p>)

[//]: # ([Unity]VRoidの瞳孔に奥行きを付けよう！&#40;HANA Tool用データ無料配布&#41;)

[//]: # (</p></div>)

[//]: # (</a>)

[//]: # ()
[//]: # (The four blendshapes are:)

[//]: # ()
[//]: # (* `Highlight_Down_L`: Left eye highlight translating downwards)

[//]: # (* `Highlight_Down_R`: Right eye highlight translating downwards)

[//]: # (* `Highlight_Rotate`: Highlights rotating counterclockwise)

[//]: # (* `Highlight_Scale`: Highlights enlarging)

[//]: # ()
[//]: # (### Setup)

[//]: # ()
[//]: # (Open the face tracking blueprint, locate the "Smooth BlendShape List" and "Set Character Tracking BlendShapes" nodes on the far right, and insert the following nodes and connections in between:)

[//]: # ()
[//]: # (![]&#40;pathname:///doc-img/en-blueprint-example-live2d-physics-1.webp&#41;)

[//]: # ()
[//]: # (The nodes at the top are relatively straightforward to understand—we multiply the degree to which the eyes are closed &#40;`eyeBlinkLeft` and `eyeBlinkRight`&#41; by 1.5, and then set the values for the two highlight-lowering blendshapes.)

[//]: # ()
[//]: # (![]&#40;pathname:///doc-img/en-blueprint-example-live2d-physics-2.webp&#41;)

[//]: # ()
[//]: # (The nodes at the bottom implement the "jiggly eyes." We obtain the degree to which the eyes are closed &#40;here we only take the left eye, `eyeBlinkLeft`&#41;, then input it into the magical **"Float Pendulum Physics"** node and use the output value to set the blendshapes for rotating and enlarging the highlight:)

[//]: # ()
[//]: # (![]&#40;pathname:///doc-img/en-blueprint-example-live2d-physics-3.webp&#41;)

[//]: # ()
[//]: # (The **"Float Pendulum Physics"** node works on the same principle as [the physics simulation of Live2D]&#40;https://docs.live2d.com/en/cubism-editor-manual/physics-operation/&#41;. By specifying a multi-segment pendulum &#40;as shown below&#41;, the X coordinate of the top node of the pendulum is the input value, and the output value is the X coordinate of the bottom node of the pendulum. The pendulum's "Arms" property determine the length and physical properties of each segment of the pendulum.)

[//]: # ()
[//]: # ()
[//]: # (<div className="video-box"><video loop controls src="/doc-img/zh-blueprint-example-live2d-physics-video-4.mp4" />)

[//]: # (<p>Source：<a href="https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/" target="_blank">https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/</a></p>)

[//]: # (</div>)

[//]: # ()
[//]: # (You can preview the pendulum physics by setting the "Visualize" property of the node to "Yes":)

[//]: # ()
[//]: # (<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196835467-8eec329f-176f-47ba-af4e-fb4d0c4361d6.mp4" /></div>)

[//]: # ()
[//]: # (The blueprint above only implements the movement of one layer of highlights; however, multiple "Float Pendulum Physics" nodes and more layers of highlight blendshapes can be used to produce a more sophisticated jiggly eye effect.)

[//]: # ()
[//]: # (:::tip)

[//]: # (Keep in mind that the "Float Pendulum Physics" node is not limited to just creating jiggly eyes. Most common physical effects seen in Live2D can be achieved in Warudo as well. However, some physical effects may be better suited to be implemented using native 3D methods, such as hair physics—which is a different topic altogether!)

[//]: # (:::)
