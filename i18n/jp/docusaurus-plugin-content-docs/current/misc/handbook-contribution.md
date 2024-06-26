---
sidebar_position: 20
---

# ドキュメント貢献

:::tip
Warudo ドキュメントサイトは現在Githubでオープンソース化されています！<br />
https://github.com/HakuyaLabs/warudo-docs/
:::

Warudo handbookはReactベースの[Docusaurus](https://docusaurus.io/)を使用しており、内容は[Markdown](https://www.markdownguide.org/)形式で記述されています。また、ドキュメントページには便利な機能を追加しており、Warudoソフトウェアの機能ヘルプとヒントとしても利用されます。

Warudo handbookはオープンソースです。もし理解が難しい部分があったり、新しいコンテンツを作成したり、独自のチュートリアルやガイドを提供したい場合は、GithubのissueやDiscordで質問を提出するか、Githubプロジェクトに直接コードや翻訳を追加して貢献してください。あなたの名前はドキュメントの下部にある貢献者リストに掲載されます！


## 貢献に参加する

### Github Issueを使用して問題を報告し意見を述べる

Github Issueでのフィードバックは直接的で簡単な方法です。いくつかのissueテンプレートを設定して、問題を提起するのに役立てています。<br />
https://github.com/HakuyaLabs/warudo-docs/issues

ここでのフィードバックはWarudoドキュメントに対するものであり、Warudoソフトウェア自体についての議論は関連するDiscordチャンネルで行ってください。<br />
https://discord.gg/warudo

### コードを提出し貢献者になる

Gitとフロントエンド開発の知識があれば、Githubで直接Merge Requestを提出してコードを貢献できます。<br />
知識がない場合でも問題ありません。以下の内容で、ローカルでWarudo Handbookを実行し、修正する方法をお教えします。

## 技術的な詳細

### ディレクトリ構造

| Path | Content |
|--|--|
| `/docs` | 英語ドキュメント（主要） |
| `/i18n/zh/docusaurus-plugin-content-docs/current` | 中国語ドキュメント（翻訳） |
| `/i18n/jp/docusaurus-plugin-content-docs/current` | 日本語ドキュメント（翻訳） |

非英語の翻訳バージョンのディレクトリ構造は、言語の切り替えが正確に機能するように、英語版と完全に一致する必要があります。

:::tip

ウェブサイト左側のナビゲーションバー構造も英語版ファイルによって生成されますので、`/docs`フォルダー内の各ファイルを`/i18n/[lang]/docusaurus-plugin-content-docs/current`にコピーし、各ファイルの構造が異なる言語間で完全に一致していることを確認してください。

:::


### よく使うコマンド

| Command | Description |
|--|--|
| `yarn` | 依存関係のインストール |
| `yarn start:en` | 英語ドキュメント開発モードを実行 |
| `yarn start:zh` | 中国語ドキュメント開発モードを実行 |
| `yarn start:jp` | 日本語ドキュメント開発モードを実行 |
| `yarn start:all` | 異なるポートで複数の言語ドキュメントを同時に実行 |
| `yarn build` | 本番バージョンのドキュメントをビルド |

 
## ローカルでドキュメントサイトの開発環境を実行する

開発ツールに不慣れでも心配しないでください。試してみましょう。

<details>

<summary>ローカル開発ドキュメントチュートリアル</summary>

### 環境の準備

まず、必要な開発環境をダウンロードします。

 - Node.js ダウンロード: https://nodejs.org/en/download/  
	<small>Node.jsはドキュメントサイトに必要なプログラミング言語です。</small> <br />
	<small>LTSバージョンを選択してインストールします（Windows用の.msi/.exe、macOS用の.pkg）</small> 

 - GitHub Desktop ダウンロード: https://desktop.github.com/  
    <small>GitHub DesktopはGithub公式のバージョン管理ツールで、コードの提出やブランチのマージを直接行うのに役立ちます。</small>

 - VSCode ダウンロード: https://code.visualstudio.com/  
	<small>VSCodeは一般的なエディタで、フロントエンドプロジェクトの開発に適しています。他の馴染みのあるエディタを使っても構いません。</small>

### コマンドラインの使用

 - Windowsユーザーは、`Win+R`を使用して`cmd`を実行してターミナルを開きます。

 - macOSユーザーは、ランチャーから`Terminal`アプリを使用します。

上記の開発環境をインストールした後、ターミナルで`node -v`コマンドを使用して、インストールされているNode.jsのバージョンを確認できます。

### Github Desktopでプロジェクトを追加

 - Githubアカウントにログイン

 - `HakuyaLabs/warudo-docs`を検索

 - プロジェクトをローカルにクローン
   <small>これでドキュメントサイトのコードがあなたのコンピュータにダウンロードされました。</small>

 - `現在のブランチ` - `新しいブランチ` - ブランチ名を入力 - `ブランチを作成`をクリック    
   <small>ブランチはGitの概念で、自分のブランチでファイルの内容を変更しても他の人の作業に影響を与えません。</small>

 - `ブランチを公開`をクリック  
   <small>これで自分のブランチを公開し、編集を開始できます。</small>

### ローカルでサイトを実行

まずターミナルを開きます：

 - **`cd <あなたのサイトファイルの場所>`**  
   <small>サイトファイルのフォルダーに移動します。</small>

 - **`corepack enable`**   
   <small>Node.jsのパッケージマネージャーを設定します。</small><br />
   <small>*理論的にはこのコマンドは一度有効にすれば、その後は実行する必要はありません。</small>

 - **`yarn`**  
   <small>依存関係のパッケージをインストールします。</small><br />
   <small>*プロジェクトのpackage.json依存ファイルが更新された場合は、このコマンドを再度実行して依存関係をインストールします。</small>

 - **`yarn start:en`** 英語ドキュメントサイトを実行
   **`yarn start:zh`** 中国語ドキュメントサイトを実行
   **`yarn start:all`** 一度に複数の言語ドキュメントサイトを実行

これで準備が整い、ローカルのコンピュータ上で実行されるドキュメントサイトがブラウザに表示されるはずです。ドキュメント内容を変更して保存すると、ブラウザが自動的にページを更新します。ドキュメント内容を編集してみてください！

### 編集の開始

 - Markdownファイルを編集し、ブラウザでリアルタイムにページを確認

ほとんどのフォルダー内のドキュメントは.mdおよび.mdx形式で保存されます。これは[Markdown](https://www.markdownguide.org/)形式のテキストで、いくつかの記述フォーマットコードを含むテキストファイルです。見栄えの良いドキュメントを作成するには、Markdownの書き方を研究してみてください。


### 変更の提出とアップロード

保存した後：

 - Github Desktopを開き、左側にすべての変更が表示されます。提出したい変更ファイルをすべて選択します。 
  入力フィールドに変更内容の説明を入力します（例：ドキュメントxxの翻訳を追加）、提出をクリックします。

 - これで今回の変更が提出され、履歴リストに表示されるはずです。

 - ただし、現在この変更は自分のコンピュータ上にしか存在しないため、「Push Origin」をクリックして変更をGithubにアップロードします。

 - よし！最初の提出が完了しました。これであなたの変更が保存されました。

### Warudo Handbookのメンテナンスメンバーに連絡し、変更をレビューして公開

 - プルリクエストを提出するか、グループでドキュメントメンテナンスメンバーに連絡し、変更をマージして公開します。

</details>

## ドキュメントにあなたの名前を追加する

各ドキュメントの最下部には編集者を示すコードがあります。ドキュメントを変更または完成させた後、ここにあなたの名前を追加することを忘れないでください。アバターは自動的にGithub IDから取得されます。

```
<AuthorBar authors={{
  creators: [
    {name: 'あなたの名前', github: 'あなたのGithub ID'},
  ],
  translators: [
    {name: 'あなたの名前', github: 'あなたのGithub ID'},
  ],
}} />
```


<AuthorBar authors={{
  creators: [
    {name: 'Nekotora', github: 'Nekotora'},
  ],
  translators: [
  ],
}} />