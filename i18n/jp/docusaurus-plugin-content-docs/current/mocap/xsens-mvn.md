---
sidebar_position: 100
---

# Xsens MVN

[Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US)によるボディトラッキング。

## 設定

**Xsens MVN → Options → Network Streamer** を開き、以下のように設定します。

![](/doc-img/zh-xens-1.webp)

次に、**Xsens MVN受信機**アセットの**出演者ID**を、モーションキャプチャデータを受信するXsens Actorに更新します。デフォルトは 1 です。

:::caution

Network Streamer機能を使用するには、MVN Animate PlusまたはProサブスクリプションが必要です。
:::

:::info
詳細については、[公式ドキュメント](https://base.xsens.com/s/article/MVN-Unity-Live-Plugin?language=en\_U)を参照してください。
:::

## キャリブレーション

Xsensハードウェアのキャリブレーションは、Xsens MVNで行います。

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
