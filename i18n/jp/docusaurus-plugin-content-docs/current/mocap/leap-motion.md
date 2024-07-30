---
sidebar_position: 70
---

# Leap Motion Controller

[Leap Motion Controller](https://leap2.ultraleap.com/leap-motion-controller-2/)によるハンドトラッキング。

## 設定

より正確で安定したトラッキングを実現するには、Leap Motion Controller 2の使用をおすすめします。オリジナルのLeap Motion Controllerもサポートされています。

Leap Motion ControllerをWarudoに接続するには、[Leap MotionのWebサイト](https://leap2.ultraleap.com/gemini-downloads/)から最新のGeminiソフトウェアをダウンロードしてインストールする必要があります。

Warudoは、Leap Motion Controllerが提供する3つのトラッキングモード（**デスクトップ**、**スクリーントップ**、**チェストマウント**）すべてに対応しています 。
最高の体験を得るには、[ネック/チェストマウント](https://www.etsy.com/market/leap_motion_mounting)を使用した**チェストマウントモード**をおすすめします。


## キャリブレーション {#Calibration}

通常、Leap Motion Controllerのキャリブレーションは必要ありません。しかし、トラッキングを調整するために、**[Leap Motion Controller]** アセット内で **[Controller Position Offset]** 、**[Controller Rotation Offset]**、および **[Controller Scale]** を調整することができます。シーン内には仮想のLeap Motion Controllerが表示され、トラッキングを視覚化するのに役立ちます。

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">仮想 Leap Motion Controllerを調整します</p>

## オプション

* **Controller Position Offset**: コントローラー位置のオフセット。X軸の正の値は左方向へのオフセット、Y軸の正の値は上方向へのオフセット、Z軸の正の値は前方向へのオフセットを意味します。
* **Controller Rotation Offset**: コントローラー回転のオフセット。
* **Controller Scale**: コントローラーのスケール。手を身体から遠ざけたい場合は、この値を大きくします。**Per-Axis Scale**を有効にすると、各軸に対して個別にコントローラーのスケールを調整できます。
* **Fix Finger Orientations Weight**: モデルの仕様の違いにより、Leap Motion Controllerの指の向きがモデルの指の向きと一致しない場合があります。このオプションでは、Leap Motion Controllerの指の向きをモデルに合わせて調整できます。 0 は調整なし、 1 は完全な調整を意味します。指が自然に見えるまでこの値を調整してください。
* **Shoulder Rotation Weight**: 肩をどの程度回転させるかを指定します。 0 は回転なし、 1 は完全な回転を意味します。肩が自然に見えるまでこの値を調整してください。

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)、および[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

### Leap Motion Trackerアセットに「トラッカーは起動していません」と表示されます

最新の[Geminiソフトウェア](https://leap2.ultraleap.com/gemini-downloads/)がインストールされ、バックグラウンドで実行されていることを確認してください。

### モデルの手首/指が不自然に見えます

**[Leap Motion Tracker]** アセットの **[Fix Finger Orientations Weight]** オプションを調整してみてください。また、 **[Wrist Rotation Offset]** および **[Global Finger Rotation Offset]** オプションの調整も必要になる場合があります（設定項目左のボックスにチェックを入れて有効にしてください）。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
