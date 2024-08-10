---
sidebar_position: 502
---

# NiloToon Character Controller

:::info
この機能は[Warudo Pro](../pro)でのみ利用可能です。NiloToon Character Controllerをシーンに追加するには、**[設定] → [URP]** でUniversal Render Pipelineを有効にする必要があります。
:::

NiloToon Character Controllerを使用すると、キャラクターのNiloToon設定を調整できます。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/jp/doc-img/en-nilotoon-char-color.png"  />
<p class="img-desc">キャラクターを白黒で着色</p>
</div>
<div style={{width: '73%'}} className="video-box"><video controls loop src="/jp/doc-img/en-nilotoon-char-dissolve.mp4" />
<p>尻尾を溶かす</p>
</div>
</div>

詳細については、NiloToonのドキュメントを参照してください。

## 設定

NiloToon設定を調整する**キャラクター**を選択します。キャラクターがNiloToonで設定されている場合は、その設定が読み込まれ、アセットに表示されます。

アセット内で直接設定を調整したり、[ブループリント](../blueprints/overview)の**Set Asset Property**ノードを使用して設定を制御したりできます。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
