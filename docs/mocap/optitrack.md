---
sidebar_position: 515
---

# OptiTrack Motive

:::info
This feature is only available in [Warudo Pro](../pro).
:::

Body tracking via [OptiTrack Motive](https://optitrack.com/software/motive/). Requires access to an [OptiTrack](https://chingmu.com) optical tracking system.

In addition to character tracking, prop tracking is also supported. For example, you may want to track a chair or a handheld camera using your optical tracking system and stream the motion data to Warudo, animating a chair prop or camera in Warudo accordingly.

## Setup

In Warudo, go to **Menu -> Settings -> OptiTrack**. Make sure the **Server Address** and **Local Address** are both correct. The Server Address should be the IP of the OptiTrack PC, and the Local Address should be the IP of the Warudo PC. If you run Warudo and OptiTrack Motive both on the same computer, enter `127.0.0.1` for both. Then, set **Enabled** to Yes. You should see a status message that says "Connected to OptiTrack Motive".

![](/doc-img/en-optitrack-1.png)

### Character Tracking

To connect OptiTrack Motive to Warudo, please enable **Streaming** in OptiTrack Motive and set **Transmission Type** to **Unicast**. Please also select the correct IP in the Local Interface dropdown. This IP should have the same subnet as the PC running Warudo. If you run Warudo and OptiTrack Motive both on the same computer, select "loopback".

![](/doc-img/en-optitrack-2.png)

Then, use the [Onboarding Assistant](../tutorials/readme-1) (or run **Character → Setup Motion Capture**) and select **OptiTrack Motive** for pose tracking. After the setup is complete, you should be able to see an **OptiTrack Skeleton Receiver** asset in your scene. Make sure the **OptiTrack Skeleton Name** field matches the one in OptiTrack Motive:

![](/doc-img/en-optitrack-3.png)

### Prop Tracking

In Warudo, create a new **OptiTrack Rigid Body Receiver** asset and set **OptiTrack Rigid Body ID** to the ID of the rigidbody that you would like to track. Then, for **Target Asset**, select the Warudo prop/camera that you would like to control.

:::tip
If you would like to access prop tracking data in blueprints, you can use the **Get OptiTrack Rigid Body Receiver Data** node.
:::

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
