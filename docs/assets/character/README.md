---
sidebar_position: 10
---

# Character

Warudo supports the standard [VRM ](https://vrm.dev/en/univrm/)format. If your model format is not VRM (for example, it is a MMD or a VRChat model), you can use the [Mod SDK](../../modding/mod-sdk.md) to export it to `.warudo` format and load it into Warudo.

By default, character files should be placed in the `Characters` subfolder of Warudo's data folder.

:::info
Can't find the data folder? Click "🚀" -> "Open Data Folder".
:::

## Properties

* Source: The path to the model file.

### Motion Capture

Refer to the [motion capture section](/docs/tutorials/mocap/body-tracking) for details.

* Setup Motion Capture: Select the [face tracking](../../mocap/face-tracking.md) and [pose tracking ](../../mocap/body-tracking.md)template to automatically generate the mocap [blueprints](/docs/mocap/blueprints/overview).

:::info
Think of blueprints as programs that apply the mocap data on your avatar. Read more [here](../../advanced/blueprints-intro.md).
:::

* Remove Motion Capture: Remove the assets and blueprints created in a previous motion capture setup.

### Expressions

Refer to the [expressions](blendshape-expression.md) subpage for details.

### Animation

* Save Animation Profile: Save the following settings as an animation profile. Animation profiles can be applied on any character in any scene.
* Load Animation Profile: Load an existing animation profile. Following settings will be overridden.
* Idle Animation: The animation played by default.

:::tip
**Warudo has over** [**500 built-in idle animations**](../../misc/idle-animations.md), be sure to try them out!
:::

Some pose tracking templates（e.g. MediaPipe, RhyLive）support blending the mocap with idle animations, achieving the following effect:

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180953465-7b91a347-452d-4c03-b860-45dc58ec0392.mp4" />
Here, bending of the upper body comes from the idle animation, while the head and hand movements come from mocap. When tracking of the hands is lost, the avatar's hands smoothly transitions into the idle animation.
</div>

* Overlaying Animations: Animations overlaid on top of the idle animation. Each layer of animation can be assigned its own mask and weight, allowing different parts of the body to play different animations. The higher (lower in the list) the animation layer, the higher its priority.
  * Enabled: If set to "No", this animation layer will be ignored.&#x20;
  * Animation: The animation that this layer overlays onto the idle animation.
  * Weight: The weight of the overlay animation, or the magnitude to which the model moves according to the animation.
  * Speed: The playback speed of the overlay animation. Note that most of Warudo's built-in character animations are static poses / only have one frame, so this parameter may be useless.
  * Mask: Whether to turn on animation masking. If set to "No", the animation will be applied to the entire model.
  * Masked Body Parts: When animation masking is on, the animation will be applied to these parts of the model.
  * Mask Upper Body: Assign upper body parts to the animation mask.
  * Mask Lower Body: Assign lower body parts to the animation mask.
  * Additive Animation: Additive animation applies on top of the idle animation instead of replacing it. All of Warudo's built-in idle animations are non-additive, so this is only useful for [custom animations](../../modding/character-animation-mod.md).

<div className="video-box"><iframe class="bilibili-video" src="//player.bilibili.com/player.html?aid=985941728&bvid=BV1Zt4y1c7Re&cid=843191749&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
Demo of overlapping animations. Source: https://www.bilibili.com/video/BV1Zt4y1c7Re
</div>

:::tip
Using overlaying animation and the IK features below, you can pose your character in almost any fashion!
:::

* Override Hand Poses: Override the pose of the model's hands, for example, making a "✌" gesture.
  * Left Hand / Right Hand：
    * Pose: The pose that this hand should make.
    * Weight: The weight of the pose, that is, how much the hand should blend into the selected pose.

:::info
In the built-in [motion capture templates](mocap/overview), the priority of the idle animation, overlay animations, override hand poses, and [body IK](./#body-ik) are all **lower** than motion capture.

In other words, even if you have set an override hand pose for your right hand, if you raise your right hand and it becomes tracked, the model follows your right hand's pose instead of the override hand pose.&#x20;
:::

* Breathing Animation: Add breathing to the upper body.
* Swaying Animation: Natural back-and-forth swaying of various parts of the body.
* Overlay Animations Transition Time: The duration of the transition when the overlay animation and override hand pose properties are updated.
* Additional Bone Offsets: If you want to make the head (or any joint of the body) always tilt a few degrees to one side, you can use this.
  * Bone: The bone to offset.
  * Rotation Offset: The angle of rotation on the X, Y, Z axes of the bone.

### Look IK

:::tip
**What is IK?** IK stands for Inverse Kinematics, and in game engines and Warudo, IK can be understood as "making a part of the model rotate towards, or reach a desired position", without requiring an animation made by an animator. See below:

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">Source：https://medium.com/unity3danimation/overview-of-inverse-kinematics-9769a43ba956</p>
:::

Make the character look at a specified target in the scene (e.g. camera).

* Target: The target to look at. Must be an entity in the scene, such as a [camera](../camera.md), [prop](../prop.md), [anchor](../anchor.md), etc.
* Overall Weight: 0 means the character looks in the original direction. 1 means the character looks at the specified target.&#x20;
* Eye Weight: How much the eyes should be looking at the specified target.
* Head Weight: How much the head should be turning to the specified target.
* Body Weight: How much the body should be turning to the specified target.
* Clamp Eye Weight: The greater it is, the smaller the range of movement of the eyes.
* Clamp Head Weight: The greater it is, the smaller the range of rotation of the head.
* Clamp Body Weight: The greater it is, the smaller the range of rotation of the body.

### Body IK

Make the character's spine or limbs follow a specified target in the scene.

* IK Target: The target that this part of the body should follow. Must be an entity in the scene, such as a [camera](../camera.md), [prop](../prop.md), [anchor](../anchor.md), etc.
* Create Temporary IK Target Anchor At Current Position: Create a temporary anchor asset at the current position of this part of the body, set the IK target to this anchor, and gradually fade in the IK.
* Remove Temporary IK Target Anchor: Remove the temporary anchor asset created for this part of the body, and gradually fade out the IK.

:::tip
Creating a temporary anchor allows you to fix the model's hands in an ideal position, preventing the hands from drifting left and right due to head movements. This can be quite useful for some poses.

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039288-aac4e485-c9f9-4686-948e-75f783586b25.mp4" />
Before
</div>

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039290-13b91459-110d-4706-9c77-3516b1c3b175.mp4" />
After
</div>
:::

* Position Weight: At 0, the body part stays in its original position; at 1, the body part will be fully pulled towards the target.
* Rotation Weight: Similar to the position weight, but determines whether the rotation of the body part will also follow the target.
* Bend Goal Target: The target that the elbow (or knee, in the case of legs) will follow.

![](/doc-img/en-assets-character-4.webp)

* Bend Goal Weight: At 0, the elbow position is completely decided by the IK position; at 1, the elbow position will be fully pulled towards the bend goal target.

### Ragdoll

:::caution
Experimental feature. Not recommended for use.
:::

### Meshes

Toggle meshes and skinned meshes on the model.

* Visible: Whether the mesh should be visible.

:::info
Models exported by [VRoid Studio](https://vroid.com/en/studio) only have two meshes: `Body` and `Face`. More detailed models often split the character's clothes, accessories, tail, animal ears, etc. into separate meshes.
:::

## Examples

### The model's pose is too aggressive / too soft / the arms are sinking into the body / the arms are too far away from the body.

Try setting the additional bone offsets. The rotation angle of the two shoulder joints actually quite affects the perception of the character's personality!

![](/doc-img/en-assets-character-3.webp)

### **I want to set up** a shortcut key **for toggling meshes (clothing, accessories, etc.).**

To do this, create a new blueprint (or open an existing one) and setup like below:

![](/doc-img/en-assets-character-1.webp)

### I want to set up a shortcut key for switching the idle animation.

To do this, create a new blueprint (or open an existing one) and setup like below:

![](/doc-img/en-assets-character-2.webp)

### I've set up my character's idle animation, but I want to make a small adjustment to the posture. / I've set up my character's idle animation, but I want to fix their hands so they don't sway with the body. / ...

You can configure body IK. An example (taking a selfie) can be found on [anchor](../anchor.md)'s page.
