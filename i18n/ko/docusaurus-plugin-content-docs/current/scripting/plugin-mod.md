---
sidebar_position: 100
---

# 플러그인 모드

플러그인 모드는 Warudo에 커스텀 에셋과 노드를 추가하는 유형의 [Warudo 모드](../modding/mod-sdk)에요.

:::tip
플러그인 모드를 만들어보려면 [당신의 첫 플러그인 모드를 만들어보세요](creating-your-first-plugin-mod) 튜토리얼을 참고하세요!
:::

:::info
이 페이지에서는 플러그인 모드를 만드는 일반적인 가이드를 다루고 있어요. 추가로 [플러그인](api/plugins) 스크립팅 API 페이지도 참고해 주세요.
:::

## 환경 설정

플러그인 모드는 `Plugin`을 상속하는 C# 스크립트가 포함된 일반적인 모드예요. [당신의 첫 모드를 만들어보세요](../modding/creating-your-first-mod)을 따라 새로운 모드를 만든 후, 모드 폴더에 C# 스크립트를 생성하고 `Plugin` 상속해 주세요. 커스텀 에셋이나 노드 타입이 있다면 `[PluginType]` 속성의 `AssetTypes` 및 `NodeTypes` 속성에 해당 타입들이 등록되었는지 확인해야 해요(자세한 내용은 [플러그인 API](api/plugins)를 참고해 주세요).

## Unity 에셋 포함하기

프리팹, 재질, 텍스처와 같은 Unity 에셋을 플러그인 모드에 포함하려면 에셋을 모드 폴더에 넣으면 돼요. Warudo는 모드를 익스포트할 때 이러한 에셋을 자동으로 포함해요.

:::caution
프리팹이나 재질에 커스텀 셰이더나 스크립트가 사용된 경우, 해당 셰이더나 스크립트도 모드 폴더에 포함해 주세요.
:::

런타임 중에 이러한 에셋을 스크립트에서 로드할 수 있어요. 자세한 내용은 [로딩 Unity 에셋](api/plugins#loading-unity-assets)을 참고해 주세요.

## 제한 사항 {#limitations}

플러그인 모드는 다음과 같은 제한이 있어요:

- 서드파티 DLLs이나 NuGet 패키지를 사용할 수 없어요.
- 어셈블리의 일부인 C# 스크립트를 익스포트할 수 없어요. 즉, 모드 폴더에 `.asmdef` 파일을 포함할 수 없어요.
- 리플렉션(`System.Reflection`)을 사용할 수 없고, 파일 시스템(`System.IO`)에 접근할 수 없어요.
  * `MonoBehaviour` 컴포넌트의 메서드를 호출하려면 Unity의 [`SendMessage`](https://docs.unity3d.com/ScriptReference/GameObject.SendMessage.html) 또는 [`BroadcastMessage`](https://docs.unity3d.com/ScriptReference/Component.BroadcastMessage.html) 메서드를 사용하는 것을 권장해요.
  * 데이터를 저장하고 불러오는 방법은 [데이터 저장 및 로딩](api/io)을 참고하세요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
  {name: 'Willycho', github: 'Willycho'},
],
}} />
