---
sidebar_position: 500
---

# VMC

Tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english). VR trackers are also supported using the paid (supporter) version of [VirtualMotionCapture](https://www.patreon.com/sh_akira).

## Setup

### VR Trackers

First, make sure you have the paid (supporter) version of [**VirtualMotionCapture**](https://vmc.info/) installed. It can be downloaded from the developer's [Patreon](https://www.patreon.com/sh_akira) or [pixivFANBOX](https://akira.fanbox.cc/).

:::tip
What is the difference between VirtualMotionCapture and VMC? Simply put, they are the same thing, but they can refer to two different things. One is the original VirtualMotionCapture application, one is the protocol that is used by VirtualMotionCapture and other applications. (A protocol is basically how applications communicate with each other.) In this handbook, we use "VMC" to refer to the protocol, and "VirtualMotionCapture" to refer to the application.
:::

Make sure you have connected your VR trackers to SteamVR. Then, open VirtualMotionCapture; load your VRM model, and perform calibration. Finally, check **Enable OSC motion sender** in **Settings → VMCProtocol Motion sender**. The default port 39539 is also the default port that Warudo's VMC receiver uses.

![](/doc-img/en-vmc-1.png)

### VSeeFace

The following example demonstrates how to apply VMC data to the character using [VSeeFace](https://www.vseeface.icu/). Other software that supports VMC can be configured in a similar manner.

In **General settings**, make sure **VMC Protocol → Send datawith VMC protocol** is checked. The default port 39539 is also the default port that Warudo's VMC receiver uses.

![](/doc-img/zh-vmc-1.webp)

### Other Applications

For other applications that support VMC, you can check the documentation of the application to see how to enable VMC tracking. Make sure you are sending to the correct port (default 39539).

## Calibration

Calibration of VMC-compatible tracking systems is done in the external application.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### My character is in extremely weird poses.

First, make sure you have loaded the same model in Warudo and the external application.

We also require the models to have normalized bones,  i.e., all bones on the model should have zero rotation (0, 0, 0) when the model is in T-pose. If your model is in [VRM format](https://vrm.dev/), then in most cases there should be no issue. However, in very rare cases, the modeler may not have checked the Enforce T-Pose option when exporting, and it can be fixed by re-exporting with this option checked. Please refer to [this page](../misc/normalizing-model-bones) for more details.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
