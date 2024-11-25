---
sidebar_position: 100
---

# 낮잠 자기

스트리밍 도중 잠깐 쉬는 건 흔한 일이에요. Warudo에서는 얼굴 추적이 중단되면 캐릭터가 서서히 기본 포즈와 표정으로 전환돼요. 이 튜토리얼에서는 기본 포즈 대신 캐릭터가 자연스럽게 잠자는 포즈와 표정으로 전환되도록 만들어, 캐릭터에 약간의 현실감을 더할 거예요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/nap.mp4" /></div>
<p class="img-desc">일하다가 잠들었어요!</p>

:::info
이 튜토리얼은 iFacialMocap이나 MediaPipe를 사용해 얼굴을 추적하는 상황을 전제로 해요. 다른 얼굴 추적 시스템은 얼굴 추적이 중단되었을 때 신호를 제공하지 않아 작동하지 않을 수 있어요.
:::

## 얼굴 추적 Blueprint

얼굴 추적 blueprint를 열어봐요! 온보딩 과정에서 선택한 옵션에 따라 당신의 blueprint가 아래와 다르게 보일 수 있지만, 기본 아이디어는 같아요. 그리고 그만큼 복잡해 보일 수 있어요—노드와 연결선이 엄청 많으니까요!

![](/doc-img/en-blueprint-nap-1.png)

모든 노드를 하나하나 살펴보지는 않겠지만, 몇 가지 부분으로 나누어 설명해 볼게요. 먼저, 왼쪽에 있는 이 노드 시퀀스를 볼 수 있을 거예요:

![](/doc-img/en-blueprint-nap-2.png)

