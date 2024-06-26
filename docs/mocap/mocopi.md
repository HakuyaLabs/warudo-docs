---
sidebar_position: 80
---

# Sony Mocopi

Body tracking via [Sony Mocopi](https://electronics.sony.com/more/mocopi/all-mocopi/p/qmss1-uscx).

## Setup

Follow the [official tutorial video](https://www.sony.com/electronics/support/articles/00298063) to set up Sony Mocopi.

Then, enter the settings page on the Mocopi app. In **External device connection settings**, select **mocopi (UDP)** for **Transfer format**, and enter your computer's IP address for **IP address**.

:::tip
If you do not know your computer's IP, you can check on the configuration page of the **Mocopi Receiver** asset.

![](/doc-img/en-ifacialmocap-1.png)

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with `192.168`. For example, in the above picture, you can first try `192.168.1.151`.
:::

Go back to the main interface, tap **Motion** on the menu bar, and tap the **SAVE** icon to switch to the **SEND** mode. Tap the green send button at the bottom to start sending tracking data.

![](/doc-img/en-mocopi-1.png)

## Calibration

Calibration of Sony Mocopi is done in the Mocopi app.

## Options

* **Motion Buffering**: Whether to enable Mocopi's built-in motion buffering. This can usually be disabled because Warudo already smooths the motion data.

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