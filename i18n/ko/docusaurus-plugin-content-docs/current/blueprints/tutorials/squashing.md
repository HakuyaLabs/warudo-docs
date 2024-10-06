---
sidebar_position: 90
---

# 소품으로 머리 찌그러뜨리기

우리는 이미 [뼈대 스케일](balloon)을 가지고 놀고 있으니, 이번 튜토리얼에서는 한 걸음 더 나아가서 캐릭터의 머리를 납작하게 찌그러뜨려 볼게요!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/squashing.mp4" /></div>
<p class="img-desc">납작해졌다고 할 수 있겠네요.</p>

## 첫 번째 시도

우리가 익숙한 것부터 시작해 봐요: On Keystroke Pressed 노드와 Throw Prop At Character 노드를 사용하는 거예요. (물론, On Keystroke Pressed 대신 원하는 이벤트 노드를 사용할 수 있지만, 간단하게 하기 위해 이걸로 유지할게요.) 여기서 **Throw Prop At Character → From**을 **Above Character Head**로 설정하고, 거리는 5로 설정했어요. 이렇게 하면 소품이 캐릭터의 머리 위에서 떨어지게 돼요.

![](/doc-img/en-blueprint-squashing-1.png)

지난 튜토리얼에서 했던 것처럼 **Set Character Bone Scale** 노드를 사용해서 소품이 캐릭터와 충돌할 때 머리 뼈대를 스케일할 수 있어요, 이렇게요:

![](/doc-img/en-blueprint-squashing-2.png)

이제 C를 누르면 소품이 캐릭터 머리 위에서 떨어지고, 충돌 시 캐릭터의 머리가 납작하게 찌그러져요.

또한, 머리 뼈대를 원래 크기로 되돌리기 위한 **Set Character Bone Scale** 노드를 따로 추가할 수도 있어요:

![](/doc-img/en-blueprint-squashing-8.png)

언제든지 Enter 플로우 인풋을 클릭하면 머리 뼈대 스케일을 리셋할 수 있어요! (혹은 원한다면 단축키를 설정할 수도 있어요.) 이 방법은 아래 섹션에서 머리 스케일을 리셋하고 싶을 때 매우 유용할 거예요.

## Multi Gate

이제 캐릭터의 머리를 납작하게 만들고 다시 원래대로 돌리는 방법을 알았어요. 문제는 머리가 점점 더 납작해지도록 진행이 필요하다는 거예요. C를 누를 때마다 머리가 더 납작해지도록 만들고 싶다면 어떻게 해야 할까요?

**Multi Gate** 노드가 도움이 돼요! 지금까지 본 노드들과 달리, Multi Gate 노드는 여러 개의 플로우 아웃풋을 가질 수 있어 원하는 만큼 아웃풋을 추가할 수 있죠. 아래처럼 **Exit Count**를 4로 설정하면 Exit 1부터 Exit 4까지 4개의 플로우 아웃풋이 생겨요:

![](/doc-img/en-blueprint-squashing-3.png)

Multi Gate가 트리거될 때마다 **다음 플로우 아웃풋**이 트리거돼요. 예를 들어, 첫 번째로 트리거되면 Exit 1이 실행되고, 두 번째로 트리거되면 Exit 2가 실행되며, 이런 식으로 진행됩니다. 다섯 번째로 트리거되면 Exit 5가 없으므로 다시 Exit 1이 실행되고, 이 패턴이 반복돼요.

바로 이게 우리가 필요한 기능이에요! Multi Gate가 첫 번째로 트리거되면 머리 뼈대 스케일을 1로 리셋하고, 두 번째로 트리거되면 조금 눌러 찌그러뜨리고, 세 번째로는 더 찌그러뜨리고, 이런 식으로 진행할 수 있어요. 이를 blueprint로 표현하면 아래와 같아요:

![](/doc-img/en-blueprint-squashing-4.png)

처음에는 기본 스케일 (1, 1, 1)에서 시작하고, 조금 찌그러뜨리면 (1.33, 0.83, 1.33), 그다음 (1.66, 0.67, 1.66), 마지막으로 (2, 0.5, 2)로 찌그러뜨려요. X축과 Z축을 늘리고 Y축을 줄여서 머리가 납작해지는 거죠. 물론 X와 Z를 1로 유지하고 Y축만 줄일 수도 있지만, 이 방식이 머리를 납작하게 만드는 데 더 자연스러워 보여요.

이제 C를 여러 번 눌러보면 머리가 점점 더 납작해지면서 4번마다 리셋되는 걸 볼 수 있을 거예요!

