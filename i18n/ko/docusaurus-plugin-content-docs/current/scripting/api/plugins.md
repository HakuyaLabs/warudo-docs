---
sidebar_position: 50
---

# 플러그인

플러그인은 Warudo에서 모든 커스텀 스크립트의 상위 개념이에요. 또한 플러그인은 [리소스 프로바이더와 리졸버](resource-providers-and-resolvers)를 등록하거나, 외부 서비스와 인증을 처리하거나, 플러그인의 에셋과 노드의 전역 설정을 사용자가 구성할 수 있게 하는 등 씬과는 독립적인 작업을 수행하는 데 사용돼요.

:::tip
플러그인을 생성하지 않고도 [플레이그라운드](../playground)를 사용해 커스텀 에셋과 노드를 불러올 수 있으며, 이들은 Warudo의 "Core" 플러그인에 의해 자동으로 등록되고 관리돼요. 그러나 커스텀 에셋과 노드를 다른 사용자와 공유하려면 [플러그인 모드](../plugin-mod)를 만들어야 하며, 이 안에서 커스텀 에셋과 노드를 등록할 수 있는 자체 플러그인을 만들어야 해요.
:::

:::info
이 페이지에서는 플러그인을 만들기 위한 스크립팅 API에 대해 설명하고 있어요. [Plugin Mod](../plugin-mod) 페이지도 참조하세요.
:::

## 타입 정의

Warudo에서 로드되고 실행될 수 있는 플러그인 타입을 만들 수 있어요. 플러그인 타입은 `Plugin` 타입을 상속받으며, 아래와 같이 `[PluginType]` 속성으로 정의돼요:

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

파라미터 요약:

