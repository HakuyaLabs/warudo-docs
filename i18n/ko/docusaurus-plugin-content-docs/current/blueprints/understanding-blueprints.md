---
sidebar_position: 10
---

# 당신의 첫 Blueprint를 만들어보세요!

노드 에디터를 처음 열면 너무 많은 노드와 할 수 있는 일들이 많아 당황할 수 있어요. 하지만 걱정하지 마세요! 이 섹션에서는 Blueprint의 기초를 하나씩 차근차근 설명해 드릴게요.

## 첫 번째 Blueprint

간단한 예제로 시작해볼게요. Esc키를 눌렀을 때 카메라가 흔들리게 하고 싶다고 가정해봅시다. 먼저, 도구 모음에서 **Add Blueprint** 버튼을 클릭하여 새 Blueprint를 추가하세요. Blueprint의 이름을  "Esc 키를 눌러 카메라 흔들기"와 같이 더 의미 있는 이름으로 바꿀 수도 있지만, 지금은 그대로 두겠습니다.

![](/doc-img/en-understanding-blueprints-1.png)
<p class="img-desc">새 Blueprint 추가하기.</p>

이 Blueprint는 멋지지만, 아직 유용하지는 않아요. 여기에 몇 가지 노드를 추가해야 합니다. 검색 창에 "on keystroke"를 입력하면 **On Keystroke Pressed** 노드를 볼 수 있을 거예요. 이를 노드 에디터로 끌어다 놓으면, 다음과 같은 화면이 보일 거예요.:

![](/doc-img/en-understanding-blueprints-2.png)
<p class="img-desc">새 Keystroke Pressed 노드 추가하기.</p>

:::tip
만약 잘못된 노드를 끌어다 놓았다면, 해당 노드를 클릭하여 선택한 후 **Delete** 키를 눌러 삭제할 수 있어요. 또는 **Undo** 버튼을 사용해 실행을 취소할 수도 있어요.
:::

잘했어요! 이제 카메라를 흔드는 노드를 추가해야 해요. 검색 창에 **Shake Camera** 를 입력하면 Shake Camera 노드를 볼 수 있을 거예요. 이를 On Keystroke Pressed 노드 옆으로 끌어다 놓으세요. 그리고 당신을 위한 도전 과제가 있어요: On Keystroke Pressed 노드를 Shake Camera 노드에 아래와 같이 연결해보세요.

![](/doc-img/en-understanding-blueprints-3.png)
<p class="img-desc">새 Shake Camera node를 추가하고 On Keystroke Pressed node와 연결하기.</p>

만약 On Keystroke Pressed 노드 **Exit** 옆에 있는 녹색 점을 클릭하여 Shake Camera 노드의 **Enter** 옆에 있는 녹색 점으로 끌어다 놓았다면, 축하해요! 아주 훌륭한 직관을 가지고 계시네요. 참고로 연결을 제거하려면 연결된 양쪽 점 중 하나를 클릭하고 빈공간으로 드래그하면 됩니다.

:::tip
노드 오른쪽에 있는 녹색 점들은 <b style={{color: "green"}}>플로우 아웃풋</b>이라고 하고, 노드 왼쪽에 있는 녹색 점들은 <b style={{color: "green"}}>플로우 인풋</b>이라고 해요. 따라서, 방금 On Keystroke Pressed 노드의 **Exit**을 Shake Camera 노드의 **Enter**에 연결한 거예요.

점들끼리 연결된 방향은 노드가 실행되는 순서를 결정해요. 위 그림에서는 On Keystroke Pressed 노드가 실행되면 Shake Camera 노드가 다음에 실행되도록 설정한 거예요.
:::

여기까지 잘 따라오셨나요? 그렇다면 Esc키를 눌러서 카메라가 흔들리는지 확인해봅시다.

어라, 카메라가 전혀 흔들리지 않네요. 왜 그런 걸까요?

Shake Camera 노드를 좀 더 자세히 살펴보죠. 이 노드에는 **Camera** 데이터 인풋이 있는데, 아직 아무것도 설정되지 않았어요! 드롭다운 메뉴에서 우리의 카메라를 선택해봅시다:

![](/doc-img/en-understanding-blueprints-4.png)
<p class="img-desc">**Camera** 셋팅 데이터 입력.</p>

다시 Esc 키를 눌러봅시다. 만약 카메라가 흔들린다면, 축하합니다! 첫 번째 Blueprint를 성공적으로 만들었어요.

## 노드 간에 데이터를 전달하기

Shake Camera 노드의 데이터 인풋 옆에 있는 검은 점들이 무엇인지 궁금할 수 있어요. 실제로, 이 점들은 **Enter** 옆에 있는 녹색 점들과 매우 비슷하게 생겼어요. 이 점들도 무언가에 연결될 수 있을까요?

맞아요, 연결할 수 있어요! 노드 팔레트(palette)에서 **Get Main Camera** 노드를 노드 에디터로 끌어다 놓고, Get Main Camera 노드의 **Camera** 옆에 있는 검은 점을 클릭한 다음 Shake Camera 노드의 **Camera** 옆에 있는 검은 점으로 끌어다 놓으세요, 이렇게요:

![](/doc-img/en-understanding-blueprints-5.png)
<p class="img-desc">Get Main Camera node를 Shake Camera node에 연결하기.</p>

:::tip
Warudo는 [여러대의 카메라](../assets/camera)를 지원하며, 메인 카메라는 현재 메인 창에 표시되는 카메라입니다.
:::