## variable(변수) {#variables}

오늘은 여기서 마무리해도 되지만, 우리는 항상 더 흥미로운 것을 원하잖아요. 만약 머리를 10번, 아니면 100번 찌그러뜨리고 싶다면 어떻게 해야 할까요? 100개의 플로우 아웃풋과 100개의 Set Character Bone Scale 노드를 만드는 건 좋은 방법이 아니에요. 더 나은 방법이 있을 거예요.

이때 **variable**(변수)가 도움이 돼요.variable은 노드들이 변경하거나 읽을 수 있는 데이터예요. 위의 blueprint에서 4개의 Set Character Bone Scale 노드를 만들었지만, 각 노드의 설정은 **Scale** 옵션만 다를 뿐 본질적으로 같아요. 그래서 많은 노드를 만들 필요 없이, 하나의 노드를 만들고 그 노드가 변경되는 값(즉, variable)을 Scale로 사용하게 할 수 있어요!

우선 variable을 만들어 봅시다. 노드 편집기의 **Properties** 탭으로 가서 **+** 버튼을 눌러 variable을 생성해요. variable 이름을 **BumpedTimes**로 하고, 타입은 **Integer**로 설정해요.(integer은 자연수를 멋지게 표현한 것 뿐이에요. 머리를 1.5번이나 2.3번 찌그러뜨릴수는 없으니까요):

![](/doc-img/en-blueprint-squashing-5.png)

Throw Prop At Character 노드 바로 뒤에 **Integer Variable Add** 노드를 사용해 소품이 캐릭터와 충돌할 때마다 variable을 1씩 증가시켜요:

![](/doc-img/en-blueprint-squashing-6.png)

Warudo로 돌아가서 C를 몇 번 눌러보면, 소품이 캐릭터와 충돌할 때마다 variable이 1씩 증가하는 것을 확인할 수 있어요:

![](/doc-img/en-blueprint-squashing-7.png)

이 variable을 읽기 위해 **Get Integer Variable** 노드를 사용할 수 있어요. Properties 탭에서 **BumpedTimes** variable을 0으로 초기화하고, Set Character Bone Scale, Get Integer Variable, 그리고 Scale Vector3 노드를 아래와 같이 추가해 봅시다. **Scale Vector3 → Scale**은 (1, 1, 1)로 설정되어 있어요:

![](/doc-img/en-blueprint-squashing-9.png)

:::tip
다음 내용을 읽기 전에, 이 blueprint가 어떤 역할을 할지 예상이 되나요?
:::

이제 C를 누르면, 소품이 캐릭터와 충돌할 때마다 머리 뼈대가 점점 커질 거예요! 이건 논리적으로 맞아요. 왜냐하면, 소품이 충돌할 때마다 BumpedTimes를 1씩 증가시키고, 머리 뼈대 스케일을 (1, 1, 1)에 BumpedTimes를 곱한 값으로 설정하고 있기 때문이에요. 첫 번째 충돌 시 BumpedTimes는 1이고, 머리 뼈대 스케일은 (1, 1, 1) × 1 = (1, 1, 1)가 돼요. 두 번째 충돌 시 BumpedTimes는 2이고, 머리 뼈대 스케일은 (1, 1, 1) × 2 = (2, 2, 2)가 돼요. 이런 식으로 계속 커지는 거죠.

하지만 우리는 머리를 풍선처럼 키우는 게 아니라 찌그러뜨리고 싶어요! 아래의 blueprint를 다시 만들어 보세요.

![](/doc-img/en-blueprint-squashing-10.png)

Properties 탭에서 BumpedTimes variable을 0으로 리셋하고, C를 몇 번 눌러보세요. 머리 뼈대가 점점 더 납작하게 찌그러지는 걸 볼 수 있을 거예요! 그런데 이게 어떻게 작동할까요?

개인적으로 blueprint를 읽을 때 사용하는 트릭 중 하나는 데이터를 오른쪽에서 왼쪽으로 따라가는 거예요. 이 경우, 최종 스케일 값을 Set Character Bone Scale 노드로 출력하는 **Vector3** literal literal 노드부터 시작해요. 여기서 X와 Z 값은 위쪽 **Float Addition** 노드에서 제공되고, Y 값은 아래쪽 Float Addition 노드에서 제공돼요. 위쪽 경로인 **Get Integer Variable → Float Multiplication → Float Addition** 은 본질적으로 (BumpedTimes × 0.1 + 1)을 계산하고, 아래쪽 경로는 (BumpedTimes × -0.1 + 1)을 계산해요.

