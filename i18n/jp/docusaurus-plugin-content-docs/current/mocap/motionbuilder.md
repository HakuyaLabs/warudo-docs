---
sidebar_position: 510
---

# Autodesk MotionBuilder

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。
:::

[Autodesk MotionBuilder](https://www.autodesk.com/products/motionbuilder/) を介したボディトラッキングにより、Autodesk MotionBuilderが統合された光学式モーションキャプチャシステム（[VICON](https://www.vicon.com/)、[OptiTrack](https://optitrack.com/)など）からモーションデータを受信できるようになります。

キャラクターのトラッキングに加えて、道具のトラッキングにも対応しています。たとえば、光学トラッキングシステムを使用して椅子や手持ちカメラをトラッキングし、そのモーションデータをWarudoにストリーミングして、それに合わせて椅子のpropやカメラをWarudoでアニメーションさせることができます。

## 設定

:::info
Autodesk MotionBuilder 2020 を使用していることを確認してください。異なるバージョンとの互換性が必要な場合は、お問い合わせください（ビルドを配信するまでに時間がかかる場合があります）。
:::

**Mobu2Warudo** プラグインがすでにインストールされていることを確認してください。このプラグインは、Warudo Proライセンスに含まれています。

### キャラクタートラッキング

MotionBuilderを開き、キャラクターのFBXファイルを読み込み、キャラクタライズします。**モデルには正規化されたボーンが必要です。つまり、モデルがTポーズのとき、モデル内のボーンの初期回転がすべて 0 である必要があります。** また、モデルには、Warudoにロードされたキャラクターモデルと同じボーン階層が必要です。

:::info
FBXモデルに正規化されたボーンがあるかどうかを確認するには、モデルをUnityにインポートし、ボーンの変換の回転が 0 であるかどうかを確認します。
:::

**Devices → Warudo Device** をScene Viewにドラッグします。

![](/doc-img/en-motionbuilder-1.png)

:::caution

「Warudo Device」が表示されない場合は、プラグインの読み込みに失敗したことを意味します。[Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) をダウンロードしてインストールし、MotionBuilderを再起動してください。
:::

**Devices → Warudo Device → Characters** を選択し、**Add** をクリックして新しい行を追加します。 デフォルト名の **MyCharacter** を実際のキャラクター名に変更し、[Online] テキストの横にある赤いボックスをクリックします。 ボックスがすぐに緑色に変わり、MotionBuilderがWarudoにモーションデータをストリーミングしていることを示します。

![](/doc-img/en-motionbuilder-2.png)

Warudoで、**MotionBuilder Receiver → MotionBuilder Character Name** を実際のキャラクター名に更新します。

### 道具のトラッキング

**Devices → Warudo Device → Props** を選択し、**Add** をクリックして新しい行を追加します。デフォルト名の **MyProp** を、トラッキングするオブジェクトのラベル名に変更します。オブジェクトはシーン階層内のどこにでも配置できます。トラッキングを開始するには、[Online] テキストの横にある赤いボックスをクリックします。

Warudoで、新しい **MotionBuilder Prop Receiver** アセットを作成し、 **MotionBuilder Prop Name** にトラッキング対象オブジェクト名を入力します。次に、**Target Asset**で、制御する Warudoの道具/カメラを選択します。

:::tip
ブループリント内のpropトラッキングデータにアクセスする場合は、**Get MotionBuilder Prop Receiver Data**ノードを使用できます。
:::

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)と[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

### 私のキャラクターは非常に奇妙なポーズをとっています

まず、Warudoと外部アプリケーションに同じモデルがロードされていることを確認します。

また、モデルには正規化されたボーンが必要です。つまり、モデルがTポーズのとき、モデル内のボーンの初期回転がすべて 0 である必要があります。詳細については、[このページ](../modding/character-mod#normalize-bones)を参照してください。

### Autodesk MotionBuilderがWarudoを実行している別のPCにデータをストリーミングしていることを確認しましたが、Warudoがデータを受信して​​いません

ネットワーク設定が正しいこと、つまり2台のPCが同じネットワーク上にあり、相互に通信できることを確認してください。双方向にpingを打って確認してみてください。

また、キャラクターの階層がかなり大きい場合は、受信側のPCのMTU（最大伝送単位）サイズがデータを受信するのに十分な大きさであるかを確認し、必要に応じてサイズを大きくしてください。詳細については、[こちらのページ](https://answers.microsoft.com/en-us/windows/forum/all/how-to-change-mtu-settings-in-windows-10/5c36c250-a0e8-47ee-b01c-de22139dc297)を参照してください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
