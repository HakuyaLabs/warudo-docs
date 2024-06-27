---
sidebar_position: 20
---

# ドキュメント貢献

:::tip
Warudo Handbookは現在GitHubでオープンソース化されています！<br />
https://github.com/HakuyaLabs/warudo-docs/
:::

Warudo HandbookはReactベースの[Docusaurus](https://docusaurus.io/)を使用しており、ドキュメントの内容は[Markdown](https://www.markdownguide.org/)形式で記述されています。また、各ドキュメントページには、Warudoソフトウェアの機能ヘルプとヒントとして利用できる、便利なTipsも追加しています。

Warudo Handbookはオープンソースプロジェクトです。もし理解が難しい部分があったり、新しいコンテンツを作成したり、独自のチュートリアルやガイドを提供したい場合は、GitHubのissueやDiscordで質問するか、GitHubプロジェクトに直接コードや翻訳を追加して貢献してください。あなたの名前はドキュメント下部にある貢献者リストに掲載されます！


## 貢献に参加する

### GitHub Issueを使用して問題を報告し意見を述べる

GitHub Issueでのフィードバックは直接的で簡単です。ドキュメント内容に何か問題があれば、Issueを立てて修正提案をしてください。<br />
https://github.com/HakuyaLabs/warudo-docs/issues

ここでのフィードバックはWarudoドキュメントに対するものであり、Warudoソフトウェア自体についての議論は、関連するDiscordチャンネルで行なってください。<br />
https://discord.gg/warudo

### コードを提出し貢献者になる

Gitとフロントエンド開発の知識があれば、GitHubで直接pull requestを提出してコードを貢献できます。<br />
知識がない場合でも問題ありません。以下に、ローカル環境でWarudo Handbookを実行し、修正する方法を記載します。

## 技術詳細

### ディレクトリ構造

| Path | Content |
|--|--|
| `/docs` | 英語ドキュメント（デフォルト） |
| `/i18n/zh/docusaurus-plugin-content-docs/current` | 中国語ドキュメント（翻訳） |
| `/i18n/jp/docusaurus-plugin-content-docs/current` | 日本語ドキュメント（翻訳） |

英語以外の翻訳バージョンのディレクトリ構造は、言語の切り替えが正確に機能するように、英語版と完全に一致させる必要があります。

:::tip

Warudo Handbook左側のナビゲーションバー構造も英語版ファイルによって生成されますので、`/docs`ディレクトリ内の各ファイルを`/i18n/[lang]/docusaurus-plugin-content-docs/current`にコピーし、各ファイルの構造が異なる言語間で完全に一致していることを確認してください。

:::


### よく使うコマンド

| Command | Description |
|--|--|
| `yarn` | 依存関係のインストール |
| `yarn start:en` | 英語版開発モードを実行 |
| `yarn start:zh` | 中国語版開発モードを実行 |
| `yarn start:jp` | 日本語版開発モードを実行 |
| `yarn start:all` | 異なるポートで複数の言語ドキュメントを同時に実行 |
| `yarn build` | 本番バージョンのドキュメントをビルド |

 
## ローカル環境での開発について

開発ツールに不慣れでも心配しないでください。気軽にチャレンジしてみましょう！

<details>

<summary>ローカル開発ドキュメントチュートリアル</summary>

### 環境の準備

まず、必要な開発環境をダウンロードします。

 - Node.js ダウンロード: https://nodejs.org/en/download/  
	<small>Node.jsはWarudo Handbookの開発に必要なプログラミング言語です。</small> <br />
	<small>LTSバージョンを選択してインストールします（.msi/.exeはWindows用、.pkgはmacOS用）</small> 

 - GitHub Desktop ダウンロード: https://desktop.github.com/  
    <small>GitHub DesktopはGitHub公式のバージョン管理ツールで、コードの提出やブランチのマージを直接行うのに役立ちます。</small>

 - VSCode ダウンロード: https://code.visualstudio.com/  
	<small>VSCodeは一般的な開発者向けエディタで、フロントエンドプロジェクトの開発に適しています。他の馴染みのあるエディタを使っても構いません。</small>

### コマンドラインの使用

 - Windows: ショートカットキーの`Win+R`を使用して`cmd`を実行し、コマンドプロンプトを開きます。

 - macOS: ランチャーから`Terminal`アプリを使用します。

上記の開発環境をインストールした後、ターミナル上で`node -v`コマンドを使用して、インストールされているNode.jsのバージョンを確認できます。

### GitHub Desktopでプロジェクトを追加

 - GitHubアカウントにログイン

 - `HakuyaLabs/warudo-docs`リポジトリを検索

 - ローカル環境にプロジェクトをクローン  
   <small>これでWarudo Handbookのコードがあなたのマシンにダウンロードされました。</small>

 - `Current branch` - `New branch` - ブランチ名を入力 - `Create branch` をクリック    
   <small>ブランチはGitの概念で、自分のブランチ上でファイルの内容を変更しても他の人の作業に影響を与えません。</small>

 - `Publish branch` をクリック  
   <small>これで自分のブランチがリモートリポジトリに反映され、編集を開始できます。</small>

### ローカル環境でWarudo Handbookを実行

まずターミナルを開きます：

 - **`cd <プロジェクトディレクトリのパス>`**  
   <small>Warudo Handbookのプロジェクトディレクトリに移動します。</small>

 - **`corepack enable`**   
   <small>Node.jsのパッケージマネージャーを設定します。</small><br />
   <small>*基本的にはこのコマンドは一度有効にすれば、その後は実行する必要はありません。</small>

 - **`yarn`**  
   <small>依存関係のパッケージをインストールします。</small><br />
   <small>*プロジェクトのpackage.json依存ファイルが更新された場合は、このコマンドを再度実行して依存関係をインストールします。</small>

 - **`yarn start:en`** 英語版を実行
 - **`yarn start:zh`** 中国語版を実行
 - **`yarn start:jp`** 日本語版を実行
 - **`yarn start:all`** 一度に複数の言語環境を実行

これで準備が整い、ローカルマシン上で実行されるWarudo Handbookがブラウザに表示されるはずです。ドキュメント内容を変更して保存すると、ブラウザが自動的にページを更新します。  
ドキュメント内容を編集して試してみてください！

### 編集の開始

 - Markdownファイルを編集し、ブラウザでリアルタイムにページを確認

ほとんどのディレクトリ内のドキュメントは.mdおよび.mdx形式で保存されます。これは[Markdown](https://www.markdownguide.org/)形式のテキストで、いくつかの記述フォーマットコードを含むテキストファイルです。見栄えの良いドキュメントを作成するには、Markdownの書き方を研究してみてください。


### 変更の提出とアップロード

変更を保存した後：

 - GitHub Desktopを開くと、左側のサイドバーにすべての変更が表示されます。提出したい変更ファイルをすべて選択します。 
  Descriptionの入力欄に変更内容の説明を入力し（例：ドキュメントxxの翻訳を追加）、 `Commit` をクリックします。

 - これで今回の変更が提出され、履歴リストに表示されるはずです。

 - ただし、現在この変更は自分のマシン上にしか存在しないため、 `Push Origin` をクリックして変更をGitHubにアップロードします。

 - ヨシ！最初の提出が完了しました。これであなたの変更が保存されました。

### Warudo Handbookのメンテナンスメンバーに連絡し、変更をレビューして公開

 - GitHub上でpull requestを提出し、ドキュメントのメンテナンスメンバーに連絡します。変更が受け入れられ、マージされると公開されます。

</details>

## ドキュメントにあなたの名前を追加する

各ドキュメントの最下部には編集者を示すコードセクションがあります。ドキュメントを変更または完成させた後、ここにあなたの名前を追加することを忘れないでください。アバターアイコンは自動的にGitHub IDから取得されます。

```
<AuthorBar authors={{
  creators: [
    {name: 'あなたの名前', github: 'あなたのGitHub ID'},
  ],
  translators: [
    {name: 'あなたの名前', github: 'あなたのGitHub ID'},
  ],
}} />
```


<AuthorBar authors={{
  creators: [
    {name: 'unsoluble_sugar', github: 'unsolublesugar'},
  ],
  translators: [
  ],
}} />