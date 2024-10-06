---
sidebar_position: 40
---

# 소품 모드

소품 모드는 의자나 검과 같은 Unity [프리팹](https://docs.unity3d.com/kr/current/Manual/Prefabs.html)을 Warudo에서 소품으로 사용하는 모드를 의미해요.

## 설정

### 1단계: 모델 준비

소품 모델을 모딩 프로젝트에 임포트하세요. 씬에 소품을 배치한 후, 원하는 위치와 회전으로 조정하세요. 소품을 우클릭하고 **Create Empty Parent**를 선택해 빈 게임 오브젝트를 소품의 루트로 만드세요.

:::tip
빈 부모(empty parent)를 생성하는 이유는 소품 에셋이 루트 게임 오브젝트의 변환을 소품의 변환으로 사용하기 때문이에요. 만약 빈 부모(empty parent)를 생성하지 않으면 소품의 변환에 적용한 변경사항이 유지되지 않아요.
:::

### 2단계: 캐릭터 부착 설정 (선택 사항)

소품이 캐릭터에 부착되도록 의도된 경우(예: 액세서리), `CharacterAttachmentSettings` 스크립트를 프리팹에 추가해 기본으로 부착될 캐릭터의 뼈대를 지정할 수 있어요. 이렇게 하면 사용자가 Prop → Transform Attachment → Attach To에서 캐릭터를 선택할 때, 소품이 기본 뼈대(머리) 대신 지정된 캐릭터 뼈대에 자동으로 부착돼요.

또한, 소품의 자식 변환에 `CharacterAttachmentRotationConstraint` 스크립트를 추가해 소품의 뼈대가 특정 캐릭터의 뼈대와 함께 회전하도록 설정할 수 있어요. 예를 들어, 장갑 소품의 자식 변환은 캐릭터의 손가락 뼈대와 함께 회전해야 해요.

### 3단계: 프리팹 생성

소품의 루트 게임 오브젝트를 선택하고 모드 폴더로 드래그해 프리팹을 생성하세요. 프리팹 이름을 **"Prop"**으로 지정하고, 반드시 모드 폴더(하위 폴더도 가능)에 배치하세요.

### 4단계: 모드 익스포트

**Warudo → Build Mod**를 선택하고 생성된 `.warudo` 파일이 `Props` 데이터 폴더에 저장되었는지 확인하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
