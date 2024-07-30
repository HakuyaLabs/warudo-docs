---
sidebar_position: 500
---

# VMC

外部アプリケーションによるトラッキング。[VirtualMotionCapture Protocol](https://protocol.vmc.info/)を介して、モーションキャプチャデータをWarudoに送信します。VRトラッカーは、[VirtualMotionCapture有料版（支援版）](https://www.patreon.com/sh_akira)を使用してもサポートされます。

## 設定

### VRトラッカー

まずは、 [**VirtualMotionCapture**](https://vmc.info/)の有料版（支援版）がインストールされていることを確認してください。開発者の[Patreon](https://www.patreon.com/sh_akira)または[pixivFANBOX](https://akira.fanbox.cc/)からダウンロードできます。

:::tip
VirtualMotionCaptureとVMC の違いは何でしょうか？簡潔に言えば、これらは同じものですが、2つの異なるものを指すことがあります。1つはオリジナルの VirtualMotionCaptureアプリケーションで、もう1つはVirtualMotionCaptureと他アプリケーションで使用されるプロトコルのことを指します（プロトコルとは、基本的にアプリケーションが互いに通信する方法のことを意味します）。 このハンドブックでは、プロトコルを指すのに「VMC」を使用し、アプリケーションを指すのに「VirtualMotionCapture」を使用します。
:::

VRトラッカーがSteamVRに接続されていることを確認してください。次に、VirtualMotionCapture を開き、VRMモデルをロードして、キャリブレーションを実行します。最後に、**[詳細設定] → [モーション送信（VMCProtocol）]** で **[OSCでモーション送信を有効にする]** をオンにします。デフォルトのポート番号 39539 は、WarudoのVMCレシーバーが使用するデフォルトポートです。

![](/doc-img/jp-vmc-1.png)

### VSeeFace

次の例は、 [VSeeFace](https://www.vseeface.icu/)を使用して VMCデータをキャラクターに適用する方法を示しています。 VMCをサポートする他のソフトウェアも同様の方法で構成できます。

**[一般設定]** で、 **[VMCプロトコル] → [VMCプロトコルで送信する]** がチェックされていることを確認します。デフォルトのポート番号 39539 は、WarudoのVMCレシーバーが使用するデフォルトポートです。

![](/doc-img/jp-vmc-2.png)

### その他のアプリケーション

VMCをサポートするその他のアプリケーションについては、アプリケーションのドキュメントを参照してVMCトラッキングを有効にする方法を確認してください。また、正しいポート番号（デフォルトは 39539）に送信していることを確認してください。

## キャリブレーション

VMC互換のトラッキングシステムのキャリブレーションは、外部アプリケーションで行います。

## よくある質問 {#FAQ}

よくある質問については、[「概要」](overview#FAQ)と[「ポーズトラッキングのカスタマイズ」](body-tracking#FAQ)を参照してください。

### 私のキャラクターは非常に奇妙なポーズをとっています

まず、Warudoと外部アプリケーションに同じモデルがロードされていることを確認します。

また、モデルには正規化されたボーンが必要です。つまり、モデルがTポーズのとき、モデル内のボーンの初期回転がすべて 0 である必要があります。そうでない場合、他のソフトウェアに送信されるデータへの互換性が失われる可能性があります。

モデルが[VRM形式](https://vrm.dev/)であれば、ほとんどの場合、問題はないはずです。ただし、非常にまれなケースでは、モデル制作者がエクスポート時に、Enforce T-Poseオプションをオンにしていない可能性があります。このオプションをチェックした状態で再エクスポートすることで問題を修正できます。詳細については、[このページ](../modding/character-mod#normalize-bones)を参照してください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