:::tip
우리가 Float Multiplication/Addition 노드를 사용하는 이유는 최종 결과가 소수점 값(float)이기 때문이에요. 정수 값(integer)이 아니죠.
:::

이제 BumpedTimes의 다른 값에 대한 최종 스케일을 수동으로 계산해 볼게요:

| BumpedTimes | X and Z | Y | Final Scale |
| ----------- | ------- | - | ----------- |
| 1 | 1 × 0.1 + 1 = 1.1 | 1 × -0.1 + 1 = 0.9 | (1.1, 0.9, 1.1) |
| 2 | 2 × 0.1 + 1 = 1.2 | 2 × -0.1 + 1 = 0.8 | (1.2, 0.8, 1.2) |
| 3 | 3 × 0.1 + 1 = 1.3 | 3 × -0.1 + 1 = 0.7 | (1.3, 0.7, 1.3) |
| 4 | 4 × 0.1 + 1 = 1.4 | 4 × -0.1 + 1 = 0.6 | (1.4, 0.6, 1.4) |

이 패턴이 보이시죠? X와 Z 값은 매번 0.1씩 증가하고, Y 값은 매번 0.1씩 감소해요. 바로 이게 우리가 원하는 거예요: 소품이 충돌할 때마다 머리 뼈대가 점점 더 납작하게 찌그러지게 되는 거죠!

## Variable 리셋

하지만 C를 몇 번 더 누르면, 결국 머리 뼈대가 반대 방향으로 커지는 것을 볼 수 있을 거예요, 이런 식으로요:

![](/doc-img/en-blueprint-squashing-11.png)

왜 그럴까요? 위에서 계산을 계속해 보면:

| BumpedTimes | X and Z | Y | Final Scale |
| ----------- | ------- | - | ----------- |
| 8 | 8 × 0.1 + 1 = 1.8 | 8 × -0.1 + 1 = 0.2 | (1.8, 0.2, 1.8) |
| 9 | 9 × 0.1 + 1 = 1.9 | 9 × -0.1 + 1 = 0.1 | (1.9, 0.1, 1.9) |
| 10 | 10 × 0.1 + 1 = 2 | 10 × -0.1 + 1 = 0 | (2, 0, 2) |
| 11 | 11 × 0.1 + 1 = 2.1 | 11 × -0.1 + 1 = -0.1 | (2.1, -0.1, 2.1) |
| 12 | 12 × 0.1 + 1 = 2.2 | 12 × -0.1 + 1 = -0.2 | (2.2, -0.2, 2.2) |

Y 값이 음수가 되고 있어요, 즉 머리 뼈대가 아래쪽으로 자라기 시작하는 거예요! 우리가 원하는 결과는 아니죠. BumpedTimes가 10이 되면 머리 뼈대 스케일을 (1, 1, 1)로 리셋해야 해요. 10이 가장 평평해질 수 있는 값이고, 그 이상 가면 머리가 아래로 자라게 됩니다. 다행히도 우리는 이미 이것을 해결할 방법을 알고 있어요: [댄스](dance#if-branch)튜토리얼에서 배운 If Branch 노드를 사용하면 돼요!

![](/doc-img/en-blueprint-squashing-12.png)

새로 추가된 노드는 매우 간단해요. BumpedTimes가 10 이상인지 확인하고, 그렇다면 이를 0으로 리셋하며, 동시에 머리 뼈대 스케일도 다시 1로 리셋하는 거예요.

:::tip
여기서는 **Integer Greater Than Or Equal** 노드를 사용하지만, **Integer Equal** 노드를 사용해 BumpedTimes가 10과 같은지 확인할 수도 있어요. 차이점은 전자는 BumpedTimes가 10, 11, 12일 때 If True 플로우 아웃풋을 트리거하지만, 후자는 BumpedTimes가 정확히 10일 때만 트리거해요. 일반적으로 전자가 더 유연하기 때문에 많이 사용돼요. 예를 들어, BumpedTimes가 실수로 11이 된다면, 후자를 사용했을 때는 절대로 다시 0으로 리셋할 수 없겠죠.
:::

최종 blueprint는 이렇게 생겼어요 (꽤 크죠!):

![](/doc-img/en-blueprint-squashing-13.png)

축하해요! 이제 blueprint의 variable 개념을 익혔어요. 이 튜토리얼은 이전 것들보다 조금 더 도전적이었는데, 여기까지 온 당신, 정말 대단해요!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
