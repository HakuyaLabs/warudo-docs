---
sidebar_position: 1000
translate_from_version: 2024-06-16
---

# デバッグ

スクリプトが期待どおりに動作しませんか？デバッグのヒントをご紹介します！

## Warudoを再起動する

ありきたりに聞こえるかもしれませんが、Warudoの再起動は多くの問題を解決できます。特にModやスクリプトをホットリロードした場合は有効です。原因が分からない問題に遭遇したら、まずは必ず試してください。

## ロギング

通常どおり、Unityの`Debug.Log`を使用してコンソールにメッセージを出力できます。**メニュー → ログフォルダーを開く**からログフォルダーにアクセスできます。`Player.log`ファイルには現在のセッションのログが、`Player-prev.log`には前回のセッションのログが含まれます。

## 完全なビルドログを有効にする

[プラグインMod](plugin-mod)を作成している場合は、Mod Settingsウィンドウで**Log Level**をAllに設定し、**Clear Console On Build**のチェックを外すことをおすすめします。

![](/doc-img/en-mod-13.png)

[Modding](../modding/mod-sdk#custom-scripts)のドキュメントもご覧ください。

## Discordに参加する

まだ問題が解決しない場合は、[Discord](https://discord.gg/warudo)でお気軽に質問してください。スクリプティング関連専用の**#plugins-scripting**チャンネルがあり、経験豊富なメンバーが問題の診断を喜んでお手伝いします！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
