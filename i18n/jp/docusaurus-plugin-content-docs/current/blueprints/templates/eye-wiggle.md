---
sidebar_position: 30
---

# Live2Dの目のwiggle

:::caution

Warudo 0.12.3以降では、このブループリントは不要になりました。代わりに、Pendulum Physicsを使用して目の揺れを設定することをおすすめします。詳しくは[Pendulum Physics](../../mocap/pendulum-physics)を参照してください。
:::

目のwiggleは、キャラクターの目をより生き生きと見せるために、Live2Dモデルでよく使われるエフェクトです。このブループリントを使用すると、この人気のある効果を3Dモデルに追加することができます！

<div style={{width: '100%'}} className="video-box"><video controls loop src="/jp/doc-img/eye-wiggle.mp4" /></div>
<p class="img-desc">Live2Dのような目のwiggleの物理演算！</p>

## 前提条件

3Dモデルにwiggle目を加えるには、目のハイライトと瞳を分離するBlendShapeを用意する必要があります：

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832935-946222b5-e9a3-4efa-b9dc-7bdd04b9a3f2.mp4" /></div>
<p class="img-desc"></p>

:::tip
VRoidモデルをお持ちの方は、[HANA_Tool](https://booth.pm/en/items/2604269)で追加できる[頼鳥ミドリ (@yoridrill)](https://twitter.com/yoridrill)氏のBlendShapeデータをご利用ください。詳細は[こちらのブログ記事](https://note.com/yoridrill/n/nfc15a0760a26)をご参照ください。
:::

このブループリントでは、以下の6つのBlendShapeを想定しています：

* `highlight_down_left`: 左目のハイライトが下に移動
* `highlight_down_right`: 右目のハイライトが下に移動
* `highlight_rotate_left`: 左目のハイライトが反時計回りに回転
* `highlight_rotate_right`: 右目のハイライトが反時計回りに回転
* `highlight_scale_left`: 左目のハイライトが拡大
* `highlight_scale_right`: 右目のハイライトが拡大

BlendShapeの名前が異なる場合は、それに応じてブループリントを修正することができます。

最後に、キャラクターのフェイストラッキングをすでに設定している必要があります。

## 設定

以下のブループリントをダウンロードしてシーンにインポートしてください。

<a href="/blueprints/eye-wiggle.json" target="_blank" download>
<div className="file-box">
<p>
eye-wiggle.json
</p></div>
</a>

このブループリントはインポートしてそのまま使えるはずです。 **「コメント」** ノードの指示に従って設定を調整してください。

:::tip
別のキャラクターアセットを作成した場合は、ノードの**キャラクター**オプションを更新する必要があります。
:::

## 備考

「**Float Pendulum Physics**」ノードは、[Live2Dの物理シミュレーション](https://docs.live2d.com/en/cubism-editor-manual/physics-operation/)と同じ原理で動作します。 複数セグメントの振り子を指定すると（下図参照）、振り子の最上部のノードの X 座標が入力値として使用され、振り子の最下部のノードの X 座標が出力値として使用されます。 **Arms**オプションは、振り子の各セグメントの長さと物理的特性を決定します。

<div className="video-box"><video loop controls src="/jp/doc-img/zh-blueprint-example-live2d-physics-video-4.mp4" />
</div>
<p class="img-desc">出典：<a href="https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/" target="_blank">https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/</a></p>

**Visualize**をYesに設定することで、振り子の物理をプレビューすることができます：

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196835467-8eec329f-176f-47ba-af4e-fb4d0c4361d6.mp4" /></div>
<p class="img-desc"></p>

このブループリントは、1層のハイライトの動きのみを実装しています。しかし、複数のFloat Pendulum Physicsノードとより多くのハイライトBlendShapeの層を使用することで、より洗練された目のwiggle効果を作り出すことができます。

:::tip
「Float Pendulum Physics」ノードは、目のwiggleの物理効果を作成することに限定されていないことを覚えておいてください！例えば、腕のbouncyなどLive2Dで見られる他の物理効果も、この方法を使用してWarudoに実装することができます。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
