---
sidebar_position: 1
translate_from_version: 2026-02-28
---

# Unity と Warudo SDK のインストール

このページでは、**Unity Editor** と **Warudo SDK** のインストール方法を順を追って説明します。

---

:::info

現在サポートされているのは **64 ビット Windows** システムのみです。

:::

## ステップ1 - Unity Hub をインストールする

まず、**Unity Hub** をダウンロードします（通常は最新バージョンで問題ありません）。
Unity Hub は、さまざまなバージョンの Unity Editor と、それぞれのバージョンのプロジェクトを管理するためのソフトウェアです。

[**Unity 公式サイト**](https://unity.com/download)を開き、下の画像の 2 つの赤枠のいずれかをクリックして Unity Hub をダウンロードします。ダウンロードには Unity アカウントの登録が必要になる場合があります。

![](/doc-img/en-sdk-installation-1.png)

ダウンロードした UnityHubSetup.exe を実行し、任意のパスにインストールします。
インストール後、正しく起動できることを確認します。

![](/doc-img/sdk-installation-2.png)

ログイン後、最新の Long-Term Support（LTS）版 Unity Editor のダウンロードが自動的に提案されます。
Warudo ではこのバージョンを使用しないため、**Skip installation** をクリックすることをおすすめします。

ただし、そのバージョンをインストールする場合は、複数の Unity Editor バージョンを管理しやすくするため、
インストールパスを `...\<version>`（例: `D:\Softwares\Unity\2021.3.18f1`）に変更し、
既定のインストールパスである `C:\Program Files\Unity\Hub\Editor` は**使用しない**ことを強くおすすめします。

![](/doc-img/sdk-installation-3.png)

Unity Personal Edition の利用条件を満たしている場合は、ここで個人向けライセンスをアクティベートして取得できます。

![](/doc-img/sdk-installation-4.png)

前の手順でアクティベーションをスキップした場合や失敗した場合も、Unity Hub で後から手動でライセンスをアクティベートできます。

![](/doc-img/sdk-installation-5.png)

![](/doc-img/sdk-installation-6.png)

![](/doc-img/sdk-installation-7.png)

Unity Hub の言語は、【Preferences】-【Appearance】で変更できます。

![](/doc-img/sdk-installation-8.png)

## ステップ2 - Unity Editor をインストールする

次に Unity Editor のインストーラーをダウンロードします。バージョンは必ず **2021.3.45f2** でなければなりません。

この特定のパッチリリースは Warudo SDK との互換性のために必要であり、別のバージョンに置き換えることはできません。インストールするには、次の手順に従ってください。

1. [Unity Download Archive](https://unity.com/releases/editor/archive)に移動します。
2. **2021** タブで、Version **2021.3.45f2 (Oct 3, 2025)** を見つけます。
3. **INSTALL** をクリックします。
![](/doc-img/sdk-installation-9.png)
4. ブラウザーが Unity Hub を開こうとするので、**Open** を選択します。
5. 開いた Unity Hub ウィンドウで **Continue** をクリックし、次に **Install** をクリックします。
6. インストールには時間がかかる場合があるため、しばらくお待ちください。

**`4.` が失敗した場合、または手動でインストールする場合は、`2.` に戻ってから次の手順に進んでください。**

3. **See all** をクリックします。
4. **Windows** をクリックしてインストーラーをダウンロードします（ファイル名は `UnitySetup64-2021.3.45f2.exe` に似ており、約 3～4 GiB です）。
![](/doc-img/sdk-installation-13.png)
5. ダウンロードしたインストーラーを実行して、インストールを開始します。
既定のインストール先は `C:\Program Files\Unity 2021.3.45f2` の場合があります。変更することもできますが、複数の Unity バージョンを管理する際の混乱を避けるため、パスにバージョン番号を含めることをおすすめします（例: `D:\Softwares\Unity\2021.3.45f2`）。
インストールには時間がかかる場合があるため、しばらくお待ちください。
6. インストール後、Unity Hub を開きます。
7. **Installs → Locate** に移動します。
8. インストールしたエディターフォルダを参照し、`Unity.exe` を `Editor` サブフォルダ内で選択します。
9. **Select Editor** をクリックします。

上記の手順を完了すると、必要な Unity バージョン（2021.3.45f2）が Unity Hub に表示されるはずです。

![](/doc-img/sdk-installation-10.png)


## ステップ3 - Warudo SDK をダウンロードしてインポートする

Unity で Warudo SDK をセットアップする方法は 2 つあります。

- Unity Package Manager を使用してパッケージをインポートする（推奨）
- Mod 制作プロジェクトテンプレートをダウンロードする

プロジェクトを最新の Warudo Mod SDK リリースと簡単に同期できるため、Package Manager の方法を強くおすすめします。GitHub への接続が不安定な場合は、テンプレートプロジェクトを使用できます。

### 方法 A — Unity Package Manager（推奨）

インストール前に、**File → Build Settings... → Player Settings... → Other Settings → Api Compatibility Level** が **.NET Framework** に設定され、**Assembly Version Validation** のチェックが外れていることを確認してください。
（このページには **Edit → Project Settings → Player → Other Settings** からもアクセスできます。）

![](/doc-img/en-mod-sdk-2.webp)

Unity プロジェクトを開き、**Window → Package Manager** を選択します。Package Manager ウィンドウで **+** ボタン（左上）をクリックし、**Add package from git URL...** を選択します。次の URL を入力してください。

```
https://github.com/HakuyaLabs/Warudo-Mod-Tool.git#0.14.3.10
```

GitHub に安定してアクセスできない場合は、tarball をダウンロードできます。


<div className="file-box">
<a href="/sdk/Warudo-Mod-Tool-0.14.3.10.tgz" target="_blank">Warudo-Mod-Tool-0.14.3.10.tgz</a>
</div>

代わりに **Add package from tarball...** を使用してください。

**Add** をクリックすると、Unity がパッケージをダウンロードしてインストールします。Unity から事前ビルド済みパッケージまたは変換について確認された場合は、**Yes** を選択し、パッケージのインポートが完了するまで待ちます。

:::caution

`No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub` のようなエラーが表示される場合、システムに Git がインストールされていません。https://git-scm.com/download から Git をインストールし、Unity と Unity Hub を再起動してください。
![](/doc-img/en-mod-sdk-1.webp)

:::

### 方法 B — Mod 制作プロジェクトテンプレート

[Warudo SDK 0.14.3.10 Modding Project.zip](https://files.warudo.app/modsdk/Warudo%20SDK%200.14.3.10%20Modding%20Project.zip)

1. 上記の zip をフォルダにダウンロードして展開します（例: `D:\Softwares\Unity\2021.3.45f2\Projects\WarudoModding`）。
2. Unity Hub で **Add**（または **Open**）をクリックし、そのフォルダを選択します。
3. プロジェクトを開きます。初回起動時には、Unity がアセットをインポートするまで数分かかる場合があります。

プロジェクトの読み込みが完了したら、Console に Errors がないか確認します（Warnings が少数表示されるのは正常です）。Errors がなければ、SDK は正しくインストールされており、最初の Mod を作成する準備ができています。

![](/doc-img/sdk-installation-11.png)

:::tip

Console に Errors が表示される場合は、**Clear** をクリックしてからもう一度確認してください。問題が解決しない場合は、[Discord](https://discord.gg/warudo) またはコミュニティチャンネルでお問い合わせください。

:::

:::caution

すでに次のいずれかのアセットを含む**既存の**プロジェクトに SDK をインポートする場合は、それらがスタブファイルに置き換わらないよう、インポート中に対応するフォルダのチェックを外してください。

- Dynamic Bones → `Packages/DynamicBone`
- Final IK → `Plugins/RootMotion/FinalIK`
- PuppetMaster → `Plugins/RootMotion/PuppetMaster`

:::

すべてが Errors なくインポートされたら、[はじめての Mod を作成する](creating-your-first-mod)から始められます。

---

## バージョン履歴

### Warudo SDK 0.14.3.10（最新）

- Unity バージョン: **2021.3.45f2**（Oct 3, 2025）
- Unity Package Tarball: [Warudo-Mod-Tool-0.14.3.10.tgz](https://docs.warudo.app/sdk/Warudo-Mod-Tool-0.14.3.10.tgz)
- Unity プロジェクト: [Warudo SDK 0.14.3.10 Modding Project.zip](https://files.warudo.app/modsdk/Warudo%20SDK%200.14.3.10%20Modding%20Project.zip)

### Warudo SDK 0.12.0

- Unity バージョン: **2021.3.18**（Feb 1, 2023）
- Unity Package File: [Warudo SDK 0.12.0.unitypackage](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0.unitypackage)
- Unity プロジェクト: [Warudo SDK 0.12.0 Modding Project.zip](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0%20Modding%20Project.zip)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
