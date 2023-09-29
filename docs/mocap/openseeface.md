---
sidebar_position: 60
---

# OpenSeeFace (Beta)

Webcam-based face tracking. Tracks a set of basic blendshapes, head rotation and head translation. Quality of face tracking is similar to that of [VSeeFace](https://www.vseeface.icu/).

<div className="hint hint-info">
OpenSeeFace is the face tracking technology used in [VSeeFace](https://www.vseeface.icu/), so users familiar with VSeeFace may find it quite familiar. The overall tracking quality is also similar, although winking is not as stable as VSeeFace at the moment.
</div>

## Properties

* Character: Select the character to apply face tracking to.
* Input Camera: Select the camera. **Currently, IP cameras (such as** [**DroidCam**](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)**) are not supported.**
* Calibrate: Correct the position and rotation of the head to face forward.
* Head Movement Range: The range of head movement up, down, left, right, and forward.&#x20;
* Head Rotation Range: The range of rotation for the head.
* Head Rotation Offset: The offset of rotation for the head.
* Head Vertical Movement: Whether or not to allow the head to move up and down.
* Eye Movement Intensity: The intensity of eye movement. X is the horizontal intensity, Y is the vertical intensity.
* Linked Eye Blinking: Whether to force blinking both eyes at the same time. Recommended if you notice blink tracking is not very stable.

### Advanced

* Eye Blinking Offset: If you find the model's eyes are not fully closing, add 0.1 to the value until fit. Otherwise, subtract 0.1 from the value.&#x20;
* Eye Wide Sensitivity: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the EyeWideLeft/EyeWideRight blendshapes easier to trigger.
* Eyebrow Movement Sensitivity: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the eyebrow-related blendshapes easier to trigger.
* Mouth Left Right Sensitivity: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the MouthLeft/MouthRight blendshapes easier to trigger.
* Mouth Open Threshold: If you find the model's mouth opens too easily, add 0.1 to the value until fit. Otherwise, subtract 0.1 from the value.
* Mouth Open Sensitivity: Increasing this value makes the JawOpen blendshape (or the "A" VRM animation clip) easier to trigger.
* Mouth Funnel Sensitivity: Increasing this value makes the MouthFunnel blendshape (or the "O" VRM animation clip)  easier to trigger.
* Mouth Smile Sensitivity: **Requires ARKit blendshapes to be present on the model.** Increasing this value makes the MouthSmileLeft/MouthSmileRight blendshapes easier to trigger.
* Body Movement Intensity: The range of natural body movement that follows head movement.

## Tips

* After OpenSeeFace tracker is started, it takes 10-15 seconds for internal calibration. During this time, the model's mouth and eyes may move randomly, which is normal.
