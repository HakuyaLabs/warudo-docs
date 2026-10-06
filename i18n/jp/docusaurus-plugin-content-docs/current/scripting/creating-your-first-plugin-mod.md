---
sidebar_position: 2
translate_from_version: 2024-06-16
---

# 初めてのプラグインModを作成する

前回のチュートリアルでは、[Playground](playground)を使用してカスタムノードとカスタムアセットを読み込みました。ただし、これには制限があります。Unityアセットを参照できないため、たとえばカスタムUnityパーティクルプレハブを生成するノードを作りたい場合、Playgroundでは実現できません。

このチュートリアルでは、[Warudo SDK](../modding/mod-sdk)を使用して、先ほど作成した`HelloWorldNode`と`CookieClickerAsset`を含むプラグインModをビルドします。プラグインModを使用するとUnityアセットの保存・参照ができるだけでなく、カスタムノードとアセットをほかのユーザーに配布できます。

## ステップ1: Warudo SDKプロジェクトを作成する

まだ作成していない場合は、[Warudo SDKのインストール](../modding/sdk-installation)ガイドに従って新しいWarudo SDKプロジェクトを作成してください。まずWarudo SDKに慣れるため、[初めてのModを作成する](../modding/creating-your-first-mod)チュートリアルも実施することをおすすめします。

:::tip
プラグインModのビルドは、ほかの種類のModのビルドと非常によく似ています！唯一の違いは、以下で説明するように、プラグインModには`Plugin`を継承するC#スクリプトが必要なことです。
:::

## ステップ2: 新しいModを作成する

新しいModを作成するには、メニューバーから**Warudo → New Mod**を選択します。

![](/doc-img/en-mod-sdk-3.webp)

**Mod Name**に「HelloWorldPlugin」と入力し、「Create Mod!」をクリックします。

![](/doc-img/en-plugin-mod-1.png)

Assetsフォルダーの下に、Mod用のフォルダーが作成されます。

## ステップ3: プラグインスクリプトを作成する

「HelloWorldPlugin」Modフォルダー内で右クリックし、`HelloWorldPlugin.cs`という新しいC#スクリプトを作成します。スクリプトに次のコードを貼り付けます。

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;

[PluginType(
    Id = "hakuyatira.helloworld",
    Name = "Hello World",
    Description = "A simple plugin that says hello to the world.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    SupportUrl = "https://docs.warudo.app",
    AssetTypes = new [] { typeof(CookieClickerAsset) },
    NodeTypes = new [] { typeof(HelloWorldNode) })]
public class HelloWorldPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Debug.Log("The Hello World plugin is officially enabled! Hooray!");
    }

}
```

[前回のチュートリアル](creating-your-first-script)の`HelloWorldNode.cs`ファイルと`CookieClickerAsset.cs`ファイルを、「HelloWorldPlugin」Modフォルダーにコピーします。

Modフォルダーは次のようになります。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-plugin-mod-2.png" />
</div>
</div>

## ステップ4: プラグインModをエクスポートする

もう少しで完了です！Modをエクスポートする前に、**Warudo → Mod Settings**でModの設定が正しいか確認できます。Modの名前、バージョン、作成者、説明を設定できます。これらは`[PluginType]`のパラメーターと同じにする必要があります。

デフォルトでは**Mod Export Directory**は空欄で、この場合Modはプロジェクトのルートフォルダーにエクスポートされます。代わりに、Warudoのデータフォルダーにある`Plugins`ディレクトリ、たとえば`C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Plugins`を設定できます。

:::warning
エクスポートする前にWarudoを閉じ、`Playground`ディレクトリから`HelloWorldNode.cs`と`CookieClickerAsset.cs`を削除してください。これはPlaygroundとプラグインModの競合を防ぐためです。
:::

**Warudo → Export Mod**を選択してプラグインModをエクスポートします。すべて問題なく進めば、コンソールに`BUILD SUCCEEDED!`メッセージが表示されます。

![](/doc-img/en-plugin-mod-4.png)

Modフォルダー内のスクリプトが実際にプラグインModへコンパイルされていることを確認するため、簡単な動作確認を行うとよいでしょう。コンソールを上へスクロールすると、次の行が見つかります。

![](/doc-img/en-plugin-mod-5.png)

:::warning
この行が表示されない場合、UnityプロジェクトがC#スクリプティング用に正しく設定されていない可能性があります。[このセクション](../modding/mod-sdk#custom-scripts)の手順に従い、プラグインModをもう一度エクスポートしてください。
:::

エクスポートされた`HelloWorldPlugin.warudo`フォルダーが、Warudoのデータフォルダー内の`Plugins`ディレクトリにあることを確認します。Warudoを開き、AboutダイアログでプラグインModが読み込まれているか確認できます。

![](/doc-img/en-plugin-mod-3.png)

もちろん、Cookie Clickerアセットは**Add Asset**メニューに、Hello Worldノードはノードパレットに表示されます。

![](/doc-img/en-getting-started-playground-7.png)

![](/doc-img/en-getting-started-playground-2.png)

Voilà！Warudoで初めてのプラグインModが完成しました！

## ステップ5: Unityアセットを読み込む

プラグインModができたので、カスタムUnityアセットをWarudoに読み込めます！`CookieClickerAsset`スクリプトでUnityアセットを読み込んでみましょう。

Unity Asset Storeから[Cartoon FX Remaster Free](https://assetstore.unity.com/packages/vfx/particles/cartoon-fx-remaster-free-109565)をダウンロードします。パッケージをUnityプロジェクトにインポートします。次に、パッケージからパーティクルプレハブを選択し、**Ctrl**を押しながら「HelloWorldPlugin」フォルダーへドラッグします。この例では「CFXR Explosion 1」プレハブを使用します。

![](/doc-img/en-plugin-mod-6.png)

プレハブの名前を`Particle`に変更します。Modフォルダーは次のようになります。

![](/doc-img/en-plugin-mod-7.png)

`CookieClickerAsset.cs`スクリプトを開き、以下の内容に置き換えます。

```csharp
using System;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;
using Object = UnityEngine.Object;
using Random = UnityEngine.Random;

