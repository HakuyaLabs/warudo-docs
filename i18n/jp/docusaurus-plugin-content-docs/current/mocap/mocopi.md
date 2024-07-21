---
sidebar_position: 80
---

# Sony Mocopi

[Sony Mocopi](https://electronics.sony.com/more/mocopi/all-mocopi/p/qmss1-uscx)によるボディトラッキング。

## 設定 {#setup}

Mocopiの基本設定は、[公式チュートリアルビデオ](https://www.youtube.com/watch?v=g0d-x0l2HtA)に従ってください。

<iframe width="560" height="315" src="https://www.youtube.com/embed/g0d-x0l2HtA?si=0mOT9DLhOW6XY5M6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Mocopiのキャリブレーション設定が完了したら、Mocopiアプリの設定画面を開きます。**[外部機器との接続設定]** で、**[送信フォーマット]** に **[mocopi（UDP）]** を選択し、 **[IPアドレス]** に、PCのIPアドレスを入力します。 **[送信ポート設定]** は、Warudo側のポート番号と合わせてください。

![](/doc-img/jp-mocopi-2.png)



:::tip

PCのIPアドレスがわからない場合は、 **[Mocopi Receiver]** アセットのプロパティ画面で確認できます。

![](/doc-img/jp-mocopi-3.png)

複数のIPが表示されている場合は、それぞれ試す必要があります。通常、Wi-FiルーターによってPCに割り当てられたIPアドレスは `192.168` から始まります。たとえば上の図では、まずを`192.168.1.151`を試してみてください。
:::

Mocopiアプリに戻り、メニューバーの **[モーション]** をタップし、**[保存]** アイコンをタップして **[送信]** モードに切り替えます。画面下部にある緑色の **[送信]** ボタンをタップして、トラッキングデータの送信を開始します。

![](/doc-img/jp-mocopi-1.png)

## キャリブレーション {#calibration}

Mocopiのキャリブレーションは、Mocopiアプリで行います。

## オプション {#options}

* **Motion Buffering**: Mocopiの内蔵モーションバッファリングを有効にするかどうかの設定です。Warudoはすでにモーションデータをスムージングしているため、通常は無効にして問題ありません。

## よくある質問 {#FAQ}

よくある質問については、「[概要](overview#FAQ)」と「[フェイストラッキングのカスタマイズ](face-tracking#FAQ)」を参照してください。

### 時間経過とともにトラッキングがズレてしまいます

これは慣性モーションキャプチャシステムによく見られる問題で、累積したエラーにより時間の経過とともにズレが生じます。ズレを減らすには、トラッキングセンサーの近くに磁気や電気的な干渉がないことを確認しましょう。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
