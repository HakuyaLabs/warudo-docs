---
sidebar_position: 50
translate_from_version: 2024-06-18
---

# Playground

Playgroundは、[プラグインMod](plugin-mod)を作成せずにカスタムスクリプトを読み込めるWarudoの開発環境です。Warudoのデータフォルダー内の`Playground`フォルダーに配置したC#スクリプト（`.cs`ファイル）は自動的にコンパイル・読み込みされ、スクリプトへの変更も自動的に再読み込みされます。

:::tip
Playgroundを始めるには、[初めてのスクリプトを作成する](creating-your-first-script)チュートリアルをご覧ください！
:::

Playgroundには任意のC#スクリプトを配置できますが、Warudoに認識させるには、少なくとも1つのクラスが[エンティティ型](api/entities.md)、つまり`Node`、`Asset`、`Plugin`のいずれかを継承している必要があります。

## 環境設定

Playgroundの使用にIDEは必須ではありませんが、コード補完や構文ハイライトのために使用することをおすすめします。[JetBrains Rider](https://www.jetbrains.com/rider/)または[Visual Studio Code](https://code.visualstudio.com/)をおすすめします。

次に、[こちら](/scripts/Playground.csproj)から`.csproj`ファイルをダウンロードし、Warudoのデータフォルダー内にある`Playground`ディレクトリへ配置します（メニュー → データフォルダーを開く）。IDEでそのファイルを開けば準備完了です！

## エンティティのホットリロード

ホットリロードでは、エンティティデータをシリアル化し、古いエンティティ型をアンロードして新しいエンティティ型を読み込み・インスタンス化した後、古いエンティティデータをデシリアル化します。この処理は通常数秒で完了します。

ホットリロードが完了すると、再読み込みされたアセット、ノード、プラグインの数を示すトーストメッセージが表示されます。

:::tip
エラーが表示された場合は、トーストメッセージをクリックしてコンパイルエラーを確認できます。
:::

## 制限事項

Playgroundには以下の制限があります。

* サードパーティ製DLLやNuGetパッケージは（簡単には）使用できません。これは将来改善する予定です。
* Playgroundスクリプトでは、Unityアセット（例：プレハブ、マテリアル、テクスチャ）を追加または参照できません（代わりに[プラグインMod](plugin-mod)を使用してください）。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
