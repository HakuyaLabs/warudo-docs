---
sidebar_position: 30
---

# 인형에 파묻히기

혼란을 만드는 것은 즐거움을 만드는거죠. 이 튜토리얼에서는 많은 동물 인형을 생성하고, 캐릭터를 그 밑에 파묻는 방법을 배울 거예요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/buried.mp4" /></div>
<p class="img-desc">동물 인형에 파묻히는 모습.</p>

## 여러 Blueprints

이전 튜토리얼을 따라왔다면, 각 상호작용마다 새로운 blueprint를 생성해왔다는 것을 알 수 있을 거예요. 그렇다면, 모든 노드를 하나의 blueprint에 추가하는게 더 간단하지 않을까요?

기술적으로 말하자면, 여러 blueprint로 할 수 있는 작업은 하나의 blueprint로도 가능해요. 하지만 편성을 유지하는 건 좋은 습관이에요; 여러 개의 작은 blueprint를 사용하면 특정 상호작용을 일시적으로 비활성화해도 다른 상호작용에 영향을 주지 않죠. 또한, blueprint를 다른 사람과 공유하려 할 때, 불필요한 노드가 잔뜩 있는 blueprint보다는 하나의 깔끔한 blueprint를 공유하는 것이 훨씬 쉬워요.

또한 성능도 고려해야 해요. Warudo 에디터는 많은 노드를 처리하는 데 최적화되어 있지 않아요. 하나의 blueprint에 100개 이상의 노드가 있으면 지연 현상이 나타날 수 있어요. 따라서 가능하다면 여러 개의 작은 blueprint로 나누는 것이 항상 좋은 방법이에요.

## 루프용

좋아요, 이제 blueprint를 만들어봅시다! 동물 인형을 생성하는 것은 간단해요: 이미 [익숙한](ragdoll.md) **Throw Prop At Character** 노드를 사용하면 돼요. 하지만 여러 개의 인형을 어떻게 생성할까요?

그 답은 **For Loop** 노드에 있어요. 이름에서 유추할 수 있듯이, 이 노드를 사용하면 여러 번 반복해서 어떤 작업을 수행할 수 있어요. 하지만 자세한 설명은 나중에 다루기로 하고, 먼저 아래의 blueprint를 따라 만들어보세요. For Loop 노드에서는 **Last Index**를 100으로, **Interval**을 0.01로 설정했어요; **Throw Prop At Character** 노드에서는 **Prop Source**를 Tiger로 **From**을 Above Character Head로 설정해 호랑이 인형이 캐릭터의 머리 위로 떨어지게 했어요.

![](/doc-img/en-blueprint-buried-1.png)

우리가 이미 알고 있는 두 노드의 역할은 다음과 같아요: On Keystroke Pressed 노드는 Ctrl+Shift+Z 단축키를 정의하고, Throw Prop At Character 노드는 호랑이 인형을 캐릭터에게 던져요. 하지만 For Loop 노드는 무슨 역할을 할까요? Ctrl+Shift+Z를 눌러서 확인해봅시다.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/buried-2.mp4" /></div>
<p class="img-desc">아야.</p>

호랑이 인형이 많이 생성됐죠! 그런데 몇 개일까요? For Loop 노드를 자세히 살펴보면, 이 노드는 간단히 말해서 다음과 같은 의미예요: "**First Index** (1) 부터 **Last Index** (100)까지 각 숫자에 대해, 0.01초 **Interval**로 **Loop Body** 플로우를 실행한다." 이 Loop Body 플로우가 Throw Prop At Character 노드에 연결되어 있기 때문에, 이는 곧 "1부터 100까지 각 숫자에 대해, 0.01초마다 호랑이 인형을 생성해서 캐릭터에게 던진다"는 의미예요. 또는 더 간단히 말하면, "1초 동안 100개의 호랑이 인형을 생성하여 캐릭터에게 던진다"는 거죠.

![](/doc-img/en-blueprint-buried-3.png)

:::tip
**Last Index**를 1000으로 설정하면 무슨 일이 일어날지 짐작할 수 있나요? 그리고 **Interval**을 0으로 설정하면 어떻게 될까요?
:::

