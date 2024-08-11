---
sidebar_position: 503
---

# Post Processing Volume

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。Post Processing Volumeをシーンに追加するには、**[設定] → [URP]** でUniversal Render Pipelineを有効にする必要があります。
:::

Post Processing Volumeアセットは、シーンにポストプロセスエフェクトを追加するために使用されます。[カメラ](camera#post-processing)のポストプロセスエフェクトに似ていますが、Post Processing Volumeは1つのカメラだけではなくシーン全体に影響します。

Post Processing Volumeアセットは、Unityの[URP Volume](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@17.0/manual/volumes-landing-page.html)のラッパーであるため、同じパラメーターを持ちます。以下では、使用可能なポストプロセスエフェクトの概要を簡単に説明します。詳細については、[Unityのドキュメント](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@17.0/manual/EffectList.html)を参照してください。

## 設定

**Import From Environment** をクリックすると、環境からポストプロセス設定 (存在する場合) をインポートできます。その後、必要に応じてポストプロセス設定を調整できます。設定を有効にするには、設定の横にあるチェック ボックスをオンにして有効にする必要があります。これにより、環境からポストプロセス設定を選択的に上書きできます。

## Bloom

ブルームは、シーンの明るい領域を「輝かせる」ポストプロセスエフェクトです。

![](/doc-img/bloom-off.png)
<p class="img-desc">Bloom無効</p>

![](/doc-img/bloom.png)
<p class="img-desc">Bloom有効</p>

:::info
NiloToon を使用している場合は、このブルーム エフェクトの代わりに、 [NiloToon Volume](nilotoon-volume)のブルームを使用することをおすすめします。NiloToon Volumeは、キャラクターと環境に異なる強度としきい値を使用して、ブルームを個別に適用できます。
:::

## Channel Mixer

チャンネルミキサーは、各入力カラーチャンネルが出力チャンネルの全体的なミックスに与える影響を変更します。たとえば、緑のチャンネルの影響を赤のチャンネルの全体的なミックスに増やすと、最終画像の緑色の部分（中立色/単色を含む）がより赤みがかった色合いになります。

## Chromatic Aberration

レンズがすべての色を同じポイントにブレンドできない場合に生じる効果を模倣します。

![](/doc-img/chromatic-aberration-off.png)
<p class="img-desc">Chromatic Aberration無効</p>

![](/doc-img/chromatic-aberration.png)
<p class="img-desc">Chromatic Aberration有効</p>

## Color Adjustments

このエフェクトを使用して、レンダリングイメージの全体的なトーン、明るさ、コントラストを微調整します。

![](/doc-img/color-adjustments-off.png)
<p class="img-desc">Color Adjustments無効</p>

![](/doc-img/color-adjustments.png)
<p class="img-desc">Color Adjustments有効</p>

## Depth of Field

焦点が合っていないオブジェクトをぼかします。**Focus Distance**を上書きすると、 **Auto Focus Character**を設定できるようになり、フォーカス距離がキャラクターに自動的に追従するようにすることができます。

![](/doc-img/dof-gaussian.png)
<p class="img-desc">ガウスモードでのDepth of Field</p>

![](/doc-img/dof-bokeh.png)
<p class="img-desc">ボケモードでのDepth of Field</p>

## Film Grain

写真フィルム上のランダムな光学テクスチャシミュレートします。フィルムグレインは通常、物理的なフィルム上に存在する小さな粒子によって引き起こされます。

![](/doc-img/film-grain-off.png)
<p class="img-desc">Film Grain無効</p>

![](/doc-img/film-grain.png)
<p class="img-desc">Film Grain有効</p>

## Lens Distortion

実際のカメラレンズの形状をシミュレートし、レンダリングイメージを歪めます。

![](/doc-img/lens-distortion-off.png)
<p class="img-desc">Lens Distortion無効</p>

![](/doc-img/lens-distortion.png)
<p class="img-desc">Lens Distortion有効</p>

## Lift Gamma Gain

3wayカラーグレーディングを行います。

## Motion Blur

実際のカメラが露光時間よりも速く動く物体を撮影したときに生じるぼかしをシミュレートします。

![](/doc-img/motion-blur-off.png)
<p class="img-desc">Motion Blur無効</p>

![](/doc-img/motion-blur.png)
<p class="img-desc">Motion Blur有効</p>

## Panini Projection

視野が非常に広いシーンでパースビューをレンダリングするのに役立ちます。

![](/doc-img/panini-off.png)
<p class="img-desc">Panini Projection無効</p>

![](/doc-img/panini.png)
<p class="img-desc">Panini Projection有効</p>

## Shadows Midtones Highlights

レンダリングのシャドウ、ミッドトーン、ハイライトを個別に制御します。

## Split Toning

輝度値に基づいてイメージのさまざまな領域に色を付け、より特徴的な外観を実現します。これを使用して、シーンのシャドウとハイライトにさまざまな色調を追加できます。

## Tonemapping

トーンマッピングは、イメージのHDR値を新しい範囲の値に再マッピングするプロセスです。最も一般的な目的は、ダイナミックレンジが低いイメージを、より高いレンジに見せることです。

:::tip
**ACES**トーンマッピングモードは、ほとんどの環境でよりシネマティックな外観を実現するために推奨されます。
:::

## Vignette

イメージの中心部に注意を引くため、画像の中心よりも端を暗くしたり、彩度を下げたりする効果。

## White Balance

ホワイトバランス効果を適用し、現実で白く見えるアイテムが白くレンダリングされるように、不自然な色かぶりを除去します。また、ホワイトバランスを使用して、最終レンダリングに全体的に冷たい、または暖かい雰囲気を作り出すこともできます。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
