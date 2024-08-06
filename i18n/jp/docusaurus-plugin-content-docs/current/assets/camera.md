---
sidebar_position: 50
---

# カメラ

カメラはシーンのビューを制御するために使用されます。 1つのシーンに最大8台のカメラを追加できます。

## 設定

デフォルトでは、シーンにはすでにカメラが存在します。新しいカメラを追加するには、**[アセットを追加する]** メニューを使用します。**[メインカメラ]** を切り替えるには、次のいずれかの方法を使用できます。

1. カメラ名の横にあるカメラアイコンをクリックして、そのカメラをメインカメラに設定します。
2. **Tab**キーを押してシーン内の次のカメラに切り替えるか、**Ctrl+Tab**キーを押してシーン内の前のカメラに切り替えます。

![](/doc-img/jp-camera-1.png)
<p class="img-desc">カメラ名の横にある塗りつぶされたカメラアイコンは、そのカメラがメインカメラであることを示しています。</p>

カメラはデフォルトで **[自由観察]** モードに設定されています。**コントロールモード**を **[オービットキャラクター]** に設定すると、カメラがキャラクターの周りを回転するようになります。また、**コントロールモード**を **[なし]** に設定すると、カメラを固定することができます。

:::tip
カメラを別のキャラクターの周りに回転させるには、**フォーカスキャラクター**をフォーカスしたいキャラクターに設定します。
:::

カメラの移動速度を増減するには、**コントロール感度**を調整します。

## 出力

デフォルトでは、WarudoのNDI/Spout/仮想カメラは、メインウィンドウのビューを出力します（ **[メニュー] → [設定]** で有効/無効にできます）。各カメラごとに**NDI/Spout/仮想カメラ出力**を有効にすることもできます。これにより、複数のカメラから同時にシーンを表示することができます。


![](/doc-img/en-camera-1.webp)
<p class="img-desc">カメラでSpout/NDI/仮想カメラ出力を有効にすることで、複数のカメラのシーンを同時に表示することができます。</p>

