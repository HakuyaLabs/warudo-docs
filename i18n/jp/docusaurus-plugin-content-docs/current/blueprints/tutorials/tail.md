---
sidebar_position: 140
translate_from_version: 2024-06-14
---

# しっぽをつかむ

あなたのキャラクターにしっぽはありますか？ あるなら、このチュートリアルがぴったりです！ このチュートリアルでは、ホットキーを押したときにキャラクターが自分のしっぽをつかむようにします。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/tail.mp4" /></div>
<p class="img-desc">そのしっぽ、つかまえる！</p>

:::tip
キャラクターにしっぽがなくても大丈夫です！ それでもチュートリアルを読んで、**Set Asset Property** ノードと **Invoke Asset Trigger** ノードの使い方を学べます。
:::

## Tail IK

ブループリントの作業を始める前に、まずシーンを設定しましょう！ 最初に [Anchor](../../assets/anchor) アセットを作成し、キャラクターの右手にアタッチします。

![](/doc-img/en-blueprint-tail-2.png)

これは後で、しっぽをキャラクターの右手へ向ける際に役立ちます。

次に、[Tail](../../assets/tail) アセットを作成し、キャラクターに[設定](../../assets/tail#setup)します。**Inverse Kinematics** セクションで **Enabled** をYesに、**IK Target** を先ほど作成したアンカーに設定します。

![](/doc-img/en-blueprint-tail-3.png)

:::info
すでにしっぽを作成している場合、このチュートリアルでは揺れと追加シェイプを無効にする必要があることに注意してください。
:::

これで、アンカーに向かうために逆運動学（IK）を使用するよう、しっぽが設定されます。言い換えると、しっぽは常に次のようにキャラクターの右手へ届こうとします。

![](/doc-img/en-blueprint-tail-1.png)

## Set Asset Property

現在、しっぽをつかむ／つかまない状態を切り替えるには、**Tail → Inverse Kinematics → Enabled** を手動でオン／オフする必要があります。

![](/doc-img/en-blueprint-tail-4.png)

これをブループリントで行う方法はあるでしょうか？ 悪い知らせは、「Toggle Tail IK」のようなノードは存在しないことです。良い知らせは、強力で汎用性の高い **Set Asset Property** ノードが、まさに望みどおりのことをできることです！

名前が示すとおり、Set Asset Propertyノードはアセットのプロパティ（オプション）を設定します。**Asset** ドロップダウンでしっぽアセットを選択した後、**Data Path** ドロップダウンから Inverse Kinematics → Enabled プロパティを選ぶだけです。

![](/doc-img/en-blueprint-tail-9.png)

次に、**Target Value** を指定する代わりに **Toggle** をYesに設定すれば、ノードがトリガーされるたびにプロパティをYesとNoの間で切り替えます。

![](/doc-img/en-blueprint-tail-5.png)

これでCtrl+Shift+Xを押すと、しっぽのIKがオン／オフに切り替わります！ 簡単でしょう？

しっぽIKの切り替えは便利ですが、IKが瞬時にオン／オフになることに気付くかもしれません。しっぽが手へ瞬時に届くのではなく、徐々に届くように、IKも徐々にオン／オフできたほうがよいでしょう。

そのためには、**Tail → Inverse Kinematics → Enabled** をYesに設定し、代わりに **Tail → Inverse Kinematics → Weight** オプションを操作します。

![](/doc-img/en-blueprint-tail-6.png)

Weightを0から1へドラッグすると、しっぽが徐々に手へ届くことがわかります。これをブループリントで行うにはどうすればよいでしょう？ そう、また **Set Asset Property** ノードです！ 今回はTail → Inverse Kinematics → Weightプロパティを選択します。

![](/doc-img/en-blueprint-tail-8.png)

2つのノードの **Target Value** をそれぞれ1と0に設定します。Flip Flopノードはトリガーされるたびに2つのExitフロー出力を交互に切り替えることを思い出してください。したがって、Ctrl+Shift+Xを押すと、しっぽIKが徐々にオン／オフになります。

![](/doc-img/en-blueprint-tail-7.png)

:::tip
ご覧のとおり、Set Asset PropertyノードはAssetsタブにあるほとんどすべての項目を設定できます！ 専用ノードの代わりになることさえあります。たとえば、Set Asset Propertyノードは道具の **Enabled** オプションを設定できるため、もう **Toggle Asset Enabled** ノードを使う必要がないようにも思えます。

ただし、Set Asset Propertyはより汎用的なため、Toggle Asset Enabledのような専用ノードよりパフォーマンスが劣ります。特に、Set Asset Propertyノードを頻繁に（たとえば **On Update** ノードの後など）トリガーしないよう注意してください。パフォーマンスの問題を引き起こすおそれがあります。経験則として、やりたいことのための専用ノードがあるなら、Set Asset Propertyではなくそちらを使いましょう。
:::

## Invoke Asset Trigger

スライダー調整やスイッチの切り替えを自動化する方法はわかりましたが、ボタンのクリックはどう自動化すればよいでしょうか？ たとえば、ホットキーで **Tail → Reset Tail** ボタンを自動的に「クリック」する方法はあるでしょうか？

![](/doc-img/en-blueprint-tail-11.png)

あります！ **Invoke Asset Trigger** ノードなら、まさにそれができます。Set Asset Propertyノードと似ていますが、プロパティを設定する代わりに、アセットのトリガー（ボタン）を呼び出します。**Trigger Path** ドロップダウンからTail → Reset Tailトリガーを選択できます。

![](/doc-img/en-blueprint-tail-10.png)

Warudoにはかなり多くのボタンがあるため、このノードが役に立つことがあります！ たとえば、フェイストラッキングにiFacialMocapやMediaPipeを使っている場合、私は **iFacialMocap Receiver / MediaPipe Tracker → Calibrate** にホットキーを割り当て、ホットキーでフェイストラッキングをキャリブレーションできるようにするのが便利だと感じています。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
