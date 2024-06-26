---
sidebar_position: 70
---

# Leap Motion Controller

Hand tracking via [Leap Motion Controller](https://leap2.ultraleap.com/leap-motion-controller-2/).

## Setup

We recommend using a Leap Motion Controller 2 for more accurate and stable tracking. The original Leap Motion Controller is also supported.

To connect the Leap Motion Controller to Warudo, you need to download and install the latest Gemini software from [Leap Motion's website](https://leap2.ultraleap.com/gemini-downloads/).

Warudo supports all 3 tracking modes offered by the Leap Motion Controller: **Desktop**, **Screen Top**, and **Chest Mounted**. We recommend using the **Chest Mounted** mode along with a [neck/chest mount](https://www.etsy.com/market/leap_motion_mounting) for the best experience.

## Calibration {#Calibration}

There is generally no need to calibrate the Leap Motion Controller. However, you can adjust **Controller Position Offset**, **Controller Rotation Offset**, and **Controller Scale** in the **Leap Motion Controller** asset to adjust the tracking. A virtual Leap Motion Controller will be displayed in the scene to help you visualize the tracking.

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">Adjusting the virtual Leap Motion Controller.</p>

## Options

* **Controller Position Offset**: The offset of the controller position. Positive X is a left offset, positive Y is an upward offset, and positive Z is a forward offset.
* **Controller Rotation Offset**: The offset of the controller rotation.
* **Controller Scale**: The scale of the controller. Increase this value if you want hands to be further away from the body. You can also enable **Per-Axis Scale** to scale the controller on each axis separately.
* **Fix Finger Orientations Weight**: Due to different model specifications, the finger orientations of the Leap Motion Controller may not match the finger orientations of the model. This option allows you to adjust the finger orientations of the Leap Motion Controller to match the model. 0 means no adjustment, 1 means full adjustment. Adjust this value until the fingers look natural.
* **Shoulder Rotation Weight**: How much the shoulders should be rotated. 0 means no rotation, 1 means full rotation. Adjust this value until the shoulders look natural.

## Frequently Asked Questions {#FAQ}

Please refer to [Overview](overview#FAQ) and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### The Leap Motion Tracker asset says "Tracker not started."

Please make sure you have installed the latest [Gemini software](https://leap2.ultraleap.com/gemini-downloads/), and it is running in the background.

### My model's wrist/fingers look unnatural.

Try adjusting the **Fix Finger Orientations Weight** option in the **Leap Motion Tracker** asset. You may also need to adjust the **Wrist Rotation Offset** and **Global Finger Rotation Offset** options (check the left boxes to enable them).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />