---
sidebar_position: 70
translate_from_version: 2024-06-14
---

# カメラをアニメーションさせる

キャラクターで楽しむのはもう十分ですね！ 配信に映画のようなカメラワークを取り入れる方法を見ていきましょう。このチュートリアルでは、シンプルながら効果的なカメラアニメーションの追加方法を学びます。

:::tip
Warudo Pro ユーザーなら、[director](../../assets/director) アセットを使ってカメラアニメーションを作成することもできます。
:::

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera-2.mp4" /></div>
<p class="img-desc">キャラクターが踊り、カメラも一緒に動きます！</p>

## Orbit Character カメラをアニメーションさせる

このチュートリアルの主役は **Camera Orbit Character** ノードです。ノードエディターにドラッグして、詳しく見てみましょう。

![](/doc-img/en-blueprint-camera-1.png)

Camera Orbit Character ノードは、基本的に Orbit Character 操作モードにおけるカメラのパラメーターを記録・再生します。マウスでカメラを動かし、カメラをどこへ動かしたか、どれだけズームやパンをしたかなどをノードに記録させるだけです。あとはいつでもノードをトリガーすれば、カメラが記録した位置と向きに移動します。

:::info
まだ設定していない場合は、**Camera → Control Mode** を **Orbit Character** に設定してください。
:::

試してみましょう！ たとえば、視聴者にキャラクターのふわふわな尻尾を見せたいので、カメラを回転させてキャラクターの後ろに移動します。

![](/doc-img/en-blueprint-camera-2.png)

次に、ノード上の **Align Target With Main Camera** ボタンをクリックします。するとノードはカメラの位置と向きを **Target** データ入力に記録します。これでカメラを正面に戻しても、ノードをトリガーするたびにカメラはキャラクターの後ろへ移動し、尻尾を映してくれます！

次のようなブループリントなら簡単に作れます。

![](/doc-img/en-blueprint-camera-3.png)

これでいつでも B キーを押して、キャラクターの正面と背面を切り替えられます！

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera.mp4" /></div>
<p class="img-desc"></p>

さあ、今度はあなたの番です！ 自分だけのカメラ用ブループリントを作り、キャラクターのためにどんな面白いカメラワークを考えられるか試してみてください。

:::tip
**Transition Time** と **Transition Easing** オプションをいろいろ試して、カメラの動きにどう影響するか確認してください！ 自然なカメラワークには、Transition Easing の **InOutSine** がよい出発点になります。
:::

## アニメーションをループさせる

すべて順調ですが、1つ問題があります。往復するアニメーションを手動でトリガーする必要があることです。カメラを自動的に動かす方法はあるのでしょうか？

あります！ 方法を見ていきましょう。まず、異なるカメラ位置と向きを設定した Camera Orbit Character ノードを2つ用意します。1つ目のノードは次のとおりです。

![](/doc-img/en-blueprint-camera-4.png)

2つ目のノードは次のとおりです。

![](/doc-img/en-blueprint-camera-5.png)

つまり、1つ目のノードをトリガーするとカメラはキャラクターの左側へ、2つ目のノードをトリガーすると右側へ移動します。カメラをまず左、次に右へ移動させたいなら、次のように **On Transition End** を **Enter** に接続するだけです。

![](/doc-img/en-blueprint-camera-13.png)

:::info
接続元は **Exit** ではなく **On Transition End** であることに注意してください。Exit フロー出力はノードがトリガーされた、つまりカメラが動き始めた時点でトリガーされるのに対し、On Transition End フロー出力はカメラの移動が完了した時点でトリガーされるためです。
:::

ここで左側の Camera Orbit Character ノードの Enter フロー入力をクリックすると、カメラがキャラクターの左側へ移動した後、自動的に右側へ移動します。ここまではよさそうです！ 次は何をすればよいでしょうか？

「簡単だよ」と思うかもしれません。「右側の Camera Orbit Character ノードの On Transition End を、左側の Camera Orbit Character ノードの Enter に接続すれば完成だ！」

