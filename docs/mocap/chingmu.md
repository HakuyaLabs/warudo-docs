---
sidebar_position: 520
---

# Chingmu Avatar

:::info
This feature is only available in [Warudo Pro](../pro).
:::

Body tracking via [Chingmu Avatar](https://www.chingmu.com/software/downloaddetail_7.shtml). Requires access to a [Chingmu](https://chingmu.com) optical tracking system.

In addition to character tracking, prop tracking is also supported. For example, you may want to track a chair or a handheld camera using your optical tracking system and stream the motion data to Warudo, animating a chair prop or camera in Warudo accordingly.

## Setup

### Character Tracking

Open Chingmu Avatar and load the FBX file of your character, and characterize it. **The model must have normalized bones, i.e., all bones on the model should have zero rotation (0, 0, 0) when the model is in T-pose.** The model should also have identical bone hierarchy as the character model loaded in Warudo.

:::info
You can check if a FBX model has normalized bones by importing it into Unity and checking if the bone transforms have zero rotation.
:::

Make sure **VRPN Livestream** (启用Vrpn) is checked, along with **Rigidbodies** (刚体), **Bones** (骨骼), and **Motion Retargeting** (重定向).

![](/doc-img/en-chingmu-1.png)

If you have multiple characters in the scene, in Warudo, set **Chingmu Avatar Receiver → Object ID** to the index of the character that you would like to track. The index starts from 0.

If you are running Chingmu Avatar on a different PC, you need to enter the IP address of the PC running Chingmu Avatar in Warudo's **Settings → Chingmu → VRPN Connection String**.

### Prop Tracking

In Warudo, create a new **Chingmu Avatar Rigidbody Receiver** asset and set **Rigidbody ID** to the ID of the rigidbody that you would like to track. Then, for **Target Asset**, select the Warudo prop/camera that you would like to control.

:::tip
If you would like to access prop tracking data in blueprints, you can use the **Get Chingmu Avatar Rigidbody Receiver Data** node.
:::

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### My character is in extremely weird poses.

First, make sure you have loaded the same model in Warudo and Chingmu Avatar.

We also require the models to have normalized bones,  i.e., all bones on the model should have zero rotation (0, 0, 0) when the model is in T-pose. Please refer to [this page](../misc/normalizing-model-bones) for more details.

### My character is not moving.

You can try click **Settings → Chingmu → Restart Chingmu Plugin**. If this does not work, try restarting Chingmu Avatar and/or Warudo.
