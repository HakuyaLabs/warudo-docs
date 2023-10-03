---
sidebar_position: 10
---


# Expressions

* Import VRM Expressions: If the model is in VRM format, import all of the built-in VRM [BlendShapeClips](https://vrm.dev/en/univrm/blendshape/univrm\_blendshape.html) as expressions.
* Generate Key Binding Blueprint: Based on the currently configured expressions, generate a blueprint for key binding.

:::info
The maximum number of expression hotkeys that can be generated is 46, with the default hotkeys being:

Alt+1, Alt+2, Alt+3... Alt+=

Alt+Q, Alt+W, Alt+E... Alt+\\

Alt+A, Alt+S, Alt+D... Alt+'

Alt+Z, Alt+X, Alt+C... Alt+/

...assuming your model really has that many expressions!

**Press Alt+Backspace to reset the expressions.**
:::

* Expressions:
  * Name: Name of the expression. Used for identification in the blueprint.
  * Layer: When switching expressions, expressions on the same layer will fade out, while expressions on different layers can overlap.
  * Disable Eye Blink Tracking: Whether to disable eye blink blendshapes when applying this expression.
  * Disable Mouth Tracking: Whether to disable mouth blendshapes when applying this expression.
  * Disable Brow Tracking: Whether to disable brow blendshapes when applying this expression.
  * Target BlendShapes:
    * Target Skinned Mesh: The skinned mesh that the blendshape is located in.
    * BlendShape: The blendshape you want to set.
    * Target Value: How much you want to set the blendshape to, normally between 0 and 1; values outside the range may cause weird effects.
    * Enter Duration: The duration it takes for this blendshape to fade in to the target value when applying this expression.
    * Enter Easing: The easing function used for this blendshape to fade in to the target value when applying this expression.
    * Enter Delay: The delay before this blendshape starts to fade in to the target value when applying this expression.
    * Exit Duration: The duration it takes for this blendshape to fade out to the default value when applying another expression.
    * Exit Easing: The easing function used for this blendshape to fade out to the default value when applying another expression.
    * Exit Delay: The delay before this blendshape starts to fade out to the default value when applying another expression.
  * Constrained BlendShapes:
    * Apply to All Skinned Meshes: Whether to control the same named blendshape on all skinned meshes.
    * Target Skinned Mesh: The skinned mesh that the blendshape is located in.
    * Constrained BlendShape: The blendshape that is controlled when this expression is active.
    * Min Value: The minimum value that the constrained blendshape cannot be less than when this expression is active.
    * Max Value: The maximum value that the constrained blendshape cannot be greater than when this expression is active.
  * Target Material Properties: The target material properties. This is for compatibility with VRM's [MaterialValueBinding](https://vrm.dev/en/univrm/blendshape/univrm\_blendshape.html#id3) feature, which is used to modify a material property, such as making a clothing material transparent.
* Default BlendShapes: A list of the model's default BlendShapes; will be overridden by face tracking.
  * Target Skinned Mesh: The skinned mesh that the blendshape is located in.
  * BlendShape: The blendshape to set.
  * Default Value: The default value of the blendshape.
* Default Material Properties: The default material properties. This is for compatibility with VRM's [MaterialValueBinding](https://vrm.dev/en/univrm/blendshape/univrm\_blendshape.html#id3) feature.

:::info
When importing VRM expressions, the default BlendShapeClips (i.e. Joy, Angry, Sorrow, Fun/Surprised) in the VRM model will be placed on layer 0, while the BlendShapeClips added by the modeler will be placed on layer 1, 2, 3, etc.
:::

## Examples

:::info
The following examples assume that you have set up the expressions and can already switch between different expressions by pressing Alt+1, Alt+2, etc.
:::

### One of my expressions already closes the model's eyes, but when I blink, the model's eyes close further. It looks weird.

There are two ways to solve this:

1. In the expression list, expand the configuration for that expression and enable "Disable Eye Blink Tracking".
2. In the expression list, expand the configuration for that expression, click the + button at the bottom right of the "Constrained BlendShapes" list, select the blendshape that closes the left eye from the dropdown list, and set the min and max values to 0. Repeat the same for the right eye blendshape.

Note: The first solution is simpler, but the second solution offers more flexibility (for example, if you want to constrain other blendshapes besides the blink ones).

### I want to change the speed at which a certain expression fades in / fades out.

In the expression list, expand the configuration for that expression, and adjust "Enter Duration" for each target blendshape in the "Target BlendShapes".

### My model has an e.g. heart-shaped eye blendshape. I want to display this blendshape when activating a certain expression.

In the expression list, expand the configuration for that expression, click the + button at the bottom right of the "Target BlendShapes", select the heart-shaped eye blendshape from the dropdown list, and set the target value to 1. The other properties can be adjusted as desired, or you can keep the defaults.

### I want to change the default key bindings.

Open the "Expression Key Bindings" blueprint and locate the "On Keystroke Pressed" node. Then, modify it as needed. For example, in the original blueprint, pressing Alt+1 will activate the `Joy` expression:

![](pathname:///doc-img/en-expression-1.webp)

The following changes the keyboard shortcut to Ctrl+Shift+T.

![](pathname:///doc-img/en-expression-2.webp)

### I want to create a new expression from scratch.

In the expressions list, click the + button at the bottom right to add a new item. In the "Target BlendShapes", add the blendshapes that form the desired expression. For example, the following expression will activate the `笑い` BlendShape on the model when applied:

![](pathname:///doc-img/en-expression-3.webp)

Open the "Expression Key Bindings" blueprint (or create a new blueprint). Drag out the "On Keystroke Pressed" and "Toggle Character Expression" nodes from the sidebar. Set the keyboard shortcut on the "On Keystroke Pressed" node, and select the character and the newly created expression on the "Toggle Character Expression" node. Connect the output and input of the two nodes as shown below.

![](pathname:///doc-img/en-expression-4.webp)

### Can I only activate an expression for a certain period of time and then automatically switch back to the previous expression after a while?

To do this, enable "Is Transient" on the "Toggle BlendShape Expression" node in the blueprint to "Yes." The duration of the expression will be determined by "Exit Delay" of each BlendShape in the expression.

![](pathname:///doc-img/en-expression-5.webp)
