---
sidebar_position: 0
---

# 概要

![](/doc-img/mod-cover.jpg)

Warudoは、以下のような独自の3Dアセットをインポートできる完全なModシステムを提供します。

* [キャラクター](character-mod)
* [キャラクターアニメーション](character-animation-mod)
* [道具](prop-mod)
* [パーティクル](particle-mod)
* [環境](environment-mod)

WarudoのModは、 **Warudo SDK**を使用して作成されます。SDKとは基本的に「Modの作成を助けるツールセット」のことを指しますが、WarudoではUnityプロジェクトを提供しています！Wrudo SDKによってエクスポートされたModファイルには `.warudo` 拡張子が付いており、対応するデータフォルダに配置するとWarudoに認識されます。Modファイルを他の人と直接共有することもできますし、**[ディスカバー]** タブから[Steamワークショップ](https://steamcommunity.com/app/2079120/workshop/)にアップロードすることもできます。

![](/doc-img/jp-mod-8.png)
<p class="img-desc">ディスカバータブでModの閲覧、アップロードができます。</p>

## SDKのセットアップ {#setup-the-sdk}

SDKをセットアップするには、まずUnityを正しくセットアップする必要があります。
詳しい手順については、[Unity & Warudo SDKのインストール](sdk-installation)をご覧ください。

## カスタムシェーダー {#custom-shaders}

[lilToon](https://lilxyzw.github.io/lilToon/#/)や[Poiyomi Shader](https://www.poiyomi.com/)など、UnityのBuilt-in Render Pipelineと互換性のある任意のシェーダーを使用できます。
[Warudo Pro](../pro.md)では、URP互換シェーダーを使用できるようにする[Universal Render Pipeline（URP）](https://docs.unity3d.com/Manual/com.unity.render-pipelines.universal.html)もサポートしています。

## カスタム C# スクリプト {#custom-scripts}

WarudoのModがユニークなのは、[C#のMonoBehaviourスクリプト](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html)を含めることができる点です。これにより、Modにインタラクティブな要素を追加できます。たとえば、キャラクターModにスクリプトを追加してキャラクターの耳をアニメーションさせたり、環境Modにスクリプトを追加して照明を制御したりすることができます。Warudoの組み込みコンポーネントと連携するには、[スクリプト](../scripting/overview)セクションを参照してください。

Modフォルダに配置されたC#スクリプトはコンパイルされ、Modに含まれます。これらのスクリプトを通常のUnityプロジェクトと同様にキャラクター、道具、または環境にアタッチすることができます。

ただし、以下の制限事項に注意してください：

* [Assembly definition (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html) は現在サポートされていません。Assembly definitionの対象となるC#スクリプトは、modにパッケージ化されません。
* [ScriptableObjects](https://docs.unity3d.com/ScriptReference/ScriptableObject.html)は現在サポートされていません。
* コンパイル済みDLLは現在サポートされていません。含めることができるのは`.cs`ソースファイルのみです。
* `UnityEditor` 名前空間を参照するスクリプトはサポートされていません。

Modにスクリプトを含める場合は Mod SettingsウィンドウでLog Levelを **[All]** に設定し **[Clear Console On Build]** のチェックを外すことをおすすめします。のチェックを外すことをおすすめします。

![](/doc-img/en-mod-13.png)

この設定により、Modのビルド時により多くの情報が提供され、コンソールでエラーを確認することができます。スクリプトがModフォルダに配置されているにもかかわらず、ビルドログにスクリプトが見つからないためコンパイルがスキップされた旨のメッセージが表示される場合、プロジェクトで`.csproj`ファイルが正しく生成されていない可能性があります。

**[Edit] → [Preferences] → [External Tools]** をクリックし、 **[Regenerate project files]** をクリックする必要があります。

![](/doc-img/en-mod-12.png)

その後、改めてModのビルドを試みてください。

## Modプロジェクトのバックアップ

定期的にModプロジェクトのバックアップを作成するか、  [Unity Version Control](https://unity.com/solutions/version-control)を使用することをおすすめします。特に、定期的にModモジュールを作成している場合、`Asset/Packages/UMod/ExportSettings.asset` ファイルをバックアップすべきです（Unityエディタには表示されないファイルです）。このファイルには、Modのエクスポート設定（エクスポートフォルダやModアイコンなど）が保存されます。このファイルを失うと、すべてのModモジュールを手動で再度作成する必要があります。

:::caution
一部のユーザーから、Modをエクスポートした後にエクスポート設定が失われているという報告を受けています。現在調査中ですので、それまでの間、`ExportSettings.asset`ファイルを定期的にバックアップすることをおすすめします。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
