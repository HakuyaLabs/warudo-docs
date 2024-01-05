---
sidebar_position: 100
---

# Xsens MVN

Body tracking via [Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US).

## Setup

Open **Xsens MVN → Options → Network Streamer** and configure as shown below.

![](pathname:///doc-img/zh-xens-1.webp)

Then, update **Actor ID** in the **Xsens MVN Receiver** asset to the Xsens Actor whose motion capture data you would like to receive. The default is 1.

:::caution
Note: You need an MVN Animate Plus or Pro subscription to use the Network Streamer feature.
:::

:::info
For more details, see the [official documentation](https://base.xsens.com/s/article/MVN-Unity-Live-Plugin?language=en\_US).
:::

## Calibration

Calibration of Xsens hardware is done in Xsens MVN.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### My tracking drifts over time.

This is a common issue with inertial motion capture systems, which drift over time due to accumulated errors. To reduce the drift, make sure there are no magnetic or electrical interference near the tracking sensors.
