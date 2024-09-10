---
sidebar_position: 41
---

# 방향/점/볼류메트릭 조명

조명 에셋은 씬을 밝히는 데 사용돼요. 조명 에셋에는 세 가지 종류가 있어요:
* **Directional Light**: 특정 방향에서 씬 전체를 비추는 방향성 조명이에요.
* **Point Light**: 특정 지점에서 씬을 비추는 점 조명이에요.
* **Volumetric Light**: 특정 지점에서 씬을 비추며 볼류메트릭 조명 효과를 갖춘 스포트라이트에요.

![](/doc-img/en-light-1.png)
<p class="img-desc">볼류메트릭 조명.</p>

:::info
조명 에셋은 캐릭터를 밝히거나 기존 환경 조명을 조정하는 데 매우 유용해요. 하지만 너무 많은 조명을 씬에 추가하는 것은 성능 문제를 일으킬 수 있으므로 권장되지 않아요.
:::

## 설정

기본적으로 씬에는 이미 방향성 조명이 있어요. 새로운 조명을 추가하려면 **Add Asset** 메뉴를 사용하세요.

변환 기즈모를 사용해 조명 에셋의 위치와 회전을 조정할 수 있어요. (참고로, 방향성 조명의 위치는 중요하지 않아요.) 조명의 **색상**과 **강도**는 에셋 설정에서 변경할 수 있으며, 캐릭터, 소품, 환경에 조명이 영향을 미치는지 여부도 여기서 켜고 끌 수 있어요.

:::tip
[환경](environment)을 사용하는 경우, **Environment → Allow Lights To Affect Characters**와 **Directional Light → Affect Environment**를 끄는 것이 좋습니다. 이렇게 하면 환경 조명이 캐릭터에 영향을 미치지 않고, 방향성 조명이 환경에 영향을 주지 않아요. 이를 통해 캐릭터와 환경 조명을 개별적으로 제어할 수 있으며, 일반적으로 이렇게 설정하는 것이 바람직해요.
:::

### 그림자

**그림자**를 활성화하면 조명이 그림자를 드리울 수 있어요. 캐릭터의 그림자가 환경에 드리워지도록 하려면 (예: 바닥에 그림자가 생기게 하려면), **Main Properties → Affect Environment**를 활성화해야 해요..

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
