---
sidebar_position: 10
---

# 概要

![](/doc-img/mocap-cover.jpg)

自宅でストリーミングする場合でも、プロのモーションキャプチャスタジオでストリーミングする場合でも、Warudoが対応します。現在、Warudoは以下のモーションキャプチャシステムをサポートしています。

* Webカメラ
  * [MediaPipe](./mediapipe)または [OpenSeeFace](./openseeface)（Warudo内蔵のトラッキングソフト）
* iPhone
  * [iFacialMocap/FaceMotion3D](./ifacialmocap) または [RhyLive](./rhylive) アプリのいずれかのインストールが必要
* [SteamVR](./steamvr)
* [Leap Motion Controller](./leap-motion)
* [Sony Mocopi](./mocopi)
* [Rokoko](./rokoko)
* [Xsens MVN](./xsens-mvn)
* [Virdyn Studio (VDMocapStudio)](./virdyn)
* [Noitom Axis](./noitom)
* [StretchSense Glove](./stretchsense)
* [VMCプロトコル](./vmc)をサポートする外部アプリケーション（例: [VSeeFace](https://www.vseeface.icu/)、 [VirtualMotionCapture](https://vmc.info/)）
  * VRトラッカーは、[VirtualMotionCapture（支援版）](https://www.patreon.com/sh_akira)を使用することでサポートされます

[Warudo Pro](../pro.md)は、次のモーション キャプチャ システムもサポートしています。

* [Autodesk MotionBuilder](./motionbuilder)互換性のある光学トラッキング システム（例:  [VICON](https://www.vicon.com/)、[OptiTrack](https://optitrack.com/)）
* [OptiTrack Motive](./optitrack)
* [Chingmu Avatar](./chingmu)

## どのようなモーションキャプチャシステムを使うべきですか？ {#what-motion-capture-systems-should-i-use}

3D VTuberソフトを初めて使用する場合は、顔と手のトラッキングの両方に[MediaPipe](./mediapipe)を使用することをおすすめします。MediaPipeはWarudoに組み込まれているモーションキャプチャシステムで、Webカメラがあれば使用できます。iPhoneをお持ちの場合は、顔のトラッキングに[iFacialMocap](./ifacialmocap)アプリを使用することをおすすめします。MediaPipeよりも精度が高く、顔のトラッキングをiPhoneに任せると、コンピューターの負荷も軽減されます。

トラッキングの精度を向上させたい場合は、次の提案も参考にしてください。

* 顔のトラッキングには iPhone を使用します（[iFacialMocap](./ifacialmocap)アプリ経由）これは、現在利用できる最高のフェイストラッキングソリューションです。iPhoneをお持ちでない場合は、中古のiPhoneを検討してください。Face IDと互換性がある限り、iFacialMocapが動作するはずです。

:::tip
最高のトラッキング品質を得るには、iPhone 12以降（iPhone miniも可）の使用をおすすめします。古いiPhoneではトラッキング品質が低下する可能性があります。
:::

* MediaPipeのハンド トラッキングの精度が十分でないと思われる場合は、ハンドトラッキングに[Leap Motion Controller](./leap-motion)の使用を検討してください。[ネックマウント](https://www.etsy.com/market/leap_motion_mounting)を使用して首に装着し、手をトラッキングすることができます。
* フルトラッキングソリューションをお探しの場合は、[Sony Mocopi](./mocopi)、または[VRトラッカー](./vmc)の使用を検討してください。予算に余裕がある場合は、[Virdyn VDSuit](./virdyn)、 [Noitom Perception Neuron](./noitom)、 [Rokoko Smartsuit Pro](./rokoko)、 [Xsens MVN Link](./xsens-mvn)などのモーションキャプチャスーツの使用も検討してください。[StretchSense gloves](./stretchsense)を使用すると、これらのモーションキャプチャスーツに指のトラッキングを追加できます。 
* より専門的なソリューションをお探しの場合は、[VICON](https://www.vicon.com/)、[OptiTrack](https://optitrack.com/)、[Chingmu](https://www.chingmu.com/)などの光学式モーションキャプチャシステムの使用を検討してください。

## 設定 {#setup}

Warudoでモーションキャプチャを設定する方法は2つあります。推奨される方法は、すべてのシーンに付属する **「初心者ナビ」** アセットを使用することです。 **[基本設定] → [始める]** をクリックし、画面の指示に従ってください。

![](/doc-img/jp-getting-started-2.png)
<p class="img-desc">初心者ナビでモーションキャプチャを設定します</p>

初心者ナビの手順が完了したら、関連するモーションキャプチャアセットを選択して、トラッキングの設定をさらにカスタマイズできます。たとえば、iFacialMocapを使用している場合、頭が動くと同時にキャラクターの身体も動くようになっています。これが望ましくない場合、**iFacialMocap受信機**アセットで**身体の移動幅**を **0** に設定することで、身体の動きを抑えることができます。

![](/doc-img/jp-mocap-1.png)
<p class="img-desc">iFacialMocapの体の動きの強さを調整</p>

モーションキャプチャを設定する2つ目の方法は、**[キャラクター] → [モーションキャプチャーの設定]** を使用することです。この設定では、顔やポーズのトラッキングを直接設定できます。ただし、初心者ナビ設定の一部のチェック手順がスキップされます。

![](/doc-img/jp-mocap-2.png)
<p class="img-desc">キャラクターアセットでモーションキャプチャを設定</p>

この方法は、複数のフェイストラッキングシステムまたはポーズトラッキングシステムをセットアップする必要がある場合に便利です（新たに初心者ナビで設定を行なうと、既存のモーションキャプチャ設定が削除されてしまうため）。

どちらの方法を選択しても、対応するトラッキングのブループリントが生成され、シーンに追加されます。たとえば、顔のトラッキングに iFacialMocap を選択し、ポーズのトラッキングに MediaPipe を選択した場合、**「フェイストラッキング - iFacialMocap」** と **「ポーズトラッキング - MediaPipe」** の2つのブループリントが生成されます。これらのブループリントを変更して、トラッキングをカスタマイズできます。

:::caution
**[アセットの追加]** をクリックして、**iFacialMocap受信機**などのモーションキャプチャアセットを手動で作成することはほとんどありません。なぜならモーションキャプチャアセットだけでは、トラッキングデータを受信または送信することしかできず、トラッキングデータをキャラクターに接続できないからです。トラッキングデータの接続はブループリントを介して行なう必要があります。**初心者ナビ**と**モーションキャプチャの設定**機能を使えば、必要なブループリントが自動的に作成されます。
:::

## よくある質問 {#FAQ}

### キャラクターが動きません

iFacialMocapなどの外部アプリケーションを必要とするモーションキャプチャシステムを使用している場合は、アプリが実行されており、トラッキングデータが Warudoに送信されていることを確認してください。また、PCのファイアウォールがWarudoによるトラッキングデータの受信をブロックしていないことを確認してください。Warudoをホワイトリストに追加するか、ファイアウォールを一時的に無効にする必要がある場合があります。

Windowsはパブリックネットワークからの着信接続をブロックする可能性があるため、ネットワークをプライベートネットワークとして設定することもできます。詳細については、[このガイド](https://support.microsoft.com/en-us/windows/make-a-wi-fi-network-public-or-private-in-windows-0460117d-8d3e-a7ac-f003-7a0da607448d)を参照してください。

一部のモーションキャプチャレシーバーには**ポート**のオプション設定があります。ポート番号が外部アプリケーションのポート番号と一致していることを確認してください。

### トラッキングが敏感すぎる / 不安定すぎる

トラッキングのブループリント (例: フェイストラッキング - iFacialMocap ) に移動し、**スムーズ回転リスト** / **スムーズ位置リスト** / **スムーズ変換** / **スムーズBlendShapeリスト** ノードを見つけてください。 **[スムーズ時間]** の値を増やすとトラッキングがスムーズになり、値を減らすとトラッキングの応答性が向上します。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
