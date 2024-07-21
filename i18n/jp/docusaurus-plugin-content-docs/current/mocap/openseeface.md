---
sidebar_position: 51
---

# OpenSeeFace

Webカメラベースのフェイストラッキング。基本的なBlendShape、頭の回転、頭の移動のセットをトラッキングします。フェイストラッキングの品質は、[VSeeFace](https://www.vseeface.icu/)の品質と同等です。

:::info
OpenSeeFaceは、[VSeeFace](https://www.vseeface.icu/)で使用されているフェイストラッキング技術であるため、VSeeFaceを使い慣れているユーザーにとっては、非常に馴染み深いものでしょう。
:::

:::caution
通常、フェイストラッキングにはより多くのBlendShapeをトラッキングし、トラッキング品質が高い[MediaPipe](./mediapipe.md)を使用することをおすすめします。OpenSeeFaceは、主に何らかの理由でMediaPipeを使用できないユーザーのために提供されています。
:::

## 設定

OpenSeeFaceはWarudoに組み込まれているため、追加のソフトウェアをインストールする必要はありません。

:::tip
OpenSeeFaceトラッカーを起動すると、内部キャリブレーションに 10～15 秒かかります。この間、モデルの口と目が不規則に動くことがありますが、これは正常な動作です。
:::

## キャリブレーション {#calibration}

OpenSeeFace のトラッキングは次の方法で調整できます。

* **[キャラクター] → [モーションキャプチャー] → [クイックキャリブレーション] → [キャリブレーションOpenSeeFace]** をクリックする
* **[OpenSeeFaceトラッカー]** アセットで **[キャリブレーション]** をクリックする

キャリブレーション中は、まっすぐ前を向いて頭を動かさないでください。キャリブレーション後は、頭を自由に動かすことができます。

## オプション {#options}

* **目のまばたきオフセット**: モデルの目が完全に閉じていない場合は、値に 0.1 を追加して調整してください。そうでない場合は、値から 0.1 を引いてください。
* **目開き（EyeWideLeft/EyeWideRight）感度**: **モデルにARKit BlendShapeが存在している必要があります。** この値を大きくすると、EyeWideLeft/EyeWideRight BlendShapeがトリガーされやすくなります。
* **眉毛の動きの感度**: **モデルにARKit BlendShapeが存在している必要があります。** この値を大きくすると、眉毛関連のBlendShapeがトリガーされやすくなります。
* **口の歪み（MouthLeft/MouthRight）感度**: **モデルにARKit BlendShapeが存在している必要があります。** この値を大きくすると、MouthLeft/MouthRight BlendShapeがトリガーされやすくなります。
* **口開き閾値**: モデルの口が簡単に開きすぎる場合は、値に 0.1 を追加して調整してください。そうでない場合は、値から 0.1 を引いてください。
* **口開く（JawOpen）感度**: この値を大きくすると、JawOpen BlendShape（または「A（あ）」VRMアニメーションクリップ）がトリガーされやすくなります。
* **O口（MouthFunnel）感度**: この値を大きくすると、MouthFunnel BlendShape（または「O（お）」VRMアニメーションクリップ）がトリガーされやすくなります。
* **口のスマイル（MouthSmileLeft/MouthSmileRight）感度**: **モデルにARKit BlendShapeが存在している必要があります。** この値を大きくすると、MouthSmileLeft/MouthSmileRight BlendShapeがトリガーされやすくなります。
* **身体の移動幅:** 頭の動きに自動追従する身体の動きの強度を調整します。

## よくある質問 {#FAQ}

よくある質問については、「[概要](overview#FAQ)」と「[フェイストラッキングのカスタマイズ](face-tracking#FAQ)」を参照してください。

### OpenSeeFaceを使用すると空のコンソールウィンドウがポップアップし続け、トラッキングが機能しません

これはWindowsのバグが原因です。修正するには、スタートメニューで **[Terminal]** を検索して開きます。下矢印アイコンをクリックして、**[設定]** を選択します。**[既定のターミナルアプリケーション]** として **[Windowsターミナル]** を選択し、**[保存]** をクリックします。その後、Warudoを再起動します。

### OpenSeeFaceトラッカーウィンドウは表示されますが、トラッキングが機能しません

一部のウイルス対策ソフトでは、Warudoのカメラへのアクセスがブロックされる場合があります。ウイルス対策ソフトのカメラ保護機能を無効にするか、Warudoをホワイトリストに追加してください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
