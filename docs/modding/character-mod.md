---
sidebar_position: 10
---

# Character Mod

You can import any character model into Warudo as long as they can be imported into Unity! This includes FBX models or [VRChat avatars](https://booth.pm/en/search/avatar?tags%5B%5D=3D+Character). Even if you are using a VRM model, there are still benefits to creating a character mod, such as adding custom shaders or better physics components such as [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) and [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144).

## Setup

### Step 1: Prepare Model

First, import the character model into the modding project. It should be a humanoid model with an [Animator](https://docs.unity3d.com/ScriptReference/Animator.html) component. If your model does not have an Animator component, go to the model import settings and set **Animation Type** to Humanoid, then click **Apply**.

![](/doc-img/en-character-mod-1.webp)

If you are using a FBX model, make sure **R/W Enabled** is checked in the model import settings.

![](/doc-img/en-character-mod-2.webp)

### Step 2: Setup Character

Place your character in the scene and select it. Select **Warudo → Setup Character...** in the menu bar. In the Setup Character window, select **Setup selected GameObject as character mod**:

![](/doc-img/en-character-mod-3.webp)

You should see a prefab named **Character** is generated in the mod folder:

![](/doc-img/en-character-mod-4.webp)

:::tip
If you notice the character's bones become twisted, please refer to the [Normalizing Bones](#normalize-bones) section.
:::

### Step 3: Export Mod

Select **Warudo → Build Mod** and make sure the generated `.warudo` file is put into the `Characters` data folder.

## Third-Party Components

You can add Unity components to your character mod as you like. Here are some commonly used components:

* [VRM](https://vrm.dev/en/univrm/) components, such as VRM Spring Bones, VRM Spring Bone Colliders
* [Animation Rigging](https://docs.unity3d.com/Packages/com.unity.animation.rigging@latest) components, such as Rotation Constraint
* [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones) (Automatically converted to Dynamic Bone at runtime)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11 ([Magica Cloth 2](https://assetstore.unity.com/packages/tools/physics/magica-cloth-2-242307) support is coming soon!)

Note that you need to import the corresponding Unity packages for Dynamic Bone and Magica Cloth, as they are not included in Warudo SDK.

Since Warudo allows you to package C# scripts into your mod, you can also use other Unity components! However, please note the limitations described in the [Custom C# Scripts](mod-sdk#custom-scripts) section.

## Animations

You may want to add custom animations to your character, such as changing hair color or flapping wings. Depending on the nature of your animation, you can use one of the following methods:

* **Animation controls human bones only:** Create a [character animation mod](character-animation-mod) and play using any character animation nodes in Warudo or Character → Overlaying Animations.
* **Animation controls material properties:** Use Warudo's character expression system (Character → Expressions).
* **Animation controls non-bone transforms:** Add an [Animator Controller](https://docs.unity3d.com/Manual/class-AnimatorController.html) to the Animator component, and use [Feline's Animator Parameter Setter Nodes](https://steamcommunity.com/sharedfiles/filedetails/?id=3005732826&searchtext=animator+) to access the Animator Controller.

:::info
If you are reusing a VRChat model, you can also just use the Animator Controller that comes with the model. However, the first 2 methods integrate better with Warudo's motion capture and animation system, thus are recommended.
:::

## Normalizing Bones {#normalize-bones}

Bone normalization refers to the process of ensuring the bones in a model have zero rotation in the T-pose. You can check if a model has normalized bones by importing it into Unity and checking 1. if the model is in the T-pose, and 2. if all bone transforms have (0, 0, 0) rotation _before_ you use Warudo SDK to set up the character. The **Setup Character** window will also warn you if the model does not have normalized bones:

![](/doc-img/en-mod-11.png)

If after the character setup, your character's bones become twisted, it is likely that the model did not have normalized bones, and Warudo SDK failed to automatically normalize the bones without breaking the model. In this case, you will need to manually normalize the bones _before_ importing the FBX model into Unity.

There are many ways to normalize bones in modeling tools such as Blender or Maya; however, the most tried-and-tested way is creating a [VRM](https://vrm.dev/en/univrm/) model from the FBX model, and then importing the VRM model into Unity. Since VRM models are guaranteed to have normalized bones, you can be sure that the bones will not be twisted after setting up the character using Warudo SDK.

If you are a Blender user and looking to manually normalize the bones, you can use the **Set Rest Pose** option from [Cats](https://github.com/absolute-quantum/cats-blender-plugin). When you export the FBX, you should use the below settings:

![](/doc-img/en-mod-15.png)
<p class="img-desc">Credit: [@Kana_Fuyuko](https://twitter.com/Kana_Fuyuko)</p>

Blender's built-in FBX exporter is known to have issues with not exporting the correct bone rotations, so if that didn't work for you, you can try using a third-party add-on such as [Better FBX Importer & Exporter](https://blendermarket.com/products/better-fbx-importer--exporter) or [Cats](https://github.com/absolute-quantum/cats-blender-plugin) to export the FBX model. 

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
