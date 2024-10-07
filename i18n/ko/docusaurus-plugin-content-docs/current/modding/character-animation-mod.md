---
sidebar_position: 11
---

# 캐릭터 애니메이션 모드

Warudo에서 사용하고 싶은 [애니메이션 클립](https://docs.unity3d.com/kr/current/Manual/AnimationClips.html)이 있나요? 그렇다면 캐릭터 애니메이션 모드가 필요해요!

:::caution
만약 비뼈대 변환이나 재질 속성을 애니메이션화하는 애니메이션이 있다면, 다른 방법으로 캐릭터에 이 애니메이션을 추가하는 것이 좋습니다. [캐릭터 모드](character-mod#animations) 자세한 내용은 캐릭터 모드 섹션을 참조하세요.
:::

## 설정

### 1단계: 애니메이션 클립 준비

이미 프로젝트에 **애니메이션 클립**(청록색 삼각형 아이콘으로 표시)이 있다면, 잘됐어요! 이 단계를 건너뛰어도 됩니다

애니메이션이 FBX 파일인 경우, 먼저 리그 임포트 설정에서 **Animation Type**을 Humanoid로 설정하세요:

![](/doc-img/en-mod-14.png)

그런 다음, FBX 파일을 확장하고 내부의 **애니메이션 클립**(청록색 삼각형 아이콘으로 표시)을 선택한 후 Ctrl+D를 눌러 FBX 파일 밖에 복사본을 만드세요.

![](/doc-img/en-character-animation-mod-1.webp)

### 2단계: 애니메이션 클립 이름 변경

애니메이션 클립의 이름을 <b>"Animation"</b>으로 변경하고 모드 폴더(모든 하위 폴더에 넣을 수 있음)에 배치했는지 확인하세요.

### 2단계: 모드 내보내기

**Warudo → Build Mod**를 선택하고, 생성된 `.warudo` 파일이 `CharacterAnimations` 데이터 폴더에 저장되었는지 확인하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
