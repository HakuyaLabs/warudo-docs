---
sidebar_position: 10
---

# 캐릭터

캐릭터는 Warudo의 핵심이에요. Warudo는 표준 [VRM](https://vrm.dev/en/univrm/) 모델 형식을 지원해요. 만약 모델 형식이 VRM이 아니라 MMD나 VRChat 모델인 경우, [Mod SDK](../modding/mod-sdk.md) 를 사용해 `.warudo` 형식으로 내보내고 Warudo에 로드할 수 있어요.

캐릭터 파일은 Warudo의 데이터 폴더 내 `Characters` 하위 폴더에 저장해야 해요.

:::info
데이터 폴더를 찾을 수 없나요? **Menu → Open Data Folder**를 클릭하여 열어보세요.
:::

## 설정

기본적으로, 화면에는 이미 캐릭터가 하나 있어야 해요. 새로운 캐릭터를 추가하려면 **Add Asset** 메뉴를 사용하세요.

캐릭터 설정을 위해 **Onboarding Assistant → Basic Setup → Get Started** 를 사용하는 것을 추천해요. 이는 캐릭터 파일을 자동으로 가져오고, 모션 캡처를 설정하며, VRM 표현을 가져와 설정해요.

다른 방법으로, 캐릭터 asset에서 **Source**를 선택하고 **Setup Motion Capture**를 클릭하여 모션 캡처를 설정하고, **Import VRM Expressions**를 클릭하여 VRM 표현을 가져오는 방식으로 수동 설정할 수도 있어요.

## 모션 캡처 {#mocap}

캐릭터의 모션 캡처를 설정하려면 [모션 캡처](../mocap/overview#setup) 페이지를 참조하세요. 모션 캡처를 설정한 후, 추적을 보정하고 캐릭터 asset 내에서 추적 blueprint의 특정 부분에 직접 접근할 수 있어요.

![](/doc-img/en-character-1.png)
<p class="img-desc">빠른 보정 및 blueprint 탐색 패널.</p>

## 표현 {#expressions}

표현은 얼굴 추적 외에도 캐릭터의 얼굴 표정을 제어하는 방법이에요. 캐릭터 asset은 VRM 표현 ([VRM BlendShapeClips](https://vrm.dev/en/univrm/blendshape/univrm_blendshape/)로도 알려져 있음)과 사용자 정의 표현 모두를 지원해요.

온보딩 중에 Warudo는 캐릭터의 모든 VRM 표현을 자동으로 가져오고, 해당 표현에 단축키를 추가하는 blueprint를 생성해요. 또한, **Import VRM Expressions**를 클릭하여 VRM 표현을 수동으로 가져오고,  **Generate Key Binding Blueprint**를 클릭하여 키 바인딩을 위한 blueprint를 생성할 수도 있어요.

:::tip
만약 `.warudo` 모델을 사용 중이지만,  GameObject에 `VRMBlendShapeProxy` 컴포넌트가 있다면, Warudo는 여전히 VRM 표현을 가져올 수 있어요.
:::

표현 목록에서 각 표현을 확장하여 미리보기(**Enter Expression**)하고 설정을 커스터마이즈할 수 있어요.

![](/doc-img/en-character-2.png)
<p class="img-desc">표현 확장.</p>

표현의 **이름**을 설정할 수 있으며, 이는 blueprint에서 식별하는 데 사용돼요. 또한, 표현의 **레이어**를 설정할 수 있어요. 표현을 전환할 때 같은 레이어의 표현은 페이드 아웃되고, 다른 레이어의 표현은 겹칠 수 있어요.

:::info
VRM 표현을 가져올 때, VRM 모델의 기본 BlendShapeClips(예: Joy, Angry, Sorrow, Fun/Surprised)는 레이어 0에 배치되고, 모델러가 추가한 BlendShapeClips는 레이어 1, 2, 3 등에 배치돼요.
:::

만약 표현이 이미 모델의 눈을 감고 있는 경우, **Disable Eye Blink Tracking**을 활성화하여 눈이 더 감기는 것을 방지할 수 있어요. 비슷하게, **Disable Mouth Tracking**과 **Disable Brow Tracking** 옵션을 사용하여 얼굴 추적이 입과 눈썹 블렌드쉐이프를 제어하지 않도록 할 수 있어요.

**Target BlendShapes** 목록에는 이 표현이 활성화될 때 제어되는 모든 블렌드쉐이프가 포함돼요. 이 목록에서 블렌드쉐이프를 추가하거나 제거할 수 있으며, 각 블렌드쉐이프에 대해 **목표값(Target Value)**, **기간 입력(Enter Duration)**, **완화 입력(Enter Easing)**, **지연 입력(Enter Delay)**, **종료 기간(Exit Duration)**, **완화 및 지연 종료(Exit Easing and Exit Delay)** 를 커스터마이즈할 수 있어요.

기본적으로 Warudo는 표현을 전환할 때 0.4초의 페이드 인 및 페이드 아웃 지속 시간을 사용해요. **Target BlendShapes**에서 각 블렌드쉐이프에 대해 **Enter Duration**과 **Exit Duration**을 커스터마이즈할 수 있으며, 페이딩을 완전히 비활성화하려면 **Is Binary** 옵션을 활성화할 수 있어요.

### 트리거 조건 {#trigger-conditions}

표현은 보통 단축키로 트리거되지만, 얼굴 추적만으로도 표현을 트리거할 수도 있어요!

설정하려면 **Trigger Conditions** 목록에 새 항목을 추가하세요. 표현 트리거 **Conditions**를 설정하고 필요한 경우 다른 옵션도 커스터마이즈하세요. 예를 들어, 아래 설정은 `mouthSmileLeft`와 `mouthSmileRight` 블렌드쉐이프가 모두 0.5보다 클 때 표현을 트리거해요.

![](/doc-img/en-character-4.png)

**Trigger Conditions** 목록에 여러 항목을 추가할 수 있으며, 항목의 **Conditions** 중 하나라도 충족되면 표현이 트리거돼요.

:::info
조건은 얼굴 추적 블렌드쉐이프가 아닌 모델 블렌드쉐이프를 기반으로 한다는 점을 유의하세요. ARKit 호환 모델을 사용하는 경우, ARKit 블렌드쉐이프를 조건으로 선택하면 돼요. 그렇지 않은 경우, 얼굴 추적에서 사용하는 해당 모델 블렌드쉐이프를 찾아야 할 수도 있어요.
:::

### 고급

**Target Material Properties** 목록에는 이 표현에 의해 제어되는 Unity 소재 속성이 포함돼요. 소재 이름과 속성 이름을 미리 알고 있어야 한다는 점을 유의하세요. 이는 Unity에서 확인할 수 있어요.

**Constrained BlendShapes** 목록에는 이 표현이 활성화될 때 제어되는 모든 블렌드쉐이프가 포함돼요. 블렌드쉐이프를 제어하면 캐릭터의 얼굴 표현을 정밀하게 조절할 수 있으며, 블렌드쉐이프 간의 전환이 항상 부드럽게 이루어지도록 할 수 있어요. 예를 들어, 표현이 활성화될 때 모델의 입이 일정 이상 열리지 않도록 하려면 이 목록에 새 항목을 추가하고, **Constrained BlendShape**를 (예: `JawOpen`) 선택한 다음, **Constrained Value Min**과 **Constrained Value Max**를 원하는 범위로 설정할 수 있어요 (예: 0에서 0.5).

선택적으로, **Constraint BlendShape** 를 설정하여 제어된 블렌드쉐이프와의 매핑을 설정할 수 있어요. 예를 들어, 다음 설정은 `Smile` 블렌드쉐이프 값에 따라 `JawOpen` 블렌드쉐이프 값이 달라지도록 해요. `Smile`이 0일 때, `JawOpen`은 0에서 1까지 값을 가질 수 있고, `Smile`이 1일 때, `JawOpen`은 0에서 0.25로 제한돼요.

![](/doc-img/en-character-3.png)
<p class="img-desc">`JawOpen` 블렌드쉐이프 제어.</p>

**Toggle GameObjects** 목록에는 이 표현이 활성화될 때 토글되는 모든 자식 게임오브젝트가 포함돼요. 예를 들어, 캐릭터가 웃을 때 파티클 효과의 가시성을 토글하는 데 사용할 수 있어요.

마지막으로, 표현 목록 아래에서 **Default BlendShapes**와 **Default Material Properties**를 찾을 수 있어요. 이는 어떤 표현이나 얼굴 추적도 활성화되지 않았을 때 사용돼요.

## 애니메이션 {#animation}

Warudo는 캐릭터에 애니메이션을 재생하는 것을 지원해요. 더 나아가, 호환되는 상체 추적 blueprint(예: [MediaPipe](../mocap/mediapipe.md), [RhyLive](../mocap/rhylive.md))를 사용하는 경우, 애니메이션이 모션 캡처와 자동으로 블렌딩되어 재미있거나 친밀한 방식으로 시청자와 상호작용할 수 있어요.

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180953465-7b91a347-452d-4c03-b860-45dc58ec0392.mp4" /></div>
<p class="img-desc">여기서 상체의 구부림은 대기 애니메이션에서 나오고, 머리와 손의 움직임은 모션 캡처에서 나와요. 손 추적이 끊기면 아바타의 손이 대기 애니메이션으로 부드럽게 전환돼요.</p>

Warudo에서는 세 가지 유형의 애니메이션이 있어요:

* **Idle Animation**: 다른 애니메이션이 재생되지 않을 때 기본적으로 재생되는 애니메이션.

  ![](/doc-img/en-character-5.png)
  <p class="img-desc">대기 애니메이션 선택.</p>
* **Overlaying Animations**: Idle Animation 위에 겹쳐서 재생되는 애니메이션.

  예를 들어, "Cat" 애니메이션을 좋아하고 사용하고 싶지만, 동시에 캐릭터가 침대에 앉아있기를 원한다고 가정해보세요. 두 가지 애니메이션을 결합하려면, **Idle Animation** 을 앉아있는 애니메이션으로 설정하고, **Overlaying Animations** 목록에 새 항목을 추가하여 **Animation**을 "Cat"으로 설정한 후, **Mask Upper Body**를 클릭하여 "Cat" 애니메이션이 상체에만 영향을 미치도록 할 수 있어요.

  ![](/doc-img/en-character-6.png)
    <p class="img-desc">"Cat" 애니메이션을 앉아있는 애니메이션과 결합하여 overlaying animations를 사용하는 모습.</p>

  ![](/doc-img/en-character-7.png)
    <p class="img-desc">"Cat" 애니메이션이 상체에만 영향을 미치는 모습.</p>

  **overlaying animations**는 원하는 만큼 추가할 수 있어요. 각 애니메이션 레이어는 자체 **마스크된 신체 부위(Masked Body Parts)**, **가중치(Weight)**, 그리고 **속도(Speed)** 를 할당할 수 있어 몸의 다른 부분이 서로 다른 애니메이션을 재생할 수 있어요. 목록에서 애니메이션이 아래에 있을수록 우선순위가 높아요.

  <div className="video-box"><iframe class="bilibili-video" src="//player.bilibili.com/player.html?aid=985941728&bvid=BV1Zt4y1c7Re&cid=843191749&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe></div>
  <p class="img-desc">overlaying animations 데모. 출처: https://www.bilibili.com/video/BV1Zt4y1c7Re </p>
* Transient animations: blueprint로 트리거되는 일회성 애니메이션. 예를 들어, Twitch 리딤을 받을 때 재생되는 짧은 춤 애니메이션이 이에 해당돼요. 자세한 내용은 [blueprint 튜토리얼](../blueprints/overview)을 참조하세요.

추가적으로 신체 애니메이션 외에도 **Breathing Animation**(호흡 애니메이션)과 **Swaying Animation**(흔들림 애니메이션)을 설정할 수 있으며, **Override Hand Poses**(손 포즈 덮어쓰기)도 설정할 수 있어요. 예를 들어, 캐릭터의 손을 평화 기호와 같은 특정 포즈로 설정할 수 있어요.

마지막으로, **Additional Bone Offsets**을 사용하여 캐릭터의 자세를 약간 조정할 수 있어요. 예를 들어, 캐릭터의 머리를 한쪽으로 몇 도 기울이고 싶을 때 사용할 수 있어요.

:::info
기본적으로, idle animation, overlay animations, override hand poses, 그리고 [body IK](./#body-ik)의 우선순위는 모두 모션 캡처보다 **낮아요.**

예를 들어, 오른손에 대한 override hand pose를 설정했더라도, MediaPipe와 같은 추적 시스템으로 오른손이 추적되고 있다면, 모델은 override hand pose 대신 오른손의 실제 포즈를 따르게 돼요. override hand pose가 모션 캡처보다 우선순위를 갖도록 하려면, hand pose 설정에서 **High Priority**(높은 우선순위)를 활성화할 수 있어요.
:::

## Look At IK {#look-ik}

Look At IK는 캐릭터가 화면에서 지정된 목표물(예: 카메라)을 바라보도록 하는 데 사용돼요. 이는 완벽한 셀피를 찍을 때 유용해요!

:::tip
시청자들과의 눈 맞춤을 유지하고 싶다면, 얼굴 추적을 설정할 때 Look At을 활성화하는 것이 좋습니다 (기본적으로 활성화되어 있어요). 자세한 내용은 [얼굴 추적 커스터마이징](../mocap/face-tracking)을 참조하세요.
:::

Look At IK, 를 사용하려면, 간단히 활성화하고 **Target**을 캐릭터가 바라봐야 하는 목표물로 설정하세요. 다양한 가중치를 조정하여 캐릭터의 머리, 눈, 몸이 목표물을 바라보도록 회전하는 정도를 조절할 수 있어요. **Clamp Weight** 옵션을 사용하여 머리, 눈, 몸의 회전 범위를 제한할 수 있어요. 값이 클수록 회전 범위는 작아집니다.

## Body IK {#body-ik}

Body IK는 화면에서 지정된 목표물을 따라 캐릭터의 척추나 팔다리가 움직이도록 하는 데 사용돼요.

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">Body IK 요약 설명.</p>

Body IK를 사용하려면, 척추 또는 손/발에 대해 이를 활성화하고 **IK Target**을 캐릭터가 따라야 하는 목표물로 설정하세요. IK target은 보통 [카메라](camera.md), [소품](prop.md), or an [앵커](anchor.md)가 됩니다. 현재 신체 부위의 위치에 임시 앵커를 생성하려면 **Create Temporary IK Target Anchor At Current Position**을 클릭하세요. 작업이 끝나면 **Remove Temporary IK Target Anchor**를 클릭하여 임시 앵커를 제거할 수 있어요.

:::tip
임시 앵커를 생성하면 모델의 손을 이상적인 위치에 고정하여 머리 움직임으로 인해 손이 좌우로 흔들리는 것을 방지할 수 있어요. 이는 특정 포즈에 매우 유용할 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039288-aac4e485-c9f9-4686-948e-75f783586b25.mp4" />
Before
</div>

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039290-13b91459-110d-4706-9c77-3516b1c3b175.mp4" />
After
</div>
</div>
:::

**Bend Goal Target**과 **Bend Goal Weight** 옵션을 사용하여 팔꿈치와 무릎의 회전을 제어할 수 있어요. **Bend Goal Target**은 보통 [앵커](anchor.md)로 설정됩니다.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-character-8.png"  />
<p class="img-desc">Bend goal 활성화</p>
</div>
<div>
<img src="/doc-img/en-character-9.png"  />
<p class="img-desc">Bend goal 활성화</p>
</div>
</div>

## Ragdoll

Ragdoll은 캐릭터가 물리 객체에 의해 영향을 받고, 화면에서 객체를 통과하지 않도록 방지해요.

**Muscle Spring**과 **Muscle Damper** 를 사용하여 캐릭터 근육의 경직도를 조절할 수 있어요. 값이 클수록 캐릭터의 근육이 더 경직돼요.

자체 관통(캐릭터의 손이 몸을 관통하는 것)을 방지하려면 **Internal Collisions**를 활성화하세요. 최상의 결과를 위해 **Edit Ragdoll**을 클릭하여 콜라이더를 수동으로 조정해야 해요.

:::caution
Ragdoll을 활성화하면 캐릭터가 더 현실적으로 보일 수 있지만, 물리 엔진의 결함으로 인해 캐릭터가 예기치 않게 행동할 수도 있어요. 필요할 때만 ragdoll을 활성화하는 것을 추천해요.
:::

일부 노드는 asset 설정과 상관없이 임시로 ragdoll을 활성화한다는 점을 유의하세요. 예를 들어, **Throw Prop At Character** 노드는 소품이 캐릭터를 맞힐 때 캐릭터에 임시로 ragdoll을 활성화해요.

## 메쉬(Meshes)

모델의 메쉬와 스킨드 메쉬를 토글할 수 있어요.

:::info
[VRoid Studio](https://vroid.com/en/studio)에서 내보낸 모델은 보통 `Body`와 `Face` 두 개의 메쉬만 가지고 있다는 점을 유의하세요. 더 상세한 모델은 캐릭터의 옷, 액세서리, 꼬리, 동물 귀 등을 개별 메쉬로 나누는 경우가 많으며, 이 기능을 사용해 캐릭터의 재킷을 토글하는 등 다양한 작업을 할 수 있어요.
:::

:::tip
Blueprint에서 메쉬를 토글하려면, **Toggle Character Meshes** 노드를 사용할 수 있어요.
:::

## 크기 조정(Scaling)

**Transform → Scale** 속성을 사용하여 캐릭터의 크기를 조정할 수 있어요. 하지만, 이는 ragdoll, IK, 일부 모션 캡처 시스템(예: [Leap Motion](../mocap/leap-motion))과의 호환성 등 기능을 손상시킬 수 있어요. 캐릭터의 크기를 조정해야 한다면, 모델을 Unity나 Warudo에 가져오기 전에 3D 모델링 소프트웨어에서 크기를 조정하는 것을 추천해요.

## 자주 묻는 질문 {#FAQ}

### 얼굴 추적을 통해 표현을 자동으로 트리거하려면 어떻게 하나요?

**Trigger Conditions** 기능을 사용하여 표현을 자동으로 트리거할 수 있어요. 자세한 내용은 [트리거 조건](#trigger-conditions) 섹션을 참조하세요.

### 모델의 포즈가 너무 공격적이에요 / 너무 부드러워요 / 팔이 몸에 파묻혀요 / 팔이 몸에서 너무 멀리 떨어져 있어요.

**Animation → Additional Bone Offsets**를 설정해보세요. 두 어깨 관절의 회전 각도는 캐릭터의 성격 인식에 큰 영향을 미칠 수 있어요!

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-character-10.png"  />
<p class="img-desc">Additional bone offsets 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-character-11.png"  />
<p class="img-desc">Additional bone offsets 활성화：왼쪽어깨: (10, 0, -10), 오른쪽어깨: (10, 0, 10).</p>
</div>
</div>

### 표현의 단축키를 어떻게 변경하나요??

**Expression Key Bindings** blueprint를 열고 **On Keystroke Pressed** 노드를 찾아보세요. 그런 다음, 필요에 따라 수정하세요. 예를 들어, 원래 blueprint에서 Alt+1을 누르면 Joy 표현이 활성화됩니다:

![](/doc-img/en-expression-1.webp)

다음은 단축키를 Ctrl+Shift+T로 변경하는 모습

![](/doc-img/en-expression-2.webp)

### 특정 기간 동안 표현을 활성화한 다음 일정 시간이 지나면 자동으로 비활성화할 수 있나요?

이를 위해, **Expression Key Bindings** blueprint에서 **Toggle Character Expression** 노드의 **Is Transient**를 활성화하세요. 표현의 지속 시간은 표현 내 각 BlendShape의 **Exit Delay**에 의해 결정됩니다.

![](/doc-img/en-expression-5.webp)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
