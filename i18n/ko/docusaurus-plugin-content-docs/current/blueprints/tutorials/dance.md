---
sidebar_position: 50
---

# 댄스 댄스 댄스

시청자들에게 감사의 인사를 전할 재미있는 방법을 찾고 있나요? 이 튜토리얼에서는 YouTube Super Chat이나 Twitch 포인트 보상을 받을 때 캐릭터가 춤을 추도록 만드는 방법을 배울 거예요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/dance.mp4" /></div>
<p class="img-desc">시청자들의 응원에 감사하며 춤을 추는 모습!</p>

## 스트리밍 플랫폼 연결하기

시작하기 전에, Warudo를 Twitch, YouTube 또는 Bilibili 계정에 연결해야 해요. 이를 위해 Onboarding Assistant를 사용하세요. 아직 연결하지 않았다면 [시작하기](../../tutorials/getting-started.md#interaction-setup) 튜토리얼을 참조하세요. 이 튜토리얼에서는 Twitch에서 스트리밍한다고 가정하지만 다른 플랫폼에서도 비슷한 절차로 진행할 수 있어요.

:::tip
[Streamer.bot](Streamer.bot)과 같은 서드파티 통합을 사용하여, 도네이션이나 다른 스트림 이벤트를 받을 때 웹소켓 메시지를 Warudo로 보낼 수 있어요. 이 경우 Onboarding Assistant를 사용할 필요가 없어요.
:::

간단한 예제부터 시작해봅시다: Twitch 포인트 보상을 받을 때 캐릭터가 춤을 추게 만들기 위해서는 두 개의 노드만 필요해요:

![](/doc-img/en-blueprint-dance-1.png)

:::info
**Play Character One Shot Overlay Animation** 노드는 캐릭터의 일회성 애니메이션을 재생해요. 즉, 캐릭터의 기본 애니메이션을 변경하는 대신, 현재 재생 중인 기본 애니메이션 위에 애니메이션이 재생됩니다. 애니메이션이 끝나면 캐릭터는 자동으로 기본 애니메이션으로 돌아가요.
:::

:::tip
**On Twitch Channel Points Redeemed** 노드 대신, 원하는 이벤트 노드를 사용할 수도 있어요. 예를 들어, YouTube에서 스트리밍하는 경우 **On YouTube Super Chat Received** 노드를 사용할 수 있어요. 또는 웹소켓을 사용해 통신할 수 있는 서드파티 통합을 사용하는 경우 **On WebSocket Message Received** 노드를 사용할 수 있어요.
:::

테스트는 어떻게 할까요? 물론, 누군가가 Twitch 포인트 보상을 사용할 때까지 기다릴 수도 있지만, 그 방법은 비효율적이에요. 대신, Warudo에서는 노드를 수동으로 트리거할 수 있어요. Play Character One Shot Overlay Animation 노드의 **Enter** 플로우 인풋을 클릭해보세요:

![](/doc-img/en-blueprint-dance-2.png)

이제 캐릭터가 춤을 추기 시작합니다!

## If Branch

현재는 어떤 Twitch 포인트 보상을 받아도 캐릭터가 춤을 추기 시작해요. 하지만 특정 보상, 예를 들어 "댄스"라는 이름의 보상을 받을 때만 춤추게 하려면 어떻게 할까요? 여기서 **If Branch** 노드를 소개할게요. 두 노드 사이에 If Branch 노드를 추가해 볼게요:

![](/doc-img/en-blueprint-dance-3.png)

이전에 봤던 Flip Flop 노드처럼, If Branch 노드도 두 개의 플로우 아웃풋인 **If True**와 **If False**를 가지고 있어요. 그러나 번갈아 트리거되는 것이 아니라, **Condition** 데이터 인풋 값에 따라 어느 플로우 아웃풋이 트리거될지가 결정됩니다. Condition이 Yes라면 If True 플로우 아웃풋이 트리거되고, 그렇지 않으면 If False 플로우 아웃풋이 트리거됩니다.

이것을 테스트하기 위해 If Branch 노드의 Enter 플로우 인풋을 클릭해보세요. 현재 Condition이 No로 설정되어 있기 때문에 If False 플로우 아웃풋이 트리거되지만, 이후 연결된 것이 없으므로 아무 일도 일어나지 않아요.

Condition을 Yes로 설정하고 다시 Enter 플로우 인풋을 클릭해보세요. 이번에는 If True 플로우 아웃풋이 트리거되어 캐릭터가 춤을 추기 시작해요!

이제 남은 것은 Condition을 의미 있는 값으로 설정하는 것이에요. 이 경우 우리는 Twitch 포인트 보상 이름이 "댄스"와 동일한지 확인하고 싶어요. 이를 위해, 정확히 그 기능을 하는 **String Equal** 노드를 추가하고 **String Equal → Output Boolean** 데이터 아웃풋을 **If Branch → Condition**에 연결해보세요:

![](/doc-img/en-blueprint-dance-4.png)

String Equal 노드는 매우 간단해요: 두 문자열을 비교하여 같으면 Yes를 출력하고, 다르면 No를 출력해요. (문자열은 "텍스트"를 나타내는 멋진 방법이에요.) 이 경우, **On Twitch Channel Points Redeemed → Reward Title**을 **String Equal → A**에 연결하고 **String Equal → B**를 "댄스"로 설정해요. 그럼 String Equal 노드가 트리거되면, Twitch 포인트 보상 이름이 "댄스"와 같은지 확인하고 그 결과를 If Branch 노드로 전달해요. (참고로 boolean은 "yes 또는 no를 나타내는 멋진 방벙이에요.")

:::tip
보상 이름을 B에 연결하고, A를 "댄스"로 설정해도 됩니다. 이 경우, 순서는 중요하지 않아요.
:::

![](/doc-img/en-blueprint-dance-5.png)

이제 완성됐어요! Twitch 채널에서 "댄스" 보상을 사용해 보세요. 그러면 캐릭터가 춤을 추기 시작할 거예요!

## 댄스 랜덤화

항상 같은 춤 애니메이션을 재생하는 대신 랜덤으로 춤 애니메이션을 선택하고 싶다면 어떻게 할까요? [이전 튜토리얼](buried)에서 Get Random Prop 노드를 기억한다면 **Get Random Character Animation** 노드가 있다는 것도 놀랍지 않을 거예요. 이를 이용해 아래와 같이 blueprint를 설정할 수 있어요:

![](/doc-img/en-blueprint-dance-6.png)

Play One Shot Overlay Animation 노드가 트리거되면, Get Random Character Animation 노드도 트리거되어 **Character Animations** 목록에서 랜덤 애니메이션을 출력해요. 제 경우에는 "Short Dance 1", "Short Dance 2", "Short Dance 3" 중 하나가 재생되도록 설정했어요.

## 결과 랜덤화

VTuber로서 도네이션을 받을 때 예상치 못한 재미 요소를 추가하고 싶을 수 있어요. 단순히 춤을 시작하는 대신, [공중으로 발사](ragdoll) 또는 [인형 더미를 소환](buried)하는 등의 다른 일이 발생할 가능성을 넣는 거죠. 이를 구현해 봅시다!

:::tip
아래 예시에서는 간단히 하기 위해 **Get Random Character Animation** 노드를 제거했지만, 원한다면 그대로 유지할 수 있어요.
:::

먼저, If Branch ↔ Play Character One Shot Overlay Animation 사이의 연결을 제거하세요. 그 다음, If Branch 노드 바로 뒤에 **Switch On Integer** 노드를 추가하고, **Cases** 리스트에 3개의 항목을 아래와 같이 추가하세요:

![](/doc-img/en-blueprint-dance-7.png)

Switch On Integer 노드는 다음과 같이 작동해요: 노드가 트리거되면 **Input Integer** 데이터 인풋의 값을 확인한 후, 해당하는 플로우 아웃풋을 트리거해요. 예를 들어, Input Integer가 1이면 1로 라벨된 플로우 아웃풋이 트리거되고, 2면 2로 라벨된 플로우 아웃풋이, 3이면 3로 라벨된 플로우 아웃풋이 트리거됩니다.

각 플로우 아웃풋을 다른 결과에 연결해 봅시다. 예를 들어, 저는 1로 라벨된 플로우 아웃풋을 Play Character One Shot Overlay Animation 노드에, 2번을 **Play Sounds** 노드에, 3번을 **Spawn Particle** 노드에 연결했어요. 두 노드의 **Source** 옵션을 설정하는 것을 잊지 마세요:

![](/doc-img/en-blueprint-dance-8.png)

이제 테스트해 봅시다! **Switch On Integer → Input Integer** 를 1에서 3 사이의 숫자로 설정하고 Enter 플로우 인풋을 클릭하세요. 모든 것이 잘 설정되었다면, 해당하는 노드가 트리거되는 것을 볼 수 있을 거예요.

![](/doc-img/en-blueprint-dance-9.png)

마지막으로 해야 할 일은 Input Integer를 랜덤화하는 거예요. 이미 예상하셨겠지만, **Generate Random Integer** 노드가 있어요! **Value Min**을 1로, **Value Max**를 3으로 설정해 1에서 3 사이의 정수를 출력하게 해요.

![](/doc-img/en-blueprint-dance-10.png)

아래는 최종 blueprint입니다. 이제 시청자들과 함께 재미있게 즐겨보세요!

![](/doc-img/en-blueprint-dance-11.png)

## If Branch에 대해 더 알아보기

우리는 If Branch 조건으로 String Equal 노드를 사용했지만, 다른 조건들도 사용할 수 있어요. 예를 들어, **Integer Greater Than Or Equal** 노드를 사용해 **On Twitch Channel Points Redeemed → Reward Cost** 가 1,000 이상인지를 확인할 수 있어요. 이 설정을 통해 1,000 포인트 이상이 걸린 Twitch 포인트 보상을 받을 때 캐릭터가 춤을 추게 할 수 있죠.

또한 **Boolean AND**와 **Boolean OR** 노드를 사용해 여러 조건을 결합할 수 있어요. 아래 blueprint는 Twitch 포인트 보상 이름이 "DJ"와 동일하고, 보상을 사용한 사용자의 이름에 "bot"이 포함된 경우를 확인해요:

![](/doc-img/en-blueprint-dance-12.png)

다음 blueprint는 보상이 500 포인트 이상이거나, 보상을 사용한 사용자가 "hakuyatira"일 때 캐릭터가 춤을 추게 합니다::

![](/doc-img/en-blueprint-dance-13.png)

## 상호작용 Blueprints

만약 Onboarding Assistant를 사용해 상호작용 blueprint를 설정해봤다면, 방금 우리가 만든 blueprint와 매우 유사하다는 것을 알았을 거예요! 더 많은 노드가 포함될 수 있지만, 핵심 로직은 같아요: 스트림 이벤트를 받으면 흥미로운 무언가를 실행하는 것이죠.

이제 새로 배운 지식을 바탕으로 자신만의 상호작용 blueprints를 만들 수 있어요! 이전 튜토리얼에서 배운 내용을 활용해 자신만의 독특한 상호작용을 채널에 추가해 보세요. 더 재미있는 요소를 찾고 있다면 계속 읽어보세요!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
