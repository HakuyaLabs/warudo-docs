---
sidebar_position: 65
---

# RhyLive

ARKit-based face and upper body tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the free [RhyLive](https://apps.apple.com/us/app/rhylive/) app. Tracks 52 ARKit blendshapes, head rotation, and hand movements.

:::info
RhyLive and iFacialMocap have similar accuracy when it comes to face tracking, but iFacialMocap is more flexible because it can track head movements, which allows the model to move more naturally. See the following comparison:

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-1.mp4" />
<p>RhyLive</p>
</div>

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-2.mp4" />
<p>iFacialMocap</p>
</div>
:::

## Setup

To use RhyLive on an iOS device, open the app and tap on the menu icon in the top left corner to enter the settings. If your computer and phone are connected to the same WiFi network, enter your computer's IP in the "IP" field and turn on the "无线" (Wireless) switch. Alternatively, you can connect your device to your computer using a USB cable and turn on the "有线" (Wired) switch ([iTunes](https://www.apple.com/itunes/) required).

![](/doc-img/zh-rhylive-1.webp)

:::tip
If you do not know your computer's IP, you can check on the configuration page of the **RhyLive Receiver** asset.

![](/doc-img/en-ifacialmocap-1.png)

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with `192.168`. For example, in the above picture, you can first try `192.168.1.151`.
:::

:::info
If you use the "Wired" option, you must open the RhyLive app, connect your iPhone to your PC before launching Warudo.
:::

It is recommended to turn off "锁定弯腰" (Lock body bending) and turn on "隐藏模型" (Hide model). The former increases the range of motion of the model, while the latter helps reduce device overheating from prolonged use.

![](/doc-img/zh-rhylive-3.webp)

## Calibration

You can calibrate RhyLive's tracking by:
* clicking **Character → Motion Capture → Quick Calibration → Calibrate RhyLive**, or
* clicking **Calibrate** in the **RhyLive Receiver** asset.

During calibration, you should look straight ahead and keep your head still. After calibration, you can move your head freely.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Face Tracking](face-tracking#FAQ) for common questions.

### I am using the "Wired" option and connected my iPhone to my computer via USB, but my character is not moving.

Make sure [iTunes for Windows](https://support.apple.com/en-us/HT210384) is installed on your computer. If you have iTunes installed from Microsoft Store, you may need to uninstall it and install the version from Apple's website.

Alternatively, you can try using the "Wireless" option instead.

### I am using the "Wireless" option and make sure my computer and iPhone are connected to the same WiFi network, but my character is not moving.

Please try to toggle off and on the "无线" (Wireless) switch in the RhyLive app, or restart the app.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
