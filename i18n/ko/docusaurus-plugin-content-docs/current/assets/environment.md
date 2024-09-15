---
sidebar_position: 40
---

# 환경

종종 "3D 배경"이라고 불리는 환경은 캐릭터 뒤에 표시되는 3D 씬이에요. [Mod SDK](../modding/mod-sdk.md)를 사용하여 자신만의 환경을 불러올 수 있어요.

![](/doc-img/zh-environment-1.webp)
<p class="img-desc">온천 환경.</p>

## Steam 워크샵

내장된 환경 외에도, Warudo의 Steam 워크샵에서 공식 및 커뮤니티 환경을 다운로드할 수 있어요. **Discover**탭을 클릭하고 **Environments** 카테고리를 선택하세요:

![](/doc-img/en-environment-1.png)
<p class="img-desc">Steam 워크샵에서 환경을 둘러보는 모습.</p>

## 설정

환경을 설정하려면, **Source**에서 환경의 모델을 선택하세요.

:::tip
**Allow Lights To Affect Characters**(조명이 캐릭터에 영향을 미치도록 허용)을 끄는 것을 권장해요. 이렇게 하면 [**Directional Light**](light) 에셋을 사용해 캐릭터의 조명을 더 세밀하게 제어할 수 있어요.
:::

:::tip
씬의 분위기를 조성하는 데 있어 환경은 시작일 뿐이에요. [camera](camera) 에셋에서 제공하는 후처리 효과를 확인해 보거나, Warudo Pro 사용자라면 Universal RP에서 [post processing volume(후처리 볼륨)](ppv)과 [NiloToon volume](nilotoon-volume) 에셋을 활용하는 것이 좋습니다. 
:::

:::caution
환경을 이동하거나 회전할 수 있지만, 그렇게 하는 것은 권장되지 않아요. 대신, 캐릭터를 이동하고 회전시키는 것이 좋습니다. 대부분의 환경은 이동이나 회전을 고려하여 설계되지 않았기 때문에, 환경을 움직이면 시각적인 오류가 발생할 수 있어요.
:::

## 환경 설정 재정의

**Ambient Lighting Source**(주변 조명 소스), **Environment Reflections Intensity**(환경 반사 강도) 등 환경 설정을 재정의할 수 있어요. 하지만 모든 환경에서 이러한 설정이 지원되는 것은 아니에요. 예를 들어, 환경이 베이크된 조명을 사용한다면, **Ambient Lighting Source** 설정은 무시될 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
