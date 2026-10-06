---
sidebar_position: 50
translate_from_version: 2025-10-30
---

# ダンス・ダンス・ダンス

視聴者の応援に楽しくお礼をする方法をお探しですか？ このチュートリアルでは、YouTube の Super Chat や Twitch の引き換えなど、寄付を受け取ったときにキャラクターを踊らせます。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/dance.mp4" /></div>
<p class="img-desc">応援してくれる視聴者にダンスでお礼をしましょう！</p>

## 配信プラットフォームへの接続

始める前に、オンボーディングアシスタントを使って Warudo を Twitch、YouTube、または Bilibili のアカウントに接続する必要があります。まだ行っていない場合は、[はじめに](../../tutorials/getting-started.md#interaction-setup)チュートリアルを参照してください。このチュートリアルでは Twitch で配信しているものとしますが、他のプラットフォームでも手順は似ています。

:::tip
寄付やその他の配信イベントを受け取った際に Warudo へ WebSocket メッセージを送信できる [Streamer.bot](https://streamer.bot/) などのサードパーティ連携も使用できます。その場合、オンボーディングアシスタントを使う必要はありません。
:::

最小限の例から始めましょう。Twitch の引き換えを受け取ったら、キャラクターを踊らせたいとします。必要なノードは 2 つだけです。

![](/doc-img/en-blueprint-dance-1.png)

:::info
**Play Character One Shot Overlay Animation** ノードはキャラクターにワンショットアニメーションを再生します。つまり、キャラクターのアイドルアニメーションを切り替えるのではなく、再生中のアイドルアニメーションの上にアニメーションを重ねて再生します。アニメーションが終わると、キャラクターは自動的にアイドルアニメーションに戻ります。
:::

:::tip
**On Twitch Channel Points Redeemed** ノードの代わりに、もちろん好きなイベントノードを使用できます。たとえば YouTube で配信している場合は、代わりに **On YouTube Super Chat Received** ノードを使用できます。あるいは、WebSocket を使って通信できるサードパーティ連携を使っている場合は、**On WebSocket Message Received** ノードを使用できます。
:::

どうテストすればよいでしょうか？ 誰かが Twitch 報酬を引き換えるのを待つこともできますが、それではあまり効率的ではありません。代わりに、Warudo ではノードを手動でトリガーできます。Play Character One Shot Overlay Animation ノードの **Enter** フロー入力をクリックしてください。

![](/doc-img/en-blueprint-dance-2.png)

これでキャラクターが踊り始めるはずです！

## If Branch

現在は、どの Twitch 引き換えを受け取ってもキャラクターが踊り始めます。しかし、「Dance」という特定の引き換えを受け取ったときだけ踊らせたい場合はどうでしょうか？ **If Branch** ノードの出番です。次のように、2 つのノードの間に追加しましょう。

![](/doc-img/en-blueprint-dance-3.png)

先ほど見た Flip Flop ノードと同様に、If Branch ノードには **If True** と **If False** という 2 つのフロー出力があります。2 つのフロー出力を交互に切り替えるのではなく、トリガーされるフロー出力は **Condition** データ入力の値によって決まります。Condition が Yes なら If True フロー出力がトリガーされ、そうでなければ If False フロー出力がトリガーされます。

これをテストするには、If Branch ノードの Enter フロー入力をクリックします。Condition は現在 No に設定されているため、If False フロー出力がトリガーされますが、その先には何も接続されていないので何も起こりません。

Condition を Yes に設定し、もう一度 Enter フロー入力をクリックしましょう。今度は If True フロー出力がトリガーされ、キャラクターが踊り始めます！

あとは、Condition を意味のあるものに設定するだけです。今回は、Twitch の引き換え名が「Dance」と等しいかを確認したいのでした。まさにそれを行うノードが **String Equal** ノードです。ノードエディターに追加し、以下のように **String Equal → Output Boolean** データ出力を **If Branch → Condition** に接続します。

![](/doc-img/en-blueprint-dance-4.png)

String Equal ノードはとてもシンプルです。2 つの文字列を比較し、等しければ Yes、そうでなければ No を出力します。（文字列とは「テキスト」を少し格好よく言ったものです。）今回は、**On Twitch Channel Points Redeemed → Reward Title** を **String Equal → A** に接続し、**String Equal → B** を「Dance」に設定します。すると、String Equal ノードがトリガーされたときに Twitch の引き換え名が「Dance」と等しいかを確認し、その結果を If Branch ノードに渡します。（ブール値とは、YesまたはNoのいずれかを表す値です。）

:::tip
Reward Title を B に接続して、A を「Dance」に設定することもできます。この場合、順序は関係ありません。
:::

![](/doc-img/en-blueprint-dance-5.png)

できました！ Twitch チャンネルで「Dance」報酬を引き換えてみてください。キャラクターが踊り始めるはずです！

## ダンスをランダム化する

常に同じダンスアニメーションを再生するのではなく、ランダムなダンスアニメーションを選びたい場合はどうでしょうか？ [前のチュートリアル](buried)の Get Random Prop ノードを覚えていれば、**Get Random Character Animation** ノードもあることは驚きではないでしょう。したがって、次のようにブループリントを設定できます。

![](/doc-img/en-blueprint-dance-6.png)

Play One Shot Overlay Animation ノードがトリガーされると、Get Random Character Animation ノードがトリガーされ、**Character Animations** リストからランダムなアニメーションを出力します。私の場合は、「Short Dance 1」、「Short Dance 2」、「Short Dance 3」のいずれかです。

## 結果をランダム化する

VTuber として、寄付を受け取ったときにサプライズ要素を残したいことがあるかもしれません。ただダンスを始める代わりに、[自分を空中に飛ばす](ragdoll)ことや、[ぬいぐるみをたくさんスポーンする](buried)ことなど、別のことをする可能性を持たせたいかもしれません。実装してみましょう！

:::tip
以下では簡潔にするため **Get Random Character Animation** ノードを削除していますが、必要であれば残しておいてもかまいません。
:::

まず、If Branch ↔ Play Character One Shot Overlay Animation 間の接続を削除しましょう。If Branch ノードのすぐ後に **Switch On Integer** ノードを追加し、次のように **Cases** リストに 3 つのエントリーを追加します。

![](/doc-img/en-blueprint-dance-7.png)

Switch On Integer ノードは次のように動作します。ノードがトリガーされると、**Input Integer** データ入力の値を確認し、対応するフロー出力をトリガーします。たとえば Input Integer が 1 なら、1 とラベル付けされたフロー出力がトリガーされます。Input Integer が 2 なら、2 とラベル付けされたフロー出力がトリガーされます。以下同様です。

各フロー出力を異なる結果に接続しましょう。たとえば私は、1 とラベル付けされたフロー出力を Play Character One Shot Overlay Animation ノードに、2 を **Play Sounds** ノードに、3 を **Spawn Particle** ノードに接続しました。両方のノードの **Source** オプションを設定することを忘れないでください。

![](/doc-img/en-blueprint-dance-8.png)

ではテストしましょう！ **Switch On Integer → Input Integer** を 1 から 3 の任意の数字に手動で設定し、Enter フロー入力をクリックします。すべてがうまくいけば、対応するノードがトリガーされるはずです。

![](/doc-img/en-blueprint-dance-9.png)

最後に必要なのは、Input Integer をランダム化することです。もうおわかりかもしれません。**Generate Random Integer** ノードがあります！ **Value Min** を 1、**Value Max** を 3 に設定すると、1 から 3 の間の整数を出力します。

![](/doc-img/en-blueprint-dance-10.png)

以下が完成したブループリントです。さあ、視聴者と楽しんでください！

![](/doc-img/en-blueprint-dance-11.png)

## If Branch の詳細

If Branch の条件には String Equal ノードを使用しましたが、他にも使用できる条件があります。たとえば **Integer Greater Than Or Equal** ノードを使い、**On Twitch Channel Points Redeemed → Reward Cost** が 1,000 以上かを確認できます。これにより、1,000 ポイント以上の Twitch 引き換えを受け取るたびにキャラクターが踊ります。

**Boolean AND** ノードと **Boolean OR** ノードを使って、複数の条件を組み合わせることもできます。次のブループリントは、Twitch の引き換え名が「DJ」と等しく、かつ、引き換えたユーザーの名前に「bot」が含まれているかを確認します。

![](/doc-img/en-blueprint-dance-12.png)

次のブループリントでは、500 ポイント以上の Twitch 引き換えを受け取ったとき、または、その引き換えがユーザー「hakuyatira」からのものであるときに、キャラクターが踊ります。

![](/doc-img/en-blueprint-dance-13.png)

## インタラクションブループリント

オンボーディングアシスタントを使ってインタラクションブループリントを設定したことがあれば、それが今作成したブループリントと非常によく似たことをしていると気付いたかもしれません！ ノードの数は多いかもしれませんが、中核となるロジックは同じです。配信イベントを受け取ったら、何か面白いことをします。

新しく得た知識を活かして、独自のインタラクションブループリントを作成できるようになりました！ これまでのチュートリアルで学んだことを自由に取り入れ、チャンネルならではのものを作ってみてください。まだもっと楽しいことを探しているなら、続きを読みましょう！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
