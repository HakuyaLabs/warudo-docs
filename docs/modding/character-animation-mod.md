# Character Animation Mod

Warudo can use any Unity [AnimationClip](https://docs.unity3d.com/ScriptReference/AnimationClip.html) as a [character animation](../assets/character/#animation)'s source.

## Setup

<div className="hint hint-info">
If you have created animations using Blender or another tool and exported them as .fbx, after importing them into Unity, you need to expand the .fbx file, select the AnimationClip (indicated by a triangle icon) inside, and press Ctrl+D to create a copy.

<img src="https://user-images.githubusercontent.com/3406505/181229570-b0a1e527-10e2-4833-88e2-16e3fff92beb.png" alt="" data-size="original" />

Then, perform the following steps on the duplicated AnimationClip (in this example, the outer `AGIA_Idle_cat_01` AnimationClip indicated by a triangle icon).
</div>

Name the AnimationClip **"Animation"** and ensure that it is placed in the mod folder (can be placed in any subfolder). Select "Warudo" -> "Build Mod," and place the generated `.warudo` file into the "CharacterAnimations" subfolder in the Warudo data folder.
