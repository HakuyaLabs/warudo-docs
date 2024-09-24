---
sidebar_position: 10
---

# 캐릭터 모드

Unity로 가져올 수 있는 캐릭터 모델이라면 Warudo에 임포트할 수 있어요! 여기에는 FBX 모델이나 [VRChat 아바타](https://booth.pm/en/search/avatar?tags%5B%5D=3D+Character)도 포함되죠. VRM 모델을 사용하더라도, 캐릭터 모드를 만들면 커스텀 셰이더를 추가하거나 [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)과 [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 같은 더 나은 물리 컴포넌트를 적용하는 등의 이점이 있어요.

## 설정

### 1단계: 모델 준비

먼저 캐릭터 모델을 모딩 프로젝트에 임포트하세요. 모델은 [Animator](https://docs.unity3d.com/ScriptReference/Animator.html) 컴포넌트가 있는 휴머노이드 모델이어야 해요. 만약 모델에 Animator 컴포넌트가 없다면, 모델 임포트 설정에서 **Animation Type**을 Humanoid로 설정한 후 **Apply**를 클릭하세요.

![](/doc-img/en-character-mod-1.webp)

만약 FBX 모델을 사용 중이라면, 모델 임포트 설정에서 **R/W Enabled**가 체크되어 있는지 확인하세요.

![](/doc-img/en-character-mod-2.webp)

### 2단계: 캐릭터 설정

씬에 캐릭터를 배치하고 선택하세요. 메뉴 바에서 **Warudo → Setup Character...** 를 선택하세요. Setup Character 창에서 **Setup selected GameObject as character mod**를 선택하세요:

![](/doc-img/en-character-mod-3.webp)

**Character**라는 이름의 프리팹이 모드 폴더에 생성된 것을 확인할 수 있을 거예요:

![](/doc-img/en-character-mod-4.webp)

:::tip
캐릭터의 뼈대가 꼬이거나 비틀어진 것을 발견했다면 [뼈대 정상화](#normalize-bones) 섹션을 참고하세요.
:::

### 3단계: 모드 내보내기

**Warudo → Build Mod**를 선택하고, 생성된 `.warudo` 파일이 `Characters` 데이터 폴더에 들어갔는지 확인하세요.

## 스케일링

Warudo에서는 **Character → Transform → Scale** 속성을 사용해 캐릭터의 크기를 조정할 수 있어요. 하지만 이렇게 하면 래그돌, IK, 또는 몇몇 모션 캡처 시스템 (예: [Leap Motion](../mocap/leap-motion))과의 호환성이 깨질 수 있어요. 캐릭터의 크기를 조정해야 할 경우, Unity나 Warudo에 모델을 임포트하기 전에 3D 모델링 소프트웨어에서 미리 조정하는 것을 권장해요.

## 서드파티 컴포넌트

Warudo에는 캐릭터 모드에서 사용할 수 있는 몇 가지 서드파티 컴포넌트가 포함되어 있어요. 자주 사용하는 컴포넌트는 다음과 같아요:

* [VRM](https://vrm.dev/en/univrm/) VRM Spring Bones, VRM Spring Bone Colliders와 같은 컴포넌트
* [Animation Rigging](https://docs.unity3d.com/Packages/com.unity.animation.rigging@latest) Rotation Constraint 같은 컴포넌트
* [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones) (런타임에 자동으로 Dynamic Bone으로 변환됨)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11
* [Magica Cloth 2](https://assetstore.unity.com/packages/tools/physics/magica-cloth-2-242307) 2.6.0

Dynamic Bone과 Magica Cloth는 Warudo SDK에 포함되어 있지 않으므로 해당 Unity 패키지를 직접 임포트해야 해요.

Warudo는 모드에 C# 스크립트를 포함할 수 있기 때문에, 다른 서드파티 Unity 컴포넌트도 사용할 수 있어요! 하지만 [커스텀 C# 스크립트](mod-sdk#custom-scripts) 섹션에서 설명한 제한 사항을 참고해야 해요.

## 애니메이션

캐릭터에 머리 색깔 변경이나 날개 퍼덕임과 같은 커스텀 애니메이션을 추가하고 싶을 수 있어요. 애니메이션의 성격에 따라 다음 방법 중 하나를 사용할 수 있어요:

* **애니메이션이 인체 뼈대만 제어하는 경우:** [캐릭터 애니메이션 모드](character-animation-mod)를 생성하고 Warudo의 캐릭터 애니메이션 노드나 Character → Overlaying Animations를 사용해 재생하세요.
* **애니메이션이 재질 속성을 제어하는 경우:** Warudo의 캐릭터 표현 시스템 (Character → Expressions)을 사용하세요.
* **애니메이션 뼈대가 아닌 변형을 제어하는 경우:** Animator 컴포넌트에 [애니메이터 컨트롤러](https://docs.unity3d.com/kr/current/Manual/class-AnimatorController.html)를 추가하고, [Feline's Animator Parameter Setter Nodes](https://steamcommunity.com/sharedfiles/filedetails/?id=3005732826&searchtext=animator+)를 사용해 애니메이터 컨트롤러에 접근하세요.

:::info
VRChat 모델을 재사용하는 경우, 모델과 함께 제공되는 Animator Controller를 그대로 사용할 수도 있어요. 하지만 처음 두 가지 방법이 Warudo의 모션 캡처 및 애니메이션 시스템과 더 잘 통합되기 때문에 이 방법들을 권장해요.
:::

## 뼈대 정상화 {#normalize-bones}

뼈대 정상화는 모델의 뼈대가 T-포즈에서 회전 값이 0이 되도록 보장하는 과정이에요. 모델을 Unity로 가져와서 1. 모델이 T-포즈 상태인지, 2. 모든 뼈대 변환의 회전 값이 (0, 0, 0)인지 확인한 후 Warudo SDK를 사용해 캐릭터를 설정할 수 있어요. **Setup Character** 창에서도 뼈대가 정상화되지 않은 경우 경고가 표시돼요:

![](/doc-img/en-mod-11.png)

캐릭터 설정 후 뼈대가 비틀린다면 모델의 뼈대가 정상화되지 않고 Warudo SDK가 모델을 손상시키지 않고 자동으로 뼈대를 정상화하는데 실패했을 가능성이 높아요. 이런 경우 FBX 모델을 Unity로 임포트 하기 전에 수동으로 뼈대를 정상화해야 해요.

Blender나 Maya 같은 모델링 도구에서 뼈대를 정상화하는 여러 방법이 있지만, 가장 검증된 방법은 FBX 모델에서 [VRM](https://vrm.dev/en/univrm/) 모델을 생성한 후, VRM 모델을 Unity로 가져오는 거예요. VRM 모델은 뼈대가 정상화된 상태임이 보장되기 때문에 Warudo SDK로 캐릭터 설정을 한 후에도 뼈대가 비틀리지 않을 거예요.

Blender 사용자인 경우, [Cats](https://github.com/absolute-quantum/cats-blender-plugin)의 **Set Rest Pose**옵션을 사용해 수동으로 뼈대를 정상화할 수 있어요. FBX를 내보낼 때는 다음 설정을 사용해야 해요:

![](/doc-img/en-mod-15.png)
<p class="img-desc">Credit: [@Kana_Fuyuko](https://twitter.com/Kana_Fuyuko)</p>

Blender에 내장된 FBX 내보내기 기능은 올바른 뼈대 회전 값을 내보내지 못하는 문제가 알려져 있어요. 만약 이 방법이 잘 작동하지 않는다면 [Better FBX Importer & Exporter](https://blendermarket.com/products/better-fbx-importer--exporter)나 [Cats](https://github.com/absolute-quantum/cats-blender-plugin)와 같은 서드파티 애드온을 사용해 FBX 모델을 내보내는 것을 시도해 볼 수 있어요. 

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
