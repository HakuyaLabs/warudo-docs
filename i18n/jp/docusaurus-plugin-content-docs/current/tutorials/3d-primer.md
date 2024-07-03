---
side-bar-position: 11
---

# 3D VTuber入門

以下は、3D VTuberに関するよくある質問のリストです。これらはWarudoに固有のものではありませんが、知っておくと役立ちます！

## BlendShapeとは何ですか？ {#blendshape}

BlendShapeとは、以下のように、ある位置から別の位置へ移動する頂点のセットで、3Dモデルのキャラクターアニメーション手法のひとつです。

![](/doc-img/zh-tutorials-18.gif)
<p class="img-desc">参考: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/</p>

BlendShapeの値は 0 から 1 の間です。値が 0 の場合、頂点は移動しません。値が 1 の場合、頂点は以下に示すようにターゲット位置に移動します。

![](/doc-img/zh-tutorials-19.gif)
<p class="img-desc">UnityのBlendShapeは 0～100 の値を取りますが、Warudo (およびほとんどの 3Dツール) のBlendShapeは 0～1 の値を取ることに注意してください。参考: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/</p>

モデル上のBlendShapeのリストは、モデラー (およびモデリングツール) によってまったく異なります。以下に、一般的なBlendShapeのリストをいくつか示します 。モデルによってはBlendShapeの数がこれより多い場合や少ない場合がありますので、あくまでご参考まで。

<details>

<summary>VRoid Studioモデル</summary>

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

<summary>MMDモデル</summary>

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

<summary>ARKit対応（パーフェクトシンク）モデル</summary>

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

BlendShapeを「表情」と呼ぶ人がいるかもしれません。しかし、Warudo (および[VSeeFace](https://www.vseeface.icu/)などの他のVTuberアプリ) では、表情は実際には複数のBlendShape値で構成されています。たとえば、以下に示す「泣いている」表情は、5 つのBlendShape値の特定の組み合わせです。

![](/doc-img/zh-tutorials-20.webp)
混乱を避けるために、ここではBlendShapeと表情をそれぞれの名前で呼ぶことにします。
:::

## パーフェクトシンク（ARKit BlendShape）とは何ですか？ {#arkit}

ARKit BlendShapeとは、AppleのARKitフェイストラッキングでサポートされている52個のパラメータを指します。これらのBlendShapeのリストは、[こちら](https://arkit-face-blendshapes.com/)で確認できます。これらのBlendShapeは、まばたき、笑顔、しかめ面、冷笑など、様々な顔の表情をカバーします。

2020年後半、日本の開発者[hinzka氏](https://hinzka.hatenablog.com/entry/2020/10/12/014540)は、[52個のARKit BlendShapeをあらゆるVRoidモデルに自動的に追加する](https://hinzka.hatenablog.com/entry/2020/08/15/145040)プロセスに「パーフェクトシンク」という用語を用いました。このプロセスは現在、VTuberコミュニティで広く使用されており、「パーフェクトシンク」は「ARKit BlendShape」と同じ意味で使用されていることが多いです。

モデルの表現力が大幅に向上するため、パーフェクトシンクをモデルに追加することを強くおすすめします。モデルがVRoid Studioで作成されている場合は、[HANA_Tool](https://booth.pm/en/items/2604269)を使用して パーフェクトシンクをモデルに自動的に追加できます。それ以外の場合は、BlenderやMayaなどのモデリングツールでBlendShapeを手動で追加する必要があります。

3Dモデリングに慣れていない場合は、多くのモデラーがモデルにARKit BlendShapeを追加するサービスを提供しています。モデラーを見つけるには、[Discord](https://discord.gg/warudo)でお気軽にお問い合わせください！

## シェーダーとは何ですか？ {#shader}

シェーダーは、モデルのレンダリング方法を決定します。たとえば、次の画像は異なるシェーダーでレンダリングされた同じモデルです。

![](/doc-img/en-primer-1.png)
<p class="img-desc">出典: [https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700](https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700)</p>

ほとんどの3D VTuberアプリでは、Standardシェーダーと MToonシェーダーのみがサポートされています（MToonシェーダーは、VRM モデルが使用するデフォルトのシェーダーです）。ただし、Warudoは、[lilToon](https://lilxyzw.github.io/lilToon/#/)や[Poiyomi Shader](https://www.poiyomi.com/)など、UnityのBuilt-in Render Pipeline（Legacy）と互換性のあるシェーダーをサポートしています。詳細については、[Modding](../modding/mod-sdk)セクションを参照してください。

## IK (Inverse Kinematics) とは何ですか？ {#IK}

IKは「Inverse Kinematics（逆運動学）」の略称です。これは、アニメーターが作成したアニメーションを必要とせずに「モデルの一部を回転させて目的の位置に向かわせる、または到達させること」と理解できます。以下をご覧ください。

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">出典：https://medium.com/unity3danimation/overview-of-inverse-kinematics-9769a43ba956</p>

Warudoでは、キャラクターアセットの**Body IK**および**Look At IK**オプションを調整して、キャラクターの手足がターゲット位置に追従したり、ターゲット位置を向いたりするように設定できます。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />

