---
sidebar_position: 512
---

# Vicon Shogun Live

:::info
This feature is only available in [Warudo Pro](../pro).
:::

Body tracking via [Vicon Shogun Live](https://www.vicon.com/software/shogun-live/). Requires access to a Vicon optical tracking system and the DataStream SDK runtime.

In addition to character tracking, prop tracking is also supported. You can, for example, stream a tracked camera, handheld prop, or stage marker from Shogun Live and animate the corresponding Warudo prop or camera in real time.

## Setup

In Warudo, go to **Menu → Settings → Vicon**. Confirm the **Server Address** points to the PC running Shogun Live (for example `192.168.1.50:801`). If Warudo and Shogun Live run on the same machine, you can keep the default `localhost:801`. Enable **Use Pre Fetch** if you would like Vicon's DataStream client to request data ahead of time to minimize dropped frames on busy networks.

Set **Enabled** to Yes. You should see a status message that says "Connected to Vicon system" once Warudo establishes the DataStream connection.

### Character Tracking

1. In Shogun Live, expand **System → Local Vicon System → DataStream** and enable streaming. Set the transport to **Unicast** and enter the IP address of the Warudo PC in the client list if prompted.
2. Verify that your subject is labeled in Shogun Live (for example `Subject1`). The DataStream uses the subject name to publish skeleton data.
3. In Warudo, create a **Vicon Receiver** asset (or run **Character → Setup Motion Capture** and select **Vicon Shogun Live**). Set **Vicon Character Name** to match the subject name in Shogun Live. Once the plugin connects, Warudo will automatically bind the incoming joints to your character.

:::tip
If your Shogun skeleton uses custom joint names, use **Override Bone Names** on the **Vicon Receiver** asset to map specific humanoid bones to the names exposed by Shogun Live.
:::

### Prop Tracking

1. In Shogun Live, publish the rigid body (prop) you want to track and confirm it appears on the DataStream.
2. In Warudo, create a **Vicon Prop Receiver** asset. Set **Vicon Prop Name** to the rigid body's label in Shogun Live, and choose the Warudo prop or camera under **Target Asset**.
3. When the plugin reports tracking, the chosen asset follows the live prop pose. If the original hierarchy includes a transform named `root`, Warudo mirrors the entire hierarchy; otherwise, it drives the prop from a generated root.

:::tip
To access the tracking data in blueprints, use **Get Vicon Receiver Data** or **Get Vicon Prop Receiver Data** nodes.
:::

## Advanced Options

* **Root Rotation Offset**: Applies a static offset if your character or prop faces a different forward direction than the Vicon coordinate frame.
* **Use Pre Fetch** (plugin setting): Requests buffered frames from the Vicon DataStream to smooth latency-sensitive setups.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### The status says "Failed to connect to Vicon system".

Ensure the Shogun PC and the Warudo PC are on the same subnet and that the Vicon DataStream service is enabled. Double-check the **Server Address** and confirm that UDP port `801` is open on your firewall.

### My character snaps into incorrect poses.

Confirm that the subject in Shogun Live uses a skeleton compatible with your Warudo character (matching bone hierarchy and zeroed T-pose rotations). When necessary, use **Override Bone Names** to align joint names and **Root Rotation Offset** to match coordinate frames.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />

