---
sidebar_position: 5
---

# 上半身の回転

:::caution
Warudo 0.12.0以降では、上半身の回転がデフォルトで有効になったため、このブループリントは不要になりました。詳しくは[フェイストラッキングのカスタマイズ](../../mocap/face-tracking)を参照してください。
:::

このブループリントを使用すると、キャラクターに微妙かつリアルな上半身の回転を加え、キャラクターの身体表現にニュアンスを加えることができます。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/jp/doc-img/upper-body-rotation.mp4" /></div>
<p class="img-desc">頭を回すときに上半身を自然に回転させる</p>

## 前提条件

キャラクターのフェイストラッキングはすでに設定されているはずです。

## 設定

以下のブループリントをダウンロードしてシーンにインポートしてください。

<a href="/blueprints/upper-body-rotation.json" target="_blank" download>
<div className="file-box">
<p>
upper-body-rotation.json
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
