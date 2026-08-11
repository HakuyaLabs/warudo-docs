---
sidebar_position: 40
version: 2026-01-19
---

# 데이터 폴더

Warudo의 데이터 폴더는 `StreamingAssets`라는 이름의 폴더로, Warudo가 사용할 수 있는 다양한 데이터 파일을 저장하는 데 사용돼요.

---

## 찾는 방법

**Menu** ➜ **Open data folder**를 클릭하면 열 수 있어요.

![](/doc-img/data-folder-1.png)

일반적으로 다음 경로에 위치해요:

```
<STEAM_ROOT_DIR>\steamapps\common\Warudo\Warudo_Data\StreamingAssets
```

## 하위 폴더

데이터 폴더에는 여러 하위 폴더가 있으며, 서로 다른 유형의 파일을 분류하는 데 사용돼요.

자세한 내용은 다음과 같아요 (알파벳 순서):

### Binaries

이 폴더에는 프로그램과 관련된 일부 바이너리 파일이 포함되어 있어요.
삭제하거나 수정하지 마세요.

### CharacterAnimationProfiles

이 폴더는 **캐릭터의 애니메이션 프로필** 파일을 저장하는 데 사용돼요.

**지원 형식:** JSON (`*.json`)

"[**Character**](/docs/assets/character)" 에셋의 "**Animation**" 섹션에서 "**Save Animation Profile**" 버튼을 사용하면, 캐릭터의 현재 애니메이션 설정이 이 폴더에 저장돼요.

프로필 파일은 다음 시나리오에서 사용할 수 있어요:
- "[**Character**](/docs/assets/character)" 에셋 – "**Animation**" 섹션 – "**Load Animation Profile**" 버튼
- "**Load Character Animation Profile**" 노드 – "**Animation Profile**" 포트

"[**Character**](/docs/assets/character)" 에셋의 "**Animation**" 섹션에서 "**Open Animation Profiles Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### CharacterAnimations

이 폴더는 캐릭터가 재생할 수 있는 **캐릭터 애니메이션** 파일을 저장하는 데 사용돼요.

**지원 형식:**
- Unity Animation Clip (`*.anim`)
- [Warudo Character Animation Mod](/docs/modding/character-animation-mod) (`*.warudo`)

애니메이션 파일은 다음 시나리오에서 사용할 수 있어요:

- "[**Character**](/docs/assets/character)" 에셋 – "**Animation**" 섹션 – "**Idle Animation**" 옵션
- "[**Character**](/docs/assets/character)" 에셋 – "**Animation**" 섹션 – "**Overlaying Animations**" – "**Animation**" 옵션
- "**Character Animation Source**" 노드 – "**Value**" 포트
- "**Get Random Character Animation**" 노드 – "**Character Animations**" 포트
- "**Play Character One Shot Overlay Animation**" 노드 – "**Animation**" 포트
- "**Play Character Idle Animation**" 노드 – "**Animation**" 포트

"[**Character**](/docs/assets/character)" 에셋의 "**Animation**" 섹션에서 "**Open Character Animations Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### CharacterExpressionProfiles

이 폴더는 **캐릭터의 표정 프로필** 파일을 저장하는 데 사용돼요.

**지원 형식:** JSON (`*.json`)

"[**Character**](/docs/assets/character)" 에셋의 "**Expressions**" 섹션에서 "**Save Expression Profile**" 버튼을 사용하면, 캐릭터의 현재 표정 설정이 이 폴더에 저장돼요.

프로필 파일은 다음 시나리오에서 사용할 수 있어요:
- "[**Character**](/docs/assets/character)" 에셋 – "**Expressions**" 섹션 – "**Load Expression Profile**" 버튼

"[**Character**](/docs/assets/character)" 에셋의 "**Expressions**" 섹션에서 "**Open Expression Profiles Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### Characters

이 폴더는 **캐릭터 모델** 파일을 저장하는 데 사용돼요.

**지원 형식:**
- VRM 0.x Model (`*.vrm`)
- VRM 1.0 Model (`*.vrm`)
- [Warudo Character Mod](/docs/modding/character-mod) (`*.warudo`)

