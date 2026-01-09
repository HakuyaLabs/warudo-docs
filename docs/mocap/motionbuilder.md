---
sidebar_position: 510
---

# Autodesk MotionBuilder

:::info
This feature is only available in [Warudo Pro](../pro).
:::

Body tracking via [Autodesk MotionBuilder](https://www.autodesk.com/products/motionbuilder/), enabling you to receive motion data from professional (usually optical) motion capture systems (e.g., [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)) that has Autodesk MotionBuilder integration.

In addition to character tracking, prop tracking is also supported. For example, you may want to track a chair or a handheld camera using your optical tracking system and stream the motion data to Warudo, animating a chair prop or camera in Warudo accordingly.

## Setup

:::info
Please make sure you are using Autodesk MotionBuilder 2020. If you need compatibility for a different version, please reach out to us (it can take a while before we can deliver a build).
:::

Make sure the **Mobu2Warudo** plugin is already installed. It is included in your Warudo Pro license.

### Character Tracking

Open MotionBuilder and load the FBX file of your character, and characterize it. **The model must have normalized bones, i.e., all bones on the model should have zero rotation (0, 0, 0) when the model is in T-pose.** The model should also have identical bone hierarchy as the character model loaded in Warudo.

:::info
You can check if a FBX model has normalized bones by importing it into Unity and checking if the bone transforms have zero rotation.
:::

Drag **Devices → Warudo Device** into the scene view.

![](/doc-img/en-motionbuilder-1.png)

:::caution
If you cannot see "Warudo Device", it means the plugin failed to load. Please download and install [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) and restart MotionBuilder.
:::

Select **Devices → Warudo Device → Characters**, click **Add** to add a new row. Change the default name **MyCharacter** to the actual character name, and click the red box next to the "Online" text. It should turn green immediately, indicating that MotionBuilder is now streaming motion data to Warudo.

![](/doc-img/en-motionbuilder-2.png)

In Warudo, update **MotionBuilder Receiver → MotionBuilder Character Name** to the actual character name.

### Prop Tracking

Select **Devices → Warudo Device → Props**, click **Add** to add a new row. Change the default name **MyProp** to the label name of the object that you would like to track. The object can be anywhere in the scene hierarchy. Click the red box next to the "Online" text to start tracking.

In Warudo, create a new **MotionBuilder Prop Receiver** asset and enter the tracked object name for **MotionBuilder Prop Name**. Then, for **Target Asset**, select the Warudo prop/camera that you would like to control.

:::tip
If you would like to access prop tracking data in blueprints, you can use the **Get MotionBuilder Prop Receiver Data** node.
:::

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### My character is in extremely weird poses.

First, make sure you have loaded the same model in Warudo and Autodesk MotionBuilder.

We also require the models to have normalized bones,  i.e., all bones on the model should have zero rotation (0, 0, 0) when the model is in T-pose. Please refer to [this page](../misc/normalizing-model-bones) for more details.

### I have confirmed Autodesk MotionBuilder is streaming data to another PC running Warudo, but Warudo has not received any data.

Please make sure the network settings are correct, i.e., the two PCs are on the same network and can communicate with each other. You can try to ping in both directions to confirm.

Additionally, if your character has a rather large hierarchy, please check if the receiving PC has a large enough MTU (Maximum Transmission Unit) size to receive the data, and increase it if necessary. See [this page](https://answers.microsoft.com/en-us/windows/forum/all/how-to-change-mtu-settings-in-windows-10/5c36c250-a0e8-47ee-b01c-de22139dc297) for more details.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
