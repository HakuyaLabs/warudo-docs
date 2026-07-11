---
sidebar_position: 512
translate_from_version: 2025-11-04
---

# Vicon Shogun

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。
:::

[Vicon Shogun](https://www.vicon.com/software/shogun/)によるボディトラッキング。[Vicon](https://www.vicon.com)光学トラッキングシステムへのアクセスが必要です。

キャラクターのトラッキングに加えて、道具のトラッキングにも対応しています。たとえば、Shogunからトラッキング済みのカメラ、手持ちの道具、またはステージマーカーをストリーミングし、対応するWarudoの道具またはカメラをリアルタイムでアニメーションさせることができます。

## 設定

Warudoで、**Menu → Settings → Vicon**に移動します。**Server Address**がShogunを実行しているPCを指していることを確認します（例: `192.168.1.50:801`）。WarudoとShogunを同じマシンで実行している場合は、既定値の`localhost:801`のままで構いません。

**Enabled**をYesに設定します。Warudoが接続を確立すると、「Connected to Vicon Shogun」というステータスメッセージが表示されます。

![](/doc-img/en-vicon-1.jpg)

### キャラクタートラッキング

Vicon ShogunをWarudoに接続するには、[初心者ナビ](../tutorials/getting-started)を使用する（または**Character → Setup Motion Capture**を実行する）際、ポーズトラッキングとして**Vicon Shogun**を選択します。設定が完了すると、シーン内に**Vicon Subject Receiver**アセットが表示されます。**Vicon Subject Name**フィールドがShogun内の名前と一致していることを確認してください。

:::tip
Warudoのキャラクターのボーン名がShogunスケルトンで使用されているものと異なる場合は、**Vicon Receiver**アセットの**Override Bone Names**を使用して、特定のヒューマノイドボーンをShogunが公開している名前にマッピングしてください。
:::

![](/doc-img/en-vicon-2.jpg)

### 道具のトラッキング

Warudoで、**Vicon Prop Receiver**アセットを作成します。**Vicon Prop Name**をShogun Liveのrigid bodyのラベルに設定し、**Target Asset**でWarudoの道具またはカメラを選択します。

:::info
Warudoの道具ファイルの階層はShogunのものと一致している必要があり、ルートトランスフォームの名前は`root`でなければなりません。そうでない場合、Warudoはルートトランスフォームを生成しますが、子トランスフォームが完全にはミラーリングされないことがあります。
:::

:::tip
ブループリントでトラッキングデータにアクセスするには、**Get Vicon Subject Receiver Data**または**Get Vicon Prop Receiver Data**ノードを使用できます。
:::

## 詳細オプション

* **Root Rotation Offset**: キャラクターまたは道具がVicon座標フレームと異なる前方を向いている場合に、固定オフセットを適用します。通常、この設定を変更する必要はありません。
* **Use Pre Fetch**: レイテンシーに敏感なセットアップを滑らかにするため、Vicon Shogunからバッファリングされたフレームを要求します。

## よくある質問

よくある質問については、[概要](overview#FAQ)および[ポーズトラッキングのカスタマイズ](body-tracking#FAQ)を参照してください。

### ステータスに「Failed to connect to Vicon system」と表示されます。

Shogun PCとWarudo PCが同じサブネット上にあることを確認してください。**Server Address**を再確認し、ファイアウォールでポート`801`が開いていることを確認してください。

### キャラクターが誤ったポーズに飛びます。

Shogun内のsubjectがWarudoキャラクターと互換性のあるスケルトンを使用していることを確認してください（ボーン階層が一致し、Tポーズの回転がゼロになっていること）。必要に応じて、**Override Bone Names**でジョイント名を揃え、**Root Rotation Offset**で座標フレームを一致させてください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
