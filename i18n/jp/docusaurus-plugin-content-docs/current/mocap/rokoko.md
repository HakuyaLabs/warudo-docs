---
sidebar_position: 90
---

# Rokoko

[Rokoko](https://www.rokoko.com/)による顔と身体のトラッキング。

## 設定

Rokoko Studioを開いて **Livestream → Activate streaming to Unity** をアクティブにします: 

![](/doc-img/zh-rokoko-1.webp)

次に、**Rokoko受信機** アセットの **Profile名** を、モーションキャプチャデータを受信するRokokoアクター名に設定します: 

![](/doc-img/jp-rokoko-2.png)

:::caution
Unityにストリーミングするには、Rokoko PlusまたはProサブスクリプションが必要です。
:::

:::info
詳細については、[公式ドキュメント](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity)を参照してください。
:::

## キャリブレーション

Rokokoハードウェアのキャリブレーションは、Rokoko Studioで行います。

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)と[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

### 時間経過とともにトラッキングがズレてしまいます

これは慣性モーションキャプチャシステムによく見られる問題で、累積したエラーにより時間の経過とともにズレが生じます。ズレを減らすには、トラッキングセンサーの近くに磁気や電気的な干渉がないことを確認しましょう。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />

