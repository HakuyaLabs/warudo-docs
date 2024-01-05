---
sidebar_position: 11
---

# Character Animation Mod

Have some [Animation Clips](https://docs.unity3d.com/Manual/AnimationClips.html) that you want to use in Warudo? A character animation mod is what you need!

:::caution
If you have an animation that animates non-bone transforms or material properties, you should consider other methods of adding these animations to your character. See [Character Mod](character-mod#animations) for details.
:::

## Setup

### Step 1: Prepare Animation Clip

If you already have an **Animation Clip** (indicated by a cyan triangle icon) in your project, great! You can skip this step.

If your animation is a FBX file, first make sure **Animation Type** is set to Humanoid in the rig import settings:

![](pathname:///doc-img/en-mod-14.png)

Then, expand the FBX file, select the inner **Animation Clip** (indicated by a cyan triangle icon), and press Ctrl+D to create a copy that is outside the FBX file.

![](pathname:///doc-img/en-character-animation-mod-1.webp)

### Step 2: Rename Animation Clip

Rename the Animation Clip to **"Animation"**, and make sure it is placed in the mod folder (can be placed in any subfolder).

### Step 3: Export Mod

Select **Warudo → Build Mod** and make sure the generated `.warudo` file is put into the `CharacterAnimations` data folder.