다시 Esc 키를 눌러보세요. 응? 이번에도 카메라가 흔들리네요! 하지만 이번에는 **Camera** 드롭다운이 사라진 것을 확인하세요. 이는 Shake Camera 노드가 Get Main Camera 노드에서 카메라를 가져오고 있으며, 우리가 드롭다운에서 선택한 카메라는 무시된다는 뜻이에요. (물론, 기술적으로는 동일한 카메라이긴 하지만요.)

Assets 탭에서 다른 카메라를 하나 더 만들어서 새로 만든 카메라로 전환한 후 다시 Esc 키를 눌러보세요. 새로운 카메라가 흔들리는 것을 확인할 수 있을 거예요. 드롭다운에서 선택한 카메라가 아닌 새로 만든 카메라가 흔들리게 됩니다!

:::tip
위에서 설명한 <b style={{color: "green"}}>플로우 인풋/아웃풋</b>과 마찬가지로, 노드 오른쪽에 있는 검은 점들은 <b style={{color: "black"}}>데이터 아웃풋</b>이라고 하고, 노드 왼쪽에 있는 검은 점들은 <b style={{color: "black"}}>데이터 인풋</b>이라고 해요. 따라서, 방금 Get Main Camera 노드의 **Camera** 데이터 아웃풋을 Shake Camera 노드의 **Camera** 데이터 인풋에 연결한 거예요.

데이터 인풋은 노드 간에 데이터를 전달하는 역할을 해요. 이 예제에서는 Shake Camera 노드가 실행될 때, Shake Camera 노드의 **Camera** 데이터 인풋이 Get Main Camera 노드의 **Camera** 데이터 아웃풋으로 설정되어야 한다고 설정한 거예요.
:::

이것은 단지 간단한 예제일 뿐이지만, Blueprint를 만드는 것은 바로 이런 것이라는 점을 기억하세요: 필요한 노드를 찾아 연결하여 무언가가 발생했을 때(예: Esc 키를 누름) Warudo가 무엇을 해야 할지(예: 카메라 흔들기) 알려주는 거예요.

지금까지 배운 내용을 요약해봅시다:

* Blueprint는 **노드**와 **연결**로 구성됩니다. 연결에는 두 가지 유형이 있는데: <b style={{color: "green"}}>플로우 연결</b>과 <b style={{color: "black"}}>데이터 연결</b>이며, 각 노드는 플로우 인풋/아웃풋, 데이터 인풋/아웃풋 모두를 가질 수 있어요. 데이터 인풋은 노드에 직접 설정하거나 다른 노드의 데이터 아웃풋에 연결할 수 있어요.

* 연결을 생성하려면 인풋/아웃풋 포트를 클릭한 후 다른 노드의 아웃풋/인풋 포트로 드래그해 놓으세요. <b style={{color: "green"}}>플로우 연결</b> 은 노드가 실행되는 순서를 결정하며, 왼쪽에서 오른쪽으로 진행됩니다. <b style={{color: "black"}}>데이터 연결</b> 는 노드간에 데이터를 전달하는 역할을 하며, 역시 왼쪽에서 오른쪽으로 진행됩니다.

:::info
플로우 인풋은 여러 개의 플로우 아웃풋에 연결될 수 있지만, 플로우 아웃풋은 하나의 플로우 인풋에만 연결될 수 있어요. 그렇지 않으면 어느 노드가 먼저 실행되어야 하는지 불분명해질 거예요.

마찬가지로, 데이터 아웃풋은 여러 개의 데이터 인풋에 연결될 수 있지만, 데이터 인풋은 하나의 데이터 아웃풋에만 연결될 수 있어요. 그렇지 않으면 어느 노드에서 데이터가 전달되어야 하는지 불분명해질 거예요.
:::

조금 버거우신가요? 걱정하지 마세요, 다음 섹션에서 더 많은 예제를 함께 다룰 거예요.

## 데이터 타입

참고로, 데이터 연결의 양 끝의 데이터 타입은 호환되어야 해요. 위의 예제에서, **Get Main Camera → Camera** (데이터 타입: camera 에셋)을 **Shake Camera → Sustain Time** (데이터 타입: "float," 즉 소수점 숫자)와 연결할 수는 없어요. 아래의 사진처럼 포트 위에 마우스를 올려두면 데이터 타입을 확인할 수 있어요:

![](/doc-img/en-blueprints-2.png)
<p class="img-desc">포트 위에 마우스를 올려 데이터 타입 확인하기.</p>

대부분의 경우 데이터 타입에 대해 걱정할 필요가 없어요. 왜냐하면 누구나 카메라가 숫자가 될 수 없다는 것을 알기 때문이죠!

## Blueprints 비활성화하기

Blueprint는 Blueprint 이름 옆에 있는 눈 아이콘을 클릭하여 비활성화할 수 있어요. Blueprint가 비활성화되면 해당 Blueprint의 노드들은 작동하지 않아요. 예를 들어, 위의 예제에서 Blueprint가 비활성화된 상태에서 Esc 키를 누르면, On Keystroke Pressed 노드가 작동하지 않아 연결된 플로우 인풋/아웃풋들이 실행되지 않으며, 결과적으로 카메라는 흔들리지 않게 됩니다.

:::info
노드들 간에 연결된 플로우가 실행되거나 데이터가 전달되고 있는지 확인하려면, 연결선에 공이 굴러가는지 확인하세요:

![](/doc-img/en-blueprints-overview-5.webp)
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'WillyCho', github: 'Willycho'},
  ],
}} />
