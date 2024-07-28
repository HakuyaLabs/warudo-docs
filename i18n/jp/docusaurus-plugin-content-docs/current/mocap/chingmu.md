---
sidebar_position: 520
---

# Chingmu Avatar

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。
:::

[Chingmu Avatar](https://www.chingmu.com/software/downloaddetail_7.shtml)によるボディ トラッキング。[Chingmu](https://chingmu.com)光学トラッキングシステムへのアクセスが必要です。

キャラクターのトラッキングに加えて、道具のトラッキングにも対応しています。たとえば、光学トラッキングシステムを使用して椅子や手持ちカメラをトラッキングし、そのモーションデータをWarudoにストリーミングして、それに合わせて椅子のpropやカメラをWarudoでアニメーションさせることができます。

## 設定

### キャラクタートラッキング

Chingmu Avatarを開き、キャラクターのFBXファイルを読み込み、キャラクタライズします。**モデルには正規化されたボーンが必要です。つまり、モデルがTポーズのとき、モデル内のボーンの初期回転がすべて 0 である必要があります。** また、モデルには、Warudoにロードされたキャラクターモデルと同じボーン階層が必要です。

:::info
FBXモデルに正規化されたボーンがあるかどうかを確認するには、モデルをUnityにインポートし、ボーンの変換の回転が 0 であるかどうかを確認します。
:::

**VRPN Livestream** (启用Vrpn)  がオンになっていることを確認し、 **Rigidbody** (刚体)、**Bones** (骨骼)、**Motion Retargeting** (重定方向) もオンにしてください。

![](/doc-img/en-chingmu-1.png)

シーン内に複数のキャラクターがいる場合は、Warudoで **Chingmu Avatar Receiver → Object ID** を、トラッキングするキャラクターのインデックスに設定します。インデックスは 0 から始まります。

別のPCでChingmu Avatarを実行している場合は、Warudoの **[設定] → [Chingmu] → [VRPN Connection String]** にChingmu Avatarを実行しているPCのIPアドレスを入力する必要があります。

### 道具のトラッキング

Warudo で、新しい**Chingmu Avatar Rigidbody Receiver**アセットを作成し、**Rigidbody ID**を、トラッキングするRigidbodyのIDに設定します。次に、**Target Asset** で、制御するWarudoの道具/カメラを選択します。

:::tip
ブループリント内のpropトラッキング データにアクセスする場合は、**Get Chingmu Avatar Rigidbody Receiver Data**ノードを使用できます。
:::

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)と[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

### 私のキャラクターは非常に奇妙なポーズをとっています

まず、Warudoと外部アプリケーションに同じモデルがロードされていることを確認します。

また、モデルには正規化されたボーンが必要です。つまり、モデルがTポーズのとき、モデル内のボーンの初期回転がすべて 0 である必要があります。詳細については、[こちらのページ](../modding/character-mod#normalize-bones)を参照してください。

### キャラクターが動きません

**[設定] → [Chingmu] → [Chingmu プラグインの再起動]** をクリックしてみてください。それでも問題が解決しない場合は、Chingmu AvatarやWarudoを再起動してみてください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
