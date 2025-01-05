---
sidebar_position: 30
---

# ぬいぐるみに埋もれて

混沌を生み出すことは喜びを作り出すことです。このチュートリアルでは、たくさんの動物のぬいぐるみを出現させて、その下にキャラクターを埋もれさせる方法を学びます。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/jp/doc-img/buried.mp4" /></div>
<p class="img-desc">動物のぬいぐるみに埋もれる様子</p>

## 複数のブループリント {#multiple-blueprints}

これまでのチュートリアルを追っていただいている方はお気づきかもしれませんが、各インタラクションごとに新しいブループリントを作成してきました。すべてのノードを同じブループリントに追加することはできないのでしょうか？

確かに、技術的には複数のブループリントでできることは、1つのブループリントでも実現できます。しかし、整理整頓を心がけることは良い習慣です。複数の小さなブループリントを使用することで、他のものに影響を与えず特定のインタラクションを一時的に無効にすることができます。さらに、ブループリントを他の人と共有したい場合、無関係なノードがたくさんあるブループリントよりも、単一のブループリントを共有する方がはるかに簡単です。

パフォーマンスの問題もあります。Warudoエディタは大量のノードを扱うようには設計されていません。1つのブループリントに100個以上のノードがあると、遅延が発生し始めます。そのため、可能な限り複数の小さなブループリントに分割することが望ましいです。

## 繰り返し処理 {#for-loop}

では、ブループリントを作成しましょう！動物のぬいぐるみを出現させるのは簡単です。すでに[おなじみの](./ragdoll) **キャラクターにアイテムを投げる（Throw Prop At Character）** ノードを使用するだけです。でも、複数のぬいぐるみを出現させるにはどうすればいいでしょうか？

答えは、**Forサイクル（For Loop）** ノードです。名前から推測できるかもしれませんが、このノードは何かを複数回行うことを可能にします。しかし、説明は後回しにしましょう。まずは以下のブループリントを再現してみてください。Forサイクルノードでは、**ラストインデックス** を `100` に、**間隔** を `0.01` に設定しています。**キャラクターにアイテムを投げる** ノードでは、**アイテムのソース**を「トラ」に、**出発点**を「キャラクターの頭上」に設定しています。これにより、トラのぬいぐるみがキャラクターの頭上から落ちてくることになります。

![](/doc-img/jp-blueprint-buried-1.png)

他の2つのノードが何をしているかは分かりますね：**キーボードボタンを押したとき**ノードはホットキーとして `Ctrl+Shift+Z` を定義し、**キャラクターにアイテムを投げる**ノードはトラのプロップを生成してキャラクターに投げつけます。しかし、**Forサイクル**ノードは何をしているのでしょうか？`Ctrl+Shift+Z`を押して、何が起こるか見てみましょう。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/jp/doc-img/buried-2.mp4" /></div>
<p class="img-desc">痛い！</p>

たくさんのトラがいますね！でも、いったい何匹でしょうか？**Forサイクル**ノードをもう少し詳しく見てみましょう。

簡単に言えば、このノードは次のように動作します： 「**ファーストインデックス**（1）から**ラストインデックス**（100）までの各数字について、0.01秒の**間隔**で、**ループボディ**フロー出力をトリガーする」

ループボディフロー出力が**キャラクターにアイテムを投げる**ノードに接続されているので、言い換えれば、「1から100までの各数字について、0.01秒ごとにトラの小道具を生成してキャラクターに投げつける」ということになります。さらに簡単に言えば、「1秒間に100個のトラの小道具を生成してキャラクターに投げつける」ということです。

![](/doc-img/jp-blueprint-buried-3.png)

:::tip

**ラストインデックス** を `1000` に設定するとどうなるか、予想できますか？ また、**間隔** を `0` に設定するとどうなるでしょうか？
:::

しかし、キャラクターを埋めるには、ラグドールに変える必要があります。手順はご存知ですね。**キャラクターラグドールをアクティブにする**ノードです。ここでは、**突出力**を (0, -100, 0) に設定し、キャラクターを下方に押し出します。

![](/doc-img/jp-blueprint-buried-4.png)

## ぬいぐるみをランダムにする {#randomizing-the-plushies}

ここまでは素晴らしいのですが、1つ問題があります：すべてのぬいぐるみがトラなのです。様々な種類の動物を出現させたい場合はどうすればよいでしょうか？

**キャラクターにアイテムを投げる**ノードをよく見てみましょう。**アイテムソース**をトラに設定しましたが、その横にある黒い点に気づきましたか？これは、何かをそこに接続できることを意味します。つまり、自分でドロップダウンから小道具を選択する代わりに、ノードにどの小道具を出現させるかを決定させることができます。ただし、そのノードが小道具を提供するデータ出力を備えていることが条件となります。まさにこれが**ランダムアイテムの取得**ノードの役割です。

![](/doc-img/jp-blueprint-buried-2.png)

上記の例では、**ランダムアイテムの取得**ノードの**アイテムソース**データ出力を**キャラクターにアイテムを投げる**ノードの**アイテムソース**データ入力に接続しました。**ランダムアイテムの取得**ノードはその名の通りの動作をします：**アイテム**リストまたは**コレクション**リスト内の任意の小道具コレクションからランダムに小道具を選択します。この場合、**コレクション**リストに「へんてこりんな動物」コレクションを追加したので、**ランダムアイテムの取得**ノードはランダムに動物のぬいぐるみ小道具を選択し、それを**キャラクターにアイテムを投げる**ノードに出力します。

もう一度`Ctrl+Shift+Z`を押して、何が起こるか見てみましょう。すべてがうまくいけば、様々な種類の動物がキャラクターの頭上に落ちてきて、キャラクターが動物たちに埋もれてしまうはずです。楽しいですね！

:::info
技術的な詳細に興味がある方のために説明すると、ノードのデータ入力は、ノードがトリガーされたときにのみ評価されます（つまり、接続されたデータ出力から取得されます）。この場合、裏側で起こっていることは、**キャラクターにアイテムを投げる**ノードが**Forサイクル**ノードによってトリガーされるたびに、**ランダムアイテムの取得**ノードもトリガーされ、毎回異なる小道具を出力しているのです。
:::

## More on For Loop

You may have noticed that the For Loop node has a **Loop Index** data output. This data output gives us the current index of the loop, starting from **First Index** and ending at **Last Index**. In the above example, the **Loop Index** data output gives us a number from 1 to 100. What can we do with this number?

Here's an idea: connect the **Loop Index** to the **Scale** data input of the Get Random Prop node, like below. Can you guess what will happen?

![](/doc-img/en-blueprint-buried-5.png)

If you correctly guessed that the falling plushies will become bigger and bigger, awesome!

:::tip
What if we want to make the plushies smaller and smaller instead? Or instead of a scale from 1 to 100, we want a scale from 0.1 to 10? Try to figure this out yourself! The **Float Subtraction** and **Float Multiplication** nodes may be useful.
:::

The **For Loop** node also has **On Loop End** and **Exit** flow outputs. The **On Loop End** flow output is triggered when the loop ends, while the **Exit** flow output is triggered immediately after the loop is started. Try adding two **Show Toast** nodes like below, and see what happens.

![](/doc-img/en-blueprint-buried-6.png)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
