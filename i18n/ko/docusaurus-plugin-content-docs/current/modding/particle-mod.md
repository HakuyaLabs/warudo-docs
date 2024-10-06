---
sidebar_position: 41
---

# 파티클 모드

파티클 모두는 주로 **Spawn Particle** 같은 노드에서 사용할 수 있는 [파티클 시스템](https://docs.unity3d.com/Manual/PartSysReference.html)이에요.

## 설정

### 1단계: 모델 준비

파티클 게임 오브젝트를 씬에 배치하고 원하는 위치와 회전으로 조정하세요. 마우스 오른쪽 버튼을 클릭하고 **Create Empty Parent**를 선택해 빈 게임 오브젝트를 소품의 루트로 생성하세요.

플레이 모드로 전환하고 부모 게임 오브젝트를 이동시켜 파티클 시스템이 예상대로 파티클을 방출하는지 확인하세요. 그렇지 않다면 파티클 시스템의 설정을 조정해야 할 수도 있어요. 예를 들어 **Simulation Space**를 World 대신 Local로 설정할 수 있어요.

### 2단계: 프리팹 생성

루트 파티클 게임 오브젝트를 선택하고 모드 폴더로 드래그해 프리팹을 생성하세요. 프리팹 이름을 **"Particle"**로 지정하고, 반드시 모드 폴더(하위 폴더도 가능)에 배치하세요.

### 3단계: 모드 익스포트

**Warudo → Build Mod**를 선택하고 생성된 `.warudo` 파일이 `Particles` 데이터 폴더에 저장되었는지 확인하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
