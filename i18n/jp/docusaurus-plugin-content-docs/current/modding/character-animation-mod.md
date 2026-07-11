---
sidebar_position: 11
translate_from_version: 2024-06-14
---

# キャラクターアニメーションMod

Warudoで使用したい[Animation Clip](https://docs.unity3d.com/Manual/AnimationClips.html)はありますか？キャラクターアニメーションMod が必要です！

:::caution
ボーン以外の Transform やマテリアルプロパティをアニメーションさせる場合は、これらのアニメーションをキャラクターに追加する別の方法を検討してください。詳しくは[キャラクターMod](character-mod#animations)をご覧ください。
:::

## セットアップ

### ステップ1: Animation Clip を準備する

プロジェクトにすでに **Animation Clip**（水色の三角形アイコンで表示）があれば、この手順は省略できます。

アニメーションが FBX ファイルの場合は、まずリグのインポート設定で **Animation Type** が Humanoid に設定されていることを確認します。

![](/doc-img/en-mod-14.png)

次に FBX ファイルを展開し、内部の **Animation Clip**（水色の三角形アイコンで表示）を選択して Ctrl+D を押し、FBX ファイルの外部にコピーを作成します。

![](/doc-img/en-character-animation-mod-1.webp)

### ステップ2: Animation Clip の名前を変更する

Animation Clip の名前を **"Animation"** に変更し、Mod フォルダ内（任意のサブフォルダでも可）に置かれていることを確認します。

### ステップ3: Mod をエクスポートする

**Warudo → Build Mod** を選択し、生成された `.warudo` ファイルを `CharacterAnimations` データフォルダに配置します。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
