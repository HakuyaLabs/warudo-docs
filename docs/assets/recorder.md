---
sidebar_position: 100
---

# Recorder (Export FBX/BVH)

Record the character's animation and output an animation file in FBX or BVH format.

## Properties

* Character: The character whose animation data is to be recorded.
* Target Frame Rate: The frames per second in the recorded animation. Note that this will also limit the render FPS.
* Export Format: FBX / BVH.
  * FBX Format:
    * Record BlendShapes: Whether to export blendshape data.
  * BVH Format:
    * Export to Blender: BVH file will have the Z axis as up and the Y axis as forward instead of the normal BVH conventions. From Blender 3.0, it is no longer necessary to enable this option to correctly import BVH.
    * Enforce Humanoid Bones: Whether to only export [Unity Humanoid](https://docs.unity3d.com/Manual/AvatarCreationandSetup.html) bones.
* Output Filename: The name of the exported animation file.
