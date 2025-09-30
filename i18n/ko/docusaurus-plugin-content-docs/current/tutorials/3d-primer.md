---
sidebar_position: 11
translate_from_version: 2024-12-11
---

# 3D VTubing 기초

아래는 3D VTubing에 대한 자주 묻는 질문 목록이예요. Warudo에만 국한된 내용은 아니지만, 알아두면 유용해요!

## 블렌드쉐이프(blendshape)란 무엇인가요? {#blendshape}

블렌드쉐이프는 특정 위치에서 다른 위치로 이동하는 일련의 버텍스(정점)예요. 예를 들어, 다음과 같아요:

![](/doc-img/zh-tutorials-18.gif)
<p class="img-desc">참고: DevelopPaper</p>

블렌드쉐이프의 값은 0과 1 사이예요. 값이 0일 때는 버텍스(정점)가 움직이지 않아요. 값이 1일 때는 버텍스가 목표 위치로 이동해요. 아래와 같이 보여요:

![](/doc-img/zh-tutorials-19.gif)
<p class="img-desc">Unity에서 블렌드쉐이프는 0에서 100 사이의 값을 가지지만, Warudo(그리고 대부분의 3D 도구)에서는 블렌드쉐이프가 0에서 1 사이의 값을 가져요. 참고: DevelopPaper</p>

모델의 블렌드쉐이프 목록은 전적으로 모델러(와 모델링 도구)에 달려 있어요. 아래는 일반적인 블렌드쉐이프 목록 몇 가지예요(참고용으로만 제공되며, 모델에 따라 블렌드쉐이프가 더 많거나 적을 수 있어요):

<details>

<summary>VRoid Studio 모델</summary>

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

<summary>MMD 모델</summary>

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

<summary>ARKit-compatible (Perfect Sync) 모델</summary>

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
블렌드쉐이프를 "표정"이라고 부르는 것을 들어본 적이 있을 거예요. 하지만 Warudo(또는 VTubing 앱인 [VSeeFace](https://vseeface.icu))에서는 하나의 표정이 여러 블렌드쉐이프 값으로 구성돼요. 예를 들어, 아래에 보여진 "울기" 표정은 다섯 개의 블렌드쉐이프 값의 특정 조합이예요:

![](/doc-img/zh-tutorials-20.webp)
혼동을 피하기 위해, 블렌드쉐이프와 표정은 각각의 이름으로 부르기로 할게요.
:::

## "Perfect Sync" / ARKit 블렌드쉐이프란 무엇인가요? {#arkit}

ARKit 블렌드쉐이프는 Apple의 ARKit 얼굴 추적에서 지원하는 52개의 매개변수를 말해요. 이 블렌드쉐이프 목록은 [여기](https://arkit-face-blendshapes.com/)에서 볼 수 있어요. 이 블렌드쉐이프는 눈 깜박임, 미소, 찡그림, 코웃음 등 다양한 얼굴 표정을 포함해요.

2020년 말, 일본 개발자 [hinzka](https://hinzka.hatenablog.com/entry/2020/10/12/014540)는 [VRoid 모델에 52개의 ARKit 블렌드쉐이프를 자동으로 추가](https://hinzka.hatenablog.com/entry/2020/10/12/014540)하는 과정을 "Perfect Sync"라는 용어로 처음 사용했어요. 이 과정은 이제 VTubing 커뮤니티에서 널리 사용되며, "Perfect Sync"는 종종 "ARKit 블렌드쉐이프"와 같은 의미로 사용돼요.

모델의 표현력을 크게 향상시킬 수 있기 때문에 ARKit 블렌드쉐이프를 모델에 추가하는 것을 강력히 추천해요. VRoid Studio로 모델을 만든 경우, [HANA_Tool](https://booth.pm/en/items/2604269)을 사용해 ARKit 블렌드쉐이프를 자동으로 모델에 추가할 수 있어요. 그렇지 않은 경우, Blender나 Maya와 같은 모델링 도구에서 블렌드쉐이프를 수동으로 추가해야 해요.

만약 3D 모델링에 익숙하지 않은 경우, 많은 모델러가 ARKit 블렌드쉐이프를 모델에 추가하는 서비스를 제공해요. [Discord](https://discord.gg/warudo)에서 모델러를 찾아 도움을 요청해도 괜찮아요!

## 셰이더(shader)란 무엇인가요? {#shader}

셰이더는 모델이 어떻게 렌더링되는지를 결정해요. 예를 들어, 아래 이미지는 동일한 모델이 서로 다른 셰이더로 렌더링된 모습을 보여줘요:

![](/doc-img/en-primer-1.png)
<p class="img-desc">출처: [https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700](https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700)</p>

대부분의 3D VTubing 앱에서는 Standard와 MToon 셰이더만 지원해요. (MToon 셰이더는 VRM 모델이 기본적으로 사용하는 셰이더예요.) 하지만 Warudo는 [lilToon](https://lilxyzw.github.io/lilToon/#/)과 [Poiyomi Shader](https://www.poiyomi.com/)와 같은 Unity의 내장(레거시) 렌더링 파이프라인과 호환되는 모든 셰이더를 지원해요. 자세한 내용은 [모딩](../modding/mod-sdk) 섹션을 참조해 주세요.

## 역운동학(Inverse Kinematics, IK)이란 무엇인가요? {#IK}

IK는 역운동학(Inverse Kinematics)을 의미해요. 애니메이터가 만든 애니메이션 없이 모델의 일부가 원하는 위치로 회전하거나 도달하도록 만드는 것으로 이해할 수 있어요. 아래를 참고해 주세요:

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">출처：https://medium.com/unity3danimation/overview-of-inverse-kinematics-9769a43ba956</p>

Warudo에서는 캐릭터 에셋의 **Body IK**와 **Look At IK** 옵션을 조정하여 캐릭터의 팔다리가 목표 위치를 따르거나 목표 위치를 바라보도록 할 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />

