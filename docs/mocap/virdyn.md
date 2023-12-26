---
sidebar_position: 110
---

# Virdyn Studio (VDMocapStudio)

Body tracking via [VDMocapStudio](https://www.virdynm.com/virdyn-vdmocap-studio-motion-capture-software-system-for-vdsuit-full-product/). Requires a [VDSuit](https://www.virdynm.com/virdyn-vdsuit-full-for-full-body-function-inertia-motion-capture-suit-product/) suit.

## Setup

Open VDMocapStudio and enable data streaming by clicking **Broadcast -> OpenShare**. Make sure the IP selected is accessible from Warudo.

![](pathname:///doc-img/en-virdyn-1.png)

## Calibration

Calibration of Virdyn hardware is done in VDMocapStudio. You can also use **Virdyn Studio Receiver -> Calibrate Root Transform** to reset the character's root position and rotation in Warudo.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](pose-tracking#FAQ) for common questions.

### My tracking drifts over time.

This is a common issue with inertial motion capture systems, which drift over time due to accumulated errors. To reduce the drift, make sure there are no magnetic or electrical interference near the tracking sensors.
