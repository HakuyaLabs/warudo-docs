---
sidebar_position: 41
translate_from_version: 2024-06-14
---

# パーティクルMod

パーティクルMod は通常、**Spawn Particle** などのノードで使用できる[パーティクルシステム](https://docs.unity3d.com/Manual/PartSysReference.html)です。

## セットアップ

### ステップ1: モデルを準備する

パーティクルの GameObject をシーンに配置し、目的の位置と回転に調整します。右クリックして **Create Empty Parent** を選択し、道具のルートとなる空の GameObject を作成します。

Play Mode に入り、親 GameObject を動かして、パーティクルシステムが期待どおりにパーティクルを放出することを確認します。そうでない場合は、**Simulation Space** を World ではなく Local に設定するなど、パーティクルシステムの設定を調整する必要があります。

### ステップ2: Prefab を作成する

ルートのパーティクル GameObject を選択し、Mod フォルダにドラッグして プレハブ を作成します。プレハブ の名前を **"Particle"** に変更し、Mod フォルダ内（任意のサブフォルダでも可）に置かれていることを確認します。

### ステップ4: Mod をエクスポートする

**Warudo → Build Mod** を選択し、生成された `.warudo` ファイルを `Particles` データフォルダに配置します。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
