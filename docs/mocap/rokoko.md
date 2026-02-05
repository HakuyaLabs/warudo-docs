---
sidebar_position: 90
version: 2024-06-18
---

# Rokoko

Face & body tracking via [Rokoko](https://www.rokoko.com/).

## Setup

Open Rokoko Studio and enable **Livestream → Activate streaming to Unity**:

![](/doc-img/zh-rokoko-1.webp)

Then, update **Profile Name** in the **Rokoko Receiver** asset to the Rokoko actor whose motion capture data you would like to receive:

![](/doc-img/zh-rokoko-2.webp)

:::caution
Note: You need a Rokoko Plus or Pro subscription to stream to Unity.
:::

:::info
For more details, see the [official documentation](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity).
:::

## Calibration

Calibration of Rokoko hardware is done in Rokoko Studio.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### My tracking drifts over time.

This is a common issue with inertial motion capture systems, which drift over time due to accumulated errors. To reduce the drift, make sure there are no magnetic or electrical interference near the tracking sensors.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
