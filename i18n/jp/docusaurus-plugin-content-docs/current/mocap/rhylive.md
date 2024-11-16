---
sidebar_position: 65
---

# RhyLive

ARKitベースの顔と上半身のトラッキング。[Face ID](https://support.apple.com/en-us/HT208109)対応の iOSデバイスと無料の[RhyLive](https://apps.apple.com/us/app/rhylive/)アプリが必要です。52個のARKit BlendShape、頭の回転、手の動きをトラッキングします。

:::info
RhyLiveとiFacialMocapは、顔のトラッキングに関しては同様の精度を持っていますが、iFacialMocapは頭の動きをトラッキングできるため、モデルをよりより柔軟で自然に動かすことができます。次の比較をご覧ください。

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-1.mp4" />
<p>RhyLive</p>
</div>

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-2.mp4" />
<p>iFacialMocap</p>
</div>
:::

## 設定

iOSデバイスでRhyLiveを使用するには、アプリを開いて左上隅のメニューアイコンをタップし、設定画面を開きます。PCとiPhoneが同じ Wi-Fiネットワークに接続されている場合は、「IP」入力欄にPCのIPアドレスを入力し、「无线」(ワイヤレス) スイッチをオンにします。もしくは、「有线」(有線) スイッチをオンにして、USBケーブルを使用したデバイス接続もできます（[iTunes](https://www.apple.com/itunes/)が必要）。

![](/doc-img/zh-rhylive-1.webp)

:::tip
PCのIPアドレスがわからない場合は、**[RhyLive受信機]** アセットのプロパティ画面で確認できます。

![](/doc-img/jp-ifacialmocap-1.png)

複数のIPが表示されている場合は、それぞれ試す必要があります。通常、Wi-FiルーターによってPCに割り当てられたIPアドレスは `192.168` から始まります。たとえば上の図では、まずは`192.168.1.151`を試してみてください。
:::

:::info
「有線」オプションを使用する場合は、Warudoを起動する前にRhyLiveアプリを開き、iPhoneをPCに接続する必要があります。
:::

「锁定弯腰」（身体の曲げをロック）をオフにし、「隐藏模型」（モデルを非表示）をオンにすることをおすすめします。前者はモデルの動きの範囲を広げ、後者は長時間の使用によるデバイスの過熱を軽減するのに役立ちます。

![](/doc-img/zh-rhylive-3.webp)

## キャリブレーション

RhyLiveのトラッキングは次の方法で調整できます。
* **[キャラクター] → [モーションキャプチャー] → [クイックキャリブレーション] → [キャリブレーションRhyLive]** をクリック
* **[RhyLive受信機]** アセットで **[キャリブレーション]** をクリック

キャリブレーション中は、まっすぐ前を向いて頭を動かさないでください。キャリブレーション後は、頭を自由に動かすことができます。

## よくある質問 {#FAQ}

よくある質問については、「[概要](overview#FAQ)」と「[フェイストラッキングのカスタマイズ](face-tracking#FAQ)」を参照してください。

### 「有線」オプションを使用して、iPhoneをUSB経由でPCに接続しましたが、キャラクターが動きません

お使いのPCに[iTunes for Windows](https://support.apple.com/ja-jp/118290)がインストールされていることを確認してください。
正常に動作しない場合は、代わりに「ワイヤレス」オプションを使用してみてください。

### 「ワイヤレス」オプションを使用しており、PCとiPhoneが同じWi-Fiネットワークに接続されていることを確認していますが、キャラクターが動きません

RhyLiveアプリの「无线」（ワイヤレス）スイッチのオン/オフを切り替えるか、アプリを再起動してください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
