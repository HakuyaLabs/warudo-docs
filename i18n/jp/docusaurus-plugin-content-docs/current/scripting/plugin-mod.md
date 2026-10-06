---
sidebar_position: 100
translate_from_version: 2024-06-16
---

# プラグインMod

プラグインModは、Warudoにカスタムアセットとノードを追加する[Warudo Mod](../modding/mod-sdk)の一種です。

:::tip
プラグインModの作成を始めるには、[初めてのプラグインModを作成する](creating-your-first-plugin-mod)チュートリアルをご覧ください！
:::

:::info
このページでは、プラグインModを作成するための一般的なガイドラインを説明します。[プラグイン](api/plugins)のスクリプティングAPIページもご覧ください。
:::

## 環境設定

プラグインModは、`Plugin`を継承するC#スクリプトを含む通常のModです。[初めてのModを作成する](../modding/creating-your-first-mod)チュートリアルに従って、新しいModを作成できます。次に、Modフォルダー内に新しいC#スクリプトを作成し、`Plugin`を継承させます。カスタムアセット型またはノード型がある場合は、`[PluginType]`属性の`AssetTypes`および`NodeTypes`プロパティに登録されていることを確認してください（[Plugin API](api/plugins)を参照）。

## Unityアセットを含める

Modフォルダーに配置することで、プラグインModにUnityアセット（例：プレハブ、マテリアル、テクスチャ）を含められます。WarudoはModのエクスポート時にこれらのアセットを自動的に含めます。

:::caution
プレハブまたはマテリアルがカスタムシェーダーやスクリプトを使用している場合は、それらのシェーダーやスクリプトもModフォルダーに含めてください。
:::

その後、実行時にスクリプトからこれらのアセットを読み込めます。詳細は[Unityアセットの読み込み](api/plugins#loading-unity-assets)をご覧ください。

## 制限事項 {#limitations}

プラグインModには以下の制限があります。

- サードパーティ製DLLやNuGetパッケージは使用できません。
- アセンブリの一部であるC#スクリプトはエクスポートできません。つまり、Modフォルダー内に`.asmdef`ファイルを配置できません。
- リフレクション（`System.Reflection`）の使用やファイルシステム（`System.IO`）へのアクセスはできません。
  * `MonoBehaviour`コンポーネントのメソッドを呼び出すには、Unityの[`SendMessage`](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html)または[`BroadcastMessage`](https://docs.unity3d.com/ScriptReference/Component.BroadcastMessage.html)メソッドの使用を検討してください。
  * データの保存と読み込みについては、[データの保存と読み込み](api/io)をご覧ください。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
