---
sidebar_position: 50
---

# MediaPipe

Webcam-based face and hand tracking. For face tracking, MediaPipe tracks 40+ ARKit blendshapes, head rotation and head translation. For pose tracking, MediaPipe tracks your wrist and fingers.

## Setup

MediaPipe is built into Warudo, so you do not need to install any additional software. Most webcams should work with MediaPipe, but if you have trouble getting it to work, refer to the [FAQ](#FAQ) section below.

MediaPipe can be run either on CPU or GPU. GPU is recommended for better performance; by default, MediaPipe already runs on GPU. To use CPU instead, go to the **MediaPipe Tracker** asset and disable **GPU Acceleration**.

:::tip
When to use CPU? If you are playing a game that uses a lot of GPU resources, you may want to use CPU for MediaPipe instead to avoid performance issues.
:::

If you use MediaPipe for hand tracking, please make sure you are at the camera center and your hands are fully visible in the camera view. You can enable **Show Camera** in the **MediaPipe Tracker** asset to see the camera view; it should look like this:

![](/doc-img/en-mediapipe-1.png)

Usually, you should place the camera above the computer screen, with your head slightly above the center of the camera view. We also recommend calibrating hand tracking before use. See [Calibration](#Calibration) for details.

## Calibration {#Calibration}

### Face Tracking

You can calibrate MediaPipe's face tracking by:
* clicking **Character → Motion Capture → Quick Calibration → Calibrate MediaPipe**, or
* clicking **Calibrate** in the **MediaPipe Tracker** asset.

During calibration, you should look straight ahead and keep your head still. After calibration, you can move your head freely.

### Hand Tracking

You can calibrate MediaPipe's hand tracking by clicking **Calibrate Hand Tracking** in the **MediaPipe Tracker** asset. Raise one of your hands next to your ear with your palm facing the camera. Use your other hand to press **OK** to calibrate.

![](/doc-img/en-mediapipe-2.png)
<p class="img-desc">During calibration, the hands should be in a relaxed posture with palm facing the camera, with fingers slightly bent if desired.</p>

If you find your hands are moving too fast or too slow, you can adjust the **Hand Movement Range** option. You can also adjust the **Hand Movement Offset** option, to move the hands closer to your head, for example.

## Options

* **Hand Movement Range**: The range of motion for the hands. X is left and right, Y is up and down, and Z is forward and backward.
* **Hand Movement Offset**: The offset of the hand movement range. Positive X is a left offset, positive Y is an upward offset, and positive Z is a forward offset.
* **Arm Swivel Offset**: Rotates the elbow inwards or outwards.
* **Hand Horizontal Distance Compensation**: Brings the character's hands closer together, making it easier to make gestures like crossing fingers.
* **Hand Y Threshold**: If the distance between the wrist and the top and bottom edges of the camera view is less than this value, the tracking of that hand is ignored. This helps to avoid jitter problems caused by unstable tracking.
* **Camera Diagonal Field of View**: The field of view of the camera. An accurate value helps to estimate the depth of the hands. You can usually find the field of view listed by the manufacturer on the camera's store page.
* **Hand Push Z Max**: The hands will be pushed forward to prevent clipping through the body. This value determines the maximum distance that the hands will be pushed forward.
* **Hand Push Y Range**: The further down the hands are from the shoulders, the more they will be pushed forward. When the vertical distance from the hands to the shoulders is greater than or equal to this value, they will be pushed forward to the maximum.
* **Hand Push Y Offset**: When this value is 0, the hands start to be pushed forward from the shoulders down. When this value is positive, the hands start to be pushed forward from above the shoulders.
* **Shoulder Rotation Weight**: How much the shoulders should be rotated. 0 means no rotation, 1 means full rotation. Adjust this value until the shoulders look natural.

## Frequently Asked Questions {#FAQ}

Please refer to [Overview](overview#FAQ), [Customizing Face Tracking](face-tracking#FAQ), and [Customizing Pose Tracking](body-tracking#FAQ) for common questions.

### My MediaPipe tracker window is black / stuck at "Loading...".

Some webcams are only supported when **GPU Acceleration** is enabled (e.g., IP cameras such as [DroidCam](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)), while some are only supported when **GPU Acceleration** is disabled. You can try toggling **GPU Acceleration** in the **MediaPipe Tracker** asset to see if it fixes the issue.

Additionally, some antivirus software may block Warudo from accessing the camera. Please disable the camera protection function of your antivirus software, or add Warudo to the whitelist.

### I cannot puff my cheeks / stick out my tongue.

This is a known limitation of MediaPipe; we are waiting for Google to [fix it](https://github.com/google/mediapipe/issues/4403).

### My tracking is jittery.

First, make sure your webcam is actually running at 30+ FPS. You can use [this website](https://webcamtests.com/fps) to check your webcam's FPS. If your webcam is running at a low FPS, your room may be too dark; make sure your room is well-lit.

If your webcam is running at 30+ FPS, but the tracker window shows a much lower FPS, try toggling **GPU Acceleration** in the **MediaPipe Tracker** asset.

:::tip
The tracking FPS is usually between 15-30. When you are playing a 3D game, the tracking FPS may drop to ~10.
:::

### My tracking has frozen.

If you are using a laptop, make sure it is plugged in and not running on battery.

### Should I use MediaPipe or [Leap Motion](leap-motion.md) for hand tracking?

We generally recommend to use a Leap Motion Controller 2 with a neck/chest mount for hand tracking, if you have the budget. Leap Motion tracking is generally more stable and uses less CPU/GPU resources than MediaPipe, especially when you are playing a 3D game.

We do not recommend Leap Motion Controller 1 which tends to lose tracking easily.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
