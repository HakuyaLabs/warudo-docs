---
sidebar_position: 100
translate_from_version: 2024-06-14
---

# 居眠りする

配信中に休憩を取るのはよくあることです。Warudo では、顔のトラッキングがされなくなると、キャラクターはゆっくりとアイドル時のポーズと表情に戻ります。このチュートリアルでは、代わりにキャラクターを眠っているポーズと表情へ移行させ、さりげないリアリティを加えます。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/nap.mp4" /></div>
<p class="img-desc">仕事中におやすみ！</p>

:::info
このチュートリアルでは、顔トラッキングに iFacialMocap または MediaPipe を使用していることを前提としています。ほかの顔トラッキングシステムでは、顔がトラッキングされなくなったときに信号を提供しないため、動作しない可能性があります。
:::

## 顔トラッキングのブループリント

顔トラッキング用ブループリントを開きましょう！オンボーディング中に選択したブループリントのオプションによっては、以下のものとは見た目が異なるかもしれませんが、基本的な考え方は同じです。それに、どれも同じくらい恐ろしい見た目です――ノードと接続がたくさんあります！

![](/doc-img/en-blueprint-nap-1.png)

このブループリントのすべてのノードを扱うことはしませんが、いくつかの部分に分けて見ていきましょう。まず、左側に次のノードの並びが見えるはずです。

![](/doc-img/en-blueprint-nap-2.png)

これは簡単です！[以前のチュートリアル](balloon#resetting-bone-scale)で、すでに On Disable Blueprint ノードを見ています。このノードはブループリントが無効化されたときにトリガーされ、この顔トラッキング用ブループリントは **Character → Motion Capture** をオフにすると無効化されます。そのため、モーションキャプチャを無効化すると、キャラクターの表情（BlendShape）は **Reset Character Tracking BlendShapes** ノードによりリセットされ、キャラクターのボーン（頭、目など）は **Reset Overridden Character Bones** ノードによりリセットされます。

では、ブループリントの右側を見てみましょう。

![](/doc-img/en-blueprint-nap-3.png)

[On Update ノード](balloon#on-update)はすでにおなじみでしょう。これは Warudo の実行中、毎フレームトリガーされます。このノードの並びは、毎フレーム、キャラクターの BlendShape（**Set Character Tracking BlendShapes**）、ボーン（**Override Character Bone Rotation Offsets**）、ルート位置（**Override Character Root Position**）を更新したいという意味です。しかし、どの BlendShape、どのボーン、どのルート位置でしょうか？それを担うのがブループリント中央のノードです。

![](/doc-img/en-blueprint-nap-16.png)

## BlendShapeリストを切り替える

幸い、このチュートリアルの目的では、いくつかのノードだけを見れば十分です。**Get iFacialMocap Receiver Data** ノードを探してください（MediaPipe を使っている場合は **Get MediaPipe Receiver Data** ノードです）。これは顔トラッキングデータを提供する「ソース」ノードです。

![](/doc-img/en-blueprint-nap-4.png)

現在はノード間の接続が近すぎるため、分かりやすくするために Get iFacialMocap Receiver Data ノードを次のように左下へ移動しましょう。

![](/doc-img/en-blueprint-nap-5.png)

Get iFacialMocap Receiver Data、Empty BlendShape List、Switch BlendShape List の3つのノードが見えるまで、ブループリントをズームおよびパンしてください。まだ **Switch BlendShape List** ノードについて何も知らなくても、そこへの接続を確認するだけで、その働きを推測できますか？

![](/doc-img/en-blueprint-nap-6.png)

解き明かしていきましょう。まず、**Get iFacialMocap Receiver Data → Is Tracked** が **Switch BlendShape List → Condition** に接続されています。これは、Switch BlendShape List ノードが顔をトラッキングしているかどうかを気にしていることを意味します。顔がトラッキングされていれば Condition は Yes、そうでなければ Condition は No です。

次に、**Empty BlendShape List → Output** が **Switch BlendShape List → If False** に接続され、**Get iFacialMocap Receiver Data → BlendShapes** が **Switch BlendShape List → If True** に接続されていることが分かります。ふむ、分かってきた気がします！

そのとおりです。Switch BlendShape List ノードは本質的に、その時点で顔がトラッキングされているかを確認します。顔がトラッキングされていれば、トラッキングの BlendShape を出力に渡してキャラクターに表情を反映します。そうでなければ、空の BlendShape リストを出力に渡すため、キャラクターの表情はまったくなくなります。

このノードをさらに強力にしているのは、2つの BlendShape リストを_滑らかに遷移_させて切り替えられることです。**To True/False Transition Time**、**To True/False Transition Delay**、**To True/False Transition Easing** のオプションにより、顔がトラッキングされる、またはされなくなったときにキャラクターの表情がどう変わるかを細かく制御できます。たとえば、To False Transition Time を0.5秒、To False Transition Delay を1秒に設定すると、顔がトラッキングされなくなってから1秒後に、キャラクターの表情は0.5秒かけて空の BlendShape リスト（つまり自然な表情）へ滑らかに遷移します！

とにかく、顔がトラッキングされなくなったときのキャラクターの表情を変えたい場合は、現在は単なる空の BlendShape リストである Switch BlendShape List → If False への入力を変更するだけです。その間に **BlendShape List Set BlendShape** ノードを追加して、リストに BlendShape を加えられます。

![](/doc-img/en-blueprint-nap-7.png)

上の例では、`Blink` を1に設定したエントリーを1つだけ持つ BlendShape リストを作成しています。この BlendShape リストは顔トラッキングが失われるたびに出力へ渡され、キャラクターは目を閉じます。

:::tip
キャラクターに `Blink` BlendShape がない場合は、たとえば `eyeBlinkLeft` や `eyeBlinkRight` といった、キャラクターに付属するまばたき用の BlendShape を使用できます。複数の BlendShape を設定するには、その間に別の BlendShape List Set BlendShape ノードを追加するだけです。
:::

では、iPhone のフロントカメラの前に手をかざして顔トラッキングを遮ってみてください（MediaPipe を使用している場合は、顔をカメラから離すだけです）。キャラクターが目を閉じるはずです！

![](/doc-img/en-blueprint-nap-13.png)

デフォルト設定ではかなり速く目が閉じるため、遷移をより自然にするには **To False Transition Time** と **To False Transition Delay** のオプションを調整するとよいでしょう。私はそれぞれ2秒と1秒に設定しました。

![](/doc-img/en-blueprint-nap-8.png)

## 回転リストを切り替える

:::info
この節を読む前に、オンボーディング中にアイドル時の頭部アニメーションを有効にしていた場合（トラッキングしていないときはデフォルトで有効です）、まず無効にする必要があります。**Generate Idle Head Animation** ノードを探し、**Enabled** を No に設定してください。

![](/doc-img/en-blueprint-nap-12.png)
:::


キャラクターを、たとえば頭を横に傾けるような眠っているポーズへ遷移させる手順は、実は先ほど行ったことととてもよく似ています。もう一度 Get iFacialMocap Receiver Data ノードを下側へ移動しましょう。

![](/doc-img/en-blueprint-nap-9.png)

右側に **Default Character Rotation List** と **Switch Rotation List** ノードが見えるまで移動します。

![](/doc-img/en-blueprint-nap-10.png)
![](/doc-img/en-blueprint-nap-11.png)

3Dキャラクターのポーズは各ボーンがどれだけ回転しているかで決まるため、BlendShape ではなく、ここではあちこちに「ボーン回転」が表示されています。ここにある Switch Rotation List ノードは顔がトラッキングされているかを確認し、トラッキングされていればボーン回転データ（つまり頭の動き）を出力に渡し、そうでなければデフォルトの回転リスト（つまり頭がまったく動かない状態）を出力に渡します。

頭を横に傾けるには、その間に **Offset Character Bone Rotation List** ノードを追加して頭の回転をオフセットするだけです。

![](/doc-img/en-blueprint-nap-15.png)

**Character Bones** リストに **Head** を追加し、**Rotation Offset** を (15, 0, -20) に設定しました。これは、頭が前方に15度、右に20度回転することを意味します。もちろん、好みに合わせて回転を調整したり、リストにさらにボーンを追加してキャラクターの眠っているポーズをより複雑にしたりできます！

:::tip
数字を手入力する代わりに、X/Y/Z のラベルを左右にクリック＆ドラッグして数字を調整できます。このテクニックはどの数値入力でも使えます！
:::

これで、顔がトラッキングされなくなるとキャラクターは頭を横に傾けます！

![](/doc-img/en-blueprint-nap-14.png)


<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
