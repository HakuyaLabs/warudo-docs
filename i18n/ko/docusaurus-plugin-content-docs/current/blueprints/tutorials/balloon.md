---
sidebar_position: 80
---

# 풍선 머리

이번 튜토리얼에서는 얼굴 추적을 사용해 캐릭터의 머리를 풍선처럼 부풀리는 방법을 배워볼 거예요!!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/balloon.mp4" /></div>
<p class="img-desc">볼을 부풀려 머리를 크게 만드는 모습.</p>

## 뼈대 스케일 조정

캐릭터의 머리를 부풀리기 위해서는 캐릭터의 뼈대 중 일부를 확대해야 해요. Warudo(또는 어떤 Unity 앱/게임에서도) 캐릭터는 55개의 뼈대를 가지고 있으며, 그중 일부는 선택 사항이에요. 우리가 관심 있는 머리 뼈대는 "Head"로 불립니다. **Set Character Bone Scale** 노드를 노드 에디터에 추가하고, **Bone**을 "Head"로 설정한 후, **Scale**을 1.1로 설정해보세요.

:::tip
기본적으로 Scale 옵션을 설정하면 XYZ 축이 동일한 비율로 조정됩니다. 이를 균일 스케일링이라고 불러요. 각 축을 개별적으로 조정하고 싶다면 **Uniform Scaling** 버튼을 클릭해 해제할 수 있습니다.
:::

![](/doc-img/en-blueprint-balloon-1.png)

이제 Enter를 클릭해 노드를 테스트해보세요. 캐릭터의 머리가 조금 더 커지는 것을 볼 수 있을 거예요!!

## 얼굴 추적 데이터 읽기

이제 머리 뼈대의 스케일을 조정할 수 있으니, 언제 스케일을 조정할지 정해야 해요. 볼을 부풀리는 재미있는 방법으로 스케일을 트리거할 수 있습니다!

볼을 부풀리는지 알아내기 위해서는 **Get Character BlendShape** 노드를 사용할 수 있어요. 노드 에디터에 추가해봅시다:

![](/doc-img/en-blueprint-balloon-2.png)

여기서 **BlendShape** 옵션은 볼을 부풀리는 블렌드셰이프를 선택해야 해요. ARKit 호환 캐릭터 모델을 사용하는 경우, 해당 블렌드셰이프는 보통 "cheekPuff" 또는 "CheekPuff"라고 불려요.

:::tip
만약 ARKit 호환 캐릭터 모델을 사용하지 않거나 iPhone으로 얼굴을 추적하지 않는다면, cheek puff 블렌드셰이프나 트래킹 데이터를 사용할 수 없어요. 그런 경우, 입을 이용해 트리거를 바꿀 수 있어요. 예를 들어, "jawOpen"(ARKit 블렌드셰이프가 있는 모델) 또는 "A"(VRM 블렌드셰이프만 있는 모델) 블렌드셰이프를 사용해 머리 부풀리기를 트리거할 수 있어요.
:::

**Inspect Value** 노드를 사용해 블렌드셰이프의 값을 아래와 같이 확인할 수 있어요:

![](/doc-img/en-blueprint-balloon-3.png)

볼을 부풀려 보세요, 그러면 값이 0(볼을 부풀리지 않은 상태)에서 1(볼을 부풀린 상태) 사이에서 변동하는 것을 볼 수 있을 거예요.

이제 노드를 연결할 준비가 되었어요. BlendShape 값을 **Set Character Bone Scale → Scale**에 연결하면 되겠죠? 잠깐만요...

![](/doc-img/en-blueprint-balloon-4.png)

Warudo가 노드를 연결하지 못하게 하고 있어요! 무슨 일이 일어난 걸까요? **Get Character BlendShape → Value**는 소수를 출력하지만, **Set Character Bone Scale → Scale** 옵션은 세 개의 숫자 X, Y,, Z 에요! 좀 더 정확히 말하자면, 우리는 0~1의 소수값을 _벡터_ 로 만들어야해요. (벡터는 단순히 여러 개의 숫자를 멋지게 용어입니다.) 이를 위해 **Scale Vector** 노드를 사용할 수 있어요:

