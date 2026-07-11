---
sidebar_position: 3
translate_from_version: 2024-08-28
---

# ペンディスプレイの手の同期

## はじめに

![](/doc-img/pen-display-hand-sync-9.png)

このページでは、**お絵描きやデザイン作業の配信環境を構築する**のに役立つサンプルシーンを紹介します。
Warudoワールド内で、**ペンを持ち**、**スクリーンアセット上のカーソルに完全に追従**させることができます！

<div style={{width: '100%'}} className="video-box">
<video controls loop src="/doc-img/pen-display-hand-sync-10.mp4" />
</div>
<p class="img-desc">紹介！</p>

## チュートリアル

###  ステップ1 - 準備

1. まず、以降のチュートリアルを進めるために、Steamワークショップで次のアイテムをサブスクライブする必要があります。

	| アイテム      | SteamワークショップURL                                                                   |
	|:----------- |:------------------------------------------------------------------------------------------ |
	| 環境 | [🔗 Loft Apartment](https://steamcommunity.com/sharedfiles/filedetails/?id=3033191267)        |
	| キャラクター   | [🔗 VRoid Avatar Sample A](https://steamcommunity.com/sharedfiles/filedetails/?id=3003820352) |
	| 道具 1      | [🔗 Square Grid](https://steamcommunity.com/sharedfiles/filedetails/?id=3295273541)           |
	| 道具 2      | [🔗 Drawing Tablet Set](https://steamcommunity.com/sharedfiles/filedetails/?id=3146409616)    |
	| ノード        | [🔗 Mouse Position Nodes](https://steamcommunity.com/sharedfiles/filedetails/?id=3159188937)  |

2. 次に、次のファイルをダウンロードし、`<WARUDO_DATA_FOLDER>\Scenes`フォルダーに配置する必要があります。

<ol style={{ "list-style-type": "none" }}><li>
<ul><li>
    <a
    target="_blank"
    href="/scenes/Warudo_PenDisplay_SampleScene_v20240828.json"
    download="Warudo_PenDisplay_SampleScene_v20240828.json">
      🔗 Warudo_PenDisplay_SampleScene_v20240828.json
    </a>
</li></ul>
</li></ol>

3. 次に、Warudoの`Open scene`オプションからダウンロードしたシーンを開くことができます。

:::warning[Warudo Proユーザー向け]

このチュートリアルに従うには、URP（Nilotoon）をBiRPに切り替える必要があります。
設定完了後にURPへ戻し、環境とキャラクターをURP版に置き換えることができます。

:::

### ステップ2 - ディスプレイの割り当て（マルチディスプレイユーザー向け）

1. Warudoのメインウィンドウを配置するモニターを決めます。
（**モニターA**と呼びます）
2. Warudo内に表示するモニターを決めます。
（**モニターB**と呼びます）

モニターA = モニターBの場合は**ステップ3**へ直接進めます。異なる場合は、次の手順に進みます。

3. ✨ `Mouse Position Relative To Screen`ノードの`Output Offset X/Y`値を変更し、マウスがモニターBの**左上隅**にあるときに`Output`が`(0,0)`になるようにします。

	![](/doc-img/pen-display-hand-sync-1.png)

:::tip[オフセット値の決め方]

1. マウスをモニターBの**左上隅**に移動します。
2. 現在の`Output`の❗ **反対の値** ❗を`Output Offset X/Y`に入力します。
**例:** マウスが左上隅にあるときのOutputが(1920, -1080)の場合、次のように入力します。
`Output Offset X` = `-1920`
`Output Offset Y` = `+1080`
3. もう一度✨の手順を確認します。

:::

:::warning

モニターAまたはBの選択を変更するたびに、オフセット値を再調整する必要があります。

:::

### ステップ3 - ディスプレイ解像度の入力

**モニターB**の解像度（ピクセル単位）を`Decompose Vector2`ノードに入力します。

![](/doc-img/pen-display-hand-sync-2.png)

:::note[一般的な16:9の解像度]

| サイズ  |  X   |  Y   |
|:-----:|:----:|:----:|
| 1080p | 1920 | 1080 |
|  2K   | 2560 | 1440 |
|  4K   | 3840 | 2160 |
|   ⋯   |  ⋯   |  ⋯   |

:::

### ステップ4 - ディスプレイの選択

**モニターB用のディスプレイ**を、`Prop - Drawing Screen`内の`Content` - `Display`として選択します。

![](/doc-img/pen-display-hand-sync-3.png)

### ステップ5 - （任意）アセットのカスタマイズ

:::info

**初回はこのステップをスキップすることをおすすめします。**

:::

**初心者ナビ**を使用して、自分のキャラクター、環境、モーションキャプチャを設定できます。

キャラクターとスクリーンの位置をカスタマイズすることもできます。

キャラクターによっては、キャラクターがより自然にペンを持てるよう、**`Anchor - Right Hand IK`**内の**`Transform` - `Position`**の値を調整する必要があります。

:::warning

モーションキャプチャ設定で、`Finger Movements`の振り子物理を**無効にする必要があります！**

![](/doc-img/pen-display-hand-sync-6.png)

- その他の身体関連の振り子物理（`Arm Movements`や`Body Lean`など）もオフにすることをおすすめします。

:::

### ステップ6 - マッピングのキャリブレーション

`Prop - Calibration Border`の`Scale`にある**`X`**と**`Y`**の値をそれぞれ調整します。
スクリーンが赤い枠の**内側の縁**にできるだけ正確に収まるようにしてください。

:::note

毎回スケールを調整する前に、🔗 **`Uniform Scaling`**のロックを解除する必要があります。

:::

![](/doc-img/pen-display-hand-sync-4.png)

### ステップ7 - キャリブレーション枠を隠す

最後に、`Prop - Calibration Border`アセットの`Enabled`オプションを`No`に切り替えることで、非表示にできます。

![](/doc-img/pen-display-hand-sync-5.png)

:::warning

`Prop - Calibration Border`を削除しないでください。削除すると、次回キャリブレーションできなくなります。

:::

## 注意事項

- 好みのトラッキング方法を選ぶために、モーションキャプチャアセットの**`Mirrored Tracking`**または**`Invert Hands`**を変更する必要がある場合があります。

- モニターAまたはモニターBの選択を変更する場合は、ステップ2～6を繰り返す必要があります。

- **`Prop - Drawing Screen`**の厚みを調整したり、**`Prop - Tablet`**を有効にしてスケールを調整したりすると、さらにリアルさを高められます。

## 既知の問題

### 手とペンのクリッピング

このブループリントでは**ペン先をカーソルに合わせること**を最優先しており、手IKの実装原理による制限のため、手がスクリーン中央から離れすぎると、ペンが手に完全にはフィットしない場合があります。

そのため、スクリーンのスケールを大きくしすぎないことをおすすめします。


![](/doc-img/pen-display-hand-sync-7.png)

ペンを指のボーンにバインドすればこの問題を回避できますが、ペンがカーソルに完全に追従できなくなるため、ペンディスプレイよりペンタブレットに適しています。
（このシーンは現在このモードに対応していません）

### ディスプレイが消える

Warudoメインウィンドウを終了せずに右上隅の閉じるボタンをクリックすると、スクリーンが消えます（ディスプレイのオプションリストが`null`になるためです）。

これは修正待ちのバグで、現在はWarudoを終了して再度開くことでしか解決できません。（変更内容は保存できます）


![](/doc-img/pen-display-hand-sync-8.png)

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