[AssetType(Id = "82ae6c21-e202-4e0e-9183-318e2e607672", Title = "Cookie Clicker")]
public class CookieClickerAsset : Asset {

    [Markdown]
    public string Status = "You don't have any cookies.";

    [DataInput]
    [IntegerSlider(1, 10)]
    [Description("Increase me to get more cookies each time!")]
    public int Multiplier = 1;

    private int count;
    private GameObject particlePrefab; // New field to store the particle prefab

    [Trigger]
    public async void GimmeCookie() { // Note the async keyword
        count += Multiplier;
        SetDataInput(nameof(Status), "You have " + count + " cookie(s).", broadcast: true);

        // Spawn the particle prefab Multiplier times
        for (var i = 0; i < Multiplier; i++) {
            var particle = Object.Instantiate(particlePrefab, Random.insideUnitSphere * 2f, Quaternion.identity);
            particle.SetActive(true);
            Object.Destroy(particle, 3f); // Automatically destroy the cloned particle after 3 seconds

            await UniTask.Delay(TimeSpan.FromSeconds(0.2f)); // Delay 0.2 seconds before spawning the next particle
        }
    }

    protected override void OnCreate() {
        base.OnCreate();
        SetActive(true);

        // Load the particle prefab from the mod folder. Change this path if your prefab is in a different folder
        particlePrefab = Plugin.ModHost.Assets.Instantiate<GameObject>("Assets/HelloWorldPlugin/Particle.prefab");
        // Disable it so that it doesn't show up in the scene
        particlePrefab.SetActive(false);
    }

}
```

Modをもう一度エクスポートします。Warudoはプラグインのホットリロードに対応しているため、Modを`Plugins`フォルダーにエクスポートするだけで、Warudo上ですぐに変更を確認できます！

Cookie Clickerアセットの「Gimme Cookie」ボタンを押すと、シーン内にパーティクルプレハブが生成されます。

![](/doc-img/en-plugin-mod-8.png)

:::info
Warudo Proユーザーは、パーティクルエフェクトを表示するために組み込みレンダリングパイプラインへ切り替えてください。代わりにURP対応のパーティクルアセットを使用することもできます。
:::

Warudoでこんなことまでできるなんて、すごいと思いませんか？

## Playgroundとの比較

プラグインModの作成は[Playground](playground)の使用より強力ですが、欠点もあります。

* 変更するたびにModをエクスポートする必要があるため、プラグインModの開発はかなり遅くなる場合があります。
* 現在、PlaygroundではMessagePack、WebSocketSharpなど、Warudoが使用するより多くのライブラリにアクセスできます（プラグインModについては改善を進めています）。
* プラグインModにはより多くの[セキュリティ上の制限](plugin-mod#limitations)があります。たとえば、`System.IO`名前空間にはアクセスできません（ただし、[サンドボックス化されたファイル永続化API](api/io)を提供しています）。

プラグインModとPlaygroundのどちらを使用するかは、ユースケースによって決まります。新機能のプロトタイプ作成や新しいアイデアのテストを行う場合、特にUnityアセットを参照する必要がなければ、Playgroundはすばやく反復し結果を確認できる優れたツールです。VTuber向けのカスタム開発を行う場合、Playgroundはクライアント向けの小規模で自己完結した機能を実装するのに最適です。一方、カスタムUnityアセットを読み込む必要がある場合や、[Steam Workshop](../modding/sharing)でカスタムノードやアセットを配布する場合は、プラグインModを使用してください。（プラグインModへ移行する前に、Playgroundでカスタムノードとアセットのプロトタイプを作成することもできます！）

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
