---
sidebar_position: 501
---

# NiloToon Volume

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。NiloToon Volumeをシーンに追加するには、**[設定] → [URP]** でUniversal Render Pipelineを有効にする必要があります。
:::

NiloToon Volumeは、シーンに NiloToon固有のポストプロセスエフェクトを追加します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">NiloToon Volume無効</p>
</div>
<div>
<img src="/jp/doc-img/en-nilotoon-on.png"  />
<p class="img-desc">NiloToon Volume有効</p>
</div>
</div>

以下に、利用可能なポストプロセスエフェクトの概要を示します。詳細については、NiloToonのドキュメントを参照してください。

## 設定

**Import From Environment** をクリックすると、環境からNiloToonポストプロセス設定 (存在する場合) をインポートできます。その後、必要に応じてポストプロセス設定を調整できます。設定を有効にするには、設定の横にあるチェックボックスをオンにして有効にする必要があります。これにより、環境からNiloToonポストプロセス設定を選択的に上書きできます。

## Anime

カメラビューにアニメ風のグラデーションを追加します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Anime無効</p>
</div>
<div>
<img src="/jp/doc-img/en-nilotoon-anime.png"  />
<p class="img-desc">Anime有効</p>
</div>
</div>

## Bloom

Bloomは、シーンの明るい領域を「輝かせる」ポストプロセスエフェクトです。**Character Area Overrided Threshold**と**Character Area Overrided Intensity**を上書きすることで、キャラクターと環境に異なる強度としきい値を持つブルームを個別に適用できます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Bloom無効</p>
</div>
<div>
<img src="/jp/doc-img/en-nilotoon-bloom.png"  />
<p class="img-desc">Bloom有効</p>
</div>
</div>

## Character Rendering

キャラクターのNiloToonレンダリング設定を上書きして、現在の環境と調和するようにレンダリングを調整します。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">Character Rendering設定の上書き無効</p>
</div>
<div>
<img src="/jp/doc-img/en-nilotoon-character.png"  />
<p class="img-desc">Character Rendering設定の上書き有効</p>
</div>
</div>

## Shadow

キャラクターのNiloToonシャドウ設定を上書きします。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-nilotoon-off.png"  />
<p class="img-desc">シャドウ設定の上書き無効</p>
</div>
<div>
<img src="/jp/doc-img/en-nilotoon-shadow.png"  />
<p class="img-desc">シャドウ設定の上書き有効</p>
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
