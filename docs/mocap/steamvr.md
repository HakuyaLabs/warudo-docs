---
sidebar_position: 68
version: 2024-06-16
---

# SteamVR

Tracking via solving VR tracker data from [SteamVR](https://store.steampowered.com/app/250820/SteamVR/).

## Setup

### Character Tracking

Warudo currently supports 6-point character tracking. After [setting up motion capture](body-tracking) to use SteamVR, go to the **SteamVR Character Tracker** asset and click the **Setup / Calibrate** button. You will see a list of trackers that you can assign to different body parts. Then, you will be asked to perform a T-pose to calibrate the trackers.

:::tip
We will add support for elbow, knee, and chest trackers in the future.
:::

After calibrating, you can expand each tracker to visualize the tracking sphere and adjust its **Position Offset** and **Rotation Offset**. This is especially useful if the trackers are not placed at the exact place on your body. For example, if your head tracker is put on top of your head, you should adjust the **Position Offset** to move the tracking sphere downwards, so that it matches your head position relative to the tracker.

### Prop Tracking

In Warudo, create a new **SteamVR Prop Tracker** asset and select the VR **Device** that you would like to track. You may also want to select the **Reference Frame** to be your character asset. Then, for **Target Asset**, select the Warudo prop/camera that you would like to control.

:::tip
If you would like to access prop tracking data in blueprints, you can use the **Get SteamVR Prop Tracker Data** node.
:::

## Accessing Raw Device Data

If you would like to access raw device data in blueprints, you can use the **Get SteamVR Device Data** node. This node returns the position and rotation of the specified VR device (e.g., tracker, controller, HMD).

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