:::info
Spoutを[OBS](https://obsproject.com/)に出力するには、 [obs-spout2-plugin](https://github.com/Off-World-Live/obs-spout2-plugin/releases)をインストールし、Spout2 Captureソースを追加します。NDIを[OBS](https://obsproject.com/)に出力するには、[obs-ndi](https://github.com/Palakis/obs-ndi)プラグインをインストールし、NDI™ソースを追加します。

Warudoを同じネットワーク内の別のデバイスに出力する必要がある場合はNDIを使用し、同じPC上の別のアプリケーション（OBSなど）に出力するだけでよい場合はSpoutを使用してください。リソース使用量と遅延が低いため、Spoutが推奨されます。
:::

:::tip
すべての出力方法は透過出力をサポートしています。透明な背景を有効にするには、**[基本プロパティ] → [透明な背景]** を有効にするだけです。

OBSでSpout出力を使用する場合、Spout2 Captureのプロパティで**Composite Mode**を**Premultiplied Alpha**に設定して透過を有効にします。

![](/doc-img/en-camera-3.webp)


OBSで仮想カメラ出力を使用する場合、**映像キャプチャデバイス**のプロパティで映像フォーマットを**ARGB**に設定して透過を有効にします。

![](/doc-img/en-camera-4.webp)
:::

このカメラのビューのスクリーンショットを撮るには、**[スクリーンショット]** ボタンをクリックします。

:::tip
スクリーンショットを撮るためのショートカットキーを設定するには、ブループリントで **スクリーンショット(Take Screenshot)** ノードを使用します。
:::


## 基本プロパティ

カメラに **[クロマキー]** を設定することで、シーンの背景を特定の色に置き換えることができます。背景を透明にしたい場合は、**[クロマキーカラー]** を(0, 0, 0, 0)に設定するか、単に **[透明な背景]** を有効にします。

:::caution
**[クロマキー]** や **[透明な背景]** が有効になっている場合でも、シーン内の[環境](environment.md)は表示されます。
:::

カメラはキャラクター、道具、環境をレンダリングするかどうかを設定できます。例えば、**[環境のレンダリング]** をオフにすると、環境はカメラのビューに表示されなくなりますが、キャラクターや道具にあたった環境の照明は表示されたままになります。これは、透明な背景が必要でありながら、環境の照明を使用したい場合に特に便利です。環境をオフにする代わりに、カメラで **[環境のレンダリング]** をオフにするだけで済みます。

もう一つ便利なパラメータは **[視野角]** で、カメラの視野の広さを制御します。値が大きいほど、カメラの視野が広くなります。**[正射投影]** は、ビューをできるだけ平坦に見せたい場合に役立ちます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-ortho-off.webp"  />
<p class="img-desc">正射投影が無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-ortho-on.png"  />
<p class="img-desc">正射投影が有効</p>
</div>
</div>

## ハンドヘルドムーブメント（手持ち移動）

カメラを人が持っているような動きをシミュレートしたい場合は、**[ハンドヘルドムーブメント]** を有効にします。これにより、カメラの動きにわずかな揺れが加わります。**[強度]** と **[スピード]** を調整して、揺れの強さと速度を制御します。

## ポストプロセスエフェクト {#post-processing}

:::info
[Warudo Pro](../pro)でUniversal Render Pipeline（URP）が有効になっている場合、以下のポストプロセスエフェクトは利用できません。代わりに、[Post Processing Volume](ppv)アセットを使用してください。
:::

### トーンマッピングとカラーグレーディング

**[LUTマテリアル]** を設定することで、シーンの雰囲気をガラリと変えることができます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-lut-off.png"  />
<p class="img-desc">LUT無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-lut-on.png"  />
<p class="img-desc">LUT有効</p>
</div>
</div>

:::tip
Warudoには200以上のLUTテクスチャが内蔵されています。シーンに合ったものを選びましょう！
:::

**[ACES（ムービースタイル）トーンマッピング]** を有効にすることもできます。ACESは映画業界で広く使用されているカラーマネジメントシステムです。環境をよりリアルに見せることができますが、鮮やかな色彩を持つアニメ風キャラクターとは相性が悪いかもしれません。

最後に、**[自然な彩度]** 、**[コントラスト]** 、**[輝度]** 、**[色合い]** を使用して、シーンの色を好みに合わせて調整できます。

:::info
Warudoはデフォルトで **[自然な彩度]** 、**[コントラスト]** 、**[輝度]** をそれぞれ1、1.02、1.05に設定しており、シーンをより鮮やかに見せます。元の色を維持したい場合は、これらの値を0、1、1に設定してください。
:::

### ブルーム

ブルーム効果は、イメージの明るい部分の周りにハロー効果を作り出します。**[強度]** はブルーム効果の強さを制御し、**[しきい値]** はブルーム効果を発するイメージの明るさの下限を制御します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-bloom-off.png"  />
<p class="img-desc">ブルーム無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-bloom-on.png"  />
<p class="img-desc">ブルーム有効</p>
</div>
</div>

### アンビエントオクルージョン

シーンにより多くの影を追加し、よりリアルな外観にします。**[半径]** は影の半径を制御し、**[強度]** は影の強さを制御します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-ssao-off.png"  />
<p class="img-desc">アンビエントオクルージョン無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-ssao-on.png"  />
<p class="img-desc">アンビエントオクルージョン有効</p>
</div>
</div>

:::info
アニメ風のキャラクターモデル（特に顔のメッシュが完全に平坦でない場合）には、アンビエントオクルージョンを有効にすることは推奨されません。アンビエントオクルージョンを有効にしたいが、キャラクターの影が変に見える場合は、**[最大半径ピクセル]** の値を調整してみてください。
:::

### アナモフィックフレア

歪んだレンズの水平/垂直フレア効果を提供します。**[強度]** はフレアの強さを制御し、**[しきい値]** はフレアを発するイメージの明るさの下限を制御します。フレアをもっと広げたい場合は、**[かくさん]** の値を増やすことができます。デフォルトではフレアは水平ですが、**[垂直フレア]** を有効にすると、垂直にすることができます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-flare-off.png"  />
<p class="img-desc">アナモフィックフレア無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-flare-on.png"  />
<p class="img-desc">アナモフィックフレア有効</p>
</div>
</div>

### 被写界深度

焦点が合っていないオブジェクトをぼかします。特定の **[焦点距離]** を設定するか、**[コントロール] → [オービットキャラクター]** で選択したキャラクターに自動的に焦点を合わせるために **[フォーカスキャラクター]** を有効にすることができます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-dof-off.png"  />
<p class="img-desc">被写界深度無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-dof-bokeh-off.png"  />
<p class="img-desc">ボケ無効の被写界深度</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-dof-on.png"  />
<p class="img-desc">ボケ有効の被写界深度</p>
</div>
</div>

### 色収差

レンズがすべての色を同じ点にブレンドできないときに生じる効果を模倣します。**[強度]** は効果の強さを制御します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-color-abb-off.webp"  />
<p class="img-desc">色収差無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-color-abb-on.png"  />
<p class="img-desc">色収差有効</p>
</div>
</div>

### レンズ汚れ

レンズの汚れや斑点をシミュレートします。まず、レンズの汚れの **[マテリアル]** を選択する必要があります。**[強度]** はレンズの汚れの強さを制御し、**[しきい値]** はレンズの汚れ効果を発する画像の明るさの下限を制御します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-lens-dirt-off.webp"  />
<p class="img-desc">レンズ汚れ無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-lens-dirt-on.png"  />
<p class="img-desc">レンズ汚れ有効</p>
</div>
</div>

### ケラレ（ビネッティング）

画像の周辺を暗くします。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-vignette-off.webp"  />
<p class="img-desc">ケラレ無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-vignette-on.webp"  />
<p class="img-desc">ケラレ有効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-vignette-blink.png"  />
<p class="img-desc">ケラレ有効（まばたきあり）</p>
</div>
</div>

### ナイトビジョン

ナイトビジョンゴーグルをシミュレートします。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-nightvision-off.png"  />
<p class="img-desc">ナイトビジョン無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-nightvision-on.webp"  />
<p class="img-desc">ナイトビジョン有効</p>
</div>
</div>

### ぼかし

イメージをぼかします。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-blur-off.webp"  />
<p class="img-desc">ぼかし無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-blur-on.webp"  />
<p class="img-desc">ぼかし有効</p>
</div>
</div>

### ピクセル化

画像にモザイク効果を追加します！

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-camera-pixelate-off.webp"  />
<p class="img-desc">ピクセル化無効</p>
</div>
<div>
<img src="/jp/doc-img/en-camera-pixelate-on.png"  />
<p class="img-desc">ピクセル化有効</p>
</div>
</div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