이건 쉽죠! [이전 튜토리얼](balloon#resetting-bone-scale)에서 On Disable Blueprint 노드를 이미 봤을 거예요. 이 노드는 blueprint가 비활성화될 때 트리거돼요. 그리고 이 얼굴 추적 blueprint는  **Character → Motion Capture**를 끌 때 비활성화돼요. 그래서 모션 캡처를 끄면 **Reset Character Tracking BlendShapes** 노드로 캐릭터의 얼굴 표정이 리셋되고 **Reset Overridden Character Bones** 노드로 캐릭터의 뼈대(예: 머리, 눈)가 리셋돼요.

이제 blueprint 오른쪽을 살펴볼까요:

![](/doc-img/en-blueprint-nap-3.png)

[On Update node](balloon#on-update)노드도 이미 익숙할 거예요. 이 노드는 Warudo가 실행되는 매 프레임마다 트리거돼요. 이 노드 시퀀스는 이렇게 말하는 거예요: 매 프레임마다 캐릭터의 블렌드셰이프 (**Set Character Tracking BlendShapes**), 뼈대 (**Override Character Bone Rotation Offsets**), 그리고 루트 위치 (**Override Character Root Position**)를 업데이트해요. 그런데 어떤 블렌드셰이프와 뼈대, 그리고 루트 위치를 업데이트하는 걸까요? 그건 blueprint 중간에 있는 노드들의 역할이에요.

![](/doc-img/en-blueprint-nap-16.png)

## 스위치 블렌드셰이프 리스트

다행히도, 이 튜토리얼에서는 몇 가지 노드만 살펴보면 돼요. **Get iFacialMocap Receiver Data** 노드(또는 MediaPipe를 사용하는 경우 **Get MediaPipe Receiver Data** 노드)를 찾아보세요; 이 노드는 얼굴 추적 데이터를 제공하는 "source" 노드예요.

![](/doc-img/en-blueprint-nap-4.png)

현재 노드 연결이 너무 가까이 있어서, 더 명확하게 보이도록 Get iFacialMocap Receiver Data 노드를 아래쪽 왼쪽으로 이동시켜 볼게요:

![](/doc-img/en-blueprint-nap-5.png)

이제 blueprint를 확대하고 이동해서 다음 3개의 노드를 찾아보세요: Get iFacialMocap Receiver Data, Empty BlendShape List, 그리고 Switch BlendShape List. 아직 **Switch BlendShape List** 노드에 대해 잘 모르지만, 연결 상태만 보고 이 노드가 어떤 역할을 하는지 추측할 수 있나요?

![](/doc-img/en-blueprint-nap-6.png)

이제 하나씩 확인해보죠. 먼저 **Get iFacialMocap Receiver Data → Is Tracked**가 **Switch BlendShape List → Condition**에 연결되어 있는 것을 볼 수 있어요. 이 연결은 Switch BlendShape List 노드가 얼굴이 추적되는지 여부를 신경 쓴다는 걸 의미해요. 얼굴이 추적되면 Condition은 Yes이고, 그렇지 않으면 No가 됩니다.

다음으로 **Empty BlendShape List → Output**이 **Switch BlendShape List → If False**에, **Get iFacialMocap Receiver Data → BlendShapes**가 **Switch BlendShape List → If True**에 연결되어 있어요. 흠, 이제 점점 감이 오네요!

실제로, Switch BlendShape List 노드는 현재 얼굴이 추적되고 있는지 확인해요. 만약 얼굴이 추적되고 있다면 추적된 blendshapes를 아웃풋으로 넘겨서 캐릭터의 표정을 반영하고, 그렇지 않으면 빈 blendshape list를 아웃풋으로 넘겨서 캐릭터의 표정을 없애요.

이 노드를 더 강력하게 만드는 점은 두 blendshape list 사이를 부드럽게 전환할 수 있다는 점이에요. **To True/False Transition Time**, **To True/False Transition Delay** 그리고 **To True/False Transition Easing** 옵션을 통해 얼굴이 추적되거나 추적되지 않을 때 캐릭터의 표정 변화를 정밀하게 제어할 수 있어요. 예를 들어, To False Transition Time을 0.5초로 설정하고 To False Transition Delay를 1초로 설정하면, 얼굴이 더 이상 추적되지 않고 1초 후에 캐릭터의 표정이 0.5초 동안 부드럽게 빈 blendshape list로 전환돼요(즉, 자연스러운 표정이 되는 거죠).

얼굴이 더 이상 추적되지 않을 때 캐릭터의 표정을 변경하려면, 현재 빈 blendshape list가 입력된 Switch BlendShape List → If False인풋을 수정하면 돼요. **BlendShape List Set BlendShape** 노드를 그 사이에 추가해서 리스트에 blendshape을 더할 수 있어요.

![](/doc-img/en-blueprint-nap-7.png)

위의 예시에서는 하나의 엔트리만 있는 blendshape list를 만들고 있어요: `Blink` 를 1로 설정한 거죠. 이 blendshape list는 얼굴 추적이 중단될 때 아웃풋으로 전달되어, 캐릭터가 눈을 감게 돼요.

:::tip
만약 캐릭터에 `Blink` 블렌드셰이프가 없다면, 캐릭터와 함께 제공되는 `eyeBlinkLeft`와 `eyeBlinkRight` 같은 blink 블렌드셰이프를 사용할 수 있어요. 여러 개의 블렌드셰이프를 설정하려면, 간단하게 BlendShape List Set BlendShape 노드를 추가로 연결해 주면 돼요.
:::

이제 iPhone 전면 카메라 앞에 손을 대어 얼굴 추적을 차단해보세요. (MediaPipe를 사용하는 경우, 얼굴을 카메라에서 멀리 이동시키면 돼요.) 그러면 캐릭터가 눈을 감는 것을 확인할 수 있을 거예요!

![](/doc-img/en-blueprint-nap-13.png)

기본 설정에서는 눈을 빠르게 감게 되므로, 좀 더 자연스러운 전환을 위해 **To False Transition Time**과 **To False Transition Delay** 옵션을 조정하는 것이 좋아요. 저는 각각 2초와 1초로 설정했어요:

![](/doc-img/en-blueprint-nap-8.png)

## 스위치 로테이션 리스트

:::info
이 섹션을 읽기 전에, 온보딩 과정에서 기본적으로 활성화된 기본 머리 애니메이션(기본 상태에서 트래킹하지 않을 때 활성화됨)이 활성화되어 있다면, 먼저 비활성화해야 해요. **Generate Idle Head Animation** 노드를 찾아 **Enabled**를 No로 설정하세요:

![](/doc-img/en-blueprint-nap-12.png)
:::


캐릭터가 고개를 옆으로 기울이는 잠자는 포즈로 전환하려면, 우리가 방금 했던 것과 매우 비슷한 과정을 따르게 돼요. 이번에도 Get iFacialMocap Receiver Data 노드를 아래쪽으로 이동시켜 보세요:

![](/doc-img/en-blueprint-nap-9.png)

오른쪽에 있는 **Default Character Rotation List**와 **Switch Rotation List** 노드가 보이도록 해요:

![](/doc-img/en-blueprint-nap-10.png)
![](/doc-img/en-blueprint-nap-11.png)

3D 캐릭터의 포즈는 각 뼈가 얼마나 회전하는지에 따라 정의돼요. 그래서 여기서는 블렌드셰이프 대신 "뼈 회전"을 많이 보게 되는 거예요. Switch Rotation List 노드는 얼굴이 추적되고 있는지 확인하고, 추적 중이면 뼈 회전 데이터를 아웃풋으로 전달하고, 그렇지 않으면 기본 회전 리스트를 아웃풋으로 전달해요.

고개를 옆으로 기울이려면, **Offset Character Bone Rotation List** 노드를 추가해 머리 회전을 조정할 수 있어요:

![](/doc-img/en-blueprint-nap-15.png)

저는 **Head**를 **Character Bones** 리스트에 추가하고 **Rotation Offset** 을 (15, 0, -20)으로 설정했어요. 이는 머리가 앞쪽으로 15도, 오른쪽으로 20도 회전된다는 의미예요. 원하는 대로 회전을 조정하거나, 더 많은 뼈를 리스트에 추가해 캐릭터의 잠자는 포즈를 더욱 복잡하게 만들 수도 있어요!

:::tip
숫자를 직접 입력하는 대신, X/Y/Z 레이블을 왼쪽 또는 오른쪽으로 드래그해 숫자를 조정할 수도 있어요. 이 트릭은 모든 숫자 입력에 대해 작동해요!
:::

이제 얼굴 추적이 중단되면, 캐릭터가 고개를 옆으로 기울이게 될 거예요!

![](/doc-img/en-blueprint-nap-14.png)


<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
