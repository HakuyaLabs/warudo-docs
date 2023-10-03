---
sidebar_position: 90
---

# Anchor

An absolute or relative position in the scene, which can be used as the target for the character's [look IK](character/#look-ik) or [body IK](character/#body-ik).

## Properties

* Parent Transform: When an entity in the scene is selected as the parent transform, the anchor point will move along with the parent transform (the values in the transform also become relative values).
  * Parent Transform is [Character](character/):
    * Attachment Type: The way the anchor is attached.
      * Human Body Bone:
        * Attach To Bone: Which human bone the prop is attached to.
      * Transform Path:
        * Attach To Transform Path: The relative path of the transform in the model's hierarchy that the anchor is attached to, used to attach the anchor to a non-standard bone (e.g. the tail bone of the model).
  * Parent Transform is [Prop](prop.md):
    * Attach To Transform Path: The relative path of the transform in the model's hierarchy that the anchor is attached to, used to attach the anchor to a non-standard bone (e.g. the tail bone of the model).
* Teleport To Main Camera: Teleport this anchor to the position of the [main camera](camera.md#main-camera).
* Teleport Main Camera To This Anchor: Teleport the main camera to this anchor's position.

## Examples

### I want to achieve the effect of seemingly taking a selfie with a phone.

<div className="video-box"><video controls loop src="/doc-img/zh-anchor-1.mp4" /></div>

Here we use the right hand as an example. Create an anchor asset, set the parent transform to the camera. Set the character's "Body IK" -> "Right Hand" -> "IK Target" to the anchor asset, and set the "Rotation Weight" to 0.5. Adjust the position and rotation of the anchor until everything looks natural.

![](/doc-img/zh-anchor-1.webp)
<p class="img-desc">The transform values used in the demo</p>

:::info
If the anchor is too close to the camera or behind it, you may not be able to use the transform gizmo. In this case, you can temporarily increase the camera's field of view until the anchor is in view, adjust the position of the anchor, and then return the field of view to its original setting.
:::

:::info
To make finer adjustments to the camera, try reducing "Controls" -> "Control Sensitivity" in the camera's configuration.
:::
