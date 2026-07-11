---
sidebar_position: 130
translate_from_version: 2024-06-16
---

# ブループリントの生成

Warudoで[トラッキングを設定](../../mocap/overview)すると、トラッキング用ブループリントが生成されていることに気付くでしょう。カスタムアセットやプラグインにロジック全体をハードコードするのではなく、ユーザーがブループリントを変更できる柔軟性を残したい場合、ブループリントの生成は特に便利です。

## コードによる生成

ブループリントを生成する推奨方法はコードを使用することです。これにより生成処理を制御でき（例: 条件に応じてノードを追加・削除する）、ノード型を正しく参照していることも保証されます。欠点は、記述量が多くなることです。

次は、`On Update`と`Show Toast`という2つのノードを含むブループリントを生成する最小限の例です。`On Update`ノードを`Show Toast`ノードに接続し、毎フレームトーストメッセージが表示されるようにします。

```csharp
var graph = new Graph {
    Name = "My Awesome Blueprint",
    Enabled = true // Enable the blueprint by default
};

// Add two nodes: On Update and Show Toast
var onUpdateNode = graph.AddNode<OnUpdateNode>();
var toastNode = graph.AddNode<ShowToastNode>();
toastNode.Header = "Hey!";
toastNode.Caption = "This is a toast message!";

// Connect the nodes so that the toast is shown each frame
graph.AddFlowConnection(onUpdateNode, nameof(onUpdateNode.Exit), toastNode, nameof(toastNode.Enter));

// Add the graph to the opened scene
Context.OpenedScene.AddGraph(graph);

// Send the updated scene to the editor
Context.Service.BroadcastOpenedScene();
```

:::tip
すべてのノードが座標(0, 0)にある場合、エディターはブループリントを自動的に整列します。そのため、ノードを正しく配置する必要はありません。ノードの位置には、引き続き`node.GraphPosition`でアクセスできます。
:::

:::info
組み込みノード型のすべてがWarudo SDKに含まれているわけではありません。プラグインModを作成しており、SDKに含まれていないノード型を参照したい場合は、オーバーロードされた`AddNode(string nodeTypeId)`メソッドを使用して、型IDでノードを作成できます。
:::

## JSONによる生成

より簡単な（ただし応急的な）ブループリント生成方法は、エディターに組み込まれている「Import Blueprint From JSON」機能を使うことです。エディターでブループリントを作成してJSONとしてエクスポートし、プラグインに格納できます。その後、`Service`クラスを使用してJSONファイルをブループリントとしてインポートします。

```csharp
var fileContents = "..."; // Assume this is the JSON file contents
Context.Service.ImportGraph(fileContents); // Import the blueprint
Context.Service.BroadcastOpenedScene(); // Send the updated scene to the editor
```

その後、名前で生成されたブループリントにアクセスできます。

```csharp
var graph = Context.OpenedScene.GetGraphs().Values.First(it => it.Name == "My Awesome Blueprint");
```

この方法はかなり応急的であり、本番コードには推奨されません。JSON形式は将来のバージョンで変更される可能性があり、コードでブループリントを生成する方法ほど柔軟ではありません。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
