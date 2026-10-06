---
sidebar_position: 40
translate_from_version: 2024-06-14
---

# 道具Mod

道具Mod は、椅子や剣のように Warudo で道具として使用する Unity の [プレハブ](https://docs.unity3d.com/Manual/Prefabs.html)です。

## セットアップ

### ステップ1: モデルを準備する

道具モデルを Mod 制作プロジェクトにインポートします。道具をシーンに配置し、目的の位置と回転に調整します。右クリックして **Create Empty Parent** を選択し、道具のルートとなる空の GameObject を作成します。

:::tip
道具アセットではルート GameObject の Transform が道具の Transform として使用されるため、空の親を作成します。空の親を作成しない場合、道具の Transform に加えた変更は保持されません。
:::

### ステップ2: キャラクターへの装着をセットアップする（任意）

道具をアクセサリーなどとしてキャラクターに装着する場合、プレハブ に `CharacterAttachmentSettings` スクリプトを配置して、装着先となる既定のキャラクターボーンを指定できます。これにより、ユーザーが Prop → Transform Attachment → Attach To でキャラクターを選択したとき、道具は既定のボーン（頭部）ではなく指定したキャラクターボーンに自動で装着されます。

道具の任意の子 Transform に `CharacterAttachmentRotationConstraint` スクリプトを配置して、道具のボーンが一緒に回転すべきキャラクターボーンを指定することもできます。たとえば手袋の道具の子 Transform は、キャラクターの指のボーンと一緒に回転させる必要があります。

### ステップ3: Prefab を作成する

道具のルート GameObject を選択し、Mod フォルダにドラッグして プレハブ を作成します。プレハブ の名前を **"Prop"** に変更し、Mod フォルダ内（任意のサブフォルダでも可）に置かれていることを確認します。

### ステップ4: Mod をエクスポートする

**Warudo → Build Mod** を選択し、生成された `.warudo` ファイルを `Props` データフォルダに配置します。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