캐릭터를 인형더미 속에 묻으려면, 캐릭터를 래그돌로 변환해야 해요. 이미 알고 있는 방법대로, **Activate Character Ragdoll** 노드를 사용하면 돼요. 여기서는 **Launch Force**를 (0, -100, 0)으로 설정하여 캐릭터를 아래로 밀어내려요.

![](/doc-img/en-blueprint-buried-4.png)

## 인행 랜덤화

지금까지는 잘 진행되었지만, 한 가지 문제가 있어요: 모든 인형이 호랑이라는 점이에요. 만약 여러 종류의 동물을 생성하고 싶다면 어떻게 할까요?

**Throw Prop At Character** 노드를 살펴보면, **Prop Source**를 Tiger로 설정했지만, 그 옆에 검은 점이 보이죠? 이 점은 무언가를 연결할 수 있다는 뜻이에요. 즉, 우리가 직접 드롭다운에서 소품을 선택하는 대신, 소품을 생성할 노드를 연결할 수 있다는 거예요. 그리고 바로 그 역할을 하는 것이 **Get Random Prop** 노드예요.

![](/doc-img/en-blueprint-buried-2.png)

위에서 우리는 Get Random Prop 노드의 **Prop Source** 데이터 아웃풋을 Throw Prop At Character 노드의 **Prop Source** 데이터 인풋에 연결했어요.  Get Random Prop 노드는 말 그대로 **Props** 목록이나 **Collections** 목록에 있는 소품 컬렉션에서 무작위로 소품을 선택해요. 이 경우, 우리는 Quirky Animals 컬렉션을 **Collections** 목록에 추가했으므로, Get Random Prop 노드는 동물 인형 소품을 무작위로 선택하고, 그것을 Throw Prop At Character 노드로 출력해요.

이제 Ctrl+Shift+Z를 다시 눌러서 어떻게 되는지 확인해봅시다. 잘 설정되었다면, 다양한 동물들이 캐릭터의 머리 위로 떨어지며 캐릭터를 그 아래에 파묻을 거예요. 재미있는 부분이죠!

:::info
중요한 기술적 세부 사항에 관심이 있다면, 노드의 데이터 인풋은 해당 노드가 트리거될 때 연결된 데이터 아웃풋에서 값을 가져온다는 점이에요. 즉, 이번 경우에는 Throw Prop At Character 노드가 트리거될 때마다 Get Random Prop 노드도 함께 트리거되어, 매번 다른 소품을 출력하는 거예요(이는 For Loop 노드에 의해 발생).
:::

## 루프에 대한 추가 설명

For Loop 노드에는 **Loop Index** 데이터 아웃풋이 있다는 점을 눈치챘을 거예요. 이 데이터 아웃풋은 루프의 현재 인덱스를 제공하며, **First Index**에서 시작해 **Last Index**에서 끝나요. 위의 예시에서는 **Loop Index** 데이터 아웃풋이 1부터 100까지의 숫자를 제공해요. 이 숫자를 어떻게 사용할 수 있을까요?

여기 하나의 아이디어가 있어요: **Loop Index**를 Get Random Prop 노드의 **Scale** 데이터 인풋에 연결해 보세요. 어떤 일이 일어날지 추측할 수 있나요?

![](/doc-img/en-blueprint-buried-5.png)

정확하게 추측했다면, 떨어지는 인형들이 점점 더 커지는 모습을 보게 될 거예요. 멋지죠!

:::tip
만약 인형들을 점점 더 작아지게 하고 싶다면 어떻게 해야 할까요? 또는 1에서 100까지의 스케일 대신 0.1에서 10까지의 스케일을 원한다면요? 스스로 한 번 해결해 보세요! **Float Subtraction**과 **Float Multiplication** 노드가 도움이 될 수 있어요.
:::

**For Loop** 노드에는 **On Loop End**와 **Exit** 플로우 아웃풋도 있어요. **On Loop End** 플로우 아웃풋은 루프가 끝날 때 트리거되고, **Exit** 플로우 아웃풋은 루프가 시작된 직후에 트리거돼요. 아래와 같이 **Show Toast** 노드를 두 개 추가하고 무슨 일이 일어나는지 확인해 보세요.

![](/doc-img/en-blueprint-buried-6.png)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
