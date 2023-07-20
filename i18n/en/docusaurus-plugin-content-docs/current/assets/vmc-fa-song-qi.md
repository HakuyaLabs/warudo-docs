# VMC Sender

Send the animation data of a character to any software that supports the [VirtualMotionCapture protocol](https://protocol.vmc.info/english)!

<div className="hint hint-success">
A list of compatible programs can be found [here](https://protocol.vmc.info/Reference).
</div>

## Properties

* IP Address: To which IP address the data will be sent.
* Port: To which port the data will be sent.
* Character: Select the character whose animation data will be sent.
* Send to VirtualMotionCapture: Whether data is being sent to [VirtualMotionCapture](https://akira.works/VirtualMotionCapture-en/) (the software with the same name, not the VMC protocol). This option must be enabled due to a bug in VirtualMotionCapture when parsing animation data.
  * Calibrating (VirtualMotionCapture): Enable this option during T-Pose calibration in VirtualMotionCapture; disable it after.

<div className="hint hint-warning">
This function requires that all initial rotations of the bones in the model be 0, otherwise the data sent to other software may not be compatible. If your model is in [VRM format](https://vrm.dev/), then in most cases there should be no issue. However, in very rare cases, the modeler may not have checked the Enforce T-Pose option when exporting, and it can be fixed by re-exporting with this option checked.
</div>