이 파일들은 "[**Character**](/docs/assets/character)" 에셋의 "**Source**" 옵션에서 사용할 수 있어요.

"[**Character**](/docs/assets/character)" 에셋에서 "**Open Characters Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### Clients

이 폴더에는 프로그램과 관련된 일부 파일이 포함되어 있어요.
삭제하거나 수정하지 마세요.

### Environments

이 폴더는 **환경** 파일을 저장하는 데 사용돼요.

**지원 형식:** [Warudo Environment Mod](/docs/modding/environment-mod) (`*.warudo`)

이 파일들은 "[**Environment**](/docs/assets/environment)" 에셋의 "**Source**" 옵션에서 사용할 수 있어요.

"[**Environment**](/docs/assets/environment)" 에셋에서 "**Open Environments Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### HandGestureProfiles

이 폴더는 **캐릭터의 손 제스처** 파일을 저장하는 데 사용돼요.

**지원 형식:** JSON (`*.json`)

"**Detect Character Hand Gesture**" 노드에서 "**Record New Hand Gesture**" 버튼을 사용하면, 캐릭터의 손 제스처가 이 폴더에 저장돼요.

프로필 파일은 다음 시나리오에서 사용할 수 있어요:
- "**Detect Character Hand Gesture**" 노드 – "**Gesture**" 포트

### HandPoses

이 폴더는 **캐릭터의 손 포즈** 파일을 저장하는 데 사용돼요.

**지원 형식:** **(개발 중 ...)**

손 포즈 파일은 다음 시나리오에서 사용할 수 있어요:

- "[**Character**](/docs/assets/character)" 에셋 – "**Animation**" 섹션 – "**Override Hand Poses**" 옵션 – "**Pose**" 옵션
- "**Enable Character Override Hand Pose**" 노드 – "**Pose**" 포트

### Images

이 폴더는 **이미지** 파일을 저장하는 데 사용돼요.

**지원 형식:** 이미지 형식

이미지 파일은 다음 시나리오에서 사용할 수 있어요:
- "**Spawn Sticker From Local Image**" 노드 – "**Image Source**" 포트 – "**Get Random Local Image**" 노드 – "**Images**" 포트
- "[**Screen**](/docs/assets/screen)" 에셋 – "**Image Source**" 옵션 ("**Content Type**"이 "**Image**"여야 해요)
- "**Discover**" 패널 – "**Published Items**" 탭 – "**Create Item**" – "**Preview Image**" 옵션

### LipSyncProfiles

이 폴더에는 프로그램과 관련된 일부 파일이 포함되어 있어요.
삭제하거나 수정하지 마세요.

### Localizations

이 폴더에는 프로그램과 관련된 일부 파일이 포함되어 있어요.
삭제하거나 수정하지 마세요.

### MMD

