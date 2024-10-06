---
sidebar_position: 70
---

# 카메라 애니메이션

캐릭터로 충분히 재미를 즐겼으니, 이제 스트림에 영화 같은 카메라 움직임을 추가하는 방법을 알아봅시다. 이번 튜토리얼에서는 간단하지만 효과적인 카메라 애니메이션을 추가하는 방법을 배울 거예요.

:::tip
Warudo Pro 사용자는 [디렉터](../../assets/director) 에셋을 사용해 카메라 애니메이션을 만들 수도 있어요.
:::

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera-2.mp4" /></div>
<p class="img-desc">캐릭터가 춤을 추며, 카메라도 함께 움직입니다!!</p>

## Orbit Character 카메라 애니메이션

이번 튜토리얼의 주인공은 **Camera Orbit Character** 노드입니다. 노드를 노드 에디터로 끌어와 자세히 살펴보죠:

![](/doc-img/en-blueprint-camera-1.png)

Camera Orbit Character 노드는 Orbit Character 제어 모드에서 카메라의 파라미터를 기록하고 재생해요. 마우스를 사용해 카메라를 움직이고, 노드가 카메라의 이동 위치, 줌 인/아웃, 팬 동작 등을 기록하게 할 수 있어요. 이후 언제든지 노드를 트리거하여 카메라가 기록된 위치와 방향으로 이동하게 만들 수 있죠.

:::info
아직 설정하지 않았다면, **Camera → Control Mode**를 **Orbit Character**로 설정하세요.
:::

한번 시도해봅시다! 예를 들어, 시청자들에게 캐릭터의 폭신한 꼬리를 보여주고 싶다면, 카메라를 캐릭터의 뒷면으로 회전시켜보세요:

![](/doc-img/en-blueprint-camera-2.png)

그 다음, 노드에서 **Align Target With Main Camera** 버튼을 클릭하면, 노드는 카메라의 위치와 방향을 **Target** 데이터 인풋에 기록합니다. 이제 카메라를 다시 앞으로 돌릴 수 있지만, 언제든지 이 노드를 트리거하면 카메라는 캐릭터의 뒤로 이동하여 꼬리를 보여줄 거예요!

아래처럼 간단한 blueprint를 만들 수 있어요:

![](/doc-img/en-blueprint-camera-3.png)

이렇게 하면 B를 눌러 언제든지 캐릭터의 앞과 뒤를 전환할 수 있어요!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera.mp4" /></div>
<p class="img-desc"></p>

이제 여러분의 차례입니다! 자신만의 카메라 blueprint를 만들어 보고, 캐릭터를 위한 흥미로운 카메라 움직임을 시도해 보세요.

:::tip
**Transition Time**과 **Transition Easing** 옵션을 가지고 놀면서 카메라 움직임에 어떤 영향을 주는지 확인해 보세요! Transition Easing에서 **InOutSine**은 자연스러운 카메라 움직임을 위한 좋은 출발점입니다.
:::

## 애니메이션 반복하기

모든 것이 잘 작동하지만 한 가지 문제가 있어요: 카메라 애니메이션을 수동으로 트리거해야 한다는 점입니다. 카메라가 자동으로 움직이게 할 방법이 있을까요?

당연히 방법이 있어요! 어떻게 설정할 수 있는지 살펴봅시다. 먼저, 두 개의 Camera Orbit Character 노드를 설정하고, 각각 다른 카메라 위치와 방향을 지정해 보세요. 제가 첫 번째 노드에 설정한 것은 다음과 같아요:

![](/doc-img/en-blueprint-camera-4.png)

그리고 두 번째 노드의 설정은 다음과 같아요:

![](/doc-img/en-blueprint-camera-5.png)

첫 번째 노드를 트리거하면 카메라가 캐릭터의 왼쪽으로 이동하고, 두 번째 노드를 트리거하면 카메라가 오른쪽으로 이동합니다. 이제 카메라가 왼쪽으로 먼저 이동한 후 오른쪽으로 이동하게 만들려면, **On Transition End** 에서 **Enter**로 아래와 같이 연결하기만 하면 돼요:

![](/doc-img/en-blueprint-camera-13.png)

:::info
여기서 중요한 점은 **Exit**가 아닌 **On Transition End**에서 연결한다는 것이에요. 이는 Exit 플로우 아웃풋은 노드가 트리거될 때, 즉 카메라가 움직이기 시작할 때 트리거되지만, On Transition End는 카메라가 움직임을 완료한 후에 트리거되기 때문이에요.
:::

이제 왼쪽 Camera Orbit Character 노드의 Enter 플로우 인풋을 클릭하면 카메라가 캐릭터의 왼쪽으로 이동한 다음, 자동으로 오른쪽으로 이동하는 것을 볼 수 있어요. 여기까지는 잘 작동하네요! 그럼 이제 무엇을 해야 할까요?

