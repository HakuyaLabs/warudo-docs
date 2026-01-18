---
sidebar_position: 15
translate_from_version: 2024-11-15
---

# 환경 모드

어떤 Unity [씬](https://docs.unity3d.com/kr/current/Manual/CreatingScenes.html)이든 Warudo에 환경 모드로 임포트 할 수 있어요!

## 설정

### 1단계: 씬 준비

Unity 씬을 원하는 대로 설정하세요. [Post Processing Stack v2](https://docs.unity3d.com/Packages/com.unity.postprocessing@3.3/manual/index.html)가 지원되니, 씬에 포스트 프로세싱 효과를 추가할 수 있어요.

씬을 최적화하는 것을 추천해요. 예를 들어:

* 너무 많은 하이폴리곤 모델을 사용하지 마세요;
* 충돌이 필요하지 않은 모델의 충돌을 비활성화하세요;
* 스트림에서 보이는 씬의 일부만 필요하다면, 나머지를 비활성화하거나 제거하세요;
* 실시간 조명 사용을 최소화하고, 가능하면 베이크된 조명을 사용하세요.

:::warning

**Do not add more than one "Camera"** resource in the scene, otherwise it will increase the performance load of the environment and may even cause errors.

:::

### 2단계: 조명 베이크 (선택 사항)

일반적으로 씬에서 조명을 베이크하는 것을 권장해요. 이렇게 하면 환경 모드의 시각적 품질과 성능을 크게 향상시킬 수 있어요.

:::warning

현재 Unity의 기본 렌더 파이프라인(BiRP)에서 **"Standard"** 재질의 베이킹은 지원되지 않아요.  
라이트맵을 베이크해야 하는 경우, 더 나은 결과를 위해 다른 재질을 사용하는 것이 좋습니다.

:::

#### Unity의 기본 라이트매퍼

대부분의 경우 Unity의 기본 라이트매퍼를 사용하는 것으로 충분해요.

Warudo는 방향성 라이트맵을 사용하니 **Windows → Rendering → Lighting**에서 **Directional Mode**가 **Directional**로 설정되어 있는지 확인하세요:

![](/doc-img/en-environment-mod-1.webp)

그렇지 않으면 씬의 조명이 올바르게 적용되지 않을 수 있어요.

:::info

씬에 이미 라이트맵이 베이크되어 있는 경우, 라이트매핑 방향 모드를 전환한 후 **Generate Lighting**을 클릭하여 라이트맵을 다시 베이크해야 합니다.

:::

#### Bakery

[Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218)라는 서드파티 라이트매퍼를 사용할 수 있어요. 단, 방향성 라이트맵을 베이크해야 합니다. 예를 들어, Bakery에서 [**Directional Mode**를 Dominant Direction 또는 MonoSH](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode)로 설정할 수 있어요.

Bakery가 Warudo에서 제대로 작동하도록 하기 위해서는 아래 단계를 따라야 해요:

1. `Bakery` 폴더를 모드 폴더로 복사하세요 (기본적으로 `Assets` 루트에 있을 거예요);
2. Bakery 설정에서 **Use scene named output path**를 체크하세요. 이렇게 하면 Bakery 라이트맵이 모드 폴더에 저장돼요. **Directional Mode**는 Dominant Direction 또는 MonoSH처럼 방향성 라이트맵을 생성하는 옵션으로 선택하세요;
3. **Render**를 클릭해 라이트맵을 렌더링하세요. 반사 프로브도 베이크하려면 **Render reflection probes**를 클릭하세요;
4. **중요:** `Bakery/_tempScene` 폴더로 이동해 베이크 과정 중 생성된 `_tempScene` Unity 씬 파일을 삭제하세요.

### 3단계: `EnvironmentSettings` 스크립트 추가

익스포트 하고자 하는 Unity 씬을 열고 `EnvironmentSettings` 스크립트(Warudo SDK에 포함됨)를 새 게임 오브젝트 또는 기존 게임 오브젝트에 추가하세요. `Copy from current environment settings` 버튼을 클릭하세요. 이 스크립트는 Unity의 환경 설정(스카이박스, 그림자 색상 등)을 저장해 환경 모드로 익스포트 할 수 있게 합니다.

### 4단계: 씬 이름 변경

씬 이름을 <b>"Environment"</b>로 변경하고, 씬을 모드 폴더에 배치하세요 (하위 폴더에 배치 가능).

### 5단계: 모드 익스포트

**Warudo → Build Mod**를 선택하고, 생성된 `.warudo` 파일이 `Environments` 데이터 폴더에 저장되었는지 확인하세요.

## 문제 해결

환경 모드를 만드는 것은 다른 유형의 모드보다 조금 더 까다로울 수 있어요. Warudo에서 환경이 에디터와 다르게 보이는 경우, 아래 체크리스트를 확인해 보세요:

* `EnvironmentSettings` 스크립트를 씬의 게임 오브젝트에 추가했나요?
* 씬 이름이 <b>"Environment"</b>로 되어 있나요?
* 모든 재질, 셰이더 등이 모드 폴더에 포함되어 있나요?
* 베이크된 조명을 사용한 경우, 라이트맵과 `LightingSettings` 에셋이 모드 폴더에 포함되어 있나요?
* 베이크된 조명을 사용한 경우, 모드 폴더에 **하나**의 라이트맵과 `LightingSettings` 에셋만 존재하는지 확인했나요?

:::caution

일부 사용자는 여러 세트의 라이트맵과 `LightingSettings` 에셋이 모드 폴더 밖에 존재할 때도 문제가 발생했다고 보고했어요. 이 문제가 지속된다면 하나의 라이트맵과 `LightingSettings` 에셋만 남기고 나머지는 삭제해 보세요.

:::

* 베이크된 조명을 사용하는 경우, 라이트맵의 방향 모드가 Directional(또는 Bakery를 사용하는 경우 Dominant Direction/MonoSH)로 설정되어 있나요?
* 모드 폴더에 여러 개의 Unity 씬이 있나요? 그렇다면 다른 씬을 삭제하세요. (서브폴더 안에 씬이 있을 수 있으니 모든 서브폴더도 확인하세요!)
* 씬에 적용되지 않은 변경사항이 있는 프리팹이 있나요? 그렇다면 변경사항을 적용하세요. 세로선이 보이는 경우(변경사항이 완전히 적용되지 않았음을 의미함), 해당 프리팹을 우클릭하고 **Prefab → Unpack Completely**를 선택한 후 모드를 다시 익스포트하세요.

![](/doc-img/en-environment-mod-2.webp)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