残念ながら、そう単純ではありません。実際に試すと、

![](/doc-img/en-blueprint-camera-6.png)

エラーメッセージが表示されます！

![](/doc-img/en-blueprint-camera-7.png)

この接続を追加できないのは、ブループリント内に許可されていないループが作られるためです。これは、Warudo がフリーズする原因となる意図しない無限ループを防ぐためです。

:::info
ループを許可するとどうなるかというと、両方のノードの Transition Time が 0 に設定されている場合、カメラが無限に高速で往復し、Warudo がクラッシュしてしまいます！
:::

しかし、**関数**を使えばこの制限を回避できます。関数は基本的に、ブループリント内のどこからでも、別のブループリントからでもトリガーできるエントリーポイントです。例を通じて学びましょう。左側の Camera Orbit Character ノードのさらに左に **Define Function** ノードを追加し、関数の **Name** を `AnimateCamera` に設定してください。

![](/doc-img/en-blueprint-camera-8.png)

これで関数を定義できました！ `AnimateCamera` 関数がトリガーされるたびに、1つ目の Camera Orbit Character ノードがトリガーされます。では、この `AnimateCamera` 関数はどうやってトリガーするのでしょうか？ **Flow Function** ノードを使います！ ノードエディターに追加し、ドロップダウンから作成した関数を選んで、Enter フロー入力をクリックしてみてください。

![](/doc-img/en-blueprint-camera-9.png)

カメラがキャラクターの左側へ移動した後、自動的に右側へ移動するはずです。これは関数が動作していることを意味します。最後に、右側の Camera Orbit Character ノードの移動が終わったとき、関数を自動的にトリガーしましょう。**Camera Orbit Character → On Transition End** を **Flow Function → Enter** に接続します。

![](/doc-img/en-blueprint-camera-10.png)

ここで再び **Flow Function → Enter** をクリックすると、カメラはキャラクターの左側へ移動し、続いて自動的に右側へ、さらに自動的に左側へ移動し、その繰り返しになります。まさに求めていた動きです！

Camera Orbit Character ノードが生成したカメラアニメーションは、カメラ操作を引き継ごうとするとすぐに停止する点に注意してください。アニメーションをより便利に開始するには、`AnimateCamera` 関数にホットキーを割り当てます。

![](/doc-img/en-blueprint-camera-11.png)

## ほかのカメラパラメーターをアニメーションさせる

カメラの位置と向きだけでなく、**Field of View** などのほかのカメラパラメーターもアニメーションさせられます。たとえば、次のブループリントはカメラが動き始めると同時にズームアニメーションも開始します。

![](/doc-img/en-blueprint-camera-12.png)

ほかのカメラノードも自由に試してみてください！

## Free Look カメラをアニメーションさせる

これまでは Orbit Character 操作モードでカメラをアニメーションさせました。しかし、映画的なカメラワークの中にはキャラクターの周りを回らないものもありますし、キャラクターの位置にかかわらずカメラを2つの固定位置の間で移動させたいこともあるでしょう。この場合は、**Set Asset Transform** ノードを使えます。

![](/doc-img/en-blueprint-camera-15.png)

これは Camera Orbit Character ノードと同じように動作しますが、Free Look 操作モードにおけるカメラパラメーターを記録・再生する点が異なります。目標の位置と向きを記録するには、**Align Target With Asset** ボタンを使用します。

:::tip
このノードの名前は Set Camera Transform ではなく Set Asset Transform であることに注意してください。つまり、このノードは道具やキャラクターなど、ほかのアセットを移動・アニメーションさせるためにも使えます！
:::

## カメラを切り替える

**Switch Main Camera** ノードがあることはお伝えしましたか？ 名前どおり、オプションのフェード遷移を使って2台のカメラを切り替えます。たとえば、次のブループリントでは Ctrl+1 と Ctrl+2 を押すと2台のカメラが切り替わります。

![](/doc-img/en-blueprint-camera-14.png)

結果は次のとおりです。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera-3.mp4" /></div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
