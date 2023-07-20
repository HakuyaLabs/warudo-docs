# Character Mod

Warudo can use any Unity humanoid rig as a [character](../assets/character/)'s source.

<div className="hint hint-info">
If your model is not set to humanoid rig, go to the model import options in Unity and set the model's "Animation Type" to Humanoid, then click Apply.

<img src="https://user-images.githubusercontent.com/3406505/181214148-1af8aea4-d1ea-43b3-9ff2-3ae2de54fd92.png" alt="" data-size="original" />
</div>

Warudo is compatible with the following components:

* [VRM](https://vrm.dev/en/univrm/) compnents
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones) (Automatically converted to Dynamic Bones at runtime)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11

<div className="hint hint-success">
Since Warudo allows you to package C# scripts into your mod, you can add any third-party components as you like; but be aware of certain [limitations](https://tira.gitbook.io/warudo/advanced/mod-sdk).
</div>

## Prerequisites

1. If you have an imported model (such as a FBX model), make sure "R/W Enabled" is checked in the import settings.

![](</images/image(49).png>)

2\. You must put an [Animator](https://docs.unity3d.com/ScriptReference/Animator.html) on your character GameObject. If you imported a FBX or VRM, it should already have it.

## Automatic Setup (Recommended)

Place your character in the scene and select it. Select "Warudo" -> "Setup Character..." -> "Setup selected GameObject as character mod."

<img src="/images/image(48).png" alt="" data-size="original" />

Wait for a little bit, and you should see a prefab named **"Character"** is generated in the mod folder:

![](https://user-images.githubusercontent.com/3406505/181228083-83ebe786-c7d4-4e24-8021-8dddeb95505b.png)

Select "Warudo" -> "Build Mod" and place the generated `.warudo` file into the Characters subfolder in the Warudo data folder.

## Manual Setup

In case the automatic setup fails for some reason (e.g., bones become twisted), you can still create a new character mod manually by naming any character prefab as **"Character"** and placing it in the mod folder (can also be placed in a subfolder). Then, select "Warudo" -> "Build Mod" and place the generated `.warudo` file into the Characters subfolder in the Warudo data folder.

<div className="hint hint-info">
If you do the manual setup and your character uses [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144), it is essential to ensure that the model's skeleton is in the T-pose and all bone rotations are 0 before importing it into Unity. Failure to do so will cause Magica Cloth to malfunction in Warudo.
</div>
