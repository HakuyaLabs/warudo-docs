---
sidebar_position: 10
---

# 의상 및 액세서리 토글

캐릭터 모델은 종종 다양한 의상과 액세서리를 위한 여러 메쉬를 가지고 있어요. 이 튜토리얼에서는 단축키를 사용하여 이러한 메쉬를 켜고 끄는 방법을 보여드릴게요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/toggle-meshes.mp4" /></div>
<p class="img-desc">단축키로 캐릭터 메쉬 토글링.</p>

## 메쉬 토글링

더 이상 지체하지 말고 시작해볼까요! 먼저, 새로운 blueprint를 생성해요. [당신의 첫 Blueprint를 만들어보세요!](../understanding-blueprints.md) 튜토리얼과 마찬가지로, **On Keystroke Pressed** 노드를 추가해야 해요. 저는 단축키를 **Ctrl+Shift+J** (J는 "jacket"을 의미)로 설정할 것이지만, 원하는 키를 사용할 수 있어요.

![](/doc-img/en-blueprint-toggle-meshes-1.png)

이제 **Toggle Character Meshes** 노드를 추가해야 해요——이름에서 이미 많은 것을 설명해주고 있죠? 이를 blueprint에 추가하고, 노드를 다음과 같이 연결하세요:

![](/doc-img/en-blueprint-toggle-meshes-2.png)

**Character** 드롭다운에서 캐릭터를 선택하세요. 그런 다음, **+** 버튼을 클릭하여 **Meshes** 목록에 새 항목을 추가하고, 토글할 메쉬를 선택하세요. 이번 예시에서는 캐릭터의 재킷을 토글하려고 하니 "jacket" 메쉬를 선택해요. 이 목록에 원하는 만큼 메쉬를 추가할 수 있어요.

:::info
[VRoid Studio](https://vroid.com/en/studio)에서 내보낸 모델은 `Body`와 `Face` 두 개의 메쉬만 있다는 점을 유의하세요. 더 디테일한 모델은 캐릭터의 옷, 액세서리, 꼬리, 동물 귀 등을 개별 메쉬로 나누는 경우가 많아요. 만약 토글할 의상이나 액세서리가 없다면, 이 튜토리얼을 건너뛰거나 재미삼아 전체 바디 메쉬를 토글해도 돼요!
:::

이제 끝났어요! **Ctrl+Shift+J**를 누르면 캐릭터의 재킷이 켜지고 꺼질 거예요.

## 복사 & 붙여넣기

헤드폰도 토글할 수 있는 단축키를 설정하고 싶어요. 노드를 다시 끌어오는 대신, 이미 있는 노드를 복사해서 붙여넣을게요. **마우스 오른쪽 버튼**을 누른 상태에서 상자를 드래그하여 다음과 같이 노드를 선택하세요:

![](/doc-img/en-blueprint-toggle-meshes-3.png)

그런 다음, **Ctrl+C**를 눌러 노드를 복사하고, **Ctrl+V** 를 눌러 노드를 붙여넣으세요. 노드는 마우스 커서 위치에 붙여넣어질 거예요. 저는 단축키를 **Ctrl+Shift+H** (H는 "headphones"을 의미)로 변경하고, 드롭다운에서 "headphones" 메쉬를 선택할 거예요. 물론, 원하는 대로 설정할 수 있어요.

![](/doc-img/en-blueprint-toggle-meshes-4.png)

이제 **Ctrl+Shift+H**를 누르면 캐릭터의 헤드폰이 켜지고 꺼질 거예요.

## 이벤트 노드

On Keystroke Pressed 노드와 같은 노드를 **이벤트 노드**라고 해요. 이벤트 노드는 **Enter** 흐름 입력이 없어서 직접 트리거할 수 없어요. 대신, Warudo가 자동으로 트리거해요. 이 경우에는 핫키를 눌렀을 때 트리거돼요.

다른 이벤트 노드도 있어요. 예를 들어 **On YouTube Super Chat Received** 노드가 있어요. Warudo를 YouTube 스트림에 연결한 경우, Super Chat을 받으면 이 노드가 트리거돼요. 아래 예시에서는 Super Chat을 받을 때 **On YouTube Super Chat Received** 노드를 사용하여 캐릭터의 재킷을 토글하고 있어요.

![](/doc-img/en-blueprint-toggle-meshes-5.png)

이 "if X, then Y"(X가 발생하면 Y를 수행한다) 패러다임은 blueprint의 기본이에요. 여기서 X는 단축키를 누르거나 Super Chat을 받는 것과 같은 이벤트이고, Y는 캐릭터가 춤을 추거나 ragdoll 효과를 적용하는 것과 같은 다양한 상호작용이에요. 실제로, 다음 튜토리얼에서는 바로 이러한 것들을 살펴볼 거예요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
