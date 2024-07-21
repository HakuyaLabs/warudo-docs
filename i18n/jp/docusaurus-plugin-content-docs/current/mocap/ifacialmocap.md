---
sidebar_position: 60
---

# iFacialMocap/FaceMotion3D

ARKitベースのフェイストラッキング。[Face ID](https://support.apple.com/en-us/HT208109)対応のiOSデバイスと、[iFacialMocap](https://apps.apple.com/us/app/id1489470545)アプリ（$7.99）が必要です。52個のARKit BlendShape、頭の回転、頭の移動をトラッキングします。

iFacialMocapに代わるものとして、[FaceMotion3D](https://apps.apple.com/us/app/facemotion3d/id1507538005)（永久ライセンス$14.99）があります。iFacialMocapより多くの機能がありますが、Warudoのフェイストラッキングにおいては、2つのアプリは機能的に同等です。

:::tip
最高のトラッキング品質を得るには、iPhone 12以降（iPhone miniも可）の使用をおすすめします。古いiPhoneではトラッキング品質が低下する可能性があります。
:::

:::info
iPhoneがFace IDに対応していない場合でも、A12以上のチップを搭載し、iOS 14にアップデートしていれば、iFacialMocap / FaceMotion3Dを使用できる可能性があります。ただし、トラッキング品質は標準以下になる可能性があります。
:::

## Setup

:::tip
PCのIPアドレスがわからない場合は、 **[iFacialMocap受信機]** アセットのプロパティ画面で確認できます。

![](/doc-img/jp-ifacialmocap-1.png)

複数のIPが表示されている場合は、それぞれ試す必要があります。通常、Wi-FiルーターによってPCに割り当てられたIPアドレスは `192.168` から始まります。たとえば上の図では、まずを`192.168.1.151`を試してみてください。
:::

### iFacialMocap

iFacialMocapアプリを開き、右上の歯車アイコンをタップして設定画面を開きます。**[宛先IPアドレス]** をタップして、PCのIPアドレスを入力します。

![](/doc-img/jp-ifacialmocap-2.png)

**[長時間のストリーミング向けに最適化]** を有効にすることをおすすめします。これにより、長時間の使用によるデバイスの過熱を軽減できます。

![](/doc-img/jp-ifacialmocap-3.png)

### FaceMotion3D

FaceMotion3Dアプリを開き、左下の設定アイコンをタップして設定画面を開きます。**[ストリーミング設定]** をタップします。**[ソフトウェア名]** を **[Other]** に設定し、**[iFacialMocapと互換性がある]** を有効にします。

![](/doc-img/jp-ifacialmocap-4.png)

メイン画面に戻り、左上の **[ライブ]** ボタンをタップし、ソフトウェアとして **[Other]** を選択して、PCのIPアドレスを入力します。次に、**[Connect]** をタップしてストリーミングを開始します。

![](/doc-img/jp-ifacialmocap-5.png)

## キャリブレーション {#calibration}

iFacialMocap のトラッキングは次の方法で調整できます。
* **[キャラクター] → [モーションキャプチャー] → [クイックキャリブレーション] → [キャリブレーションiFacialMocap]** をクリックする
* **[iFacialMocap受信機]** アセットで **[キャリブレーション]** をクリックする

キャリブレーション中は、まっすぐ前を向いて頭を動かさないでください。キャリブレーション後は、頭を自由に動かすことができます。

## よくある質問 {#FAQ}

よくある質問については、「[概要](overview#FAQ)」と「[フェイストラッキングのカスタマイズ](face-tracking#FAQ)」を参照してください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
