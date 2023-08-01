# VMC

Tracking via an external application, which sends data to Warudo via the [VirtualMotionCapture protocol](https://protocol.vmc.info/english).&#x20;

## Setup

The following example demonstrates how to apply VMC data to the character using [VSeeFace](https://www.vseeface.icu/). Other software that supports VMC can be configured in a similar manner.

Click on the settings in the upper right corner -> General settings, make sure "OSC/VMC Protocol" -> "Send datawith OSC/VMC protocol" is checked. The default IP is the localhost IP(127.0.0.1); the default port 39539 is also the default port that Warudo's VMC receiver uses, so if you want to send the motion capture data from VSeeFace to Warudo running on the same computer, you are already done!

<figure><img src="/images/image(9)(1)(2).jpg" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-warning">
This function requires that all initial rotations of the bones in the model be 0, otherwise the data sent to other software may not be compatible. If your model is in [VRM format](https://vrm.dev/), then in most cases there should be no issue. However, in very rare cases, the modeler may not have checked the Enforce T-Pose option when exporting, and it can be fixed by re-exporting with this option checked.
</div>

## Properties

* Port: The port that Warudo uses to receive data.
