---
sidebar_position: 50
---

# MediaPipe

Webカメラベースで顔と手のトラッキングを行ないます。フェイストラッキングでは、MediaPipeは40以上のARKit BlendShape、頭の回転、頭の移動をトラッキングします。ポーズトラッキングでは、MediaPipeは手首と指をトラッキングします。

## 設定 {#setup}

MediaPipeはWarudoに組み込まれているため、追加のソフトウェアをインストールする必要はありません。ほとんどのWebカメラはMediaPipeで動作するはずですが、動作しない場合は、以下の[FAQ](#FAQ)セクションを参照してください。

MediaPipeは、CPUまたはGPUで実行できます。パフォーマンスを向上させるにはGPUが推奨されます。MediaPipeはデフォルトでGPUで実行されています。代わりにCPUを使用するには、**MediaPipeトラッカー**アセットに移動して **GPUアクセラレーション**を無効にします。

:::tip
CPUはいつ使用するのが良いでしょうか？GPUリソースを大量に使用するゲームをプレイしている場合は、パフォーマンスの問題を回避するために、MediaPipeにCPUを使用することをおすすめします。
:::

MediaPipeをハンドトラッキングに使用する場合は、カメラの正面に位置し、カメラビューに手が完全に表示されていることを確認してください。 **[MediaPipeトラッカー]** アセットで **[カメラの内容を表示]** を有効にすると、カメラビューに自身の姿が表示されるようになります。

![](/doc-img/en-mediapipe-1.png)

通常、カメラをPC画面の上に置き、頭がカメラビューの中央より少し上になるようにします。また、使用前にハンドトラッキングをキャリブレーションすることをおすすめします。詳細については、[キャリブレーション](#Calibration)を参照してください。

## キャリブレーション {#Calibration}

### フェイストラッキング

MediaPipeのフェイストラッキングは、次の方法で調整できます。

* **[キャラクター] → [モーションキャプチャー] →[クイックキャリブレーション] → [キャリブレーションMediaPipe]** をクリックするか、
* **[MediaPipeトラッカー]** アセットで **[キャリブレーション]** をクリックします。

キャリブレーション中は、まっすぐ前を向いて頭を動かさないでください。キャリブレーション後は、頭を自由に動かして大丈夫です。

### ハンドトラッキング

**[MediaPipeトラッカー]** アセットの **[ハンドトラッキングキャリブレーション]** をクリックすると、MediaPipe のハンドトラッキングを調整できます。片方の手を耳の横に上げ、手のひらをカメラに向けます。もう一方の手で **[OK]** を押して調整します。

![](/doc-img/en-mediapipe-2.png)
<p class="img-desc">キャリブレーション中は、手のひらをカメラに向けてリラックスした姿勢を保ち、必要に応じて指を少し曲げます。</p>

手の動きが速すぎたり遅すぎたりする場合は、**[手の移動範囲]** オプションで調整できます。また、**[手の移動範囲オフセット]** オプションを調整して、たとえば手を頭に近づけることもできます。

## オプション

* **手の移動範囲**: 手の動きの範囲。Xは左右、Yは上下、Zは前後です。
* **手の移動範囲オフセット**: 手の動きの範囲のオフセット。正のXは左オフセット、正のYは上オフセット、正のZは前オフセットです。
* **腕の回転オフセット**: 肘を内側または外側に回転させます。
* **手の水平距離補正**: キャラクターの手を近づけて、指を交差させるなどのジェスチャーを行いやすくします。
* **手のY閾値**: 手首とカメラビューの上端および下端の間の距離がこの値より小さい場合、その手のトラッキングは無視されます。これにより、不安定なトラッキングによるジッターの問題を避けることができます。
* **カメラ対角線視野角**: カメラの視野（FOV）。正確な値は手の深さを推定するのに役立ちます。通常、カメラのストアページにメーカーによる視野率が記載されています。
* **ハンドプッシュZ最大値**: 身体と衝突を防ぐために、手は前方に押し出されます。この値は、手が前方に押し出される最大距離を決定します。
* **ハンドプッシュYの範囲**: 手が肩から離れるほど、前方に押し出されます。手から肩までの垂直距離がこの値以上であれば、手は最大限前方に押し出されます。
* **ハンドプッシュYオフセット**: この値が0のとき、手は肩から下に向かって前に押し出され始めます。この値が正の場合、手は肩の上から前方に押し出され始めます。
* **肩の回転の重み**: 肩をどれだけ回転させるか。0は回転なし、1はフル回転を意味します。肩が自然に見えるまで、この値を調整してください。

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)、[「顔トラッキングのカスタマイズ」](face-tracking#FAQ)、および[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

### MediaPipe トラッカー ウィンドウが黒くなり、「Loading...」のまま動きません

一部のWebカメラは、**GPUアクセラレーション**が有効になっている場合にのみサポートされます（例: [DroidCam](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)などのIPカメラ）。また、一部のWebカメラは、**GPUアクセラレーション**が無効になっている場合にのみサポートされます。**[MediaPipeトラッカー]** アセットで **[GPUアクセラレーション]** の設定を切り替えて、問題が解決するかどうかを確認してください。

![](/doc-img/jp-mediapipe-gpu-acceleration-1.png)
<p class="img-desc">MediaPipeのGPUアクセラレーション設定</p>

また、ウイルス対策ソフトによっては、Warudoのカメラへのアクセスをブロックする場合があります。ウイルス対策ソフトのカメラ保護機能を無効にするか、Warudoをホワイトリストに追加してください。

### 頬をふくらませたり、舌を突き出したりすることができません

これはMediaPipeの既知の制限で、Googleが[修正](https://github.com/google/mediapipe/issues/4403)するのを待っています。

### トラッキングが不安定です

まず、Webカメラが実際に30FPS以上で動作していることを確認します。[このWebサイト](https://webcamtests.com/fps)を使用して、WebカメラのFPSを確認できます。Webカメラが低いFPSで動作している場合は、部屋が暗すぎる可能性があります。部屋が十分に明るいことを確認してください。

Webカメラが30FPS以上で動作しているのに、トラッカーウィンドウに表示されるFPSがはるかに低い場合は、**[MediaPipeトラッカー]** アセットで **[GPUアクセラレーション]** の設定を切り替えてみてください。

:::tip
トラッキングFPSは、通常 15～30 です。3Dゲームをプレイしている場合、トラッキングFPSは 10 程度まで低下することがあります。
:::

### トラッキングがフリーズしました

ノートパソコンを使用している場合は、電源に接続されており、バッテリーで動作していないことを確認してください。

### ハンドトラッキングにはMediaPipeと[Leap Motion](leap-motion)のどちらを使用すれば良いですか？

予算に余裕がある場合は、通常、ハンドトラッキング用に首/胸にマウントする「Leap Motion Controller 2」を使用することをおすすめします。Leap Motionトラッキングは、通常、MediaPipeよりも安定しており、特に3Dゲームをプレイしているときは、CPU/GPUリソースの使用量が少なくなります。

トラッキングが失われやすい「Leap Motion Controller 1」はおすすめしません。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />