---
sidebar_position: 40
translate_from_version: 2025-10-30
---

# カラオケタイム

配信でのカラオケを嫌いな人なんているでしょうか？ でも今は 3D の世界にいるのですから、キャラクターにマイクを持たせてリアリティを加えましょう。このチュートリアルでは、歌うポーズとマイクの道具をホットキーで切り替える方法を紹介します。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/karaoke.mp4" /></div>
<p class="img-desc">心を込めて歌います！</p>

:::tip
このカラオケルーム環境を使いたい場合は、Warudo の **Discover** タブから Steam Workshop でダウンロードできます。
:::

## アイドルアニメーションを再生する

まず、マイクの道具を追加し、キャラクターの左手にアタッチします。方法がわからない場合は、[はじめに](../../tutorials/getting-started.md#assets-tab)チュートリアルを参照してください。次に、道具アセットで **Enabled** を No に設定し、ひとまずマイクを非表示にします。

次に、すでにおなじみの On Keystroke Pressed ノードと、2 つの新しいノード **Toggle Asset Enabled**、**Play Character Idle Animation** を使って、以下のブループリントを再現してみましょう。（名前から何をするものかわかりますよね？）**Toggle Asset Enabled → Asset** をマイクの道具に、**Play Character Idle Animation → Animation** を歌うポーズに設定することを忘れないでください。私は「010_0970」を使っていますが、ほかのポーズも自由に試してみてください。

![](/doc-img/en-blueprint-karaoke-1.png)

できました！ これでホットキー M を押すとマイクが現れ、キャラクターはそれを持ち上げて、歌う準備が整います。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/karaoke-2.mp4" /></div>

これはあなたには簡単すぎるので、もう少し面白くしてみましょう。マイクが現れるときに「シュッ」という効果音を再生する方法を思いつきますか？

「簡単です」とあなたは言います。検索バーに「sound」と入力すると、あっ！ **Play Sound** ノードがあります。ノードエディターに追加し、**Sound Source** をシュッという効果音に設定して、Play Character Idle Animation ノードの隣に接続します。

![](/doc-img/en-blueprint-karaoke-2.png)

M を押すと、音は問題なく再生されます。素晴らしい！ しかし、マイクを出すときでもしまうときでも、効果音が再生されることに注意してください。マイクを出すときだけ効果音を再生する方法はあるでしょうか？

## Flip Flop

答えは **Flip Flop** ノードです。通常、ノードには Enter フロー入力と Exit フロー出力があります。しかし Flip Flop ノードは特別で、**A** と **B** という 2 つの Exit フロー出力があります。Flip Flop ノードが最初にトリガーされると、**A** でフローをトリガーします。2 回目には **B** でフローをトリガーし、3 回目には再び **A** でフローをトリガーします。以後も同様です。つまり、Flip Flop ノードはトリガーされるたびに **A** と **B** を交互に切り替えます。

便利ですね。以下のようにブループリントを組み直しましょう！

![](/doc-img/en-blueprint-karaoke-3.png)

これで、マイクを出すときだけ効果音が再生されます！

## アニメーションプロファイル

かわいいのですが、Play Character Idle Animation ノードを使うには制約があります。あらかじめ定義されたポーズ／アニメーションしか選択できないのです。たとえば、キャラクターの左手だけを上げてほかは動かしたくないのですが、リストにはそのようなポーズがありません。そこで **Character → Overlaying Animations** が役立ちます。

キャラクターアセットを開き、**Idle Animation** を Generic に設定してデフォルトポーズにリセットし、**Overlaying Animations** までスクロールします。**+** ボタンをクリックしてリストに新しいエントリーを追加し、**Animation** ドロップダウンから「010_0970」を選択します。

![](/doc-img/en-blueprint-karaoke-8.png)

キャラクターは期待どおりのポーズを取ります。

![](/doc-img/en-blueprint-karaoke-9.png)

次に、左手だけを上げるため、**Masked** を Yes に設定し、以下のように **Masked Body Parts** リストへ **Left Arm** を追加します。

![](/doc-img/en-blueprint-karaoke-4.png)

ポーズに満足できるまで **Weight** オプションも調整してください。この例では 0.88 に設定しましたが、キャラクターによって異なります。

これでキャラクターは左手だけを上げます。

![](/doc-img/en-blueprint-karaoke-5.png)

では、このポーズをブループリントからどうトリガーすればよいでしょうか？ まず、アニメーションプロファイルを保存する必要があります。アニメーションプロファイルは、キャラクターの現在のアニメーション設定、つまり Idle Animation、Overlaying Animations、Override Hand Poses などのスナップショットです。**Save Animation Profile** ボタンをクリックしましょう。

![](/doc-img/en-blueprint-karaoke-6.png)

「LeftHandMic」などの名前を付け、**OK** をクリックします。

![](/doc-img/en-blueprint-karaoke-7.png)

アニメーションプロファイルを保存したので、**Load Animation Profile** ボタンを使っていつでも読み込めるようになりました！

ブループリントからこれを行う方法はすぐに見ていきますが、まずはアイドルポーズ用の別のアニメーションプロファイルを作成しましょう。私はシンプルに、Overlaying Animations リストをクリアし、Idle Animation を Generic に設定します。もちろん、カスタムのアイドルポーズを作成してもかまいません！

「Idle」という名前で別のアニメーションプロファイルを保存すれば、準備完了です！ ブループリントに移動し、「Play Character Idle Animation」ノードを「Load Animation Profile」ノードに置き換えます。**Profile** ドロップダウンから正しいプロファイルを選択することを忘れないでください。

![](/doc-img/en-blueprint-karaoke-10.png)

これで M を押すと「LeftHandMic」アニメーションプロファイルが読み込まれ、もう一度 M を押すと「Idle」アニメーションプロファイルが読み込まれます！

:::tip
上記は、オーバーレイアニメーションとアニメーションプロファイルの使用例の 1 つにすぎません。重要なのは、それらによってさまざまなポーズとアニメーションを組み合わせられるため、思いどおりにキャラクターをポーズさせられることです。
:::

## フローを遅延させる

最後に、小さな問題を直しましょう。キャラクターがマイクをしまうと、マイクがすぐに消えてしまうことに注意してください。キャラクターがマイクをしまった後に消えるほうが、よりリアルです。どうすれば実現できるでしょうか？

:::tip
ヒント：**Delay Control Flow** ノードを使うと実現できます。続きを読む前に、ぜひ試してみてください！
:::

簡単な解決策はこちらです。Toggle Asset Enabled ノードと Play Character Idle Animation ノードの順序を入れ替え、その間に Delay Control Flow ノードを追加するだけです。**Delay** を 1s に設定すると、キャラクターがマイクをしまってから 1s 後にマイクが消えます。

![](/doc-img/en-blueprint-karaoke-11.png)

Delay Control Flow ノードは、指定した遅延の後にのみ Exit でフローをトリガーします。このノードを使うと、順番に起こるイベントの連続を作成できます。たとえば、キャラクターを 5s 間踊らせ、その後突然たくさんの道具を頭の上に落とし、最後に爆発パーティクルエフェクトを再生させることができます。すべてはあなたの想像力次第です！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
