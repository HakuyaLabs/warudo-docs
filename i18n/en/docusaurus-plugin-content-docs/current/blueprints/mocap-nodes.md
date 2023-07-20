# Motion Capture Nodes

On this page, we will not go over each motion capture node in detail, but instead discuss how motion capture using [RhyLive ](../mocap/rhylive.md)is implemented using blueprints.

<div className="hint hint-warning">
It is recommended to have a basic understanding of how blueprints work before you proceed.
</div>

### Face Tracking

The blueprint for RhyLive face tracking is as follows (using the VRM blendshape mapping):

<div className="hint hint-info">
The other blendshape mappings (e.g. ARKit, MikuMikuDance) work similar, if not simpler, thus will not be discussed here.
</div>

<figure><img src="/images/image(8)(2)(4).png" alt="" /><figcaption></figcaption></figure>

The basic principle of Warudo's face tracking has already been introduced in ["Introduction to Blueprints."](../advanced/blueprints-intro.md) Although the RhyLive face tracking blueprint appears to be complex, the core logic can be expressed in one sentence: _"Receive the BlendShape list from the RhyLive receiver, perform a series of data processing, and finally apply it to the model."_ Let's follow the flow of data and start with the leftmost part of the blueprint.

![](</images/image(2)(4).png>)

The [**"Switch BlendShape List"**](advanced-nodes.md#switches) node selects either the captured motion data or an empty blendshape list based on the signal of RhyLive receiver being "Tracked". This prevents the model's expression from becoming stuck if the motion capture signal is lost.

<div className="hint hint-info">
What if we actually prefer the model's expression to be stuck when tracking is lost? We can simply remove the "Empty BlendShape List" node and connect "Get RhyLive Receiver Data -> BlendShape List" to "Switch BlendShape List -> If False."
</div>

Looking further to the right, we can see that although the blueprint appears to be complicated, the data flowing to the right is actually just the original blendshape list (from the left) with 6 VRM blendshapes set (by the **"Set BlendShape"** nodes): `Blink_L`, `Blink_R`, `A`, `O`, `I`, `U`. For example, the value of `U` is directly taken from `mouthPucker` (an ARKit mouth blendshape); `A`'s value is `jawOpen * 1.2 - mouthFunnel`, and so on.

<div className="hint hint-info">
The reason why we need to set values for A, O, I, and U is because the facial tracking data from RhyLive consists of [52 ARKit blendshapes](https://arkit-face-blendshapes.com/), but our model only has VRM blendshapes (A, I, E, O, U, Blink, etc.). So we need to find a way to calculate the values of the latter from the former.

Why is `jawOpen` multiplied by 1.2 instead of 1.3 or 1.4? Why do we subtract `mouthFunnel`? In fact, these formulas are completely heuristic (i.e., based on the developer's experience). For best results, feel free to play around and customize!
</div>

<figure><img src="/images/image(4)(1).png" alt="" /><figcaption></figcaption></figure>

The **"Constrain BlendShape"** node restricts the value of each BlendShape in the "Constrained BlendShapes" list such that they must be less than or equal to 1 minus the value of the "Constraint BlendShape." (Tricky, I know.)

For example, in the last node, if the value of `U` in the BlendShape list is 0.7, then the values of `I`, `A`, and `O` will be limited to 0.3 or less. This prevents multiple mouth blendshapes from stacking on top of each other, resulting in the model looking really weird. The order of the "Constrain BlendShape" nodes determines the priority of the mouth shapes (in this case, `U` has the highest priority).

![](</images/image(64)(1).png>)

Finally, at the end of the blueprint, we smooth the data in the blendshape list (to make the facial animations appear smoother), and then apply the blendshapes onto the model:

![](</images/image(7).png>)

What is this **"Use VRM BlendShape Proxy"** property, you may ask? Well, the well-known `A`, `I`, `E`, `O`, `U`, `Blink_L`, and `Blink_R` blendshapes on the VRM model format are not the names of the blendshapes on the model, but rather the names of VRM's [BlendShapeClips](https://vrm.dev/en/univrm/blendshape/univrm\_blendshape.html). Each VRM BlendShapeClip internally corresponds to one or more blendshape values, as shown below:

![](</images/image(63)(1).png>)

However, Warudo does not directly work with VRM's BlendShapeClips (not every model is a VRM model!), but instead manipulates the blendshapes on the model. Therefore, we need to turn on **"Use VRM BlendShape Proxy"** to help us make this conversion. With the above blueprint and model as an example, the `Blink_L` blendshape would be mapped to the VRM's `Blink_L` BlendShapeClip, which is the `Fcl_EYE_Close_L` blendshape on the model.

### Pose Tracking

The blueprint for RhyLive upper body pose tracking is as follows:

<figure><img src="/images/image(62).png" alt="" /><figcaption></figcaption></figure>

This blueprint may look complicated, but don't worry! If we just look at the flow, we can see that this blueprint will essentially override the character's bone rotations and hand IK weights on every frame.

<figure><img src="/images/image(12).png" alt="" /><figcaption></figcaption></figure>

What are "bone rotations," really? A character model has several joints, and the initial position and rotation of each joint in a character's model is (0, 0, 0). To make the model take a certain pose, we need to set the **relative** position and rotation of each joint.

<figure><img src="/images/image(2)(3)(1).png" alt="" /><figcaption><p>来源：<a href="https://blenderartists.org/t/apply-relative-rotation-from-one-armature-to-another/1194354">https://blenderartists.org/t/apply-relative-rotation-from-one-armature-to-another/1194354</a></p></figcaption></figure>

Warudo supports any Unity-compatible [humanoid rig](https://docs.unity3d.com/2021.3/Documentation/Manual/UsingHumanoidChars.html), and standard humanoid models have [54 joints](https://docs.unity3d.com/ScriptReference/HumanBodyBones.html). That means, no matter what motion capture setup you have, as long as the output motion capture data can be converted (or merged) into 54 rotation vectors, the model can be animated with them. Below, we refer to these 54 rotation vectors as **(character) bone rotations**.

<div className="hint hint-info">
Why is there no control over the character's bone positions in this blueprint? To start, with the exception of the root joint (hips), the **relative** position of each joint should remain unchanged unless you want to stretch your arm like in One Piece.

The relative position refers to the position of a child joint in the reference frame of the parent joint. For example, let's look at the arm:

<img src="/images/image(24)(1)(1)(1)(1).png" alt="" data-size="original" />

<img src="/images/image(3)(3)(1).png" alt="" data-size="original" />

As you can see, even though the arm takes different poses, the position of each child joint **relative** to the parent joint is always translated along the parent's Y axis (green axis) by a fixed distance, which does not change unless you want to stretch your arm.

Typically, the only bone position that is overridden is the hips, as it is the root bone of the character and moving its relative position will move the character's absolute position in the world. However, RhyLive only provides upper body tracking, so it won't move the character's position, which is why there is no control over the character's bone positions in this blueprint. Blueprints for full-body motion capture such as [VMC](../mocap/vmc.md) or [Rokoko](../mocap/rokoko.md), however, will control the character's bone positions through the "Override Character Bone Positions" node.
</div>

Now let's take a look at how bone rotations are passed. As you can see, we have "Override Character Bones" and "Override Character Bone Rotation Offsets" nodes that receive two sets of data: <mark style={{color: "red"}}>**bone rotations**</mark> and <mark style={{color: "orange"}}>**bone rotation offsets**</mark>. Both of these data sets originate from the RhyLive receiver, but what is the difference between them? And what are the <mark style={{color: "blue"}}>**bone rotation weights**</mark>? Well, Let's start with the first two:

<figure><img src="/images/image(1)(1)(1).png" alt="" /><figcaption></figcaption></figure>

In the above, we see that the motion capture data output by RhyLive is divided into two parts: one part has only data from the face, head, and pelvis, and the other part has only data from the two arms & hands (left and right arms, left and right hand fingers). The former is passed as <mark style={{color: "orange"}}>**bone rotation offsets**</mark>, and this part of the mocap data is <mark style={{color: "orange"}}>**always applied to the model**</mark>. The latter is passed into the node as <mark style={{color: "red"}}>**bone rotations**</mark>, and whether this part of the motion capture data is applied to the model <mark style={{color: "red"}}>**depends on the value of the**</mark> <mark style={{color: "blue"}}>**bone rotation weights**</mark>.

<div className="hint hint-info">
You may have also noticed the **"Smooth Rotation List"** node. Similar to the "Smooth BlendShapes List" node, this node's purpose is to make the input data smoother, making the character's movements more natural.
</div>

<div className="hint hint-info">
In a more precise manner, the <mark style={{color: "red"}}>**bone rotations**</mark> consist of 54 rotation vectors, the <mark style={{color: "orange"}}>**bone rotation offsets**</mark> also consist of 54 rotation vectors, and the <mark style={{color: "blue"}}>**bone rotation weight**</mark> consist of 54 decimal numbers between 0 and 1. Let's assume that <mark style={{color: "orange"}}>**bone rotation offsets**</mark> are all 0. Then, when <mark style={{color: "blue"}}>**bone rotation weights**</mark> are all 1, the pose of the model is consistent with the <mark style={{color: "red"}}>**bone rotations**</mark>, i.e., motion capture data; when <mark style={{color: "blue"}}>**bone rotation weights**</mark> are all 0, the pose of the model remains the [animation pose](../assets/character/#animation). The <mark style={{color: "orange"}}>**bone rotation offsets**</mark> are rotations additively added to each joint.

Formulated, the final rotation of each joint i is:

`FinalBoneRotations[i] =`<mark style={{color: "red"}}>**`BoneRotations`**</mark>`[i] *`<mark style={{color: "blue"}}>**`BoneRotationWeights`**</mark>`[i] + OriginalBoneRotations[i] *(1 -`<mark style={{color: "blue"}}>**`BoneRotationWeights`**</mark>`[i]) +`<mark style={{color: "orange"}}>**`BoneRotationOffsets`**</mark>`[i]`

where OriginalBoneRotations are the bone rotation data given by the [character animation settings](../assets/character/#animation).
</div>

One of Warudo's biggest selling points is its ability to perfectly blend motion capture with animation. That means that when the hands are tracked, the model's hands will follow those of the user, but when the tracking is lost, the model will smoothly transition to the [animation pose](../assets/character/#animation). You may have guessed it: this is achieved by adjusting the values of the <mark style={{color: "blue"}}>**bone rotation weights**</mark>.

<figure><img src="/images/image(61)(1).png" alt="" /><figcaption></figcaption></figure>

Looks too complicated? Well, let's read it from right to left. Essentially, the "Switch Float List" node is responsible for determining the value of the <mark style={{color: "blue"}}>**bone rotation weights**</mark>. When the RhyLive receiver signals that it's tracking, the data for the <mark style={{color: "blue"}}>**bone rotation weights**</mark> comes from the **"Construct Character Bone Weights"** node. Otherwise, the <mark style={{color: "blue"}}>**bone rotation weights**</mark> are set to the minimum character bone weights (all 54 values are set to 0), meaning that the final bone rotations will completely follow the animation pose.

So, what data do the **"Construct Character Bone Weights"** node provide? Again, tracing to the left, we see its output is determined by the [**"Switch Float"**](advanced-nodes.md#switches) nodes. These nodes take the Boolean signals from the RhyLive receiver indicating whether the left or right hand is being tracked, and convert them into either a 1 or a 0. When the left or right hand is being tracked, the corresponding weight in the <mark style={{color: "blue"}}>**bone rotation weights**</mark> will gradually transition to 1 (the model's left or right hand follows the motion capture data). When the tracking signal is lost, the weight gradually transitions to 0 (the model's left or right hand follows the animation).

Take a deep breath, we're almost done with our blueprint! But by now, you might have a good idea of what's left...

<figure><img src="/images/image(15).png" alt="" /><figcaption></figcaption></figure>

The two "Float Subtraction" nodes output 1 minus the left/right hand's <mark style={{color: "blue"}}>**bone rotation weights**</mark>, which are used as inputs for the **"Override Character Limb IK Position / Rotation Weight"** nodes. In simpler terms, this means that the IK for the left/right hand will not be applied when the hands are tracked.

<div className="hint hint-info">
The "Configured Weight" in "Relative To Configured Weight" refers to the [corresponding IK weight in the character asset](../assets/character/#body-ik).
</div>

### Conclusion

Congratulations! If you have fully understood the contents above, you are a true expert in Warudo blueprints. 🎉 Now that you understand how RhyLive-based motion capture is 100% implemented using the blueprint system, you can:

* Fine-tune the motion capture, such as adjusting the "Smooth..." nodes to control the smoothness of the animation.
* Customize blendshape mapping, such as activating an angry blendshape when you puff up your cheeks (`cheekPuff`).
* Study how the pose tracking templates with [keyboard / trackpad](../assets/jian-pan-chu-kong-ban.md) are implemented.
* Integrate VMC data with RhyLive data by using the "Get VMC Receiver Data" node (for example, use VMC for 8-point/10-point full body tracking and RhyLive for ARKit face tracking and finger tracking).
* Have a different motion capture setup, but the data is not in VMC format? Use the [Mod SDK](../modding/mod-sdk.md) to create a node type similar to "Get RhyLive Receiver Data" and integrate it into the Blueprint.

### Appendix

The **"Offset Character Transform"** node is used to temporarily offset the character's transform, which includes its position, rotation, and scale in space, without affecting the "Transform" property set on the character's config page. It is typically used to apply character locomotion:

![](</images/image(20)(1).png>)

The **"Offset Character Bone Rotation List"** node allows for offsetting the rotation(s) of specified bone(s). The following blueprint will gradually turn the character's head 30 degrees to the left when the Z key is pressed, and gradually return to its original position when released:

![](</images/image(13)(2).png>)
