---
sidebar_position: 50
---

# VMC送信機

[VirtualMotionCapture](https://protocol.vmc.info/)プロトコルに対応したソフトウェアに、キャラクターのアニメーションデータを送信します！

:::tip
互換性のあるプログラムのリストは[こちら](https://protocol.vmc.info/Reference)を参照してください。
:::

## プロパティ

* IPアドレス: データが送信される IP アドレス
* ポート: データが送信されるポート番号
* キャラクター: アニメーションデータを送信するキャラクターを選択します
* VirtualMotionCaptureに送信: [VirtualMotionCapture](https://akira.works/VirtualMotionCapture-en/) (VMCプロトコルではなく、同名ソフトウェア)送信されているかどうか。VirtualMotionCaptureのアニメーションデータ解析時にバグがあるため、このオプションを有効にする必要があります。
  * キャリブレーション中 (VirtualMotionCapture): VirtualMotionCaptureでのT-Poseキャリブレーション中はこのオプションを有効にし、キャリブレーション後は無効にしてください。

:::caution
この機能を使用するには、モデル内のボーンの初期回転がすべて 0 である必要があります。そうでない場合、他のソフトウェアに送信されるデータへの互換性が失われる可能性があります。モデルが[VRM形式](https://vrm.dev/)であれば、ほとんどの場合、問題はないはずです。ただし、非常にまれなケースでは、モデル制作者がエクスポート時に、Enforce T-Poseオプションをオンにしていない可能性があります。このオプションをチェックした状態で再エクスポートすることで問題を修正できます。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
