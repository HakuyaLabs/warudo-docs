---
sidebar_position: 41
---

# Particle Mod

A particle mod is usually a [particle system](https://docs.unity3d.com/Manual/PartSysReference.html) that can be used in nodes such as **Spawn Particle**.

## Setup

### Step 1: Prepare Model

Place your particle GameObject in the scene, then adjust it to the desired position and rotation. Right click and select **Create Empty Parent** to create an empty GameObject as the root of the prop.

Enter Play Mode and move the parent GameObject around; make sure the particle system is emitting particles as expected. If not, you may need to adjust the particle system's settings, such as setting **Simulation Space** to Local instead of World.

### Step 2: Create Prefab

Select the root particle GameObject and drag it to the mod folder to create a prefab. Name the prefab **"Particle"** and make sure it is placed in the mod folder (can be placed in any subfolder).

### Step 4: Export Mod

Select **Warudo → Build Mod** and make sure the generated `.warudo` file is put into the `Particles` data folder.
