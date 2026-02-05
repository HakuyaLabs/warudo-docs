---
sidebar_position: 40
version: 2024-06-14
---

# Prop Mod

A prop mod is any Unity [prefab](https://docs.unity3d.com/Manual/Prefabs.html) that is intended to be used as a prop in Warudo, such as a chair or a sword.

## Setup

### Step 1: Prepare Model

Import the prop model into the modding project. Place your prop in the scene, then adjust it to the desired position and rotation. Right click and select **Create Empty Parent** to create an empty GameObject as the root of the prop.

:::tip
We create an empty parent because the prop asset uses the root GameObject's transform as the prop's transform. If you don't create an empty parent, the changes you make to the prop's transform will not be preserved.
:::

### Step 2: Setup Character Attachment (Optional)

If your prop is intended to be attached to a character (such as an accessory), you can place the `CharacterAttachmentSettings` script on the prefab to specify the default character bone to attach to. This way, if the users select a character for Prop → Transform Attachment → Attach To, the prop will be automatically attached to the specified character bone, instead of the default bone (head).

You can also place the `CharacterAttachmentRotationConstraint` script on any child transform of the prop to specify the character bone to which the prop bone should be rotated together with. For example, the child transforms of a glove prop should rotate together with the character's finger bones.

### Step 3: Create Prefab

Select the root GameObject of the prop and drag it to the mod folder to create a prefab. Name the prefab **"Prop"** and make sure it is placed in the mod folder (can be placed in any subfolder).

### Step 4: Export Mod

Select **Warudo → Build Mod** and make sure the generated `.warudo` file is put into the `Props` data folder.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
