---
sidebar_position: 200
translate_from_version: 2024-06-17
---

# リソースプロバイダーとリゾルバー

Warudoにおけるリソースとは、アセットやノードで使用できる外部データのことです。たとえば、キャラクターリソースは`Characters`ディレクトリにある`.vrm`および`.warudo`ファイルです。キャラクターアニメーションリソースは、Warudoが提供する500以上の組み込みアニメーションに加え、`CharacterAnimations`ディレクトリにある任意のカスタム[キャラクターアニメーションMOD](../../modding/character-animation-mod)です。[スクリーン](../../assets/screen)の画像リソースは`Images`ディレクトリにある画像ファイルです。ほかにもさまざまなリソースがあります。

## 概要

内部的には、各リソースは`character://data/Characters/MyModel.vrm`や`character-animation://resources/Animations/AGIA/01_Idles/AGIA_Idle_generic_01`のような**リソースURI**によって一意に識別されます。

キャラクターアセットの`Source`ドロップダウンなど、リソースのドロップダウンを開くと、そのドロップダウンは**リソースプロバイダー**に問い合わせて互換性のあるリソースURIの一覧を取得します。キャラクターアセットの場合、2つのリソースプロバイダーが結果を返します。1つは`Characters`ディレクトリ内のファイルを探すもので、もう1つはSteamワークショップからインストールされたキャラクターMODを探すものです。

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '75%'}}>
![](/doc-img/en-resource-providers-1.png)
</div>
</div>

リソースURIを選択すると、Warudoは対応する**リソースURIリゾルバー**を呼び出してリソースデータを読み込みます。たとえば、`.vrm`ファイルと`.warudo`ファイルは異なるリゾルバーで読み込めますが、どちらのリゾルバーも`GameObject`（Unityシーンに読み込まれるキャラクター）を返すため、キャラクターアセットは同じ方法で扱えます。

リソースプロバイダーとリゾルバーは、[プラグイン](plugins)によって登録する必要があることに注意してください。

## プロバイダー

キューブと球体だけを小道具リソースとして提供するカスタムリソースプロバイダーを登録する、簡単なプラグインの例を見ていきましょう。

```csharp
using System;
using System.Collections.Generic;
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Core.Resource;

[PluginType(
    Id = "hakuyatira.primitiveprops",
    Name = "Primitive Props",
    Description = "A simple plugin that registers primitive props.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    SupportUrl = "https://docs.warudo.app")]
public class PrimitivePropsPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Context.ResourceManager.RegisterProvider(new PrimitivePropResourceProvider(), this);
    }

}

public class PrimitivePropResourceProvider : IResourceProvider {
    public string ResourceProviderName => "Primitives"; // The name of your provider

    public List<Resource> ProvideResources(string query) {
        if (query != "Prop") return null; // If the query is not "Prop", we don't have any compatible resources
        return new List<Resource> {
            new Resource {
                category = "Primitives", // Category that will be shown in the dropdown
                label = "Cube", // Label that will be shown in the dropdown
                uri = new Uri("prop://primitives/cube") // Underlying resource URI
            },
            new Resource {
                category = "Primitives",
                label = "Sphere",
                uri = new Uri("prop://primitives/sphere")
            }
        };
    }
}
```

上の例では、キューブと球体という2つの小道具リソースを提供するカスタムリソースプロバイダーを登録しています。`ProvideResources`メソッドがクエリが`"Prop"`の場合にのみリソース一覧を返すことに注意してください。これは、小道具アセットが次のように`"Prop"`クエリで小道具リソースを問い合わせるためです。

```csharp
// In the prop asset class
[AutoCompleteResource("Prop")]
public string Source;
```

