---
sidebar_position: 80
---

# 모션 레코더

모션 레코더는 캐릭터의 애니메이션을 녹화하여 FBX, BVH, 또는 Warudo의 WANIM 형식으로 애니메이션 파일을 출력할 수 있어요.

## 설정

녹화할 **Character**를 선택하고, **Target Frame Rate**와 **Export Format**을 선택한 다음, **Start Recording**을 클릭하여 녹화를 시작하세요. 언제든지 **Stop Recording**을 눌러 녹화를 중단할 수 있어요.

세 가지 출력 형식이 있어요:
* **FBX**: 캐릭터의 뼈대와 블렌드셰이프 데이터를 포함한 FBX 형식으로 내보냅니다.
* **BVH**: 캐릭터의 뼈대 데이터만 포함한 BVH 형식으로 내보냅니다.
* **WANIM**: Warudo의 WANIM 형식으로 내보내며, 캐릭터의 뼈대와 블렌드셰이프 데이터, 그리고 녹화 중에 트리거된 캐릭터 표정을 포함합니다. Warudo에서 애니메이션을 재생할 필요만 있는 경우, 이 형식이 권장돼요.

:::caution
참고로, FBX 내보내기는 실험적인 기능으로, 대부분의 VRM 모델이나 Maya의 특정 기능(IK, 제약 조건 등)을 사용하지 않은 FBX 파일의 `.warudo`모델에서 제대로 작동할 거예요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
