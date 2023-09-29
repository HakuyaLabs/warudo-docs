---
sidebar_position: 90
---

# Rokoko

Face & body tracking via [Rokoko](https://www.rokoko.com/).

## Setup

Open Rokoko Studio -> Livestream -> Activate streaming to Unity:

![](/doc-img/zh-rokoko-1.webp)

Then, update Profile Name to the Rokoko actor whose motion capture data you would like to receive:

![](/doc-img/zh-rokoko-2.webp)

:::caution
Note: You need a Rokoko Plus or Pro subscription to stream to Unity.
:::

:::info
For more details, see the [official documentation](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity).
:::

## Properties

* Port: The port used by Rokoko Studio. The default is 14043.
* Profile Name: The name of the Rokoko Actor to receive.
* Eye Blink Sensitivity: The sensitivity of the eye blinking.
* Eye Movement Intensity: The range of eye movement.
* Adjust Hip Height Based On Studio Actor: Whether to adjust hip height based on studio actor.
