---
side-bar-position: 11
---

# 3D VTubing Primer

Below is a list of frequently asked questions about 3D VTubing; they are not specific to Warudo, but are still useful to know!

## What is a blendshape? {#blendshape}

A blendshape is a set of vertices moving from one position to another, like the following:

![](/doc-img/zh-tutorials-18.gif)
<p class="img-desc">Reference: DevelopPaper</p>

A blendshape's value is between 0 and 1. When the value is 0, the vertices do not move. When the value is 1, the vertices move to the target position, as shown below:

![](/doc-img/zh-tutorials-19.gif)
<p class="img-desc">Note that blendshapes in Unity takes values from 0-100, but in Warudo (and most 3D tools) blendshapes take values from 0-1. Reference: DevelopPaper</p>

The list of blendshapes on a model is entirely up to the modeler (and the modeling tool). Below are a few lists of common blendshapes (for reference only; your model may have more or fewer blendshapes):

<details>

<summary>VRoid Studio models</summary>

* Fcl\_ALL\_Neutral
* Fcl\_ALL\_Angry
* Fcl\_ALL\_Fun
* Fcl\_ALL\_Joy
* Fcl\_ALL\_Sorrow
* Fcl\_ALL\_Surprised
* Fcl\_BRW\_Angry
* Fcl\_BRW\_Fun
* Fcl\_BRW\_Joy
* Fcl\_BRW\_Sorrow
* Fcl\_BRW\_Surprised
* Fcl\_EYE\_Natural
* Fcl\_EYE\_Angry
* Fcl\_EYE\_Close
* Fcl\_EYE\_Close\_R
* Fcl\_EYE\_Close\_L
* Fcl\_EYE\_Fun
* Fcl\_EYE\_Joy
* Fcl\_EYE\_Joy\_R
* Fcl\_EYE\_Joy\_L
* Fcl\_EYE\_Sorrow
* Fcl\_EYE\_Surprised
* Fcl\_EYE\_Spread
* Fcl\_EYE\_Iris\_Hide
* Fcl\_EYE\_Highlight\_Hide
* Fcl\_MTH\_Close
* Fcl\_MTH\_Up
* Fcl\_MTH\_Down
* Fcl\_MTH\_Angry
* Fcl\_MTH\_Small
* Fcl\_MTH\_Large
* Fcl\_MTH\_Neutral
* Fcl\_MTH\_Fun
* Fcl\_MTH\_Joy
* Fcl\_MTH\_Sorrow
* Fcl\_MTH\_Surprised
* Fcl\_MTH\_SkinFung
* Fcl\_MTH\_SkinFung\_R
* Fcl\_MTH\_SkinFung\_L
* Fcl\_MTH\_A
* Fcl\_MTH\_I
* Fcl\_MTH\_U
* Fcl\_MTH\_E
* Fcl\_MTH\_O
* Fcl\_HA\_Hide
* Fcl\_HA\_Fung1
* Fcl\_HA\_Fung1\_Low
* Fcl\_HA\_Fung1\_Up
* Fcl\_HA\_Fung2
* Fcl\_HA\_Fung2\_Low
* Fcl\_HA\_Fung2\_Up
* Fcl\_HA\_Fung3
* Fcl\_HA\_Fung3\_Up
* Fcl\_HA\_Fung3\_Low
* Fcl\_HA\_Short
* Fcl\_HA\_Short\_Up
* Fcl\_HA\_Short\_Low

</details>

<details>

<summary>MMD models</summary>

* 真面目
* 困る
* にこり
* 怒り
* 上
* 下
* まばたき
* 笑い
* ウィンク
* ウィンク２
* ウィンク右
* ｳｨﾝｸ２右
* はぅ
* なごみ
* びっくり
* じと目
* なぬ！
* 瞳小
* 瞳縦
* 瞳縦潰れ
* びっくり
* への字
* 恐ろしい子！
* カメラ目
* はちゅ目
* 星目
* はぁと
* 涙
* 猫目
* 瞳全消し
* あ
* い
* う
* お
* ▲
* ∧
* ω
* ω□
* はんっ！
* ぺろっ
* えー
* にやり
* ぎゃーす
* がーん
* ギギギ,
* あ２
* ああ
* いい
* おお
* 青ざめ
* д
* 八重歯左
* 八重歯右
* ワ
* 口角上げ
* 口角下げ
* 口横広げ
* 口横狭め
* 頬染め
* 照れ
* 赤面