![](/doc-img/en-blueprint-balloon-7.png)

이 노드는 Vector3(즉, 세 개의 소수: X, Y, Z)와 float(소수) 를 입력받아 스케일링된 Vector3를 출력해요. 예를 들어, 입력 값이 (1, 2, 3)과 5라면, 출력은 (5, 10, 15)가 됩니다. 만약 입력 값이 (2, 2, 2)와 0.5라면, 출력은 (1, 1, 1)이 되겠죠.

일단 **Vector3** 옵션을 (2, 2, 2)로 설정하고, 위처럼 노드를 연결한 다음 볼을 부풀렸을 때 어떤 일이 일어나는지 확인해 봅시다.

엥, 아무 일도 일어나지 않나요...? 그 이유는 Get Character Bone Scale 노드가 트리거되지 않았기 때문이에요! 지금은 그냥 수동으로 트리거해 봅시다. 볼을 다시 부풀리고, 이번에는 **Get Character Bone Scale → Enter**를 클릭하세요. 캐릭터의 머리가 커지는 것을 볼 수 있을 거예요!

![](/doc-img/en-blueprint-balloon-5.png)

하지만 문제가 하나 있어요: 볼을 부풀리는 것을 멈추고 다시 **Get Character Bone Scale → Enter**를 클릭하면, 캐릭터의 머리가 이렇게 되어버릴 거예요:

![](/doc-img/en-blueprint-balloon-6.png)

:::tip
다음 내용을 읽기 전에, 왜 이런 일이 발생하는지 추측해 보세요.
:::

## 산술 소개

잠시 뒤로 물러서서 우리가 지금 무엇을 하고 있는지 생각해 봅시다. 우리는 cheek puff 블렌드셰이프의 값을 사용하고 있어요. 이 값은 0과 1 사이의 소수인데, 이를 사용해 (2, 2, 2)라는 세 숫자를 스케일하고 있어요. 그렇다면 이 세 숫자의 최대값과 최소값은 어떻게 될까요?

최대값은 (2, 2, 2)이 되어, 캐릭터의 머리가 원래 크기의 두 배가 됩니다. 하지만 최소값은 (0, 0, 0)이 되어, 캐릭터의 머리가 사라져 버려요! 그래서 우리가 볼을 부풀리는 것을 멈추면 캐릭터의 머리가 사라지는 거죠.

이를 해결하려면, 최소값이 **(1, 1, 1)**이 되도록 해서 캐릭터의 머리가 사라지지 않게 해야 해요. 어떻게 할 수 있을까요? 간단히 각 숫자에 항상 1을 더하는 방식으로 해결할 수 있어요. 이를 위해 **Offset Vector3** 노드를 사용할 수 있어요:

![](/doc-img/en-blueprint-balloon-8.png)

여기서 **Scale Vector3 → Vector3**를 (1, 1, 1)로 변경하고 **Offset Vector3 → Offset**을 (1, 1, 1)로 설정했어요. 이제 볼을 부풀리고 Enter를 클릭하면 캐릭터의 머리가 커지고, 다시 볼을 부풀리지 않은 상태에서 Enter를 클릭하면 캐릭터의 머리가 원래 크기로 돌아올 거예요.

이 방법이 왜 효과가 있는지 살펴볼게요. 볼을 부풀릴 때 최대값은 (1, 1, 1) + (1, 1, 1) = (2, 2, 2)가 되고, 최소값은 (0, 0, 0) + (1, 1, 1) = (1, 1, 1)가 됩니다. 바로 우리가 원하는 결과죠!

## 업데이트 {#on-update}

Get Character Bone Scale 노드를 수동으로 트리거하는 게 저만큼이나 귀찮았기를 바랐어요. 실제로 매번 캐릭터의 머리를 부풀릴 때마다 blueprint를 클릭할 수는 없겠죠. 자동으로 노드를 트리거할 방법이 있다면 좋을 텐데... 잠깐만요, 정말 방법이 있네요?

![](/doc-img/en-blueprint-balloon-9.png)

