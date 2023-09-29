---
sidebar_position: 110
---

# Customization

Warudo's motion capture is implemented using [blueprints](/docs/mocap/blueprints/overview), and they are highly customizable. When you [setup the character's motion capture](../assets/character/#motion-capture), Warudo automatically generates blueprints based on your selections. For example, if you have chosen iFacialMocap + MediaPipe, two blueprints are generated: "Face Tracking - iFacialMocap" and "Pose Tracking - MediaPipe".

## Adjust smoothing

If you find your tracking has frame drops or is way too "smooth" thus unable to track fast movements, you may adjust the smoothing parameter in the mocap blueprint. All motion capture blueprints contain one or more nodes to smooth the data. For example, the following is the default iFacialMocap face tracking blueprint:

![](/doc-img/zh-custom-1.webp)

The "Smooth Rotation List" node corresponds to the smoothing of the character's bone rotations, while the "Smooth Position" node corresponds to the smoothing of the character's root position. You can adjust the "Smooth Time" property on these nodes to make the tracking smoother or more responsive.

## Remapping blendshapes

You can remap blendshapes if your character model's blendshape names do not follow the standard VRM/ARKit naming conventions. For more information, please refer to [this page](../blueprints/mocap-nodes.md).

## Live2D-esque eye physics

With the "Float Pendulum Physics" node, you can implement Live2D's eye physics for your character model with little effort. For more information, please refer to [this page](../blueprints/example-live2d-physics.md).
