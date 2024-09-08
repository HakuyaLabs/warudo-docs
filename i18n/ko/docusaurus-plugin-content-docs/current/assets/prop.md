---
sidebar_position: 20
---
# 소품

소품은 씬 내에서 자유롭게 배치되거나 캐릭터의 액세서리로 부착될 수 있는 3D 모델이에요. 내장된 모델 외에도, 외부 모델은 [Mod SDK](../modding/mod-sdk.md)를 사용해 `.warudo` 형식으로 내보낸 후 Warudo에 로드할 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '48%'}}>
<img src="/doc-img/zh-prop-1.webp"  />
<p class="img-desc">Cat paws</p>
</div>

<div style={{width: '52%'}} className="video-box"><video controls src="/doc-img/zh-prop-1.mp4" />
<p>장미와 손끝에서 발산되는 입자 효과는 소품 에셋과 캐릭터 부착 설정을 통해 구현되었습니다.</p>
</div>
</div>

## Steam 워크샵

내장된 소품 외에도, Warudo의 Steam 워크샵에서 공식 및 커뮤니티 소품을 다운로드할 수 있어요. **Discover** 탭을 클릭하고 **Props** 카테고리를 선택하세요:

![](/doc-img/en-prop-3.png)
<p class="img-desc">Steam 워크샵에서 소품을 둘러보는 모습.</p>

## 설정

소품을 설정하려면, 소품의 모델로 **Source**를 선택하세요. 그런 다음, 변환 도구를 사용하여 소품을 이동/회전/크기 조정하여 원하는 위치에 배치하세요.

![](/doc-img/en-prop-1.png)
<p class="img-desc">여기 보이는 크리스마스트리, 크리스마스 모자, 전자 피아노는 모두 소품입니다.</p>

## 변환 부착

**Transform Attachment** 설정을 사용하여 소품을 캐릭터 또는 다른 씬 객체에 부착할 수 있어요. 이것은 캐릭터가 들고 있는 소품, 예를 들어 검이나 마이크와 같은 소품에 유용해요. 캐릭터의 손에 부착할 때, **Override Hand Pose**를 지정하여 캐릭터가 검을 꽉 쥐는 것처럼 표현할 수도 있어요.

![](/doc-img/en-prop-2.png)
<p class="img-desc">캐릭터의 손에 검 소품이 부착되어 있으며 **Override Hand Pose**가 **Grab**으로 설정되어 있습니다.</p>

소품을 캐릭터의 꼬리뼈와 같은 비표준 인체 뼈대에 부착하려면, **Attachment Type**에서 **Transform Path**를 사용할 수 있어요. 이를 통해 모델의 원하는 부위에 소품을 자유롭게 부착할 수 있어요.

## 충돌 감지

기본적으로 소품의 충돌체는 비활성화되어 있어요. **Collision Detection**를 활성화하면 충돌체를 사용할 수 있으며, 이는 **캐릭터 → 래그돌**을 사용할 때 유용해요.

:::info
참고로, 모든 내장 소품이 충돌체를 가지고 있는 것은 아니에요.
:::

## 메쉬

캐릭터 에셋과 마찬가지로, 소품 에셋에 대해 **기본 블랜드셰이프**, **기본 재질 속성**을 조정하고, **메쉬**를 토글할 수 있어요.

## 자주 묻는 질문

### 스트림 시청자가 트위치 채널 포인트 보상을 사용하거나 슈퍼챗을 보낼 때, 캐릭터에게 소품을 던지려면 어떻게 해야 하나요?

**Onboarding Assistant → Interactions Setup → Get Started**를 사용하여 상호작용을 설정하세요. 설정 과정에서 캐릭터에게 소품을 던지는 조건을 비롯한 다양한 상호작용을 지정할 수 있어요.

참고로, 상호작용 Blueprint에서 **Throw Prop At Character** 노드로 던지는 "소품"은 일시적인 객체이며, 소품 에셋이 아니에요. 소품 에셋은 씬에서 지속적으로 유지되는 모델이며, 물리적 특성을 가지지 않아요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
