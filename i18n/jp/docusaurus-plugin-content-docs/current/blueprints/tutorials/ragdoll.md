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

God, this node is huge. There are many options on the **Throw Prop At Character** node, so let's unpack it a bit.

* **Impact Particle Source** and **Impact Particle Scale** determine the particle effect that is played when the prop hits the character; I will choose "Basic Impact 02" here, but you can open the preview gallery by clicking on the gallery icon to see all the available particles.
* **Launch Sound Source**, **Impact Sound Source** and **Sound Volume** are pretty much self-explanatory. 
* The **From** dropdown allows you to choose where the prop is thrown from. You can choose from the following options:
  * Viewport Bounds Random Position: Anywhere on screen, i.e., simulating a prop being thrown from the camera.
  * Screen Edge: Anywhere on the edge of the screen, i.e., simulating a prop being thrown from outside the camera.
  * Above Character Head: Right above the character's head.
  * Scene Object: A scene object, can be another prop, a character, or an [anchor](../../assets/anchor).
  * World Position: A 3D point in the scene.
  
  The default "Viewport Bounds Random Position" works good for us.
* The **To** dropdown allows you to choose where the prop is thrown to. You can choose from the following options:
  * Body Random Position: Anywhere on the character's body.
  * Human Body Bone: A standard bone on the character's body, e.g., the head, the left hand, etc.
  * Transform Path: Any child transform of the character. For example, if you want to throw at your character's tail, you can choose the tail transform here.
  
  I will change this to "Human Body Bone" and choose the "Head" bone, since that seems more, well, satisfying.
* **Scale**, **Mass**, **Speed** and **Gravity** are the physical properties of the prop and determine how the character reacts to the prop. You can adjust them to your liking; I will change Scale to 2 and Speed to 10.
* **Launch Torque** and **Randomize Launch Rotation** determine the rotation of the prop when it is launched.
* **Alive Time** determines how long the prop will stay in the scene before it disappears.

Now, when you press Space, the prop will be thrown at our character's head, and our character reacts to it.

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
