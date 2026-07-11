---
sidebar_position: 40
translate_from_version: 2026-01-19
---

# データフォルダー

Warudoのデータフォルダーは`StreamingAssets`という名前のフォルダーで、Warudoが使用できるさまざまなデータファイルを保存します。

---

## 見つける方法

**Menu** ➜ **Open data folder**をクリックすると開けます。

![](/doc-img/data-folder-1.png)

通常、次のパスにあります。

```
<STEAM_ROOT_DIR>\steamapps\common\Warudo\Warudo_Data\StreamingAssets
```

## サブフォルダー

データフォルダーには、さまざまな種類のファイルを分類するための複数のサブフォルダーが含まれています。

詳細は以下のとおりです（アルファベット順）。

### Binaries

このフォルダーには、プログラムに関連するバイナリファイルが含まれています。
削除または変更しないでください。

### CharacterAnimationProfiles

このフォルダーは、**キャラクターのアニメーションプロファイル**ファイルを保存するために使用します。

**対応形式:** JSON (`*.json`)

[**Character**](/docs/assets/character)アセットの**Animation**セクションにある**Save Animation Profile**ボタンを使用すると、キャラクターの現在のアニメーション設定がこのフォルダーに保存されます。

プロファイルファイルは、次の場面で使用できます。

- [**Character**](/docs/assets/character)アセット – **Animation**セクション – **Load Animation Profile**ボタン
- **Load Character Animation Profile**ノード – **Animation Profile**ポート

[**Character**](/docs/assets/character)アセットの**Animation**セクションにある**Open Animation Profiles Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### CharacterAnimations

このフォルダーは、キャラクターが再生できる**キャラクターアニメーション**ファイルを保存するために使用します。

**対応形式:**

- Unity Animation Clip (`*.anim`)
- [Warudo Character Animation Mod](/docs/modding/character-animation-mod) (`*.warudo`)

アニメーションファイルは、次の場面で使用できます。

- [**Character**](/docs/assets/character)アセット – **Animation**セクション – **Idle Animation**オプション
- [**Character**](/docs/assets/character)アセット – **Animation**セクション – **Overlaying Animations** – **Animation**オプション
- **Character Animation Source**ノード – **Value**ポート
- **Get Random Character Animation**ノード – **Character Animations**ポート
- **Play Character One Shot Overlay Animation**ノード – **Animation**ポート
- **Play Character Idle Animation**ノード – **Animation**ポート

[**Character**](/docs/assets/character)アセットの**Animation**セクションにある**Open Character Animations Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### CharacterExpressionProfiles

このフォルダーは、**キャラクターの表情プロファイル**ファイルを保存するために使用します。

**対応形式:** JSON (`*.json`)

[**Character**](/docs/assets/character)アセットの**Expressions**セクションにある**Save Expression Profile**ボタンを使用すると、キャラクターの現在の表情設定がこのフォルダーに保存されます。

プロファイルファイルは、次の場面で使用できます。

- [**Character**](/docs/assets/character)アセット – **Expressions**セクション – **Load Expression Profile**ボタン

[**Character**](/docs/assets/character)アセットの**Expressions**セクションにある**Open Expression Profiles Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### Characters

このフォルダーは、**キャラクターモデル**ファイルを保存するために使用します。

**対応形式:**

- VRM 0.x Model (`*.vrm`)
- VRM 1.0 Model (`*.vrm`)
- [Warudo Character Mod](/docs/modding/character-mod) (`*.warudo`)

これらのファイルは、[**Character**](/docs/assets/character)アセットの**Source**オプションで使用できます。

[**Character**](/docs/assets/character)アセットにある**Open Characters Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### Clients

このフォルダーには、プログラムに関連するファイルが含まれています。
削除または変更しないでください。

### Environments

このフォルダーは、**環境**ファイルを保存するために使用します。

**対応形式:** [Warudo Environment Mod](/docs/modding/environment-mod) (`*.warudo`)

これらのファイルは、[**Environment**](/docs/assets/environment)アセットの**Source**オプションで使用できます。

[**Environment**](/docs/assets/environment)アセットにある**Open Enviroments Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### HandGestureProfiles

このフォルダーは、**キャラクターのハンドジェスチャー**ファイルを保存するために使用します。

**対応形式:** JSON (`*.json`)

**Detect Character Hand Gesture**ノードの**Record New Hand Gesture**ボタンを使用すると、キャラクターのハンドジェスチャーがこのフォルダーに保存されます。

プロファイルファイルは、次の場面で使用できます。

- **Detect Character Hand Gesture**ノード – **Gesture**ポート

### HandPoses

このフォルダーは、**キャラクターのハンドポーズ**ファイルを保存するために使用します。

**対応形式:** **(開発中 ...)**

ハンドポーズファイルは、次の場面で使用できます。

- [**Character**](/docs/assets/character)アセット – **Animation**セクション – **Override Hand Poses**オプション – **Pose**オプション
- **Enable Character Override Hand Pose**ノード – **Pose**ポート

### Images

このフォルダーは、**画像**ファイルを保存するために使用します。

**対応形式:** 画像形式

画像ファイルは、次の場面で使用できます。