**On Update** 노드는 Warudo가 실행 중일 때 매 프레임마다 트리거되는 이벤트 노드예요. 예를 들어, Warudo가 60 FPS로 실행 중이라면, On Update 노드는 초당 60번 트리거됩니다. 덕분에 초당 60번 클릭하지 않아도 되니 다행이죠. 휴.

:::tip
Get Character Bone Scale 노드 이후에 노드를 추가하여 볼을 부풀릴 때 더 많은 효과를 트리거할 수 있다는 점을 기억하세요! **Set Character BlendShape** 노드를 추가해 볼을 부풀릴 때 캐릭터의 블렌드셰이프를 활성화해 보세요. 힌트: Set Character BlendShape → Target Value는 0과 1 사이의 소수이므로, Get Character BlendShape → Value를 직접 연결할 수 있어요.
:::

## 뼈대 스케일 초기화 {#resetting-bone-scale}

이제 이 blueprint를 사용해 스트림 중에 캐릭터의 머리를 부풀릴 수 있게 되었지만, 이 효과를 항상 활성화하고 싶지는 않을 거예요. 그래서 이벤트 노드가 비활성화된 blueprint에서는 트리거되지 않으므로, 필요할 때만 blueprint를 활성화하고 이후에 비활성화하기로 결정했을 거예요.

하지만 작은 문제가 있어요. blueprint를 비활성화할 때 머리 뼈대의 스케일이 (1, 1, 1)이 아닐 수 있어요. 그 순간에 볼을 부풀리고 있었을 수도 있잖아요! 이를 해결하기 위해 **On Disable Blueprint** 노드를 사용해 봅시다:

![](/doc-img/en-blueprint-balloon-10.png)

On Disable Blueprint 노드는 blueprint가 비활성화될 때 트리거되는 특수 노드예요. 이제 blueprint를 비활성화할 때, 머리 뼈대의 스케일이 (1, 1, 1)로 초기화됩니다. 문제 해결!

## 얼굴 추적 데이터 읽기에 대한 추가 내용

:::info
이 섹션은 고급 사용자를 위한 내용이에요. 이해가 어렵다면 건너뛰어도 괜찮아요.
:::

이 튜토리얼에서 **Get Character BlendShape** 노드를 사용해서 얼굴 추적 데이터를 읽는 방법을 배웠는데, 사실 우리가 읽고 있는 건 진짜 얼굴 추적 데이터가 아니라, 추적 데이터를 기반으로 캐릭터에 적용된 블렌드셰이프 값이에요.  This is a nuanced but important distinction. 이 차이는 작지만 꽤 중요한 부분이에요. 예를 들어, iFacialMocap에서 제공되는 원래 `cheekPuff` 블렌드셰이프 값이 0.5라고 가정해볼게요. 그런데 iFacialMocap Receiver → Configure BlendShapes Mapping에서 `cheekPuff` 값을 2배로 설정했다면, 캐릭터에 적용되는 값은 1.0이 돼요. 즉, 우리가 볼을 절반만 부풀려도 캐릭터의 머리는 최대 크기로 부풀게 되는 거죠. 또한 **Character → Motion Capture**가 비활성화된 경우, 우리가 볼을 부풀리고 있어도 캐릭터의 `cheekPuff` 블렌드셰이프 값은 항상 0이 될 거예요.

대부분의 경우 이렇게 해도 괜찮지만, 만약 실제 얼굴 추적 데이터를 기반으로 작업하고 싶다면, **Get Receiver/Tracker Data** 노드를 사용하는 게 좋아요. 예를 들어 iFacialMocap을 사용 중이라면, **Get iFacialMocap Receiver Data** 노드의 **BlendShape List Get BlendShape** 노드를 통해 실제 `cheekPuff` 값을 가져올 수 있어요:

![](/doc-img/en-blueprint-balloon-11.png)

이 방법의 단점은 iFacialMocap을 사용하지 않으면 이 blueprint가 작동하지 않는다는 점이에요. 하지만 좋은 점은 캐릭터에 `cheekPuff` 블렌드셰이프가 없어도, 우리가 볼을 부풀리는 동작을 다양한 재미있는 효과의 트리거로 사용할 수 있다는 거예요!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
