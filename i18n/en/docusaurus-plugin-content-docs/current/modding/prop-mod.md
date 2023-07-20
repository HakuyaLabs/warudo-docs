# Prop Mod

Warudo can use any Unity [prefab](https://docs.unity3d.com/Manual/Prefabs.html) as a [prop](../assets/environment.md)'s source.

## Setup

Name the prefab **"Prop"** and make sure it is placed in the mod folder (can be placed in any subfolder). Select "Warudo" -> "Build Mod," and place the generated `.warudo` file into the "Props" subfolder in the Warudo data folder.

## Character Attachment

If your prop is intended to be attached to a character (such as an accessory), you can place the `CharacterAttachmentSettings` script on the prefab to specify the default character bone to attach to.

You can also place the `CharacterAttachmentRotationConstraint` script on a prop bone to specify the character bone to which the prop bone should be rotated together with. For example, the bones of a glove should rotate together with the character's finger bones.