</details>

<details>

<summary>ARKit-compatible (Perfect Sync) models</summary>

* eyeBlinkLeft
* eyeLookDownLeft
* eyeLookInLeft
* eyeLookOutLeft
* eyeLookUpLeft
* eyeSquintLeft
* eyeWideLeft
* eyeBlinkRight
* eyeLookDownRight
* eyeLookInRight
* eyeLookOutRight
* eyeLookUpRight
* eyeSquintRight
* eyeWideRight
* jawForward
* jawLeft
* jawRight
* jawOpen
* mouthClose
* mouthFunnel
* mouthPucker
* mouthLeft
* mouthRight
* mouthSmileLeft
* mouthSmileRight
* mouthFrownLeft
* mouthFrownRight
* mouthDimpleLeft
* mouthDimpleRight
* mouthStretchLeft
* mouthStretchRight
* mouthRollLower
* mouthRollUpper
* mouthShrugLower
* mouthShrugUpper
* mouthPressLeft
* mouthPressRight
* mouthLowerDownLeft
* mouthLowerDownRight
* mouthUpperUpLeft
* mouthUpperUpRight
* browDownLeft
* browDownRight
* browInnerUp
* browOuterUpLeft
* browOuterUpRight
* cheekPuff
* cheekSquintLeft
* cheekSquintRight
* noseSneerLeft
* noseSneerRight
* tongueOut

</details>

:::caution
You may have heard others refer to blendshapes as "expressions." However, in Warudo (as well as other VTubing apps such as [VSeeFace](https://vseeface.icu)), an expression actually consists of multiple blendshape values. For example, the "crying" expression shown below is a specific combination of five blendshape values:

![](/doc-img/zh-tutorials-20.webp)
To avoid confusion, we will stick to referring blendshapes and expressions by their respective names.
:::

## What are "Perfect Sync" / ARKit blendshapes? {#arkit}

ARKit blendshapes refer to the 52 parameters that are supported by Apple's ARKit face tracking. You can view a list of these blendshapes [here](https://arkit-face-blendshapes.com/). These blendshapes cover a wide range of facial expressions: blinking, smiling, frowning, sneering, etc.

In late 2020, Japanese developer [hinzka](https://hinzka.hatenablog.com/entry/2020/10/12/014540) coined the term "Perfect Sync" for the process of [automatically adding the 52 ARKit blendshapes to any VRoid model](https://hinzka.hatenablog.com/entry/2020/10/12/014540). This process is now widely used in the VTubing community, and "Perfect Sync" is often used interchangeably with "ARKit blendshapes."

We highly recommend adding ARKit blendshapes to your model, as it greatly improves the expressiveness of your model. If your model is created with VRoid Studio, you can use [HANA_Tool](https://booth.pm/en/items/2604269) to automatically add ARKit blendshapes to your model. Otherwise, you will need to manually add the blendshapes in modeling tools such as Blender or Maya.

If you are not familiar with 3D modeling, many modelers offer the service to add ARKit blendshapes to your model. Feel free to ask in our [Discord](https://discord.gg/warudo) to find a modeler!

## What is a shader? {#shader}

A shader determines how a model is rendered. For example, the following image shows the same model rendered with different shaders:

![](/doc-img/en-primer-1.png)
<p class="img-desc">Source: [https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700](https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700)</p>

In most 3D VTubing apps, only the Standard and MToon shaders are supported. (MToon shader is the default shader that VRM models use.) However, Warudo supports any shader that is compatible with Unity's built-in (legacy) rendering pipeline, such as [lilToon](https://lilxyzw.github.io/lilToon/#/) and [Poiyomi Shader](https://www.poiyomi.com/). For more information, please refer to the [Modding](../modding/mod-sdk) section.

## What is Inverse Kinematics (IK)? {#IK}

IK stands for Inverse Kinematics. It can be understood as "making a part of the model rotate towards, or reach a desired position", without requiring an animation made by an animator. See below:

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">Source：https://medium.com/unity3danimation/overview-of-inverse-kinematics-9769a43ba956</p>

In Warudo, you can adjust the character asset's **Body IK** and **Look At IK** options to make the character's limbs follow a target position or look at a target position.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />

