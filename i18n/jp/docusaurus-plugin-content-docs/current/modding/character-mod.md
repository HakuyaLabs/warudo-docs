---
sidebar_position: 10
translate_from_version: 2025-05-25
---

# キャラクターMod

Unity にインポートできるキャラクターモデルであれば、どのようなものでも Warudo にキャラクターMod としてインポートできます。FBX モデルや [VRChat アバター](https://booth.pm/en/search/avatar?tags%5B%5D=3D+Character)も対象です。VRM モデルを使用している場合でも、カスタムシェーダーや [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)、[Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)など、より優れた物理コンポーネントを追加できるため、キャラクターMod を作成する利点があります。

## セットアップ

### ステップ1: モデルを準備する

まず、キャラクターモデルを Mod 制作プロジェクトにインポートします。モデルは [Animator](https://docs.unity3d.com/ScriptReference/Animator.html) コンポーネントを持つヒューマノイドモデルである必要があります。モデルに Animator コンポーネントがない場合は、モデルのインポート設定で **Animation Type** を Humanoid に設定してから **Apply** をクリックします。

![](/doc-img/en-character-mod-1.webp)

FBX モデルを使用している場合は、モデルのインポート設定で **R/W Enabled** がオンになっていることを確認してください。

![](/doc-img/en-character-mod-2.webp)

### ステップ2: キャラクターをセットアップする

キャラクターをシーンに配置して選択します。メニューバーで **Warudo → Setup Character...** を選択します。Setup Character ウィンドウで **Setup selected GameObject as character mod** を選択します。

![](/doc-img/en-character-mod-3.webp)

Mod フォルダ内に **Character** という名前の プレハブ が生成されます。

![](/doc-img/en-character-mod-4.webp)

:::tip
キャラクターのボーンがねじれたり、セットアップ前後でモデルの見た目に差が出たりする場合は、[ボーンの正規化](#normalize-bones)を参照してください。
:::

### ステップ3: Mod をエクスポートする

**Warudo → Build Mod** を選択し、生成された `.warudo` ファイルを `Characters` データフォルダに配置します。

## スケーリング

Warudo では **Character → Transform → Scale** プロパティでキャラクターを拡大・縮小できます。ただし、ラグドール、IK、一部のモーションキャプチャシステム（例: [Leap Motion](../mocap/leap-motion)）との互換性が損なわれることがあります。キャラクターを拡大・縮小する必要がある場合は、Unity や Warudo にモデルをインポートする前、つまり 3D モデリングソフトウェアで行うことをおすすめします。

## サードパーティ製コンポーネント

Warudo には、キャラクターMod で使用できるサードパーティ製コンポーネントが含まれています。よく使用されるコンポーネントは次のとおりです。

* VRM Spring Bones、VRM Spring Bone Colliders などの [VRM](https://vrm.dev/en/univrm/) コンポーネント
* Rotation Constraint などの [Animation Rigging](https://docs.unity3d.com/Packages/com.unity.animation.rigging@latest) コンポーネント
* [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones)（実行時に自動で Dynamic Bone に変換されます）
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11
* [Magica Cloth 2](https://assetstore.unity.com/packages/tools/physics/magica-cloth-2-242307) 2.6.0

Dynamic Bone と Magica Cloth は Warudo SDK に含まれていないため、対応する Unity パッケージをインポートする必要があります。

Warudo では C# スクリプトを Mod にパッケージ化できるため、ほかのサードパーティ製 Unity コンポーネントも使用できます。ただし、[カスタム C# スクリプト](mod-sdk#custom-scripts)セクションの制限事項に注意してください。

## アニメーション {#animations}

髪色の変更や羽ばたきなど、キャラクターにカスタムアニメーションを追加したい場合があります。アニメーションの性質に応じて、次のいずれかの方法を使用できます。

* **アニメーションが人型ボーンのみを制御する:** [キャラクターアニメーションMod](character-animation-mod)を作成し、Warudo の任意のキャラクターアニメーションノードまたは Character → Overlaying Animations で再生します。未加工の Unity `.anim` ファイルを `CharacterAnimations` フォルダに置いて使用することもできます。
* **アニメーションがマテリアルプロパティを制御する:** Warudo のキャラクター表情システム（Character → Expressions）を使用します。
* **アニメーションがボーン以外の Transform を制御する:** [Animator Controller](https://docs.unity3d.com/Manual/class-AnimatorController.html)を Animator コンポーネントに追加し、Warudo 組み込みの Animator Controller ノードで Animator パラメーターを制御します。

:::info
VRChat モデルを再利用する場合は、モデルに付属している Animator Controller をそのまま使用することもできます。ただし、最初の 2 つの方法のほうが Warudo のモーションキャプチャおよびアニメーションシステムとの統合に優れているため、おすすめです。
:::

## ボーンの正規化 {#normalize-bones}

ボーンの正規化とは、モデルのボーンが T ポーズで回転ゼロになるようにする処理です。Warudo SDK でキャラクターをセットアップする*前*に、モデルを Unity にインポートし、1. モデルが T ポーズであること、2. すべてのボーン Transform の回転が (0, 0, 0) であることを確認すると、モデルのボーンが正規化されているか確認できます。モデルのボーンが正規化されていない場合は、**Setup Character** ウィンドウでも警告されます。

![](/doc-img/en-mod-11.png)

キャラクターのセットアップ後にボーンがねじれる場合、モデルのボーンが正規化されておらず、Warudo SDK がモデルを壊さずに自動正規化できなかった可能性があります。回避策は 2 つあります。

### 手動で正規化する

キャラクターを自分でモデリングした場合は、FBX モデルを Unity にインポートする*前*にボーンを手動で正規化することをおすすめします。

Blender や Maya などのモデリングツールでボーンを正規化する方法は多数ありますが、最も実績のある方法は、FBX モデルから [VRM](https://vrm.dev/en/univrm/) モデルを作成し、それを Unity にインポートすることです。VRM モデルのボーンは正規化されていることが保証されているため、Warudo SDK でキャラクターをセットアップした後にボーンがねじれないことを確認できます。欠点は、FBX を更新するたびに VRM モデルを作成する必要があり、手間がかかることです。

Blender ユーザーがボーンを手動で正規化する場合は、[Cats](https://cats.neoneko.xyz/) の **Set Rest Pose** オプションを使用できます。FBX をエクスポートするときは、以下の設定を使用してください。

![](/doc-img/en-mod-15.png)
<p class="img-desc">クレジット: [@Kana_Fuyuko](https://twitter.com/Kana_Fuyuko)</p>

:::warning
Blender 組み込みの FBX エクスポーターは正しいボーン回転をエクスポートできない問題が知られています。問題がある場合は、[Better FBX Importer & Exporter](https://blendermarket.com/products/better-fbx-importer--exporter)（推奨）または [Cats](https://cats.neoneko.xyz/) などのサードパーティ製アドオンを使って FBX モデルをエクスポートすることを検討してください。
:::

### Denormalized Avatar Exporter を使用する

[Denormalized Avatar Exporter] は [@vr_hai](https://x.com/vr_hai) が開発した Unity パッケージです。通常は VRChat で使用するために設計されたアバターを Warudo などの VTubing アプリにエクスポートできますが、非 VRChat モデルでも機能します。

自分でキャラクターをモデリングしておらず、ボーンの正規化で問題が起きている場合は、これを使用することをおすすめします。詳細は[公式ドキュメント](https://docs.hai-vr.dev/docs/products/denormalized-avatar-exporter#usage-in-warudo)をご確認ください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
