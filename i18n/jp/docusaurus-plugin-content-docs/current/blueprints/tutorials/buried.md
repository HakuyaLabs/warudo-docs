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

## Randomizing the Plushies

So far everything is great, but there is one problem: all the plushies are tigers. What if we want to spawn all sorts of animals?

Well, let's take a look at the **Throw Prop At Character** node. We have set the **Prop Source** to Tiger, but see that black dot next to it? It means that we can connect something to it. In other words, instead of selecting a prop from the dropdown ourselves, we can let a node decide which prop to spawn, as long as that node has a data output that gives us a prop. That's exactly what the **Get Random Prop** node does.

![](/doc-img/en-blueprint-buried-2.png)

In the above, we have connected the **Prop Source** data output of the Get Random Prop node to the **Prop Source** data input of the Throw Prop At Character node. The Get Random Prop node does what it says: it randomly selects a prop from the **Props** list, or from any prop collection in the **Collections** list. In this case, we have added the "Quirky Animals" collection to the **Collections** list, so the Get Random Prop node will randomly select an animal plush prop, and output it to the Throw Prop At Character node.

Let's press Ctrl+Shift+Z again and see what happens. If everything goes well, you should see a bunch of different animals falling onto the character's head, burying the character under them. Fun stuff!

:::info
If you are interested in nitty-gritty technical details, the data inputs of a node are only evaluated (i.e., sourced from the connected data output) when the node is triggered. So, in this case, what happens behind the scenes is that the Get Random Prop node is triggered every time the Throw Prop At Character node is triggered (by the For Loop node), outputting a different prop each time.
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
