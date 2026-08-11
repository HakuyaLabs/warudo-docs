---
sidebar_position: 512
translate_from_version: 2026-08-11
---

# Vicon Shogun

:::info

이 기능은 [Warudo Pro](../pro)에서만 사용할 수 있어요.

:::

[Vicon Shogun](https://www.vicon.com/software/shogun/)을 통한 바디 트래킹. [Vicon](https://www.vicon.com) 광학 트래킹 시스템에 대한 접근이 필요해요.

캐릭터 추적 외에도 소품 추적도 지원돼요. 예를 들어, Shogun에서 추적된 카메라, 핸드헬드 소품, 또는 스테이지 마커를 스트리밍하여 해당하는 Warudo 소품이나 카메라를 실시간으로 애니메이션할 수 있어요.

## 설정

Warudo에서 **Menu → Settings → Vicon**으로 이동하세요. **Server Address**가 Shogun이 실행 중인 PC를 가리키고 있는지 확인하세요 (예: `192.168.1.50:801`). Warudo와 Shogun이 같은 머신에서 실행 중이라면, 기본값인 `localhost:801`을 유지하면 돼요.

**Enabled**를 Yes로 설정하세요. Warudo가 연결을 설정하면 "Connected to Vicon Shogun"이라는 상태 메시지가 표시될 거예요.

![](/doc-img/en-vicon-1.jpg)

### 캐릭터 추적

Vicon Shogun을 Warudo에 연결하려면, [Onboarding Assistant](../tutorials/getting-started) (또는 **Character → Setup Motion Capture** 실행)를 사용하고 포즈 추적으로 **Vicon Shogun**을 선택하세요. 설정이 완료되면 씬에 **Vicon Subject Receiver** 에셋이 표시될 거예요. **Vicon Subject Name** 필드가 Shogun의 이름과 일치하는지 확인하세요.

:::tip

Warudo 캐릭터의 본 이름이 Shogun 스켈레톤에서 사용하는 이름과 다른 경우, **Vicon Receiver** 에셋의 **Override Bone Names**를 사용하여 특정 휴머노이드 본을 Shogun에서 제공하는 이름에 매핑할 수 있어요.

:::

![](/doc-img/en-vicon-2.jpg)

### 소품 추적

Warudo에서 **Vicon Prop Receiver** 에셋을 생성하세요. **Vicon Prop Name**을 Shogun Live의 리지드 바디 라벨로 설정하고, **Target Asset**에서 Warudo 소품 또는 카메라를 선택하세요.

:::info

Warudo 소품 파일의 계층 구조는 Shogun의 것과 일치해야 하며, 루트 트랜스폼의 이름은 `root`여야 해요. 그렇지 않으면 Warudo가 루트 트랜스폼을 생성하지만, 하위 트랜스폼이 완전히 미러링되지 않을 수 있어요.

:::

:::tip

blueprint에서 추적 데이터에 접근하려면, **Get Vicon Subject Receiver Data** 또는 **Get Vicon Prop Receiver Data** 노드를 사용할 수 있어요.

:::

## 고급 옵션

* **Root Rotation Offset**: 캐릭터나 소품이 Vicon 좌표 프레임과 다른 전방 방향을 향하고 있는 경우 정적 오프셋을 적용해요. 일반적으로 이 설정을 변경할 필요는 없어요.
* **Use Pre Fetch**: 지연 시간에 민감한 설정을 부드럽게 처리하기 위해 Vicon Shogun에서 버퍼링된 프레임을 요청해요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### "Failed to connect to Vicon system"이라는 상태가 표시돼요.

Shogun PC와 Warudo PC가 같은 서브넷에 있는지 확인하세요. **Server Address**를 다시 확인하고, 방화벽에서 `801` 포트가 열려 있는지 확인하세요.

### 캐릭터가 잘못된 포즈로 튀어요.

Shogun의 서브젝트가 Warudo 캐릭터와 호환되는 스켈레톤을 사용하고 있는지 확인하세요 (일치하는 본 계층 구조와 제로화된 T-포즈 회전). 필요한 경우, **Override Bone Names**를 사용하여 관절 이름을 맞추고, **Root Rotation Offset**을 사용하여 좌표 프레임을 일치시키세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Puri', github: 'Puri12'},
  ],
}} />
