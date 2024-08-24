---
sidebar_position: 10
---

# Live2Dの腕のsway

:::caution
Warudo 0.12.3以降では、デフォルトのPendulum Physics設定で腕の揺れが有効になったため、このブループリントは不要になりました。詳しくは[Pendulum Physics](../../mocap/pendulum-physics)を参照してください。このブループリントは、ブループリントを使用してキャラクターに[Pendulum Physics](../../mocap/pendulum-physics)を手動で追加するためのリファレンスとして役立ちます。
:::

腕のswayは、Live2Dモデルでよく使われるエフェクトで、腕を前後に揺らすことでキャラクターにちょっとした生命感を与えます。このブループリントを使用すると、この人気のある効果を3Dモデルに追加することができます！

<div style={{width: '100%'}} className="video-box"><video controls loop src="/jp/doc-img/arm-sway.mp4" /></div>
<p class="img-desc">Live2Dのような腕の揺れを再現！</p>

## 設定

以下のブループリントをダウンロードしてシーンにインポートしてください。

<a href="/blueprints/arm-sway.json" target="_blank" download>
<div className="file-box">
<p>
arm-sway.json
</p></div>
</a>

このブループリントはインポートしてそのまま使えるはずです。 **「コメント」** ノードの指示に従って設定を調整してください。

:::tip
別のキャラクターアセットを作成した場合は、ノードの**キャラクター**オプションを更新する必要があります。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
