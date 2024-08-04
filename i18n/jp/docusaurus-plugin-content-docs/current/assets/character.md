---
sidebar_position: 10
---

# キャラクター

キャラクターはWarudoの核となる部分です。Warudoは標準の[VRM](https://vrm.dev/en/univrm/)モデル形式をサポートしています。モデル形式がVRMでない場合（例えばMMDやVRChatモデルなど）は、[Mod SDK](../modding/mod-sdk.md)を使用して`.warudo`形式にエクスポートし、Warudoに読み込むことができます。

キャラクターファイルは、Warudoのデータフォルダの `Characters` サブフォルダに配置する必要があります。

:::info
データフォルダが見つかりませんか？**[メニュー] → [データフォルダを開く]** をクリックして開きます。

:::

## 設定

デフォルトでは、シーンにはすでにキャラクターが存在します。新しいキャラクターを追加するには、**[アセットを追加する]** メニューを使用します。

キャラクターを設定するには、**[初心者ナビ] → [基本設定] → [始める]** を使用することをおすすめします。これにより、キャラクターファイルのインポート、モーション キャプチャの設定、VRM表情のインポートが自動的に行われます。

または、キャラクターアセットで **[ソース]** を選択し、 **[モーションキャプチャーの設定]** をクリックしてモーションキャプチャを設定し、 **[VRM表情のインポート]** をクリックしてVRM表情をインポートすることで、手動でキャラクターをセット設定することもできます。

## モーションキャプチャ {#mocap}

キャラクターのモーションキャプチャを設定するには、[モーションキャプチャ](../mocap/overview#setup)ページを参照してください。モーションキャプチャを設定すると、トラッキングのキャリブレーションを行なったり、キャラクターアセット内で特定のトラッキングブループリントにアクセスできるようになります。

![](/doc-img/jp-character-1.png)
<p class="img-desc">クイックキャリブレーションとブループリントナビゲーションパネル</p>

## 表情 {#expressions}

表情は、顔のトラッキングに加えてキャラクターの表情を制御する方法です。キャラクターアセットは、 VRM Expression（[VRM BlendShape](https://vrm.dev/en/univrm/blendshape/univrm_blendshape/)）とカスタム表情の両方をサポートしています。

基本設定で、WarudoはキャラクターのすべてのVRM Expressionを自動的にインポートし、それらのホットキーを追加するためのブループリントが生成されます。また、**[VRM表情のインポート]** をクリックしてVRM Expressionを手動でインポートしたり、 **[キーバインディングブループリントの生成]** をクリックしてキーバインディングのブループリントを生成することもできます。

:::tip
`.warudo`モデルを使用している場合でも、GameObjectに`VRMBlendShapeProxy`コンポーネントがあれば、WarudoはVRM Expressionをインポートすることができます。
:::

表情リストの各表情を展開して、**[キャラクターに表情をフェード]** でプレビューしながら、設定をカスタマイズできます。

![](/doc-img/jp-character-2.png)
<p class="img-desc">表情を拡張します</p>

ブループリント内での識別に使用される表情の **[名前]** を設定できます。表情の **[レイヤー]** を設定することもできます。表情を切り替えると、同じレイヤーの表情はフェードアウトしますが、異なるレイヤーの表情は重ね合わせることができます。

:::info
VRM  Expressionをインポートする場合、VRMモデル内のデフォルトの BlendShape (Joy、Angry、Sorrow、Fun/Surprised) はレイヤー 0 に配置され、モデラーによって追加されたBlendShapeはレイヤー 1、2、3 などに配置されます。
:::

表情によってモデルの目がすでに閉じている場合は、それ以上目を閉じないようにするために、 **[瞬きトラッキングを無効化]** すると良いでしょう。同様に、**[口元トラッキングを無効にする]** オプションと **[眉毛トラッキングを無効にする]** オプションを使用すると、口と眉のBlendShapeがフェイストラッキングによって制御されるのを防ぐことができます。

**[ターゲットBlendShapeリスト]** には、この表情がアクティブなときに制御されるすべてのBlendShapeが含まれています。このリストからBlendShapeを追加または削除したり、BlendShapeごとに **[目標値]** 、**[フェード時間]**、**[フェードインイージング]**、**[フェードイン遅延]**、**[フェードアウト時間]**、**[フェードアウトイージング]**、 **[フェードアウト遅延]** をカスタマイズすることができます。

デフォルトでは、Warudoは表情の切り替え時に0.4秒のフェードインとフェードアウトの遅延を発生させます。各BlendShapeの **[フェードイン遅延]** と **[フェードアウト遅延]** は、**[ターゲットBlendShapeリスト]** からカスタマイズできます。また、フェードを完全に無効にしたい場合は、**[2値のみ]** オプションを有効にします。

### トリガー条件 {#trigger-conditions}

表情は通常ホットキーによってトリガーされますが、フェイストラッキングだけで表情をトリガーすることもできます！

設定するには、トリガー条件（**Trigger Conditions**）リストに新しいエントリを追加します。表情トリガーの条件（**Conditions**）を設定し、必要に応じてその他のオプションをカスタマイズします。たとえば、以下の設定では、`mouthSmileLeft`と`mouthSmileRight`のBlendShapeの両方が 0.5 より大きい場合に表情をトリガーします。

![](/doc-img/en-character-4.png)

**Trigger Conditions**リストには、複数のエントリを設定できます。エントリ内のいずれかの条件（**Conditions**）が満たされると、表情がトリガーされます。

:::info
条件は、フェイストラッキングのBlendShapeではなく、モデルのBlendShapeに基づいていることに注意してください。ARKit対応モデルを使用している場合は、条件としてARKit BlendShapeを選択するだけです。それ以外の場合は、使用しているフェイストラッキングに対応するモデルのBlendShapeを見つける必要がある場合があります。
:::

### 高度な設定

**ターゲットマテリアルプロパティ**リストには、この表情で制御されるUnityマテリアルプロパティが含まれています。マテリアル名とプロパティ名を事前に知っておく必要があることに注意してください。これらはUnityで確認できます。

**制限付きBlendShape**リストには、この表情がアクティブなときに制限されるすべてのBlendShapeが含まれています。BlendShapeを制限すると、キャラクターの表情を正確に制御し、BlendShape間の遷移が常にスムーズになるようにすることができます。たとえば、表情がアクティブなときにモデルの口が一定量以上開かないようにしたい場合は、このリストに新しいエントリを追加し、**制約されたBlendShape**を口のBlendShape（例: `JawOpen`）に設定し、**制限の最小値**と**制限の最大値**を希望の範囲（例: 0 ～ 0.5）に設定します。

オプションとして、**制限BlendShape**を設定して、制約されたBlendShapeとの間にマッピングを確立することができます。例えば、以下の設定では、`JawOpen`のBlendShapeの値が`Smile`のBlendShapeの値に従い、`Smile`が0のときは`JawOpen`が0から1の範囲で変動し、`Smile`が1のときは`JawOpen`が0から0.25の範囲で制限されます。

![](/doc-img/en-character-3.png)
<p class="img-desc">`JawOpen` のBlendShapeを制限します</p>

**GameObjectを切り替える**リストには、この表情がアクティブなときに切り替えられるすべての子GameObjectが含まれています。例えば、キャラクターが笑っているときにパーティクルエフェクトの表示を切り替えるために使用できます。

最後に、表情リストの下には表情もフェイストラッキングもアクティブでないときに使用される、**デフォルトのBlendShapeリスト**と**既定のマテリアルプロパティ**があります。

## アニメーション {#animation}

Warudoは、キャラクターのアニメーション再生をサポートしています。さらに、[MediaPipe](../mocap/mediapipe.md)や[RhyLive](../mocap/rhylive.md)などの互換性のある上半身トラッキングブループリントを使用している場合、アニメーションはモーションキャプチャと自動的にブレンドされ、リスナーと楽しく親密な交流をすることができます。

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180953465-7b91a347-452d-4c03-b860-45dc58ec0392.mp4" /></div>
<p class="img-desc">ここでは、上半身の曲げはスタンバイアニメーションから取得され、頭と手の動きはモーションキャプチャから取得されます。手のトラッキングが失われると、アバターの手はスムーズにスタンバイアニメーションに移行します。</p>

Warudoには、3種類のアニメーションがあります。

* **スタンバイアニメーション**: 他のアニメーションが再生されていないときに再生されるデフォルトのアニメーション。

  ![](/doc-img/jp-character-5.png)
  <p class="img-desc">スタンバイアニメーションを選択します</p>

* **オーバーレイアニメーション**: スタンバイアニメーションの上に重ねて再生されるアニメーション。

例えば、[ネコ] アニメーションが気に入っていて、それを使用したいとします。しかし、キャラクターをベッドに座らせたいとも考えています。この2つのアニメーションを組み合わせるには、**スタンバイアニメーション**を座っているアニメーションに設定し、**オーバーレイアニメーション**リストに新しいエントリを追加して、**アニメーション**を [ネコ] に設定し、**[上半身をマスク]** をクリックして [ネコ] アニメーションが上半身のみに影響するようにします。

  ![](/doc-img/jp-character-6.png)
    <p class="img-desc">オーバーレイアニメーションを使用して、「ネコ」アニメーションと座っているアニメーションを組み合わせます。</p>

  ![](/doc-img/en-character-7.png)
    <p class="img-desc">「ネコ」アニメーションは上半身にのみ影響します。</p>

  オーバーレイアニメーションは好きなだけ追加できます。各アニメーションレイヤーには、それぞれの**マスクされた身体の部位**、**ウェイト**、**スピード**を割り当てることができ、身体の異なる部分に異なるアニメーションを再生させることができます。リストの下にあるアニメーションほど優先度が高くなります。

  <div className="video-box"><iframe class="bilibili-video" src="//player.bilibili.com/player.html?aid=985941728&bvid=BV1Zt4y1c7Re&cid=843191749&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe></div>
  <p class="img-desc">オーバーレイアニメーションのデモ。 出典: https://www.bilibili.com/video/BV1Zt4y1c7Re </p>
* 一時的なアニメーション：ブループリントによってトリガーされる一回限りのアニメーションです。例えば、Twitchの引き換えを受け取ったときに再生される短いダンスアニメーションなどです。詳細については、[ブループリントのチュートリアル](../blueprints/overview)をご覧ください。

身体のアニメーションに加えて、**呼吸アニメーション**や**揺れ動くアニメーション**、**手のジェスチャーの上書き**も設定できます。例えば、ピースサインのようにキャラクターの手を特定のポーズに設定することができます。

最後に、**余分なボーンオフセット**を使用してキャラクターの姿勢を微調整することができます。例えば、キャラクターの頭を数度片側に傾けるなどです。

:::info
デフォルトでは、スタンバイアニメーション、オーバーレイアニメーション、手のポーズの上書き、および[ボディIK](#body-ik)の優先度はすべてモーションキャプチャよりも**低く**設定されています。

例えば、右手に対して手のジェスチャーの上書きを設定していても、右手がMediaPipeなどでトラッキングされている場合、モデルは手のジェスチャーの上書きではなく、右手のトラッキングされたジェスチャーに従います。手のジェスチャーの上書きをモーションキャプチャよりも優先させるには、手のジェスチャー設定で**High Priority（高優先度）を有効**にすることができます。
:::

## 視線IK {#look-ik}

視線IKは、キャラクターがシーン内の特定のターゲット（カメラなど）を見るようにするために使用されます。これは完璧な自撮りを撮るのに便利です！

:::tip
単にリスナーとの目線を合わせたい場合は、代わりにフェイストラッキングの設定時に**ターゲットを見る**を有効にすることをおすすめします（デフォルトで有効になっています）。詳細については、[フェイストラッキング](../mocap/face-tracking) のカスタマイズをご覧ください。
:::

視線IKを使用するには、設定を有効にし、**ターゲット**をキャラクターが見るべきターゲットに設定するだけです。ウェイトを調整して、キャラクターの頭、目、身体がターゲットを見るためにどの程度回転するかを制御できます。**ウェイトを固定する**オプションは、頭、目、身体の回転を制限するために使用できます。これらの値が大きいほど、回転の範囲は狭くなります。

## ボディIK {#body-ik}

Body IK is used to make the character's spine or limbs follow a specified target in the scene.

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">Body IK in a nutshell.</p>

To use Body IK, simply enable it for the spine or a hand/foot, and set **IK Target** to the target that the character should follow. The IK target is usually a [camera](camera), [prop](prop.md), or an [anchor](anchor.md). If you want to create a temporary anchor at the current position of the body part, you can click **Create Temporary IK Target Anchor At Current Position**. When you are done, you can click **Remove Temporary IK Target Anchor** to remove the temporary anchor.

:::tip
Creating a temporary anchor allows you to fix the model's hands in an ideal position, preventing the hands from drifting left and right due to head movements. This can be quite useful for some poses.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039288-aac4e485-c9f9-4686-948e-75f783586b25.mp4" />
Before
</div>

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039290-13b91459-110d-4706-9c77-3516b1c3b175.mp4" />
After
</div>
</div>
:::

The **Bend Goal Target** and **Bend Goal Weight** options can be used to control the rotation of the elbows and knees. The **Bend Goal Target** is usually an [anchor](anchor.md).

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-character-8.png"  />
<p class="img-desc">Bend goal disabled.</p>
</div>
<div>
<img src="/jp/doc-img/en-character-9.png"  />
<p class="img-desc">Bend goal enabled</p>
</div>
</div>

## ラグドール

Ragdoll allows your character to be hit by physics objects, and prevent the character from penetrating through objects in the scene.

**Muscle Spring** and **Muscle Damper** can be used to control the stiffness of the character's muscles. The greater they are, the stiffer the character's muscles are.

To prevent self-penetration, such as the character's hands penetrating through the body, you can enable **Internal Collisions**. For best results, you will need to adjust the colliders manually by clicking **Edit Ragdoll**.

:::caution
Although enabling ragdoll can make the character look more realistic, it can also cause the character to behave in unexpected ways due to glitches in the physics engine. We recommend to only enable ragdoll when you are sure it is necessary.
:::

Note that some nodes temporarily enable ragdoll regardless of the asset setting. For example, the **Throw Prop At Character** node will temporarily enable ragdoll on the character when the prop hits the character.

## メッシュ

You can toggle meshes and skinned meshes on the model.

:::info
Note that models exported by [VRoid Studio](https://vroid.com/en/studio) only have two meshes: `Body` and `Face`. More detailed models often split the character's clothes, accessories, tail, animal ears, etc. into separate meshes, for which this feature is useful, such as toggling the character's jacket.
:::

:::tip
To toggle meshes in blueprints, you can use the **Toggle Character Meshes** node.
:::

## スケーリング

You can scale the character by using the **Transform → Scale** property. However, this may break features such as ragdoll, IK, and compatibility with some motion capture systems (e.g., [Leap Motion](../mocap/leap-motion)). If you need to scale the character, we recommend to scale the character in the 3D modeling software instead, i.e., before you have imported the model into Unity or Warudo.

## よくある質問 {#FAQ}

### How can I trigger an expression automatically with face tracking?

You can use the **Trigger Conditions** feature to trigger an expression automatically. Please refer to the [Trigger Conditions](#trigger-conditions) section for more details.

### The model's pose is too aggressive / too soft / the arms are sinking into the body / the arms are too far away from the body.

Try setting **Animation → Additional Bone Offsets**. The rotation angle of the two shoulder joints actually quite affects the perception of the character's personality!

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-character-10.png"  />
<p class="img-desc">Additional bone offsets disabled.</p>
</div>
<div>
<img src="/jp/doc-img/en-character-11.png"  />
<p class="img-desc">Additional bone offsets enabled：LeftShoulder: (10, 0, -10), RightShoulder: (10, 0, 10).</p>
</div>
</div>

### How can I change the hotkey for an expression?

Open the **Expression Key Bindings** blueprint and locate the **On Keystroke Pressed** node. Then, modify it as needed. For example, in the original blueprint, pressing Alt+1 will activate the `Joy` expression:

![](/doc-img/en-expression-1.webp)

The following changes the hotkey to Ctrl+Shift+T.

![](/doc-img/en-expression-2.webp)

### Can I enable an expression for a certain period of time and then automatically disable it after a while?

To do this, enable **Is Transient** on the **Toggle Character Expression** node in the **Expression Key Bindings** blueprint. The duration of the expression will be determined by **Exit Delay** of each BlendShape in the expression.

![](/doc-img/en-expression-5.webp)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
