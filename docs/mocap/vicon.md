---
sidebar_position: 512
---

# Vicon Shogun

:::info
This feature is only available in [Warudo Pro](../pro).
:::

Body tracking via [Vicon Shogun](https://www.vicon.com/software/shogun/). Requires access to a [Vicon](https://www.vicon.com) optical tracking system.

In addition to character tracking, prop tracking is also supported. You can, for example, stream a tracked camera, handheld prop, or stage marker from Shogun and animate the corresponding Warudo prop or camera in real time.

## Setup

In Warudo, go to **Menu → Settings → Vicon**. Confirm the **Server Address** points to the PC running Shogun (for example `192.168.1.50:801`). If Warudo and Shogun run on the same machine, you can keep the default `localhost:801`.

Set **Enabled** to Yes. You should see a status message that says "Connected to Vicon Shogun" once Warudo establishes the connection.

![](/doc-img/en-vicon-1.jpg)

### Character Tracking

To connect Vicon Shogun to Warudo, use the [Onboarding Assistant](../tutorials/readme-1) (or run **Character → Setup Motion Capture**) and select **Vicon Shogun** for pose tracking. After the setup is complete, you should be able to see a **Vicon Subject Receiver** asset in your scene. Make sure the **Vicon Subject Name** field matches the one in Shogun.

:::tip
If your Warudo character has different bone names than the ones used in the Shogun skeleton, use **Override Bone Names** on the **Vicon Receiver** asset to map specific humanoid bones to the names exposed by Shogun.
:::

![](/doc-img/en-vicon-2.jpg)

### Prop Tracking

In Warudo, create a **Vicon Prop Receiver** asset. Set **Vicon Prop Name** to the rigid body's label in Shogun Live, and choose the Warudo prop or camera under **Target Asset**.

:::info
The hierarchy of the Warudo prop file must match the one in Shogun, and the root transform must be named `root`. Otherwise, Warudo will generate a root transform, but the child transforms may not be fully mirrored.
:::

:::tip
To access the tracking data in blueprints, you can use the **Get Vicon Subject Receiver Data** or **Get Vicon Prop Receiver Data** nodes.
:::

## Advanced Options

* **Root Rotation Offset**: Applies a static offset if your character or prop faces a different forward direction than the Vicon coordinate frame. Usually you shuold not need to change this setting.
* **Use Pre Fetch**: Requests buffered frames from Vicon Shogun to smooth latency-sensitive setups.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### The status says "Failed to connect to Vicon system".

Ensure the Shogun PC and the Warudo PC are on the same subnet. Double-check the **Server Address** and confirm that port `801` is open on your firewall.

### My character snaps into incorrect poses.

Confirm that the subject in Shogun uses a skeleton compatible with your Warudo character (matching bone hierarchy and zeroed T-pose rotations). When necessary, use **Override Bone Names** to align joint names and **Root Rotation Offset** to match coordinate frames.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />

