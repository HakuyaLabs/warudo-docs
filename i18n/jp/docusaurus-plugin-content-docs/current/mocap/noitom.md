---
sidebar_position: 120
---

# Noitom Axis

[Noitom Axis Studio](https://neuronmocap.com/pages/axis-studio)またはAxis Neuronによるボディトラッキング。[Noitom Perception Neuron](https://neuronmocap.com/)スーツが必要です。

## 設定

Noitom Axis Studio を開き、**Settings → BVH Broadcasting**で、右上のスイッチを切り替えてBVHストリーミングを有効にします。

![](/doc-img/en-noitom-1.png)

## キャリブレーション

Noitomハードウェアのキャリブレーションは、Noitom Axis Studioまたは Axis Neuronで行います。

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
