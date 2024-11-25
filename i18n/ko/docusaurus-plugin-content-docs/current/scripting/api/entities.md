---
sidebar_position: 2
---

# 엔티티

엔티티는 [씬](scene) 내에서 지속되는 오브젝트(예: 노드, 에셋) 또는 씬 간에 지속되는 오브젝트(예: 플러그인)를 의미해요. Warudo에서 스크립팅은 기본적으로 자신만의 엔티티 유형을 정의하고, Warudo 런타임과 상호작용하는 것을 말해요. Warudo에서 제공하는 기본 클래스를 상속받아 자신의 엔티티 유형을 정의할 수 있어요:

- **노드:** `Node`를 상속받아 새로운 노드 유형을 만들 수 있어요. 노드 유형은 데이터 인풋, 데이터 아웃풋, 플로우 인풋, 플로우 아웃풋, 트리거를 정의할 수 있어요. 노드는 노드 팔레트에서 blueprint 에디터로 드래그하여 인스턴스화되며, 노드 인스턴스는 blueprint와 함께 저장돼요.
- **에셋:** `Asset`을 상속받아 새로운 에셋 유형을 만들 수 있어요. 에셋 유형은 데이터 인풋과 트리거를 정의할 수 있어요. 에셋은 *Add Asset* 메뉴에서 인스턴스화되며, 에셋 인스턴스는 씬과 함께 저장돼요.
- **플러그인:** `Plugin`을 상속받아 새로운 플러그인 유형을 만들 수 있어요. 플러그인 유형은 데이터 인풋과 트리거를 정의할 수 있어요. 플러그인은 Warudo가 시작되거나 핫 리로딩될 때 로드돼요. 플러그인 유형당 인스턴스는 하나뿐이며, 데이터 인풋은 씬 간에도 저장돼요.
- **구조화된 데이터:** `StructuredData`를 상속받아 새로운 [구조화된 데이터](structured-data) 유형을 만들 수 있어요. 구조화된 데이터는 노드, 에셋, 또는 플러그인의 '내장된' 데이터 인풋으로 사용할 수 있는 복합 데이터 유형이에요.

:::info
[당신의 첫 스크립트를 만들어보세요](../creating-your-first-script.md) 튜토리얼에서, 우리는 `HelloWorldNode`라는 커스텀 노드 유형과 `CookieClickerAsset`이라는 커스텀 에셋 유형을 만들었어요..
:::

:::tip
엔티티 개념은 Unity의 MonoBehaviour와 유사하지만, 더 구조화된 방식이에요.
:::

엔티티가 인스턴스화되면, Warudo는 자동으로 UUID(고유 식별자)를 엔티티에 할당해요. 이 UUID는 `Id` 속성을 통해 접근할 수 있으며, 씬 내에서 엔티티를 식별하는 데 사용되고, 씬과 함께 저장돼요.

엔티티 유형에는 일반 C# 필드와 메서드를 포함할 수 있지만, Warudo 런타임과 인터페이스하려면 엔티티 내에서 [**포트와 트리거**](ports-and-triggers)를 만들어야 해요. 모든 엔티티는 [데이터 인풋 포트](ports-and-triggers#data-input-ports)와 [트리거](ports-and-triggers#triggers)를 가질 수 있으며, 노드는 추가로 [데이터 아웃풋 포트](ports-and-triggers#data-output-ports), [플로우 인풋 포트](ports-and-triggers#flow-input-ports) 그리고 [플로우 아웃풋 포트](ports-and-triggers#flow-output-ports)를 가질 수 있어요.

![](/doc-img/en-custom-node-1.png)

![](/doc-img/en-scripting-concepts-4.png)

## 라이프사이클 {#lifecycle}

엔티티는 여러 단계로 구성된 라이프사이클을 가지고 있어요:

- **`OnCreate()`:** 엔티티가 생성될 때 호출돼요. 이곳에서 인스턴스 필드를 초기화하거나, 이벤트를 구독하는 등의 작업을 해야 해요.
    - **에셋:** 사용자가 씬에 새로운 에셋을 추가하거나, 씬이 로드될 때 호출돼요.
    - **노드:** 사용자가 blueprint에 새로운 노드를 추가하거나, 씬이 로드될 때 호출돼요. 노드는 항상 에셋이 생성된 후에 생성돼요.
    - **플러그인:** Warudo가 시작되거나 핫 리로딩될 때 플러그인이 로드되면 호출돼요.
    - **구조화된 데이터:** 부모 엔티티가 생성될 때나 사용자가 구조화된 데이터 배열에 새 데이터를 추가할 때 호출돼요.
- **`OnDestroy()`:** 엔티티가 파괴될 때 호출돼요. 여기서 리소스를 해제하는 등의 작업을 해야 해요.
    - **에셋:** 사용자가 씬에서 에셋을 제거하거나 씬이 언로드될 때 호출돼요.
    - **노드:** 사용자가 blueprint에서 노드를 제거하거나 씬이 언로드될 때 호출돼요. 노드는 항상 에셋이 파괴된 후에 파괴돼요.
- **`Deserialize(TSerialized data)`:** 엔티티가 저장된 상태에서 역직렬화될 때 호출돼요. 예를 들어, 씬이 처음 열리고 로드될 때 에셋에서 이 메서드가 호출돼요. 보통 이 메서드를 오버라이드할 필요는 없어요.
- **`Serialize()`:** 엔티티가 저장 상태로 직렬화되어야 할 때 호출돼요. 예를 들어, 씬이 저장되거나 편집기로 보내져야 할 때 이 메서드가 호출돼요. 이 메서드 역시 보통 오버라이드할 필요는 없어요.

에셋, 노드, 플러그인은 추가적인 라이프사이클 단계를 가지고 있어요:

- **`OnUpdate()`:** 엔티티가 파괴되지 않은 동안 매 프레임마다 호출돼요. Unity의 `Update()` 메서드와 유사해요.
  - `OnPreUpdate()`와 `OnPostUpdate()`도 제공돼요. 각각 `OnUpdate()` 전에 또는 후에 호출돼요.
- **`OnLateUpdate()`:** 매 프레임의 `OnUpdate()`후에 호출돼요. Unity의 `LateUpdate()` 메서드와 유사해요.
- **`OnFixedUpdate()`:** 고정된 프레임마다 호출돼요. Unity의 `FixedUpdate()` 메서드와 유사해요.
- **`OnEndOfFrame()`:** 프레임이 끝날 때 호출돼요. Unity의 [`WaitForEndOfFrame` 코루틴](https://docs.unity3d.com/ScriptReference/WaitForEndOfFrame.html)과 유사해요.
- **`OnDrawGizmos()`:** 엔티티가 기즈모를 그려야 할 때 호출돼요. Unity의 `OnDrawGizmos()` 메서드와 유사해요.

:::info
업데이트 순서는 다음과 같아요: 플러그인 → 에셋 → 노드.
:::

이 라이프사이클 메서드를 오버라이드하여 엔티티의 사용자 정의 동작을 구현할 수 있어요. 예를 들어, 매 프레임마다 어떤 작업을 실행하려면 `OnUpdate()` 메서드를 오버라이드하면 돼요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
  {name: 'Willycho', github: 'Willycho'},
],
}} />
