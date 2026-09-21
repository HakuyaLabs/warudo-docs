---
sidebar_position: 60
translate_from_version: 2025-10-30
---

# iFacialMocap / FaceMotion3D

ARKitベースのフェイストラッキング。[Face ID](https://support.apple.com/en-us/HT208109)対応のiOSデバイスと、$5.99の[iFacialMocap](https://apps.apple.com/us/app/id1489470545)アプリが必要です。52個のARKit BlendShape、頭の回転、頭の移動をトラッキングします。

iFacialMocapに代わるものとして、[FaceMotion3D](https://apps.apple.com/us/app/facemotion3d/id1507538005)（永久ライセンス$14.99）があります。iFacialMocapより多くの機能がありますが、Warudoのフェイストラッキングにおいては、2つのアプリは機能的に同等です。

:::tip
最高のトラッキング品質を得るには、iPhone 12以降（iPhone miniも可）の使用をおすすめします。古いiPhoneではトラッキング品質が低下する可能性があります。
:::

:::info
iPhoneがFace IDに対応していない場合でも、A12以上のチップを搭載し、iOS 14にアップデートしていれば、iFacialMocap / FaceMotion3Dを使用できる可能性があります。ただし、トラッキング品質が十分でない可能性があります。
:::

## 設定

:::tip
PCのIPアドレスがわからない場合は、 **[iFacialMocap受信機]** アセットのプロパティ画面で確認できます。

![](/doc-img/jp-ifacialmocap-1.png)

複数のIPが表示されている場合は、それぞれ試す必要があります。通常、Wi-FiルーターによってPCに割り当てられたIPアドレスは `192.168` から始まります。たとえば上の図では、まずは`192.168.1.151`を試してみてください。
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

以下のいずれかの状況が発生した場合:

- PCに接続できない
- iFacialMocapがWarudoにデータを送信できない
- 初心者ナビを使用後、フェイシャルキャプチャでモデルを動かせない
- フェイシャルキャプチャが突然失われる
- iPhoneが突然PCから切断される

以下の項目を順番に確認してください:

1. **管理者**: Warudoを管理者モードで実行する
2. **ポート**: 入力ポートを確認する
3. **IP**: 入力したIPが一致しているか確認する
4. **BlendShapeの命名**: モデルのBlendShape名を確認し、正しい命名と大文字・小文字になっていることを確認する（モデルにはARKit標準のBlendShapeが必要です。詳細は[3D VTuber入門](../tutorials/3d-primer)を確認してください）
5. **同じWi-Fi**: モバイル端末とPCが同じWi-Fiを使用していることを確認する
6. **プライベートネットワーク**: プライベートネットワークを使用していることを確認する
7. **ファイアウォール**: PCのファイアウォールのホワイトリストにWarudoを追加する。ファイアウォールをオフにしてアプリを再起動し、正常に接続できるか確認する（成功した場合は、ファイアウォールを再度有効にしてください）
8. **アプリの設定**: iPhoneの「設定」>「iFacialMocap」>「Allow iFacialmocap To Access」のすべての項目が有効であることを確認し、手動で再度有効にする
9. **カメラの使用状況**: VTubeStudioなど、スマートフォンのカメラを使用している別のアプリがないか確認する
10. **Appleのセキュリティ設定**: スマートフォンの設定で、iFacialMocap/RhyLiveアプリに接続のフルアクセスが許可されていることを確認する
11. **再起動**: iFacialMocapアプリを何度か開き直す
12. **iTunes**: PCにiTunesをインストールし、アプリとWarudoを再起動する
13. **古いデバイス**: iPhone Xなどの古いデバイスでは、iFacialMocapが正常に使用できない場合があります。これはスマートフォンのシステムが古すぎる、またはアプリがそのデバイスで動作し続けられないことが原因の可能性があります。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
