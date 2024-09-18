---
sidebar_position: 40
---

# 노래방 타임

누구나 스트림에서 노래방을 즐기잖아요? 이제 우리는 3D 세계에 있으니, 캐릭터가 마이크를 들고 노래하는 현실감을 더해봅시다. 이 튜토리얼에서는 단축키를 사용해 노래하는 포즈와 마이크 소품을 전환하는 방법을 보여줄 거예요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/karaoke.mp4" /></div>
<p class="img-desc">열정적으로 노래하는 모습!</p>

:::tip
이 노래방 방 환경을 사용하고 싶다면, Warudo의 **Discover** 탭에서 Steam Workshop을 통해 다운로드할 수 있어요.
:::

## 기본 애니메이션 재생하기

먼저, 마이크 소품을 추가하고 캐릭터의 왼손에 부착하세요. 어떻게 하는지 잘 모르겠다면 [시작하기](../../tutorials/readme-1.md#assets-tab) 튜토리얼을 참조하세요. 그런 다음, 소품 에셋에서 **Enabled**를 No로 설정하여 마이크를 일단 숨깁니다.

이제 우리가 익숙한 On Keystroke Pressed 노드를 사용하여 아래의 blueprint를 재현해보세요. 여기에는 두 개의 새로운 노드가 추가돼요: **Toggle Asset Enabled**와 **Play Character Idle Animation**. (이름만 봐도 기능을 알 수 있죠?) **Toggle Asset Enabled → Asset**에는 마이크 소품을 설정하고, **Play Character Idle Animation → Animation**에는 노래하는 포즈를 설정하세요. 저는 "010_0970"을 사용했지만, 다른 포즈를 실험해 봐도 좋아요.

![](/doc-img/en-blueprint-karaoke-1.png)

맞아요! 이제 M 단축키를 누르면 마이크가 나타나고, 캐릭터가 마이크를 들어 올려 노래할 준비를 해요. 

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/karaoke-2.mp4" /></div>

이건 너무 쉬우니, 더 재미있게 만들어봅시다. 마이크가 나타날 때 "우우웅" 소리 효과를 재생하는 방법을 생각해 볼 수 있을까요?

"이건 쉽지!"라고 하면서, 검색창에 "sound"를 입력하죠. 그리고 바로 **Play Sound** 노드가 보이네요. Play Sound 노드를 노드 에디터에 추가하고 **Sound Source** 를 "우우웅" 소리 효과로 설정한 다음, Play Character Idle Animation 노드 옆에 연결합니다:

![](/doc-img/en-blueprint-karaoke-2.png)

M을 누르면 소리가 잘 재생됩니다. 훌륭해요! 하지만 소리가 마이크를 꺼낼 때나 넣을 때 모두 재생된다는 점을 눈치챘나요? 마이크를 꺼낼 때만 소리가 나게 할 방법이 있을까요?

## 플립 플롭

정답은 **Flip Flop** 노드입니다. 보통 노드에는 Enter 플로우 인풋과 Exit 플로우 아웃풋이 있지만, Flip Flop 노드는 특별해요: **A**와 **B**두 개의 Exit 플로우 아웃풋을 가지고 있어요. Flip Flop 노드가 처음 트리거될 때는 **A** 플로우가 실행되고, 두 번째로 트리거되면 **B** 플로우가 실행돼요. 세 번째로는 다시 **A** 플로우, 그다음은 **B** 플로우 이렇게 번갈아가며 동작해요.

정말 편리하죠? 이제 우리의 blueprint를 아래처럼 재구성해봅시다!

![](/doc-img/en-blueprint-karaoke-3.png)

이제 마이크를 꺼낼 때만 소리 효과가 재생될 거예요!

## 애니메이션 프로필

이 방식은 귀엽지만, Play Character Idle Animation 노드를 사용할 때의 한계가 있어요. 미리 정의된 포즈/애니메이션만 선택할 수 있다는 점이죠. 예를 들어, 저는 캐릭터가 왼손만 들어 올리게 하고 싶지만, 그런 포즈는 목록에 없어요. 이때 유용한 것이 **Character → Overlaying Animations**입니다.

캐릭터 에셋을 열고, **Idle Animation**을 Generic으로 설정해 기본 포즈로 초기화한 후, **Overlaying Animations**까지 스크롤하세요. **+** 버튼을 클릭해 새 항목을 추가하고, **Animation** 드롭다운에서 "010_0970"을 선택하세요.

![](/doc-img/en-blueprint-karaoke-8.png)

캐릭터가 예상대로 포즈를 취해요:

![](/doc-img/en-blueprint-karaoke-9.png)

이제 왼손만 들어 올리도록 하려면, **Masked**를 Yes로 설정하고 **Masked Body Parts** 목록에 **Left Arm**을 추가해 아래와 같이 설정해요:

![](/doc-img/en-blueprint-karaoke-4.png)

또한, **Weight** 옵션을 조정해 원하는 포즈를 얻을 때까지 설정하세요. 이 경우, 0.88로 설정했지만, 캐릭터마다 다를 수 있어요.

이제 캐릭터는 왼손만 들어 올리게 돼요:

![](/doc-img/en-blueprint-karaoke-5.png)

그렇다면 이 포즈를 blueprint에서 어떻게 트리거할 수 있을까요? 먼저 애니메이션 프로필을 저장해야 해요. 애니메이션 프로필은 캐릭터의 현재 애니메이션 설정(Idle Animation, Overlaying Animations, Override Hand Poses 등)을 저장한 스냅샷이에요. **Save Animation Profile** 버튼을 클릭해봅시다:

![](/doc-img/en-blueprint-karaoke-6.png)

이제 이름을 붙여주세요, 예를 들어 LeftHandMic라고 하고, **OK**를 클릭하세요:

![](/doc-img/en-blueprint-karaoke-7.png)

애니메이션 프로필을 저장했으니, 이제 **Load Animation Profile** 버튼을 사용해 언제든지 이를 불러올 수 있어요!

곧 blueprint에서 이 작업을 어떻게 수행할 수 있는지 살펴보겠지만, 먼저 기본 포즈를 위한 또 다른 애니메이션 프로필을 만들어 봅시다. 저는 간단하게 처리했어요: Overlaying Animations 목록을 비우고, Idle Animation을 Generic으로 설정했어요. 물론, 여러분은 커스텀 기본 포즈를 만들어도 좋아요!

"Idle"이라는 이름으로 또 다른 애니메이션 프로필을 저장한 후, 이제 준비가 끝났어요! blueprint로 가서, Play Character Idle Animation 노드를 Load Animation Profile 노드로 교체하세요. 그리고 **Profile** 드롭다운에서 올바른 프로파일을 선택하는 것을 잊지 마세요!:

![](/doc-img/en-blueprint-karaoke-10.png)

이제 M을 누르면 "LeftHandMic" 애니메이션 프로필이 로드되고, 다시 M을 누르면 "Idle" 애니메이션 프로필이 로드됩니다!

:::tip
위는 Overlaying Animations와 애니메이션 프로파일을 사용하는 간단한 예시일 뿐이에요. 중요한 점은 이 기능들을 통해 다양한 포즈와 애니메이션을 섞어서 사용할 수 있어 원하는 대로 캐릭터를 포즈할 수 있다는 거예요.
:::

## 플로우 지연하기

마지막으로 작은 문제를 해결해봅시다. 캐릭터가 마이크를 넣을 때, 마이크가 즉시 사라지는 것을 눈치챘을 거예요. 캐릭터가 마이크를 다 넣은 후에 사라지게 한다면 더 현실적일 거예요. 어떻게 할 수 있을까요?

:::tip
힌트: **Delay Control Flow** 노드를 사용하면 가능합니다. 직접 시도해보고 계속 읽어보세요!
:::

여기 간단한 해결책이 있어요: Toggle Asset Enabled와 Play Character Idle Animation 노드의 순서를 바꾸고, 그 사이에 Delay Control Flow 노드를 추가하는 거예요. **Delay**를 1초로 설정하여  캐릭터가 마이크를 넣은 후 1초 후에 마이크가 사라지도록 합니다.

![](/doc-img/en-blueprint-karaoke-11.png)

Delay Control Flow 노드는 지정된 지연 시간 후에 Exit 플로우를 트리거해요. 이 노드를 사용하면 연속적인 이벤트를 만들 수 있어요. 예를 들어, 캐릭터가 5초 동안 춤을 추다가 머리 위에 여러 소품을 떨어뜨리고 마지막에 폭발 파티클 효과를 재생하는 등의 일련의 이벤트를 만들 수 있어요. 이 모든 것은 당신의 상상력에 달렸습니다!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