- **`Id`**: 플러그인 타입의 고유 식별자. 역 도메인 이름 표기법을 사용하는 것이 권장돼요 (예: `com.example.pluginname`). 플러그인 타입은 싱글톤이므로, 플러그인의 `Id` 속성(`plugin.Id`)과 플러그인 타입의 ID(`plugin.PluginType.Id`)는 동일해요.
- **`Name`**: 플러그인의 이름.
- **`Description`**: 플러그인에 대한 간단한 설명.
- **`Version`**: 플러그인의 버전. [Semantic Versioning](https://semver.org/) 표준을 따르는 것이 권장돼요.
- **`Author`**: 플러그인의 저자.
- **`Icon`**: 선택사항. 플러그인의 SVG 아이콘. `const string` 필드를 사용해 이 값을 저장하는 것이 권장돼요.
- **`SupportUrl`**: 선택사항. 플러그인의 지원 페이지 URL.
- **`AssetTypes`**: 이 플러그인에 포함된 에셋 타입의 배열.
- **`NodeTypes`**: 이 플러그인에 포함된 노드 타입의 배열.

:::tip
`icon`은 단일 SVG 요소여야 해요 (예: `<svg>...</svg>`). 예를 들면 다음과 같아요:
```html
<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 512 512">
    <path>...</path>
</svg>
```
:::

## 라이프사이클

플러그인은 [엔티티](entities#lifecycle) 페이지에서 설명한 라이프사이클 단계 외에도 추가적인 단계가 있어요:

- **`OneTimeSetup()`:** 플러그인의 데이터 파일이 `Plugins/Data`에 존재하는지에 따라, Warudo가 처음 플러그인을 로드할 때 한 번 호출돼요.
- **`OnSceneLoaded(Scene scene, SerializedScene serializedScene)`:** 씬이 로드된 후, 모든 에셋과 노드가 역직렬화된 후에 호출돼요.
- **`OnSceneUnloaded(Scene scene)`:** 씬이 언로드될 때 호출돼요.

## 컴포넌트

플러그인 타입은 데이터 인풋과 트리거를 정의할 수 있어요.

![](/doc-img/en-custom-plugin-1.png)

## 로딩 유니티 에셋 {#loading-unity-assets}

[당신의 첫 플러그인 모드를 만들어보세요](../creating-your-first-plugin-mod) 튜토리얼에서 설명한 것처럼, 플러그인의 모드 폴더에 있는 Unity 에셋을 `ModHost`를 사용해 로드할 수 있어요. 예를 들어, 프리팹을 로드하려면:

```csharp
var prefab = ModHost.LoadAsset<GameObject>("Assets/MyModFolder/MyPrefab.prefab");
```

텍스트 에셋(예: JSON 파일)을 로드하려면:

```csharp
var text = ModHost.LoadAsset<TextAsset>("Assets/MyModFolder/MyText.json");
```

:::tip
Warudo는 [uMod 2.0](https://trivialinteractive.co.uk/products.html)을 모딩 프레임워크로 사용해요. 에셋 로드에 대한 자세한 정보는 [ModHost documentation](https://trivialinteractive.co.uk/products/documentation/umod_20/scriptingreference/html/T_UMod_ModHost.htm)를 참조하세요.
:::

## 툴바 아이콘

일부 내장 플러그인이 툴바에 아이콘을 표시하는 것을 볼 수 있을 거예요. 게다가, 그 아이콘은 클릭할 수 있으며, 플러그인의 설정을 여는 데 사용할 수 있어요.

![](/doc-img/en-custom-plugin-2.png)

이를 구현하려면, 플러그인 클래스에 `ToolbarItemMixin` [mixin](mixins)를 포함하면 돼요:

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

## 노드 및 에셋에서 오너 플러그인 액세스

노드 및 에셋에서 `Plugin` 속성을 사용해 소유 플러그인에 접근할 수 있어요. 예를 들어:

```csharp
public override void OnCreate() {
    base.OnCreate();
    var myPlugin = (HelloWorldPlugin) Plugin;
    // Do something with myPlugin
}
```

## 플러그인 vs. 노드

Warudo에서 커스텀 스크립팅은 [blueprint 시스템](../../blueprints/overview.md)을 보완하는 방식으로 사용될 때 가장 효과적이에요. 만약 `Plugin` 클래스에 너무 많은 로직을 처리하고 있다면, 그 대신 커스텀 노드로 작성할 수 있는지 신중하게 고려해 보세요. 예를 들어, LAN에서 커스텀 UDP 패킷을 받을 때 폭죽 효과를 재생하는 아이디어가 있다면 `Plugin` 클래스가 두 가지를 모두 처리하기보다는, 커스텀 UDP 패킷이 수신되면 출력 플로우를 트리거하는 노드 하나와 입력 플로우가 수신되면 폭죽 효과를 재생하는 노드 하나를 구현하는 것이 더 좋고 유지보수하기도 쉬워요. 이는 또한 사용자가 blueprint에서 더 유연하게 커스텀 노드를 사용할 수 있도록 해줘요.

## 코드 예시

### 기본

- [Example plugin](https://gist.github.com/TigerHix/b78aabffc2d03346ff3da526706ce2ca)  
`Plugin` 클래스의 기본 사용법을 포함한 플러그인 템플릿 (단일 파일).

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)  
여러 파일로 구성된 완성된 플러그인 예시. **Stream Deck Plugin**과 **VMC Plugin**이 포함되어 있어요.
    - **Stream Deck Plugin**: WebSocket을 통해 외부 애플리케이션 (Warudo의 [Stream Deck plugin](https://apps.elgato.com/plugins/warudo.streamdeck))과 통신하는 플러그인. WebSocket 서비스 기반 클래스인 `WebSocketService`의 사용 예시를 보여줘요.
    - **VMC Plugin**: [VMC](https://protocol.vmc.info/english)를 지원하는 모션 캡처 방법으로 추가하는 플러그인으로 `FaceTrackingTemplate`와 `PoseTrackingTemplate`을 등록하는 방법을 보여줘요.

### 고급

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)  
모드 폴더에서 애니메이션 클립을 로드하고 이를 캐릭터 애니메이션으로 등록하는 커스텀 플러그인이에요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
