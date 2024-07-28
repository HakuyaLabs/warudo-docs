---
sidebar_position: 515
---

# OptiTrack Motive

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。
:::

[OptiTrack Motive](https://optitrack.com/software/motive/)によるボディトラッキング。[OptiTrack](https://chingmu.com)光学トラッキングシステムへのアクセスが必要です。

キャラクターのトラッキングに加えて、道具のトラッキングにも対応しています。たとえば、光学トラッキングシステムを使用して椅子や手持ちカメラをトラッキングし、そのモーションデータをWarudoにストリーミングして、それに合わせて椅子のpropやカメラをWarudoでアニメーションさせることができます。

## 設定


Warudo で、**メニュー -> 設定 -> OptiTrack** に移動します。サーバーアドレスとローカルアドレスが両方とも正しいことを確認します。サーバーアドレスはOptiTrack PCのIPアドレスで、ローカルアドレスは Warudo PCのIPアドレスである必要があります。WarudoとOptiTrack Motiveの両方を同じPCで実行する場合は、両方に `127.0.0.1` を入力します。そして、**[Enabled]** を [Yes] に設定します。「Connected to OptiTrack Motive」というステータス メッセージが表示されるはずです。

![](/doc-img/en-optitrack-1.png)

### キャラクタートラッキング

OptiTrack Motiveを Warudoに接続するには、OptiTrack Motiveで **Streaming** を有効にし、 **Transmission Type** を **Unicast**に設定してください。また、Local Interfaceのドロップダウンで正しいIPアドレスを選択してください。このIPアドレスは、Warudoを実行しているPCと同じサブネットである必要があります。WarudoとOptiTrack Motiveの両方を同じPCで実行する場合は、「loopback」を選択してください。

![](/doc-img/en-optitrack-2.png)

**OptiTrack Skeleton Receiver**アセットの名前が OptiTrack Motiveの名前と一致していることを確認します。

![](/doc-img/en-optitrack-3.png)

### 道具のトラッキング

Warudoで、新しい**OptiTrack Rigid Body Receiver**アセットを作成し、**OptiTrack Rigid Body ID**を、トラッキングするrigidbodyのIDに設定します。次に、**Target Asset**で、制御するWarudoの道具/カメラを選択します。

:::tip
ブループリント内のpropトラッキングデータにアクセスする場合は、**Get OptiTrack Rigid Body Receiver Data**ノードを使用できます。
:::

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)と[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
],
}} />