당신은 "그건 쉽죠,"라고 말할 수 있어요. "오른쪽 Camera Orbit Character 노드의 On Transition End를 왼쪽 Camera Orbit Character 노드의 Enter로 연결하면 되잖아요!"

하지만 그렇게 하면:

![](/doc-img/en-blueprint-camera-6.png)

오류 메시지가 나타날 거예요!

![](/doc-img/en-blueprint-camera-7.png)

이 연결을 추가할 수 없는 이유는 blueprint에 루프를 만들게 되기 때문이에요. Warudo가 무한 루프에 빠져 멈추는 것을 방지하기 위한 조치예요.

:::info
만약 루프를 허용했다면, 두 노드의 Transition Time이 0으로 설정되어 있을 경우 카메라가 너무 빠르게 반복해서 이동해 Warudo가 멈추거나 충돌할 수 있어요!
:::

그러나 **functions**를 사용하여 이 문제를 해결할 수 있어요. Function은 blueprint 내 어디서든 트리거할 수 있는 진입점이며, 다른 blueprint에서도 호출할 수 있어요. 예시로 알아봅시다. **Define Function** 노드를 왼쪽 Camera Orbit Character 노드의 왼쪽에 추가하고 function **Name**을 `AnimateCamera`로 설정하세요:

![](/doc-img/en-blueprint-camera-8.png)

우리는 방금 function을 정의했어요! 이제 `AnimateCamera` function이 트리거되면, 첫 번째 Camera Orbit Character 노드를 트리거하게 됩니다. 그렇다면 이 `AnimateCamera` function을 어떻게 트리거할까요? **Flow Function** 노드를 사용하면 됩니다! 노드를 노드 에디터에 추가하고, 드롭다운에서 방금 만든 function을 선택한 후, Enter 플로우 인풋을 클릭해 보세요:

![](/doc-img/en-blueprint-camera-9.png)

그러면 카메라가 캐릭터의 왼쪽으로 이동한 후, 자동으로 오른쪽으로 이동하는 것을 볼 수 있을 거예요. 이로써 function이 제대로 작동하는 것을 확인할 수 있어요. 이제 마지막으로, 오른쪽 Camera Orbit Character 노드가 움직임을 끝냈을 때 이 function을 자동으로 트리거하도록 설정해봅시다. **Camera Orbit Character → On Transition End**를 **Flow Function → Enter**로 연결하세요:

![](/doc-img/en-blueprint-camera-10.png)

이제 **Flow Function → Enter**를 다시 클릭하면, 카메라가 캐릭터의 왼쪽으로 이동한 후, 자동으로 오른쪽으로 이동하고, 다시 자동으로 왼쪽으로 이동하는 것이 반복됩니다. 바로 우리가 원하는 대로 작동하는 거죠!

주의할 점은, Camera Orbit Character 노드로 생성된 카메라 애니메이션은 우리가 카메라 제어를 시도할 때 즉시 멈춘다는 점입니다. 애니메이션을 더 편리하게 시작하기 위해 `AnimateCamera` function에 단축키를 할당할 수 있습니다:

![](/doc-img/en-blueprint-camera-11.png)

## 다른 카메라 파라미터 애니메이션

카메라 위치와 방향뿐만 아니라 **Field of View**(시야각) 같은 다른 카메라 파라미터도 애니메이션할 수 있어요. 예를 들어, 아래 blueprint는 카메라가 움직이기 시작할 때 줌 애니메이션을 시작합니다:

![](/doc-img/en-blueprint-camera-12.png)

다른 카메라 노드도 자유롭게 실험해 보세요!

## Free Look 카메라 애니메이션

지금까지는 Orbit Character 제어 모드에서 카메라를 애니메이션했지만 모든 영화 같은 카메라 움직임이 캐릭터 주변을 도는 것은 아니에요. 또는 캐릭터의 위치와 상관없이 고정된 두 위치 사이에서 카메라를 이동시키고 싶을 수 있어요. 이 경우 **Set Asset Transform** 노드를 사용할 수 있습니다:

![](/doc-img/en-blueprint-camera-15.png)

이 노드는 Camera Orbit Character 노드와 동일하게 작동하지만, Free Look 제어 모드에서 카메라의 파라미터를 기록하고 재생해요. 대상 위치와 방향을 기록하려면 **Align Target With Asset** 버튼을 사용하세요.

:::tip
이 노드의 이름이 Set Asset Transform인 이유는 이 노드를 사용하여 소품이나 캐릭터와 같은 다른 에셋도 이동하고 애니메이션할 수 있다는 점입니다!
:::

## 카메라 전환하기

**Switch Main Camera** 노드가 있다는 사실을 언급했었나요? 이 노드는 두 카메라 간을 전환하며, 페이드 전환 옵션도 제공해요. 예를 들어, 아래 blueprint는 Ctrl+1과 Ctrl+2를 누르면 두 카메라를 전환합니다:

![](/doc-img/en-blueprint-camera-14.png)

결과는 이렇게 나옵니다:

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/camera-3.mp4" /></div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
