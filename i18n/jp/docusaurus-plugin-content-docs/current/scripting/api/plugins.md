---
sidebar_position: 50
translate_from_version: 2024-06-16
---

# プラグイン

プラグインはWarudoのすべてのカスタムスクリプトの親です。また、[リソースプロバイダーとリゾルバー](resource-providers-and-resolvers)の登録、外部サービスでの認証、プラグインのアセットおよびノードに関するグローバル設定のユーザーによる構成を可能にするなど、シーンから独立したタスクの実行にも使用されます。

:::tip
[Playground](../playground)を使用すると、プラグインを作成せずにカスタムアセットとノードを読み込めます。これらはWarudoの「Core」プラグインによって自動的に登録・管理されます。ただし、カスタムアセットとノードを他のユーザーに配布するには、独自のプラグインがそれらを登録する[プラグインMod](../plugin-mod)を作成する必要があります。
:::

:::info
このページではプラグインを作成するためのスクリプティングAPIを説明します。[プラグインMod](../plugin-mod)ページも参照してください。
:::

## 型の定義

Warudoで読み込み・実行できるプラグイン型を作成できます。プラグイン型は`Plugin`型を継承し、次のように`[PluginType]`属性で装飾します。

```csharp
[PluginType(
    Id = "hakuyatira.helloworld",
    Name = "Hello World",
    Description = "A simple plugin that says hello to the world.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    Icon = null,
    SupportUrl = "https://docs.warudo.app",
    AssetTypes = new [] { typeof(HelloWorldAsset) },
    NodeTypes = new [] { typeof(HelloWorldNode) }
)]
public class HelloWorldPlugin : Plugin {
    // Plugin implementation
}
```

パラメーターの概要は次のとおりです。