:::tip
組み込みアセットで使用されるクエリの一覧は、[組み込みリソース型](#built-in-resource-types)セクションにあります。
:::

:::tip
小道具リソースには`prop://`スキームを使用するという慣例があるため、URIを`prop://primitives/cube`のように記述しています。ただし、特にリソースURI用のカスタムリゾルバーを作成する場合は、必ずしも従う必要はありません。
:::

プラグインが読み込まれたら、小道具アセットの`Source`ドロップダウンを開くと、カスタムリソースプロバイダーが提供した2つのリソースを確認できるはずです。

![](/doc-img/en-resource-providers-2.png)

それらを選択すると、対応するリソースURIリゾルバーが呼び出され、小道具データが読み込まれます。しかし、URIを解決する方法はまだ誰にも分かりません。URI用のリゾルバーを作成しましょう。

## URIリゾルバー

次のクラスをプラグインに追加します。

```csharp
public class PrimitivePropResourceUriResolver : IResourceUriResolver {
    public object Resolve(Uri uri) {
        if (uri.Scheme != "prop" || uri.Authority != "primitives") return null;
        var path = uri.LocalPath.TrimStart('/');

        return path switch {
            "cube" => GameObject.CreatePrimitive(PrimitiveType.Cube),
            "sphere" => GameObject.CreatePrimitive(PrimitiveType.Sphere),
            _ => throw new Exception("Unknown primitive prop: " + path)
        };
    }
}
```

最初の2行では、URIがカスタム形式、つまり`prop://primitives/xxx`に一致するかを確認します。一致する場合は、URIの最後の部分（`path`）を抽出し、それに応じてキューブまたは球体を作成します。小道具アセットが小道具リソースを選択したときに期待する型であるため、`GameObject`を直接返します。

:::tip
返されるオブジェクトの型は、リソースを使用するアセットと互換性がなければなりません。たとえば、キャラクターアセットはキャラクターリソースを選択したときに`GameObject`を期待し、スクリーンアセットは画像リソースを選択したときに`ImageResource`を期待します。内部アセットの期待する型の一覧は、[組み込みリソース型](#built-in-resource-types)セクションにあります。
:::

次に、プラグインの`OnCreate`メソッドでリゾルバーを登録します。

```csharp
Context.ResourceManager.RegisterUriResolver(new PrimitivePropResourceUriResolver(), this);
```

プラグインが再読み込みされると、小道具アセットでキューブまたは球体を選択したときに、WarudoがUnityシーン内にキューブまたは球体を作成します。

## Modコレクション

リソースプロバイダーとリゾルバーの一般的な用途は、Modのコレクションを提供することです。たとえば、Unityに100個の小道具プレハブがあり、それらをWarudoで使用したい場合、100個の[小道具Mod](../../modding/prop-mod)を`Props`ディレクトリにエクスポートする代わりに、カスタムリソースプロバイダーとリゾルバーを作成して、プラグインのModフォルダーからプレハブを直接読み込めます（[Unityアセットを読み込む](plugins#loading-unity-assets)を参照）。この方法には、ユーザーがドロップダウン内であなたのリソースをすべて同じカテゴリーにまとめて表示できるという利点もあります。

:::tip
Modコレクションプラグインを作成する際のベストプラクティスについては、[Katana Animations](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)のサンプルプラグインを参照してください。
:::

## カスタムリソース型

リソースは汎用的に設計されているため、任意の型のデータに使用できます。たとえば、ユーザーがエモートを生成できるプラグインを作成する場合、`Emote`というカスタムリソース型を作成できます。

```csharp
[AutoCompleteResource("Emote")]
public string Emote; // This will be used by the user to select the emote URI
```

次に、クエリが`"Emote"`のときにエモートURI（例: `emote://xxx/yyy`）の一覧を提供するカスタムリソースプロバイダーと、URIスキームがカスタムスキームに一致したときにエモートデータを読み込むカスタムリソースURIリゾルバーを作成します。

## 組み込みリソース型 {#built-in-resource-types}

組み込みアセットで使用される組み込みリソース型の一覧です。

| クエリ              | 例                               | 期待する型                                    |
|--------------------|------------------------------------------|--------------------------------------------|
| `"Character"`          | キャラクター                                | `GameObject `                                |
| `"CharacterAnimation"` | キャラクター、キャラクターアイドルアニメーションを再生 | `AnimationClip`                              |
| `"Environment"`        | 環境                              | `Scene` または `ValueTuple<ModHost, Scene>`       |
| `"Image"`              | スクリーン                                   | `Warudo.Plugins.Core.Utils.ImageResource`    |
| `"Music"`              | ミュージックプレイヤー                             | `string`（絶対ファイルパス）                |
| `"Particle"`           | キャラクターに小道具を投げる                  | `GameObject`                                 |
| `"Prop"`               | 小道具                                     | `GameObject`                                 |
| `"Sound"`              | サウンドを再生、キャラクターに小道具を投げる      | `AudioClip`                                  |
| `"Video"`              | スクリーン                                   | `string`（絶対ファイルパス）                |

## サムネイルリゾルバー

リソースのドロップダウンに`[PreviewGallery]`属性が付いている場合、ユーザーは「Preview Gallery」ボタンをクリックしてリソースのサムネイルグリッドを表示できます。これは、リソースが画像、小道具、ポーズ、その他の視覚データである場合に便利です。

サムネイルを提供するには、サムネイル画像データの`byte[]`を非同期に返す`IResourceUriThumbnailResolver`インターフェースを実装する必要があります。次に、プラグインの`OnCreate`メソッドでリゾルバーを登録します。

```csharp
Context.ResourceManager.RegisterUriThumbnailResolver(new MyUriThumbnailResolver(), this);
```

:::tip
快適に使用できるよう、サムネイル画像は50ms以内に読み込めるようにしてください。
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
