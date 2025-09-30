---
sidebar_position: 60
version: 2025-09-29
---

# iFacialMocap / FaceMotion3D

ARKit-based face tracking. Requires a [Face ID](https://support.apple.com/en-us/HT208109)-compatible iOS device and the $5.99 [iFacialMocap](https://apps.apple.com/us/app/id1489470545) app. Tracks 52 ARKit blendshapes, head rotation and head translation.

An alternative to iFacialMocap is [FaceMotion3D](https://apps.apple.com/us/app/facemotion3d/id1507538005), which is $14.99 for a permanent license. It has more features than iFacialMocap, but in regard to face tracking for Warudo, the two apps are functionally equivalent.

:::tip
For best tracking quality, we recommend using an iPhone 12 or newer (iPhone mini also works). Older iPhones may have lower tracking quality.
:::

:::info
If your iPhone is not compatible with Face ID, you may still be able to use iFacialMocap / FaceMotion3D if it has an A12 or higher chip and has been updated to iOS 14. However, the tracking quality may be subpar.
:::

## Setup

:::tip
If you do not know your computer's IP, you can check on the configuration page of the **iFacialMocap Receiver** asset.

![](/doc-img/en-ifacialmocap-1.png)

If multiple IPs are listed, you would need to try each one. Usually, the IP address assigned to your computer by your WiFi router starts with `192.168`. For example, in the above picture, you can first try `192.168.1.151`.
:::

### iFacialMocap

Open the iFacialMocap app, tap on the gear icon in the upper right corner to enter the settings interface. Tap on **Destination IP address** and enter your computer's IP address.

![](/doc-img/zh-ifacialmocap-1.webp)

It's recommended to enable **Optimize for long-time streaming**, which can help reduce device overheating from prolonged use.

![](/doc-img/zh-ifacialmocap-3.webp)

### FaceMotion3D

Open the FaceMotion3D app, tap on the **Setting** icon in the lower left corner to enter the settings interface. Tap on **Streaming settings**. Set **Software Name** to **Other**, and enable **Compatible with iFacialMocap**.

Go back to the main interface, tap on the **Live** button in the upper left corner, select **Other** as the software, and enter your computer's IP address. Then, tap **Connect** to start streaming.

## Calibration

You can calibrate iFacialMocap's tracking by:
* clicking **Character → Motion Capture → Quick Calibration → Calibrate iFacialMocap**, or
* clicking **Calibrate** in the **iFacialMocap Receiver** asset.

During calibration, you should look straight ahead and keep your head still. After calibration, you can move your head freely.

## Frequently Asked Questions

Please refer to [Overview](overview#FAQ) and [Customizing Face Tracking](face-tracking#FAQ) for common questions.

If you meet any of below situations:

- Can not connect to the PC  
- iFacialmocap cannot send data to Warudo  
- The facial capture cannot move the model after using the Onboarding Assistance  
- Encountered a sudden loss of face capture  
- The iPhone device suddenly disconnects from the pc

Please check the following points in order:

1. **Admin**: Run Warudo in administrator mode
2. **Port**: Check the input port
3. **IP**: Check whether the input IP is consistent
4. **Blendshapes Naming**: Check model Blendshapes naming, make sure they contain correct naming and lower/uppercase (The model needs to have Arkit standard Blendshapes, see the following list**: https**://docs.warudo.app/docs/tutorials/3d-primer)
5. **Same Wifi**: Confirm that the mobile device and PC device use the same Wifi
6. **Private Network**: Confirm that the Private Network is used
7. **Firewall**: Add Warudo to the whitelist of the computer firewall; try to turn off the firewall and see if you can connect normally after restarting the app (if successful, please remember to re-open the firewall)
8. **App Setting**: Check that all parameters in "Allow iFacialmocap To Access" in iPhone Settings > iFacialmocap are all enabled, and manually re-enable these settings
9. **Camera Occupation**: Check whether there are other apps occupying the phone camera (such as VTubeStudio)
10. **Apple security settings**: Under the phone settings, check if the iFacialmocap/Rhylive app has full access for connection
11. **Restart**: Reopen the iFacialmocap APP multiple times
12. **iTunes**: Install iTunes on the computer and restart the APP and Warudo
13. **Expired Devices**:  iFacialmocap may cannot be used properly on some old devices (like iPhoneX). This may be because the phone system is too old, or the app cannot continue to work on this device.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
