---
sidebar_position: 1
translate_from_version: 2024-11-22
---

# 初めてのスクリプトを作成する

Warudoでスクリプトを書く方法は、**Playground**を使用する方法とプラグインModを作成する方法の2つです。このチュートリアルでは、Playgroundを使用して初めてのカスタムノードを作成します！

:::tip
**Playgroundとは？** Playgroundは、カスタムノードやアセットを記述・テストできるサンドボックスだと考えてください。C#コードをコンパイル・パッケージ化する代わりに、Warudoのデータフォルダーにある`Playground`ディレクトリへ直接コードを記述できます。これにより、ModをビルドしたりWarudoを再起動したりすることなく、コードをすばやく反復・テストできます。
:::

それでは、さっそく始めましょう！

:::info
質問があれば、[Discordサーバー](https://discord.gg/warudo)の専用**#plugins-scripting**チャンネルでサポートを受けられます！
:::

## ステップ1: 環境設定

まず、[.NET 8 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/8.0)がインストールされていることを確認します。次に、[こちら](/scripts/Playground.csproj)から`.csproj`ファイルをダウンロードし、Warudoのデータフォルダー内にある`Playground`ディレクトリへ配置します（メニュー → データフォルダーを開く）。このファイルは、IDEでコード補完や構文ハイライトを利用するために役立ちます。

お好みのC# IDEを開きます。このチュートリアルでは[JetBrains Rider](https://www.jetbrains.com/rider/)を使用しますが、[Visual Studio Code](https://code.visualstudio.com/)などのほかのIDEでも問題ありません（Visual Studio Codeでは、[C#言語拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)のインストールが必要になる場合があります）。

IDEで`Playground`ディレクトリを開きます。ディレクトリ内に`HelloWorldNode.cs`というファイルを作成し、以下を貼り付けます。

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660", Title = "Hello World")]
public class HelloWorldNode : Node {

    [FlowInput]
    public Continuation Enter() {
        Context.Service.PromptMessage("Hello World!", "This node is working!");
        return Exit;
    }

    [FlowOutput]
    public Continuation Exit;

}
```

## ステップ2: カスタムノード

Warudoを開きます。起動時に、次のようなポップアップメッセージ（_トースト_と呼びます）が表示されます。

![](/doc-img/en-getting-started-playground-1.png)

これは`HelloWorldNode.cs`が正常にコンパイル・読み込みされたことを示しています。上記のコードではカスタムノードを定義しているため、メッセージには`Nodes: 1`と表示されます。

ブループリントタブに移動します。新しいブループリントを作成し、ノードパレットから`Hello World`ノードを見つけます。ドラッグして配置すると、次のように表示されます。

![](/doc-img/en-getting-started-playground-2.png)

`Enter`フロー入力をクリックすると、次のメッセージが表示されます。

![](/doc-img/en-getting-started-playground-3.png)

すべて動作していれば、おめでとうございます！初めてのWarudoノードを作成しました！

## ステップ3: ホットリロード

素晴らしい点の一つは、コードを変更するたびにWarudoを再起動する必要がないことです。実際、Warudoは`Playground`ディレクトリ内で行った変更を自動的に検出し、コードをホットリロードします！

動作を確認してみましょう。`HelloWorldNode.cs`に戻り、次の新しいコードを貼り付けます（タイピングの練習をしたい場合は、既存のコードを更新しても構いません）。

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660", Title = "Hello World")]
public class HelloWorldNode : Node {

    // New code below
    [DataInput]
    [IntegerSlider(1, 100)]
    public int LuckyNumber = 42;
    // New code above

    [FlowInput]
    public Continuation Enter() {
        // Changed code below
        Context.Service.PromptMessage("Hello World!", "This node is working! My lucky number: " + LuckyNumber);
        return Exit;
    }

    [FlowOutput]
    public Continuation Exit;

}
```

Ctrl+Sを押すとすぐに、ノードが正常にコンパイル・ホットリロードされたことを示す別のトーストメッセージが表示されます。ブループリント内のノードもそれに応じて更新されます。

![](/doc-img/en-getting-started-playground-4.png)

ラッキーナンバーを設定して、ノードが引き続き動作することを確認してください！

![](/doc-img/en-getting-started-playground-5.png)

## ステップ4: カスタムアセット

Warudoは新しい`.cs`ファイルも検出できます。今度はカスタムアセットを作成してみましょう。`Playground`ディレクトリに`CookieClickerAsset.cs`というファイルを作成し、以下のコードを貼り付けます。

```csharp
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;

[AssetType(Id = "82ae6c21-e202-4e0e-9183-318e2e607672", Title = "Cookie Clicker")]
public class CookieClickerAsset : Asset {

    [Markdown]
    public string Status = "You don't have any cookies.";

    [DataInput]
    [IntegerSlider(1, 10)]
    [Description("Increase me to get more cookies each time!")]
    public int Multiplier = 1;

    private int count;

    [Trigger]
    public void GimmeCookie() {
        count += Multiplier;
        SetDataInput(nameof(Status), "You have " + count + " cookie(s).", broadcast: true);
    }

    protected override void OnCreate() {
        base.OnCreate();
        SetActive(true);
    }

}
```

カスタムノード1つ（`HelloWorldNode.cs`）とカスタムアセット1つ（`CookieClickerAsset.cs`）が読み込まれたことを示すトーストメッセージが表示されます。

![](/doc-img/en-getting-started-playground-6.png)

新しいアセットは**Add Asset**メニューから見つけられます。

![](/doc-img/en-getting-started-playground-7.png)

シーンに追加して楽しんでください！これなら一日中遊んでいられるのに、誰がVTubingなんて必要とするでしょう？

![](/doc-img/en-getting-started-playground-8.png)

## まとめ

この短いチュートリアルでは、Playgroundの使い方を学び、カスタムノードとアセットの仕組みを少しだけ見てきました。次のチュートリアルでは、作成したカスタムノードとアセットを配布するためのプラグインModの作成方法を見ていきます！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
