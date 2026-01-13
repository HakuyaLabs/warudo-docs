---
sidebar_position: 30
version: 2024-06-14
---

# Customizing Pose Tracking

## Blueprint Customization

During the onboarding process, you can click **Customize Pose Tracking...** to customize the tracking blueprint.

![](/doc-img/en-mocap-4.png)
<p class="img-desc">Customizing pose tracking.</p>

### Upper Body Trackers

For upper body trackers (e.g., MediaPipe, RhyLive, Leap Motion Controller), the following options are available:

* **Use Keyboard/Trackpad:** Whether to generate animations for the character using a keyboard or trackpad, even when the hands are not tracked.
  
  ![](/doc-img/zh-keyboard-1.webp)
  
  After onboarding, you can adjust the keyboard/touchpad settings by clicking **Character → Motion Capture → Blueprint Navigation → Input Interfaces Animation Settings**.
  
  The keyboard and touchpad can be turned off separately by disabling either asset:
  
  ![](/doc-img/zh-keyboard-3.webp)
  :::danger
  When the keyboard is enabled, please avoid entering sensitive information such as passwords.
  :::
* **Track Fingers Only:** If enabled, only the fingers will be tracked by this tracking system. This is useful if you are using a full-body pose tracking system that already tracks the hands.

### Full Body Trackers

For full body trackers, the following options are available:

* **Track Full Body / Tracked Body Parts:** If **Track Full Body** is set to **No**, only the body parts that are selected in **Track Full Body** will be tracked by this tracking system. This is useful if you are using multiple full-body pose tracking systems, and want to use different systems to track different body parts.

## Tracker Customization

After onboarding, you can go to the corresponding pose tracking asset (e.g., MediaPipe Tracker, VMC Receiver) to customize the tracking data itself. The following options are available:

* **Mirrored Tracking:** If enabled, Warudo will mirror the tracking data.
* **Head Rotation Intensity/Offset:** Adjust the intensity and offset of the head rotation.

## Frequently Asked Questions {#FAQ}

### How can I combine multiple pose tracking systems?

If you want to set up a secondary pose tracking, you can use the **Secondary Pose Tracking** option during the onboarding process; this is helpful if you are using VR trackers/Mocopi for primary tracking and would like to use [MediaPipe](../mocap/mediapipe.md) or [Leap Motion Controller](../mocap/leap-motion.md) or [StretchSense Gloves](../mocap/stretchsense.md) for added-on finger tracking.

![](/doc-img/en-getting-started-8.png)
<p class="img-desc">Setting up secondary pose tracking.</p>

If you want to combine more than two pose tracking systems, you can set up the primary pose tracking first using the onboarding assistant, and then set up the subsequent pose tracking systems using **Character → Setup Motion Capture** with **Track Full Body** set to **No** and **Tracked Body Parts** set to the specific body parts you want to track with that system.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
