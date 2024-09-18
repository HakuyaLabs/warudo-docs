---
sidebar_position: 140
---

# 꼬리 잡기

캐릭터에 꼬리가 있나요? 그렇다면 이번 튜토리얼이 딱 맞을 거예요! 이번 튜토리얼에서는 단축키를 누르면 캐릭터가 꼬리를 잡도록 설정할 거예요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/tail.mp4" /></div>
<p class="img-desc">꼬리를 잡아보자!</p>

:::tip
꼬리가 없는 캐릭터라 해도 괜찮아요! 이 튜토리얼을 읽고 **Set Asset Property**와 **Invoke Asset Trigger** 노드를 사용하는 방법을 배울 수 있어요.
:::

## 꼬리 IK

blueprint를 작업하기 전에 먼저 씬을 설정할게요! 먼저 [앵커](../../assets/anchor) 에셋을 생성하고 캐릭터의 오른손에 부착하세요:

![](/doc-img/en-blueprint-tail-2.png)

이 설정은 나중에 꼬리를 캐릭터의 오른손으로 향하게 할 때 유용해요.

다음으로 [꼬리](../../assets/tail) 에셋을 만들어 캐릭터에 [설정](../../assets/tail#setup)하세요. **Inverse Kinematics** 섹션에서 **Enabled**을 Yes로 설정하고, **IK Target**을 방금 만든 앵커로 설정하세요:

![](/doc-img/en-blueprint-tail-3.png)

:::info
이미 꼬리를 만들었다면 이번 튜토리얼에서는 흔들기와 추가 셰이핑을 비활성화해야 해요.
:::

이 설정을 통해 꼬리가 역운동학(IK)을 사용하여 앵커를 향하게 돼요. 다시 말해, 꼬리는 이런식으로 항상 캐릭터의 오른손을 향하게 될 거예요:

![](/doc-img/en-blueprint-tail-1.png)

## 에셋 속성 설정

현재는 꼬리를 잡는 것과 잡지 않는 것을 토글하려면 **Tail → Inverse Kinematics → Enabled** 옵션을 수동으로 켜고 꺼야 해요.

![](/doc-img/en-blueprint-tail-4.png)

이걸 blueprint에서 할 수 있는 방법이 있을까요? 아쉽게도 "Toggle Tail IK"라는 노드는 없어요. 하지만 다행히도 강력하고 유연한 **Set Asset Property** 노드를 사용하면 원하는 작업을 할 수 있어요!

이 노드는 이름 그대로 에셋의 속성(옵션)을 설정해줘요. Tail 에셋을 **Asset** 드롭다운에서 선택한 후, **Data Path** 드롭다운에서 Inverse Kinematics → Enabled 속성을 선택하면 돼요:

![](/doc-img/en-blueprint-tail-9.png)

그다음 **Target Value**를 지정하는 대신 **Toggle**을 Yes로 설정하면 이 노드는 매번 트리거될 때마다 속성을 Yes와 No 사이에서 토글할 거예요:

![](/doc-img/en-blueprint-tail-5.png)

이제 Ctrl+Shift+X를 누르면 꼬리 IK가 켜졌다 꺼졌다 할 거예요! 간단하죠?

꼬리 IK를 켜고 끄는 건 좋지만, IK가 즉시 켜지거나 꺼지는 것을 눈치챘을 거예요. 꼬리가 손에 바로 닿기보다는 서서히 닿도록, IK를 점진적으로 켜고 끄면 더 자연스러울 거예요.

이를 위해 **Tail → Inverse Kinematics → Enabled**을 Yes로 설정하고, **Tail → Inverse Kinematics → Weight** 옵션을 조절하면 돼요:

![](/doc-img/en-blueprint-tail-6.png)

만약 꼬리의 가중치를 0에서 1로 끌어올리면 꼬리가 점차 손으로 향하는 것을 볼 수 있어요. 그럼 이걸 blueprint에서 어떻게 할 수 있을까요? 또다시 **Set Asset Property** 노드를 사용하면 돼요! 이번에는 select the Tail → Inverse Kinematics → Weight property 속성을 선택해요:

![](/doc-img/en-blueprint-tail-8.png)

그다음 두 노드에서 각각 **Target Value**를 1과 0으로 설정해요. Flip Flop 노드가 매번 트리거될 때마다 두 Exit 플로우 아웃풋을 번갈아 가며 실행하니까, Ctrl+Shift+X를 누르면 꼬리 IK가 점차 켜지거나 꺼지게 돼요.

![](/doc-img/en-blueprint-tail-7.png)

:::tip
보시다시피 Set Asset Property 노드는 에셋 탭에서 보이는 거의 모든 것을 설정할 수 있어요! 때로는 전용 노드를 대체하기도 해요. 예를 들어 Set Asset Property 노드는 소품의 **Enabled** 옵션도 설정할 수 있어서 더 이상 **Toggle Asset Enabled** 노드를 쓸 필요가 없을지도 몰라요.

하지만 Set Asset Property는 보다 일반적인 노드라서 Toggle Asset Enabled 같은 전용 노드보다 성능이 떨어져요. 특히 Set Asset Property 노드를 너무 자주 트리거하지 않도록 주의해야 해요(**On Update** 노드 뒤에 배치하는 경우). 그렇지 않으면 성능 문제가 발생할 수 있어요. 기본 원칙은 원하는 작업에 전용 노드가 있다면 Set Asset Property 대신 그 전용 노드를 사용하는 게 좋아요.
:::

## 에셋 트리거 호출

이제 슬라이더 조정과 스위치 토글을 자동화하는 방법은 알게 되었어요. 그렇다면 버튼 클릭도 자동화할 수 있을까요? 예를 들어, **Tail → Reset Tail** 버튼을 단축키로 자동으로 "클릭"할 수 있는 방법이 있을까요?

![](/doc-img/en-blueprint-tail-11.png)

물론 있어요! **Invoke Asset Trigger** 노드는 바로 이 작업을 해줘요. Set Asset Property 노드와 비슷하지만, 속성을 설정하는 대신 에셋의 트리거(버튼)를 호출해요. **Trigger Path** 드롭다운에서 Tail → Reset Tail 트리거를 선택하면 돼요:

![](/doc-img/en-blueprint-tail-10.png)

Warudo에는 꽤 많은 버튼이 있으니, 이 노드는 여러 상황에서 유용할 거예요! 예를 들어, iFacialMocap이나 MediaPipe를 얼굴 추적에 사용하는 경우, 저는 **iFacialMocap Receiver / MediaPipe Tracker → Calibrate**에 단축키를 할당해서 얼굴 추적을 단축키로 바로 교정할 수 있게 설정하는 걸 추천해요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