- **`Id`**: プラグイン型の一意の識別子です。逆ドメイン名表記（例: `com.example.pluginname`）の使用をおすすめします。プラグイン型はシングルトンであるため、その`Id`プロパティ（`plugin.Id`）はプラグイン型のID（`plugin.PluginType.Id`）と同じです。
- **`Name`**: プラグインの名前です。
- **`Description`**: プラグインの簡単な説明です。
- **`Version`**: プラグインのバージョンです。[セマンティックバージョニング](https://semver.org/)標準に従うことをおすすめします。
- **`Author`**: プラグインの作者です。
- **`Icon`**: 任意。プラグインのSVGアイコンです。この値を格納する`const string`フィールドを定義することをおすすめします。
- **`SupportUrl`**: 任意。プラグインのサポートページのURLです。
- **`AssetTypes`**: このプラグイン内のアセット型の配列です。
- **`NodeTypes`**: このプラグイン内のノード型の配列です。

:::tip
`icon`は単一のSVG要素（例: `<svg>...</svg>`）である必要があります。例:
```html
<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 512 512">
    <path>...</path>
</svg>
```
:::

## ライフサイクル

[エンティティ](entities#lifecycle)ページに記載されたライフサイクル段階に加えて、プラグインには次の追加のライフサイクル段階があります。

- **`OneTimeSetup()`:** `Plugins/Data`内にプラグインのデータファイルが存在するかどうかで判定され、Warudoがプラグインを初めて読み込むときに1回だけ呼び出されます。
- **`OnSceneLoaded(Scene scene, SerializedScene serializedScene)`:** すべてのアセットとノードがデシリアライズされた後、シーンが読み込まれたときに呼び出されます。
- **`OnSceneUnloaded(Scene scene)`:** シーンがアンロードされたときに呼び出されます。

## コンポーネント

プラグイン型では、データ入力とトリガーを定義できます。

![](/doc-img/en-custom-plugin-1.png)

## Unityアセットの読み込み {#loading-unity-assets}

[初めてのプラグインModを作成する](../creating-your-first-plugin-mod)チュートリアルで示したように、`ModHost`を使用してプラグインのModフォルダー内のUnityアセットを読み込めます。たとえば、プレハブを読み込むには次のようにします。

```csharp
var prefab = ModHost.LoadAsset<GameObject>("Assets/MyModFolder/MyPrefab.prefab");
```

テキストアセット（例: JSONファイル）を読み込むには次のようにします。

```csharp
var text = ModHost.LoadAsset<TextAsset>("Assets/MyModFolder/MyText.json");
```

:::tip
Warudoは基盤となるModフレームワークとして[uMod 2.0](https://trivialinteractive.co.uk/products.html)を使用しています。アセットの読み込みについての詳細は、[ModHostドキュメント](https://trivialinteractive.co.uk/products/documentation/umod_20/scriptingreference/html/T_UMod_ModHost.htm)を参照してください。
:::

## ツールバーアイコン

一部の組み込みプラグインがツールバーにアイコンを表示していることに気付くかもしれません。さらに、アイコンはクリック可能で、プラグインの設定を開くために使用できます。

![](/doc-img/en-custom-plugin-2.png)

これを実現するには、プラグインクラスに`ToolbarItemMixin`[ミックスイン](mixins)を含めます。

```csharp
[Mixin]
public ToolbarItemMixin ToolbarItem;

private bool serverConnected; // Assume this is a field that indicates whether the plugin is connected to an external server

public override void OnCreate() {
    base.OnCreate();
    ToolbarItem.SetIcon(ToolbarIcon); // ToolbarIcon is a const string that contains a SVG icon
    ToolbarItem.OnTrigger = () => Context.Service.NavigateToPlugin(Type.Id); // Open the plugin settings when the icon is clicked
}

public override void OnUpdate() {
    base.OnUpdate();
    ToolbarItem.SetEnabled(serverConnected); // Only show the icon if connected to the server
    ToolbarItem.SetTooltip("Connected! Current time: " + DateTime.Now); // Set a tooltip that is displayed when the user hovers over the icon
}
```

## ノードとアセットから所有プラグインにアクセスする

ノードとアセットからは、`Plugin`プロパティを使用して所有プラグインにアクセスできます。例:

```csharp
public override void OnCreate() {
    base.OnCreate();
    var myPlugin = (HelloWorldPlugin) Plugin;
    // Do something with myPlugin
}
```

## プラグインとノード

Warudoでのカスタムスクリプティングは、[ブループリントシステム](../../blueprints/overview.md)を置き換えるのではなく、補完するときに最も効果を発揮します。多くの処理を担う巨大な`Plugin`クラスを書いている場合は、それをカスタムノードとして書けないか慎重に考えてください。たとえば、LAN経由でカスタムUDPパケットを受信したときに花火エフェクトを再生するというアイデアがある場合、両方を行う`Plugin`クラスにするよりも、カスタムUDPパケットを受信したときに出力フローをトリガーするノードと、入力フローを受信したときに直接花火エフェクトを再生するノードという2つのカスタムノードを実装するほうが、はるかに優れており（保守も容易です）。これにより、ユーザーはカスタムノードをブループリント内でより柔軟に使用できます。

## コード例

### 基本

- [Example plugin](https://gist.github.com/TigerHix/b78aabffc2d03346ff3da526706ce2ca)
`Plugin`クラスの基本的な使い方を含む、プラグイン（単一ファイル）のテンプレート。

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)
**Stream Deck Plugin**および**VMC Plugin**を含む、完全なプラグイン例（複数ファイル）。
    - **Stream Deck Plugin**: このプラグインは、WebSocket経由で外部アプリケーション（Warudoの[Stream Deckプラグイン](https://apps.elgato.com/plugins/warudo.streamdeck)）と通信します。WebSocketサービス基底クラス`WebSocketService`の使用例を示しています。
    - **VMC Plugin**: このプラグインは、`FaceTrackingTemplate`と`PoseTrackingTemplate`を登録することで、[VMC](https://protocol.vmc.info/english)をサポート対象のモーションキャプチャ方式として追加します。

### 高度

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)
ModフォルダーからAnimationClipを読み込み、それらをキャラクターアニメーションとして登録するカスタムプラグイン。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
