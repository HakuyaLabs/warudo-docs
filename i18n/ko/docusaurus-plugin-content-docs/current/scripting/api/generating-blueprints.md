---
sidebar_position: 130
---

# Blueprint 생성

Warudo에서 [추적](../../mocap/overview)을 설정할 때, 추적 blueprint가 생성되는 것을 볼 수 있을 거예요. Blueprint를 생성하는 것은 사용자에게 blueprint를 수정할 유연성을 제공하면서도, 모든 로직을 커스텀 에셋이나 플러그인에 하드코딩하지 않고 유용하게 사용할 수 있습니다.

## 코드 사용

Blueprint를 생성하는 권장 방법은 코드를 사용하는 것이에요. 이렇게 하면 노드를 조건부로 추가하거나 제거하는 등 생성 과정을 제어할 수 있고, 노드 타입을 올바르게 참조하는 것을 보장할 수 있습니다. 단점은 코드를 작성하는 것이 더 번거로울 수 있다는 점이에요.

다음은 두 개의 노드를 포함한 blueprint를 생성하는 최소한의 예제입니다: `On Update`와 `Show Toast`. `On Update` 노드는 `Show Toast` 노드에 연결되어 있어 매 프레임마다 토스트 메시지가 표시됩니다.

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
에디터는 모든 노드가 (0, 0) 위치에 있을 때 blueprint를 자동으로 포맷해 줍니다. 따라서 노드의 정확한 위치를 걱정할 필요는 없어요. 그래도 노드의 위치에 접근하고 싶다면, `node.GraphPosition`을 사용할 수 있습니다..
:::

:::info
모든 내장 노드 타입이 Warudo SDK에 포함된 것은 아닙니다. 플러그인 모드를 생성하고 SDK에 포함되지 않은 노드 타입을 참조하려면 `AddNode(string nodeTypeId)` 메서드를 사용해 타입 ID로 노드를 생성할 수 있습니다.
:::

## JSON 사용

더 간단하지만 비추천하는 방법은 에디터에 내장된 "Import Blueprint From JSON" 기능을 사용하는 것이에요. 에디터에서 blueprint를 생성한 다음, JSON으로 내보내고 플러그인에 저장한 후, `Service` 클래스를 사용해 JSON 파일을 blueprint로 가져올 수 있습니다.

```csharp
var fileContents = "..."; // Assume this is the JSON file contents
Context.Service.ImportGraph(fileContents); // Import the blueprint
Context.Service.BroadcastOpenedScene(); // Send the updated scene to the editor
```

그 후에는 이름을 통해 생성된 blueprint에 접근할 수 있습니다.

```csharp
var graph = Context.OpenedScene.GetGraphs().Values.First(it => it.Name == "My Awesome Blueprint");
```

이 방법은 다소 비효율적이고, 프로덕션 코드에 사용하기에는 적합하지 않아요. JSON 형식은 향후 버전에서 변경될 수 있고, 코드를 통해 blueprint를 생성하는 것만큼 유연하지 않기 때문입니다.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
