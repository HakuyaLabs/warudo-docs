---
sidebar_position: 30
---

# Basic Nodes

### Events

Each blueprint can be summarized as "if X happens, then Y will occur". Event nodes are the part of the blueprint that represents "if X happens."

The **"On Keystroke Pressed"** node triggers its flow output when the specified key is pressed. The following blueprint will switch the character's idle animation when pressed Alt+Q:

![](</images/image(4)(2).jpg>)

The **"On Keystroke Released"** node works similarly; it triggers the flow outlet when the specified key is released.

The **"On Enable Blueprint"** and **"On Disable Blueprint"** nodes trigger the flow output when the blueprint is enabled or disabled respectively.

The **"On Update"** and **"On LateUpdate"** nodes trigger the flow output in each frame. The latter triggers the flow output slightly later. The following blueprint continuously applies BlendShape data received by the RhyLive receiver to the model:

![](</images/image(21).jpg>)

The **"On FixedUpdate"** node triggers the flow output before game physics is updated (every 1/90 seconds).

<div className="hint hint-info">
Update, LateUpdate and FixedUpdate are [event execution orders](https://docs.unity3d.com/Manual/ExecutionOrder.html) in Unity. The blueprints lower in the blueprint list will receive the Update / LateUpdate / FixedUpdate events later.
</div>

### Character

Character nodes belong to the "then Y will occur" category.

<div className="hint hint-info">
The number of character nodes is quite extensive, so only frequently used nodes during customizing will be listed below. For information on nodes related to motion capture, please refer to this [page](mocap-nodes.md).
</div>

The **"Play Character Idle Animation"** node allows you to switch the character's idle animation to the specified one. The following blueprint will switch the character's idle animation when pressed Alt+Q:

![](</images/image(4)(2).jpg>)

<div className="hint hint-success">
Easing functions adjust the speed at which a value changes. For example, `Linear` will cause the value to change linearly, while `OutCubic` will cause the value to start changing rapidly and slow down before reaching the end. For more information, see [https://easings.net](https://easings.net/).
</div>

The **"Play Character One Shot Animation"** node will play a specified animation on the character and return to the previous state after the animation has finished playing. The following blueprint will play an additive laugh animation when pressed Alt+Q:

![](</images/image(7)(1).jpg>)

The **"Toggle Temporary Character IK Target Anchor"** node will enable or disable the temporary character IK target anchor for the character, meaning it fixes the spine or limbs of the character to the current position in space. For example, when the Alt+Q keys are pressed, the following blueprint locks the character's hands in place and pressing the keys again will undo the fix:

![](</images/image(8)(2)(3).jpg>)

The **"Toggle Character Meshes"** node will enable or disable specific [meshes](../assets/character/#meshes) on the character model. The following blueprint will hide or show the character's jacket when the Alt+Q keys are pressed:

![](</images/image(15)(1).jpg>)

The **"Load Character Animation Profile"** node will load a previously saved [animation profile](../assets/character/#animation) for a character. The following blueprint will load an animation profile named "cat" when the Alt+Q keys are pressed:

![](</images/image(3)(1).jpg>)

The **"Enable Character IK"** node gradually fades in the IK properties of the character's spine and limbs to the specified settings. The following blueprint will move the character's right hand to a designated IK target when the Alt + Q keys are pressed:

![](</images/image(17).jpg>)

The **"Disable Character IK"** node fades out the IK properties of the character's spine or limbs, and then disables the IK once the fade-out is complete.

The **"Enable Character Override Hand Pose"** node sets the character's override hand pose. The following blueprint will have the character give a V sign with both hands when the Alt+Q keys are pressed:

![](</images/image(11)(3).jpg>)

The **"Disable Character Override Hand Pose"** node will undo the character's override hand pose.

### Cinematography

Similar to character nodes, cinematography nodes belong to the "then Y will occur" category.

The **"Switch Main Camera"** node switches the main window's camera. The following blueprint will switch the main camera to Camera 2 when the Alt+2 keys are pressed:

![](</images/image(10).jpg>)

The **"Focus Camera on Character"** node enables depth of field on the camera and gradually focuses it on the designated character. The following blueprint will focus the main camera on the character when the Alt+F keys are pressed:

![](</images/image(19)(1).jpg>)

The **"Shake Camera"** node will jitter the position and rotation of the camera. The following blueprint will shake the main camera when the Alt+F keys are pressed:

![](</images/image(12)(3).jpg>)

The **"Set Camera..."** nodes allow you to adjust various properties of the camera, such as field of view, aspect ratio, and more.

### Asset

Similarly, asset nodes belong to the "then Y will occur" category.

The **"Toggle Asset Enabled"** node enables or disables the specified asset. The following blueprint, for example, allows the character to hold a rose in their right hand (the rose being a [prop asset](../assets/prop.md) that is previously set up and [bound](../assets/prop.md#character-attachment) to the character's right hand) when the Alt+R keys are pressed:

![](</images/image(9)(1).jpg>)

The **"Set Asset Property"** node is one of the most versatile nodes and can be used to set a specific property of any asset. The following blueprint will have the character look at the rose (setting the character's look IK target to the rose) when the Alt+T keys are pressed:

![](</images/image(13)(3).jpg>)

For float and color properties, you can also specify a transition time and easing function:

![](</images/image(20)(1)(1).jpg>)

<div className="hint hint-warning">
You might have noticed that many nodes can be replaced by the "Set Asset Property" node. For example, the "Set Camera Brightness" node and the "Set Asset Property" node with data path set to "Brightness" have the same effect.

However, we recommend avoiding the use of the "Set Asset Property" node as much as possible, unless there is no alternative. This is because the performance overhead of the "Set Asset Property" node is **much greater** than directly setting the property with a predefined node. If the node is triggered by a key press, the impact on performance is negligible; but if used with nodes that execute every frame such as "On Update", the frame rate may significantly decrease.
</div>

The **"Invoke Asset Trigger"** node can invoke any buttons (triggers) displayed on an asset's config page. The following blueprint will take a screenshot when the Print Screen key is pressed:

![](</images/image(14)(1).jpg>)
