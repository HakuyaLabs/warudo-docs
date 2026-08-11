---
sidebar_position: 15
translate_from_version: 2024-11-15
---

# 環境Mod

任意の Unity [シーン](https://docs.unity3d.com/Manual/CreatingScenes.html)を、環境Mod として Warudo にインポートできます！

## セットアップ

### ステップ1: シーンを準備する

Unity シーンを好みに合わせてセットアップします。[Post Processing Stack v2](https://docs.unity3d.com/Packages/com.unity.postprocessing@3.3/manual/index.html)に対応しているため、シーンにポストプロセスエフェクトを追加できます。

たとえば、以下のようにシーンを最適化することをおすすめします。

* 高ポリゴンのモデルを使いすぎない。
* コリジョンが不要なモデルではコリジョンを無効にする。
* 配信で見えるのがシーンの一部だけなら、可能であれば残りの部分を無効化または削除する。
* リアルタイムライトはできるだけ少なくし、可能な限りベイク済みライトを使用する。

:::warning

シーンには **"Camera"** リソースを複数追加しないでください。環境へのパフォーマンス負荷が増加し、エラーの原因になる可能性があります。

:::

### ステップ2: ライティングをベイクする（任意）

環境Mod の見た目の品質とパフォーマンスを大幅に向上できるため、通常はシーンのライティングをベイクすることをおすすめします。

:::warning

現在、Unity の Built-in Render Pipeline（BiRP）では、**"Standard"** マテリアルのベイクは**サポートされていません**。
ライトマップをベイクする必要がある場合は、最良の結果を得るために別のマテリアルを使用することをおすすめします。

:::

#### Unity の Built-in Lightmapper

ほとんどの場合、Unity 内蔵の lightmapper で十分です。

Warudo は方向性ライトマップを使用するため、**Windows → Rendering → Lighting** で **Directional Mode** が **Directional** に設定されていることを確認してください。

![](/doc-img/en-environment-mod-1.webp)

設定されていない場合、シーンのライティングが正しく表示されないことがあります。

:::info

シーンにすでにライトマップがベイクされている場合は、ライトマッピングの方向モードを切り替えた後に **Generate Lighting** をクリックしてライトマップを再ベイクする必要があります。

:::

#### Bakery

方向性ライトマップをベイクする限り、サードパーティー製の lightmapper である [Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218)も使用できます。たとえば Bakery では、[**Directional Mode** を Dominant Direction または MonoSH に設定できます](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode)。

Bakery が Warudo で正しく動作するように、次の手順に従ってください。

1. `Bakery` フォルダを Mod フォルダにコピーします（既定では `Assets` のルートにあります）。
2. Bakery の設定で **Use scene named output path** を有効にします。これにより、Bakery のライトマップが Mod フォルダに保存されます。**Directional Mode** には、Dominant Direction または MonoSH など、方向性ライトマップを生成する設定を選択してください。
3. **Render** をクリックしてライトマップをレンダリングします。反射プローブもベイクする場合は、続けて **Render reflection probes** をクリックします。
4. **重要:** `Bakery/_tempScene` フォルダに移動し、ベイク中に生成された `_tempScene` Unity シーンを削除します。

### ステップ3: `EnvironmentSettings` スクリプトを追加する

エクスポートする Unity シーンを開き、新しい GameObject または既存の任意の GameObject に `EnvironmentSettings` スクリプト（Warudo SDK に含まれています）を追加します。`Copy from current environment settings` ボタンをクリックします。このスクリプトは Unity の環境設定を保存し、スカイボックス、影の色などを環境Mod にエクスポートします。

### ステップ4: シーンの名前を変更する

シーンの名前を **"Environment"** に変更し、Mod フォルダ内に配置されていることを確認します（任意のサブフォルダに配置できます）。

### ステップ5: Mod をエクスポートする

**Warudo → Build Mod** を選択し、生成された `.warudo` ファイルが `Environments` データフォルダに配置されていることを確認します。

## トラブルシューティング

環境Mod の作成はほかの種類の Mod より難しいため、Warudo 上の環境がエディター内と異なって見える場合は、以下のチェックリストで見落としがないか確認してください。

* シーン内の GameObject に `EnvironmentSettings` スクリプトを配置しましたか？
* シーンの名前が **"Environment"** であることを確認しましたか？
* すべてのマテリアル、シェーダー などが Mod フォルダに含まれていることを確認しましたか？
* ベイク済みライティングを使用している場合、ライトマップと `LightingSettings` アセットが Mod フォルダに含まれていることを確認しましたか？
* ベイク済みライティングを使用している場合、Mod フォルダ内にライトマップと `LightingSettings` アセットが **1** セットだけあることを確認しましたか？

:::caution

Mod フォルダの外にあっても、複数セットのライトマップと `LightingSettings` アセットがあると問題が発生することがユーザーから報告されています。ほかの方法で解決しない場合は、ライトマップと `LightingSettings` アセットを 1 セットだけ残してすべて削除してみてください。

:::

* ベイク済みライティングを使用している場合、ライトマップの方向モードは Directional に設定されていますか？（Bakery を使用している場合は Dominant Direction / MonoSH）
* Mod フォルダに Unity シーンが複数ありましたか？その場合は、ほかのシーンを削除してください。（サブフォルダ内にもシーンがある場合があるため、すべてのサブフォルダを確認してください！）
* シーン内の プレハブ に未適用の変更がありましたか？その場合は、変更を適用してください。縦線が表示されている場合（変更を完全に適用できなかったことを示します）は、それらを右クリックして **Prefab → Unpack Completely** を選択し、プレハブ を完全に展開してから Mod を再度エクスポートしてください。

![](/doc-img/en-environment-mod-2.webp)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
