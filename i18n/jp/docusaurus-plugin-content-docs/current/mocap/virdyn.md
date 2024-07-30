---
sidebar_position: 110
---

# Virdyn Studio (VDMocapStudio)

[VDMocapStudio](https://www.virdynm.com/virdyn-vdmocap-studio-motion-capture-software-system-for-vdsuit-full-product/)によるボディトラッキング。[VDSuit](https://www.virdynm.com/virdyn-vdsuit-full-for-full-body-function-inertia-motion-capture-suit-product/) スーツが必要です。

## 設定

VDMocapStudioを開き、 **Broadcast → OpenShare** をクリックしてデータストリーミングを有効にします。選択したIPアドレスがWarudoからアクセスできることを確認します。

![](/doc-img/en-virdyn-1.png)

## キャリブレーション

Virdynハードウェアのキャリブレーションは、VDMocapStudioで行います。**Virdyn Studio受信機 → Calibrate Root変換** を使用して、Warudo内のキャラクターのルート位置と回転をリセットすることもできます。

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
