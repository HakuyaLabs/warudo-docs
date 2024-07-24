---
sidebar_position: 20
---

# 하늘로 발사

하늘로 발사되고 싶나요? 저도 별로요. 하지만 재미있으니까 해봐요! 이 튜토리얼에서는 소품에 맞았을 때 캐릭터에 래그돌 물리 효과를 적용하는 방법을 배울 거예요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/ragdoll.mp4" /></div>
<p class="img-desc">캐릭터에 래그돌 효과 적용.</p>

## 소품 던지기

새로운 blueprint를 만들어보세요. 트리거로는 다시 **On Keystroke Pressed** 노드를 사용할거지만 원하는 이벤트 노드도 사용할 수 있어요. 테스트를 쉽게 하기 위해 단축키를 **Space** 설정할게요. 그런 다음, 바로 옆에 **Throw Prop At Character** 노드를 추가하고, 아래와 같이 노드를 연결하세요. **Character** 옵션은 우리 캐릭터로 설정하고, **Prop Source** 옵션은 캐릭터에게 던질 소품 모델로 설정하세요 (저는 "Sea Lion"을 선택할 거예요).

![](/doc-img/en-blueprint-ragdoll-1.png)

와, 이 노드는 엄청 크네요. **Throw Prop At Character** 노드에는 많은 옵션이 있으니 하나씩 살펴보도록 해요.

* **Impact Particle Source**와 **Impact Particle Scale** 은 소품이 캐릭터를 맞힐 때 재생되는 파티클 효과를 결정해요. 저는 "Basic Impact 02"를 선택하겠지만, 갤러리 아이콘을 클릭하여 모든 파티클을 미리 볼 수 있어요.
* **Launch Sound Source**, **Impact Sound Source** 그리고 **Sound Volume**은 설명이 필요 없을 정도로 명확해요. 
* **From** 드롭다운에서 소품이 던져지는 위치를 선택할 수 있어요. 다음 옵션 중에서 선택할 수 있어요:
  * Viewport Bounds Random Position: 화면 어디에서나, 즉 카메라에서 소품이 던져지는 것을 시뮬레이션.
  * Screen Edge: 화면 가장자리 어디에서나, 즉 카메라 밖에서 소품이 던져지는 것을 시뮬레이션.
  * Above Character Head: 캐릭터 머리 바로 위.
  * Scene Object: 다른 소품, 캐릭터, 또는 [앵커](../../assets/anchor)와 같은 씬 객체.
  * World Position: 씬의 3D 지점.
  
  기본 값인 "Viewport Bounds Random Position"이 우리에게 잘 맞아요.
* **To** 드롭다운에서 소품이 던져질 위치를 선택할 수 있어요. 다음 옵션 중에서 선택할 수 있어요:
  * Body Random Position: 캐릭터 몸 어디에나.
  * Human Body Bone: 캐릭터 몸의 표준 뼈, 예를 들어 머리, 왼손 등.
  * Transform Path: 캐릭터의 자식 변형 중 어느 것이든. 예를 들어, 캐릭터의 꼬리에 던지고 싶다면 여기서 꼬리 변형을 선택할 수 있어요..
  
  저는 "Human Body Bone"으로 변경하고 "Head" 뼈를 선택할 거예요. 그게 더 만족스러워 보이니까요.
* **Scale**, **Mass**, **Speed** 그리고 **Gravity** 는 소품의 물리적 속성으로, 캐릭터가 소품에 어떻게 반응할지를 결정해요. 원하는 대로 조정할 수 있어요. 저는 Scale을 2로, Speed를 10으로 변경할 거예요.
* **Launch Torque**와 **Randomize Launch Rotation**은 소품이 발사될 때의 회전을 결정해요.
* **Alive Time**은 소품이 씬에 얼마나 오래 남아 있을지를 결정해요.

이제 Space를 누르면 소품이 캐릭터의 머리에 던져지고, 캐릭터가 이에 반응해요.

## 래그돌 활성화

하지만 우리는 캐릭터가 단순히 움츠러드는 것이 아니라 래그돌 효과를 원해요! **Activate Character Ragdoll** 노드를 추가하고, Throw Prop At Character 노드의 **On Collide** 플로우 아웃풋을 Activate Character Ragdoll 노드의 **Enter** 플로우 인풋에 연결하세요. **Character** 옵션을 우리 캐릭터로 설정하고 **Launch Force**를 (0, 300, -600)으로 설정하세요.

![](/doc-img/en-blueprint-ragdoll-2.png)

:::caution
On Collide 플로우 아웃풋에서 연결하는 것이지 Exit 아웃풋에서 연결하지 않는다는 점을 유의하세요! 이는 소품이 캐릭터와 충돌할 때 래그돌을 활성화하기 위함이에요. Exit 아웃풋에서 연결하면 소품이 던져지자마자 래그돌이 활성화되기 때문에 우리가 원하는 결과가 아니에요.
:::

이제 다시 Space를 눌러보세요. 소품이 던져지지만, 이번에는 캐릭터와 충돌할 때 클래식한 래그돌 방식으로 캐릭터가 발사돼요. Space를 여러 번 눌러 소품을 다시 던져 캐릭터를 더 강하게 맞힐 수도 있어요. 정말 멋지죠!

:::tip
다른 상호작용 노드, 예를 들어 **Launch Liquid At Character**와 **Spawn Sticker From Local/Online Image**도 유사하게 설정할 수 있어요. 이 노드들을 가지고 놀아보며 어떤 결과를 만들어낼 수 있는지 확인해보세요!
:::

## 래그돌 초기화

캐릭터가 발사된 다음 5초 후에 초기화되어 돌아오는 것을 알 수 있을 거예요. 이는 Activate Character Ragdoll 노드의 **Reset Wait Time** 옵션을 조정하여 변경할 수 있어요. **Auto Reset**을 No로 설정하여 자동 초기화를 비활성화할 수도 있으며, **Reset** 흐름 입력을 수동으로 트리거할 수도 있어요. 예를 들어, 다음 blueprint는 **R** 키를 눌렀을 때만 캐릭터를 초기화해요.

![](/doc-img/en-blueprint-ragdoll-3.png)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