**지원 형식:** [Vocaloid Motion Data (MikuMikuDance)](https://mikumikudance.fandom.com/wiki/VMD_file_format) (`*.vmd`)

파일은 다음 시나리오에서 사용할 수 있어요:
- "**MMD Player**" 에셋 – "**Character Motion**" 옵션

### Motions

**지원 형식:** Warudo Animation Data (`*.wanim`)

Warudo Animation Data 파일은 "**Motion Recorder**" 에셋으로 생성할 수 있어요.

파일은 다음 시나리오에서 사용할 수 있어요:
- "**Motion Player**" 에셋 – "**Motion Sources**" 옵션

"**Motion Recorder**" 에셋에서 "**Open Motions Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### Music

**지원 형식:** 오디오 형식

파일은 다음 시나리오에서 사용할 수 있어요:
- "**Music Player**" 에셋 – "**Source**" 옵션
- "**Play Music**" 노드 – "**Source**" 포트
- "**Music Source**" 노드 – "**Value**" 포트

"**Music Player**" 에셋에서 "**Open Music Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### Particles

**지원 형식:** [Warudo Particle Mod](/docs/modding/particle-mod) (`*.warudo`)

파일은 다음 시나리오에서 사용할 수 있어요:
- "[**Prop**](/docs/assets/prop)" 에셋 – "**Source**" 옵션
- "**Particle Source**" 노드 – "**Value**" 포트
- "**Get Random Particle**" 노드 – "**Particles**" 포트
- "**Spawn Particle**" 노드 – "**Source**" 포트
- "**Throw Prop**" 노드 – "**Impact Particle Source**" 포트

### PendulumPhysicsProfiles

이 폴더는 **진자 물리 프로필** 파일을 저장하는 데 사용돼요.

**지원 형식:** JSON (`*.json`)

파일은 다음 시나리오에서 사용할 수 있어요:
- **Motion Capture** 에셋 – "**Pendulum Physics**" 섹션 – "**Load Pendulum Physics Profile**" 버튼
- "**Load Pendulum Physics Profile**" 노드 – "**Pendulum Physics Profile**" 포트

**Motion Capture** 에셋의 "**Pendulum Physics**" 섹션에서 "**Open Pendulum Physics Profiles Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### Playground

**지원 형식:** C# Source Code File (`*.cs`)

다음을 참고해 주세요: [Playground](/docs/scripting/playground)

### Plugins

**지원 형식:** [Warudo Plugin Mod](/docs/scripting/creating-your-first-plugin-mod) (`*.warudo`)

### Props

**지원 형식:** [Warudo Prop Mod](/docs/modding/prop-mod) (`*.warudo`)

파일은 다음 시나리오에서 사용할 수 있어요:
- "[**Prop**](/docs/assets/prop)" 에셋 – "**Source**" 옵션
- "**Prop Source**" 노드 – "**Value**" 포트
- "**Get Random Prop**" 노드 – "**Props**" 포트
- "**Throw Prop**" 노드 – "**Prop Source**" 포트

"[**Prop**](/docs/assets/prop)" 에셋에서 "**Open Props Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### Scenes

이 폴더는 **Warudo 씬** 파일을 저장하는 데 사용돼요.

**지원 형식:** JSON (`*.json`)

씬 파일은 다음 시나리오에서 사용할 수 있어요:
- **Menu** – **Open scene**

### Screenshots

"[**Camera**](/docs/assets/camera)" 에셋의 "**Output**" 섹션에서 "**Take Screenshot**" 버튼을 사용하면, 카메라의 현재 출력이 PNG 형식으로 이 폴더에 저장돼요.

마찬가지로, "**Take Screenshot**" 노드를 실행하면 선택된 카메라의 현재 출력이 PNG 형식으로 이 폴더에 저장돼요.

### Sounds

**지원 형식:** 오디오 형식

파일은 다음 시나리오에서 사용할 수 있어요:
- "**Play Sound**" 노드 – "**Source**" 포트
- "**Sound Source**" 노드 – "**Value**" 포트
- "**Get Random Sounds**" 노드 – "**Sounds**" 포트
- "**Throw Prop**" 노드 – "**Launch/Impact Sound Source**" 포트

"**Play Sound**" 노드에서 "**Open Sounds Folder**" 버튼을 사용하면 이 폴더를 직접 열 수도 있어요.

### SteamVR

이 폴더에는 프로그램과 관련된 일부 파일이 포함되어 있어요.
삭제하거나 수정하지 마세요.

### Videos

이 폴더는 **비디오** 파일을 저장하는 데 사용돼요.

**지원 형식:** 비디오 형식

비디오 파일은 다음 시나리오에서 사용할 수 있어요:
- "[**Screen**](/docs/assets/screen)" 에셋 – "**Video Source**" 옵션 ("**Content Type**"이 "**Video**"여야 해요)

## 추가 하위 폴더

:::tip
Steam 워크샵의 일부 플러그인은 `StreamingAssets` 아래에 추가 하위 폴더를 생성할 수도 있어요.
:::

Warudo와 관련된 파일을 더 잘 관리하기 위해 다음 하위 폴더를 만드는 것도 권장해요:

### AssetProfiles

이 폴더는 "**Export asset to file**" 버튼으로 생성한 **에셋 프로필** 파일을 저장하는 데 사용할 수 있어요.

### Blueprints

이 폴더는 "**Export blueprint to file**" 버튼으로 생성한 **blueprint** 파일을 저장하는 데 사용할 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'Puri', github: 'Puri12'},
  ],
}} />
