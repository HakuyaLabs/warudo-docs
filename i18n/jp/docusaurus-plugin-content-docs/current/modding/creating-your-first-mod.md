---
sidebar_position: 5
translate_from_version: 2024-06-14
---

# はじめての Mod を作成する

はじめての Mod を作成しましょう。このチュートリアルでは、シンプルな白いキューブの[道具Mod](prop-mod)を作成します。

:::info
始める前に、[Warudo SDK](mod-sdk.md)のセットアップが完了していることを確認してください。
:::

Unity の経験がない場合は、Unity エディターに慣れるために初心者向けチュートリアルをいくつか進めることをおすすめします。[Unity Learn](https://learn.unity.com/)はよい出発点です。

:::tip
初めて Mod を作るときは少し圧倒されるかもしれません。助けが必要な場合は、お気軽に [Discord](https://discord.gg/warudo) でご連絡ください！
:::

## チュートリアル

新しい Mod を作成するには、メニューバーから **Warudo → New Mod** を選択します。

![](/doc-img/en-mod-sdk-3.webp)

**Mod Name** に "WhiteCube" と入力し、"Create Mod!" をクリックします。

![](/doc-img/en-mod-1.png)

Assets フォルダの下に、作成した Mod 用のフォルダが生成されます。

![](/doc-img/en-mod-2.png)

Mod と同じ名前のこのフォルダを**Mod フォルダ**と呼びます。
:::tip
**Mod 用のすべてのアセット（例: プレハブ、シェーダー、マテリアル）とスクリプトは Mod フォルダに配置する必要があります。** Mod フォルダの外に置かれたものは Mod に含まれません。
:::

シーンにキューブを作成します。メニューバーで **GameObject → 3D Object → Cube** を選択します。

![](/doc-img/en-mod-3.png)

キューブを Mod としてエクスポートするには、Mod フォルダ内に プレハブ を作成する必要があります。シーンでキューブを選択し、Mod フォルダへドラッグして、青いキューブアイコンの プレハブ を作成します。

![](/doc-img/en-mod-4.png)

Warudo は作成する Mod の種類を知る必要があります。今回は道具Mod を作成するため、プレハブ の名前を "Prop" に変更します。プレハブ を右クリックして **Rename** を選択します。

![](/doc-img/en-mod-5.png)

もう少しで完了です。Mod をエクスポートする前に、Mod の設定が正しいことを確認しましょう。**Warudo → Mod Settings** を選択して Mod settings ウィンドウを開くと、Mod の名前、バージョン、作者、説明を設定できます。Warudo のプレビューギャラリーに表示する Mod アイコンも指定できます。

![](/doc-img/en-mod-6.png)

既定では **Mod Export Directory** は空です。この場合、Mod はプロジェクトのルートフォルダにエクスポートされます。対応する Warudo データフォルダに設定しておくと、エクスポート後すぐに Warudo で Mod をテストできて便利です。

Warudo で **Menu → Open Data Folder** を選択し、データフォルダを開きます。そのパスをコピーし、**Mod Export Directory** フィールドに貼り付けます。今回は道具Mod を作成するため、パスの末尾に `\Props` を追加します。たとえばデータフォルダが `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets` の場合、**Mod Export Directory** は `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Props` になります。

:::tip
同様に、キャラクターMod を作成する場合は **Mod Export Directory** を `Characters` データフォルダに設定します。
:::

最後に **Warudo → Build Mod** を選択して Mod をエクスポートします。エクスポート後、道具のデータフォルダに `WhiteCube.warudo` が表示されます。Warudo で道具アセットを作成し、**Source** ドロップダウンから "WhiteCube" を選択します。シーンに白いキューブが表示されたら成功です。はじめての Mod が完成しました！

![](/doc-img/en-mod-7.png)

ほかの Mod の作成手順も同様です。**Warudo → New Mod** で新しい Mod を作成し、アセットとスクリプトを Mod フォルダに入れ、**Warudo → Build Mod** でエクスポートします。各種類の Mod の詳細は、サイドバーの対応するセクションを参照してください。

## Mod の名前を付ける

新しい Mod を作成するときは、Mod の名前を指定する必要があります。Mod の名前は Warudo で Mod を識別するために重要です。"My Mod" や "Test Mod" のような一般的な名前は、ほかの人が Mod を見つけにくくなり、ほかの Mod と競合する可能性もあるため使用しないでください。

固有で内容を説明する名前を使用することをおすすめします。名前にはスペースを含められますが、特殊文字は使用できません。

:::caution
同じ名前の Mod は一度に 1 つしか読み込めません。別の Mod をエクスポートするために Mod フォルダを再利用しないよう注意してください！
:::

## ホットリロード

Warudo はホットリロードをサポートしています。つまり、Unity から既存の Mod ファイルを上書きする新しいバージョンをエクスポートすると、Warudo が自動的に Mod を再読み込みし、変更をシーンに反映します。たとえばキューブのマテリアルを赤に変更して再度 Mod をエクスポートすると、Warudo 上のキューブはすぐに赤くなります。

:::info
ホットリロードは常に期待どおりに機能するとは限りません。問題が発生した場合は、Warudo を再起動してください。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
