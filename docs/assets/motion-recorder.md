---
sidebar_position: 80
version: 2024-06-14
---

# Motion Recorder

The motion recorder allows you to record the character's animation and output an animation file in FBX, BVH, or Warudo's WANIM format.

## Setup

Select the **Character** that you would like to record. Select a **Target Frame Rate** and **Export Format**, and click **Start Recording** to start recording. You can press **Stop Recording** to stop recording at any time.

There are 3 export formats available:
* **FBX**: Export to FBX format containing both the character's skeleton and blendshape data.
* **BVH**: Export to BVH format containing only the character's skeleton data.
* **WANIM**: Export to Warudo's WANIM format containing the character's skeleton and blendshape data, and character expressions triggered during recording. If you only need to playback the animation in Warudo, this is the recommended format.

:::caution
Note that FBX exporting is experimental and most likely will ever work correctly on VRM models, or `.warudo` models from a FBX file without Maya-specific features (e.g., IK, constraints, etc.).
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