- **Spawn Sticker From Local Image**ノード – **Image Source**ポート
- **Get Random Local Image**ノード – **Images**ポート
- [**Screen**](/docs/assets/screen)アセット – **Image Source**オプション（**Content Type**は**Image**にしてください）
- **Discover**パネル – **Published Items**タブ – **Create Item** – **Preview Image**オプション

### LipSyncProfiles

このフォルダーには、プログラムに関連するファイルが含まれています。
削除または変更しないでください。

### Localizations

このフォルダーには、プログラムに関連するファイルが含まれています。
削除または変更しないでください。

### MMD

**対応形式:** [Vocaloid Motion Data (MikuMikuDance)](https://mikumikudance.fandom.com/wiki/VMD_file_format) (`*.vmd`)

ファイルは、次の場面で使用できます。

- **MMD Player**アセット – **Character Motion**オプション

### Motions

**対応形式:** Warudo Animation Data (`*.wanim`)

Warudo Animation Dataファイルは、**Motion Recorder**アセットで作成できます。

ファイルは、次の場面で使用できます。

- **Motion Player**アセット – **Motion Sources**オプション

**Motion Recorder**アセットにある**Open Motions Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### Music

**対応形式:** 音声形式

ファイルは、次の場面で使用できます。

- **Music Player**アセット – **Source**オプション
- **Play Music**ノード – **Source**ポート
- **Music Source**ノード – **Value**ポート

**Music Player**アセットにある**Open Music Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### Particles

**対応形式:** [Warudo Particle Mod](/docs/modding/particle-mod) (`*.warudo`)

ファイルは、次の場面で使用できます。

- [**Prop**](/docs/assets/prop)アセット – **Source**オプション
- **Particle Source**ノード – **Value**ポート
- **Get Random Particle**ノード – **Particles**ポート
- **Spawn Particle**ノード – **Source**ポート
- **Throw Prop**ノード – **Impact Particle Source**ポート

### PendulumPhysicsProfiles

このフォルダーは、**振り子物理プロファイル**ファイルを保存するために使用します。

**対応形式:** JSON (`*.json`)

ファイルは、次の場面で使用できます。

- **Motion Capture**アセット – **Pendulum Physics**セクション – **Load Pendulum Physics Profile**ボタン
- **Load Pendulum Physics Profile**ノード – **Pendulum Physics Profile**ポート

**Motion Capture**アセットの**Pendulum Physics**セクションにある**Open Pendulum Physics Profiles Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### Playground

**対応形式:** C# Source Code File (`*.cs`)

参照: [Playground](/docs/scripting/playground)

### Plugins

**対応形式:** [Warudo Plugin Mod](/docs/scripting/creating-your-first-plugin-mod) (`*.warudo`)

### Props

**対応形式:** [Warudo Prop Mod](/docs/modding/prop-mod) (`*.warudo`)

ファイルは、次の場面で使用できます。

- [**Prop**](/docs/assets/prop)アセット – **Source**オプション
- **Prop Source**ノード – **Value**ポート
- **Get Random Prop**ノード – **Props**ポート
- **Throw Prop**ノード – **Prop Source**ポート

このフォルダーは、**Menu → Open Data Folder**でデータフォルダーを開き、`Props`フォルダーへ移動すると確認できます。

### Scenes

このフォルダーは、**Warudo Scene**ファイルを保存するために使用します。

**対応形式:** JSON (`*.json`)

シーンファイルは、次の場面で使用できます。

- **Menu** – **Open scene**

### Screenshots

[**Camera**](/docs/assets/camera)アセットの**Output**セクションにある**Take Screenshot**ボタンを使用すると、カメラの現在の出力がPNG形式でこのフォルダーに保存されます。

同様に、**Take Screenshot**ノードを呼び出すと、選択したカメラの現在の出力がPNG形式でこのフォルダーに保存されます。

### Sounds

**対応形式:** 音声形式

ファイルは、次の場面で使用できます。

- **Play Sound**ノード – **Source**ポート
- **Sound Source**ノード – **Value**ポート
- **Get Random Sounds**ノード – **Sounds**ポート
- **Throw Prop**ノード – **Launch/Impact Sound Source**ポート

**Play Sound**ノードにある**Open Sounds Folder**ボタンを使用して、このフォルダーを直接開くこともできます。

### SteamVR

このフォルダーには、プログラムに関連するファイルが含まれています。
削除または変更しないでください。

### Videos

このフォルダーは、**動画**ファイルを保存するために使用します。

**対応形式:** 動画形式

動画ファイルは、次の場面で使用できます。

- [**Screen**](/docs/assets/screen)アセット – **Video Source**オプション（**Content Type**は**Video**にしてください）

## 追加のサブフォルダー

:::tip
Steam Workshopの一部のプラグインは、`StreamingAssets`の下に追加のサブフォルダーを作成する場合があります。
:::

Warudoに関連するファイルをより適切に管理するため、次のサブフォルダーを作成することもおすすめします。

### AssetProfiles

このフォルダーは、**Export asset to file**ボタンから出力した**アセットプロファイル**ファイルを保存するために使用できます。

### Blueprints

このフォルダーは、**Export blueprint to file**ボタンから出力した**ブループリント**ファイルを保存するために使用できます。

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
