---
sidebar_position: 50
---

# MediaPipe

Webcam-based upper body tracking. Advantages include a wider range of motion (e.g. forward/backward hand movements) and more responsive tracking (e.g. punches). Drawbacks include the need for some time to set up and calibrate.

:::tip
MediaPipe is a widely-used technology used in software such as [Webcam Motion Capture](https://webcammotioncapture.info/), but Warudo's implementation enables a wider range of motion and more stable hand movements.
:::

## Properties

* Character: Select the character to apply body tracking to.
* Input Camera: Select the camera. **Currently, IP cameras (such as** [**DroidCam**](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)**) are not supported.**
* Calibrate: Calibrate the position of the hands. <b style={{color: "orange"}}>**Calibration is recommended when using for the first time!**</b>

![](/doc-img/zh-mediapipe-1.webp)
<p class="img-desc">During calibration, the hands should be in a relaxed posture, with fingers slightly bent if desired.</p>

* Show Camera: Whether to show the camera's view.
* Invert Hands: Whether to invert hands.

### Advanced

* Hand Movement Range: The range of motion for the hands. X is left and right, Y is up and down, and Z is forward and backward.
* Hand Movement Offset: The offset of the hand movement range. Positive X is a left offset, positive Y is an upward offset, and positive Z is a forward offset.
* Hand Horizontal Distance Compensation: Brings the character's hands closer together, making it easier to make gestures like crossing fingers.
* Hand Y Threshold: If the distance between the wrist and the top and bottom edges of the camera view is less than this value, the tracking of that hand is ignored. This helps to avoid jitter problems caused by unstable tracking.
* Camera Diagonal Field of View: The FoV of the camera. An accurate value helps to estimate the depth of the hands. You can usually find the field of view listed by the manufacturer on the camera's store page.
* Camera Aspect Ratio: Like the FoV, an accurate value helps to estimate the depth of the hands. Most cameras on the market are 16:9.
* Hand Push Z Max: The hands will be pushed forward to prevent clipping through the body. This value determines the maximum distance that the hands will be pushed forward.
* Hand Push Y Range: The further down the hands are from the shoulders, the more they will be pushed forward. When the vertical distance from the hands to the shoulders is greater than or equal to this value, they will be pushed forward to the maximum.
* Hand Push Y Offset: When this value is 0, the hands start to be pushed forward from the shoulders down. When this value is positive, the hands start to be pushed forward from above the shoulders.
* Hand Calibration Distance: The calibration parameters set when pressing "Calibrate". Should not be adjusted manually.&#x20;
* Shoulder Rotation Correction: Adjusts the rotation of the shoulders to accommodate rotations of the chest and/or head in certain poses.

<div>

![](/doc-img/zh-mediapipe-2.webp)
<p class="img-desc">"Shoulder Rotation Correction" disabled</p>


 ![](/doc-img/zh-mediapipe-3.webp)
<p class="img-desc">启用「肩膀旋转校正」</p>
</div>

## **Tips**

* It is recommended to place the camera above the computer screen, with your head slightly above the center of the camera view.
* The tracker window (MediaPipe Tracker) must not be minimized or the motion capture will stop working! (It can be behind other windows as long as it is not minimized to the taskbar.)&#x20;
* Tracking both hands is much more stable than tracking one hand.
