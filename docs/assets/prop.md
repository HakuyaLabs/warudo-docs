---
sidebar_position: 20
---
# Prop

Props are any 3D models that can be placed freely within a scene or can be attached to a character's bones to serve as accessories. Besides the built-in models, external models can be exported as `.warudo` format using the [Mod SDK](../modding/mod-sdk.md) and then loaded into Warudo.

![](/doc-img/zh-prop-1.webp)
<p class="img-desc">Cat paws</p>


<div className="video-box"><video controls src="/doc-img/zh-prop-1.mp4" />
<p>The rose and fingertip particle effect are achieved using prop assets and character attachment settings.</p>
</div>

## Properties

* Source: The path to the model file.

### Character Attachment

* Character: The character that the prop is set to attached to. Once attached, the prop will follow the character's movement.
* Attachment Type: The way the prop is attached.
  * Human Body Bone:
    * Attach To Bone: Which human bone the prop is attached to.
    * (When attached to either hand) Override Hand Pose: The pose that the model's hand should transition into when the prop is enabled.
      * Weight: The weight of the hand pose, or the extent to which the model's hand moves according to the pose.
  * Transform Path:
    * Attach To Transform Path: The relative path of the transform in the model's hierarchy that the prop is attached to, used to attach the prop to a non-standard bone (e.g. the tail bone of the model).

### Mesh

* Default BlendShapes: The default model blendshapes.
  * Target Skinned Mesh: The skinned mesh that the blendshape is located on.
  * BlendShape: The blendshape to be set.
  * Default Value: The default value of the blendshape.
* Default Material Properties (Experimental Feature): The default material properties.
* Meshes: The meshes and skinned meshes on the model.
  * Visible: Whether or not the mesh is visible.&#x20;

:::info
The position and rotation of the prop can be adjusted using the transform gizmo in the main window.
:::
