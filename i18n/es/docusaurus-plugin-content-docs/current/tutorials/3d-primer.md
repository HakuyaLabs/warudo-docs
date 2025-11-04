---
sidebar_position: 30
translate_from_version: 2024-12-11
---

# 3D VTubing para Novatos

A continuación hay una lista de preguntas frecuentes sobre 3D VTubing; no son específicas de Warudo, ¡pero aún son útiles de saber!

## ¿Qué es un blendshape? {#blendshape}

Un blendshape es un conjunto de vértices que se mueven de una posición a otra, como se muestra a continuación:

![](/doc-img/zh-tutorials-18.gif)
<p class="img-desc">Referencia: DevelopPaper</p>

El valor de un blendshape está entre 0 y 1. Cuando el valor es 0, los vértices no se mueven. Cuando el valor es 1, los vértices se mueven a la posición objetivo, como se muestra abajo:

![](/doc-img/zh-tutorials-19.gif)
<p class="img-desc">Nota que los blendshapes en Unity toman valores de 0-100, pero en Warudo (y la mayoría de herramientas 3D) los blendshapes toman valores de 0-1. Referencia: DevelopPaper</p>

La lista de blendshapes en un modelo depende completamente del modelador (y la herramienta de modelado). A continuación hay algunas listas de blendshapes comunes (solo para referencia; tu modelo puede tener más o menos blendshapes):

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
Puede que hayas escuchado a otros referirse a los blendshapes como "expresiones". Sin embargo, en Warudo (así como en otras aplicaciones de VTubing como [VSeeFace](https://vseeface.icu)), una expresión en realidad consiste en múltiples valores de blendshape. Por ejemplo, la expresión de "llorar" mostrada abajo es una combinación específica de cinco valores de blendshape:

![](/doc-img/zh-tutorials-20.webp)
Para evitar confusión, nos mantendremos refiriéndonos a los blendshapes y expresiones por sus nombres respectivos.
:::

## ¿Qué son los blendshapes "Perfect Sync" / ARKit? {#arkit}

Los blendshapes ARKit se refieren a los 52 parámetros que son soportados por el seguimiento facial ARKit de Apple. Puedes ver una lista de estos blendshapes [aquí](https://arkit-face-blendshapes.com/). Estos blendshapes cubren una amplia gama de expresiones faciales: parpadear, sonreír, fruncir el ceño, despreciar, etc.

A finales de 2020, el desarrollador japonés [hinzka](https://hinzka.hatenablog.com/entry/2020/10/12/014540) acuñó el término "Perfect Sync" para el proceso de [agregar automáticamente los 52 blendshapes ARKit a cualquier modelo VRoid](https://hinzka.hatenablog.com/entry/2020/10/12/014540). Este proceso ahora se usa ampliamente en la comunidad VTubing, y "Perfect Sync" se usa a menudo de manera intercambiable con "blendshapes ARKit".

Recomendamos altamente agregar blendshapes ARKit a tu modelo, ya que mejora enormemente la expresividad de tu modelo. Si tu modelo fue creado con VRoid Studio, puedes usar [HANA_Tool](https://booth.pm/en/items/2604269) para agregar automáticamente blendshapes ARKit a tu modelo. De lo contrario, necesitarás agregar manualmente los blendshapes en herramientas de modelado como Blender o Maya.

Si no estás familiarizado con el modelado 3D, muchos modeladores ofrecen el servicio de agregar blendshapes ARKit a tu modelo. ¡Siéntete libre de preguntar en nuestro [Discord](https://discord.gg/warudo) para encontrar un modelador!

## ¿Qué es un shader? {#shader}

Un shader determina cómo se renderiza un modelo. Por ejemplo, la siguiente imagen muestra el mismo modelo renderizado con diferentes shaders:

![](/doc-img/en-primer-1.png)
<p class="img-desc">Fuente: [https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700](https://bibinbaleo.hatenablog.com/entry/2018/09/14/183700)</p>

En la mayoría de aplicaciones de VTubing 3D, solo se soportan los shaders Standard y MToon. (El shader MToon es el shader predeterminado que usan los modelos VRM.) Sin embargo, Warudo soporta cualquier shader que sea compatible con el pipeline de renderizado integrado (legacy) de Unity, como [lilToon](https://lilxyzw.github.io/lilToon/#/) y [Poiyomi Shader](https://www.poiyomi.com/). Para más información, por favor consulta la sección [Modding](../modding/mod-sdk).

## ¿Qué es la Cinemática Inversa (IK)? {#IK}

IK significa Inverse Kinematics (Cinemática Inversa). Se puede entender como "hacer que una parte del modelo rote hacia, o alcance una posición deseada", sin requerir una animación hecha por un animador. Ve abajo:

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">Fuente：https://medium.com/unity3danimation/overview-of-inverse-kinematics-9769a43ba956</p>

En Warudo, puedes ajustar las opciones **Body IK** y **Look At IK** del asset de personaje para hacer que las extremidades del personaje sigan una posición objetivo o miren hacia una posición objetivo.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />

