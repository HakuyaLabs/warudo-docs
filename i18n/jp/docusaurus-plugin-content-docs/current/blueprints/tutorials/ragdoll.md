---
sidebar_position: 20
---

# 空へ打ち上げ

空高く打ち上げられたいですか？私もそうは思いません。でも面白いので、やってみましょう！このチュートリアルでは、キャラクターが小道具に当たったときにラグドール物理を有効にする方法を学びます。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/jp/doc-img/ragdoll.mp4" /></div>
<p class="img-desc">キャラクターをラグドール化する。</p>

## 小道具を投げる {#throwing-props}

新しいブループリントを作成しましょう。ここではトリガーとして、再び「**キーボードボタンを押したとき(On Keystroke Pressed)**」ノードを使用しますが、好きなイベントノードを使用できます。動作確認のしやすさから、ホットキーを**スペース**キーに設定します。次に、**キャラクターにアイテムを投げる（Throw Prop At Character）** ノードをその隣に追加し、以下のようにノードを接続します。**キャラクター**オプションを自分のキャラクターに、**アイテムソースe**オプションをキャラクターに投げたい小道具モデルに設定します（私は「アシカ」を選びます）。

![](/doc-img/jp-blueprint-ragdoll-1.png)

このノードは巨大です。**キャラクターにアイテムを投げる** ノードには多くのオプションがありますので、少し詳しく見ていきましょう。


* **衝突パーティクルソース** と **スケール** は、小道具がキャラクターに当たった際に再生されるパーティクル効果を決定します。ここでは「Basic Impact 02」を選択しますが、ギャラリーアイコンをクリックしてプレビューギャラリーを開き、利用可能なパーティクルをすべて確認することもできます。
* **発射音ソース**、**衝突音ソース**、**サウンドボリューム**は、その名の通りです。
* **出発点**のドロップダウンメニューでは、小道具が投げられる場所を選択できます。以下のオプションから選択できます。
  * 視界境界ランダム座標：画面上の任意の位置、つまりカメラから小道具が投げられるようシミュレートします
  * スクリーンエッジ：画面の端のどこか、すなわちカメラの外から小道具が投げ入れられるようシミュレートします
  * キャラクターの頭上：キャラクターの頭の真上から落下します
  * シーンオブジェクト：シーン上のオブジェクトを出発点とします。キャラクター、カメラ、指向性ライト、環境などを指定します
  * ワールド位置：シーン内のワールド座標から出発点を指定します

  デフォルトの「視界境界ランダム座標」が最適です。
* ドロップダウンメニューの **到達点** では、小道具がどこに投げられるかを選択できます。以下のオプションから選択できます。
  * ボディランダム位置：キャラクターの身体のどこかランダムな場所に投げられます　
  * 人体骨格：キャラクターの身体の標準的なボーン、例えば頭部、左手などを指定します
  * 変換パス：キャラクターの子トランスフォーム、例えば、キャラクターの尻尾に投げたい場合は、ここで尻尾のトランスフォームを選択できます

  私はこれを「人体骨格」に変更し、「ヘッド」のボーンを選択します。違和感のないアクションになると思います。
* **スケール**、**品質（質量）**、**スポード**、**重力**は、小道具の物理的特性であり、キャラクターが小道具にどのように反応するかを決定します。お好みに応じて調整できます。私はスケールを 2 に、速度を 10 に変更します。
* **初期トルク**と**初期回転をランダム化**は、小道具が発射されたときの回転度合いを決定します。
* **生存時間** は、小道具が消える前にシーン内に留まる時間を決定します。

スペースキーを押すと、小道具がキャラクターの頭めがけて投げられ、キャラクターがそれに反応します。

## ラグドールの起動 {#activating-ragdoll}

But we wanted to ragdoll our character, not just make them flinch! Let's add a **Activate Character Ragdoll** node, and connect the **On Collide** flow output of the Throw Prop At Character node to the **Enter** flow input of the Activate Character Ragdoll node. Then, set the **Character** option to our character and **Launch Force** to (0, 300, -600).

![](/doc-img/en-blueprint-ragdoll-2.png)

:::caution
Note that we connect from the On Collide flow output, not the Exit output! This is because we want to activate the ragdoll _when_ the prop collides with the character. If we connect from the Exit output, the ragdoll will be activated immediately after the prop is thrown, which is not what we want.
:::

Let's press Space again. The prop gets thrown, but this time, when it hits the character, the character is launched in the classic ragdoll fashion. You can even press Space multiple times to throw props at your character again, each time hitting them with more force. Awesome!

:::tip
Other interaction nodes, such as **Launch Liquid At Character** and **Spawn Sticker From Local/Online Image**, can be configured similarly. Try to play around with them and see what you can come up with!
:::

## ラグドールのリセット {#resetting-ragdoll}

キャラクターが5秒後にリセットされることに気付くでしょう。これはActivate Character Ragdollノードの**Reset Wait Time**オプションを調整することで変更できます。また、Auto ResetをNoに設定し、**Reset**フロー入力を手動でトリガーすることで、**自動リセット**を無効にすることもできます。例えば、以下のブループリントでは、**R**キーを押したときにのみキャラクターがリセットされます。

You will notice that the character resets after 5 seconds, which can be changed by adjusting the **Reset Wait Time** option on the Activate Character Ragdoll node. You can also disable automatic resetting by setting **Auto Reset** to No, and trigger the **Reset** flow input manually. For example, the following blueprint will only reset the character when you press the **R** key.

![](/doc-img/en-blueprint-ragdoll-3.png)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
