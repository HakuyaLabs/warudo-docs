---
sidebar_position: 130
---

# 스파크 만들기

이제 스트림을 더욱 흥미롭게 만들어볼 시간이에요! 이 튜토리얼에서는 Warudo의 강력한 접촉 시스템을 소개할 거예요. 이 시스템을 사용하면 물체가 다른 물체와 접촉할 때 다양한 재미있는 효과를 트리거할 수 있어요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/contact.mp4" /></div>
<p class="img-desc">접촉 시스템을 사용해 손가락 사이에 불꽃을 일으켜 카타나를 꺼내는 모습.</p>

:::info
이 튜토리얼을 진행하려면 손 추적이나 전신 추적이 필요해요. 손 추적의 경우 [MediaPipe](../../mocap/mediapipe)도 괜찮지만, 더 나은 정확도를 위해 [Leap Motion](../../mocap/leap-motion)을 사용하는 것을 추천해요.
:::

## 접촉 시스템

접촉 시스템은 개념이 간단해요: 두 개의 물체가 접촉할 때 플로우를 트리거할 수 있어요. 예를 들어, 두 검지 손가락의 끝이 접촉할 때 스파크를 생성하는 것이에요. 이제 어떻게 구현할 수 있는지 살펴보죠!

먼저, **On Contact** 노드를 살펴볼게요. 믿기지 않겠지만, 이 노드 하나만으로 접촉 시스템 전체를 구현할 수 있어요! 본질적으로 이 노드는 **Contact Senders**에 있는 물체가 **Contact Receivers**에 있는 물체와 접촉하는지 자동으로 확인하고 **On Contact Enter** (물체와 접촉하는 순간), **On Contact Stay** (물체와 접촉하는 동안) 그리고 **On Contact Exit** (물체와 더 이상 접촉하지 않는 순간) 플로우 아웃풋을 각각 트리거해요.

![](/doc-img/en-blueprint-contact-2.png)

먼저 **Contact Senders**에 항목을 추가하고 아래와 같이 설정해요:

![](/doc-img/en-blueprint-contact-4.png)

이제 오른손을 들어 올리면, 검지 손끝에 빨간색 구가 나타나는 것을 볼 수 있을 거예요:

![](/doc-img/en-blueprint-contact-3.png)

그다음 **Contact Receivers**에 항목을 추가하고 아래와 같이 설정해요:

![](/doc-img/en-blueprint-contact-5.png)

이제 손을 들어 올리면 왼손 검지 끝에 녹색 구가 나타날 거예요:

![](/doc-img/en-blueprint-contact-6.png)

이제 실제로 전기 스파크를 생성하는 작업만 남았어요! 다행히도 **Spawn Particle** 노드를 사용하면 쉽게 할 수 있어요. 이 노드를 편집기에 추가하고 **Source** 옵션에서 좋아하는 파티클(저는 "Basic Impact 3"을 사용했어요)을 선택하고 적절한 **Scale**을 설정해요(저는 0.1을 사용했어요). 그런 다음 **On Contact → On Contact Stay**를 **Spawn Particle → Enter**에, 그리고 **On Contact → Contact Position**을 **Spawn Particle → Position Offset**에 아래와 같이 연결해 주세요:

![](/doc-img/en-blueprint-contact-7.png)

이제 손을 맞대면 손끝에서 불꽃이 튀는 것을 볼 수 있을 거예요! 생각보다 쉽죠?

![](/doc-img/en-blueprint-contact-1.png)

:::tip
설정을 완료한 후에는 **Visualized** 옵션을 No로 설정해 빨간색과 녹색 구를 숨길 수 있어요.
:::

## 쓰로틀 플로우

파티클이 매우 빠르게 생성되어 스파크 효과가 지나치게 밀집된 것을 알아챘을 거예요. 이는 **On Contact Stay** 플로우 아웃풋이 물체들이 접촉 중인 매 프레임마다 트리거되기 때문이에요. 만약 Warudo를 60 FPS로 실행 중이라면, 매 초당 60개의 파티클이 생성되는 거죠!

이 플로우 속도를 줄이기 위해 **Throttle Flow** 노드를 사용할 수 있어요. 쓰로틀은 물의 흐름을 조절하는 밸브와 같고 Throttle Flow 노드는 플로우 아웃풋의 속도를 조절해요. 아래 예시에서는 **Interval**을 0.1초로 설정한 Throttle Flow 노드가 0.1초마다 최대 한 번씩만 플로우 아웃풋을 트리거해요:

![](/doc-img/en-blueprint-contact-8.png)

플로우 속도를 원하는 대로 조정할 수 있어요. 예를 들어, 초당 20개의 불꽃을 생성하고 싶다면 Interval을 0.05로 설정하면 돼요.

## 카타나 뽑기

이번엔 다른 예시로 등 뒤에서 카타나를 뽑는 동작을 만들어 볼게요! 카타나 소품(혹은 칼, 단검, 원하는 무기)을 추가하고 캐릭터의 왼손에 아래처럼 부착해 주세요:

![](/doc-img/en-blueprint-contact-9.png)

먼저 카타나를 숨기기 위해 **Prop → Enabled**을 No로 설정하세요. 이제 접촉 시스템을 설정할 차례입니다. 새 On Contact 노드를 추가한 뒤, Contact Senders 목록에 아래와 같은 설정을 추가하세요:

![](/doc-img/en-blueprint-contact-12.png)

그리고 Contact Receivers 목록에 다음 설정을 추가하세요:

![](/doc-img/en-blueprint-contact-13.png)

오른쪽 어깨에 빨간색 구체, 왼손에는 초록색 구체가 보여야 해요. **Position Offset** 옵션을 조정해 손이 어깨 쪽에 닿도록 위치를 편안하게 맞춰주세요.

![](/doc-img/en-blueprint-contact-11.png)

마지막으로, 손이 어깨에 닿을 때마다 소품을 활성화하는 **Toggle Asset Enabled** 노드를 추가하면 됩니다:

![](/doc-img/en-blueprint-contact-10.png)

이제 왼손을 오른쪽 어깨에 대면 손에 카타나가 나타나는 것을 볼 수 있을 거예요! 카타나가 나타날 때 **Play Sound** 노드를 추가해 소리 효과를 넣거나, 파티클을 추가하거나 원하는 대로 설정할 수 있어요. 이것이 접촉 시스템의 매력입니다!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
