---
sidebar_position: 520
---

# Chingmu Avatar

:::info
이 기능은 [Warudo Pro](../pro)에서만 사용 가능해요.
:::

[Chingmu Avatar](https://www.chingmu.com/software/downloaddetail_7.shtml)를 통한 몸 추적. [Chingmu](https://chingmu.com) 광학 추적 시스템에 접근할 수 있어야 해요.

캐릭터 추적 외에도 소품 추적이 지원돼요. 예를 들어, 광학 추적 시스템을 사용하여 의자나 휴대용 카메라를 추적하고, 해당 모션 데이터를 Warudo로 스트리밍하여 Warudo에서 의자 소품이나 카메라를 애니메이션화할 수 있어요.

## 설정

### 캐릭터 추적

Chingmu Avatar를 열고 캐릭터의 FBX 파일을 로드한 후, 캐릭터화(characterize)하세요. **모델의 뼈대는 정규화된 뼈대를 가져야 해요. 즉, 모델이 T-포즈에 있을 때 모든 뼈의 회전값이 (0, 0, 0) 이어야 해요.** 또한, Warudo에 로드된 캐릭터 모델과 동일한 뼈대 계층 구조를 가져야 해요.

:::info
FBX 모델에 정규화된 뼈대가 있는지 확인하려면, Unity에 해당 모델을 가져와서 뼈대 변환의 회전값이 0인지 확인하세요.
:::

**VRPN Livestream** (启用Vrpn), **Rigidbodies** (刚体), **Bones** (骨骼), 그리고 **Motion Retargeting** (重定向)이 모두 체크되어 있는지 확인하세요.

![](/doc-img/en-chingmu-1.png)

여러 캐릭터가 씬에 있을 경우, Warudo에서 **Chingmu Avatar Receiver → Object ID**를 추적하려는 캐릭터의 인덱스로 설정하세요. 인덱스는 0부터 시작해요.

Chingmu Avatar를 다른 PC에서 실행 중인 경우, Warudo의 **Settings → Chingmu → VRPN Connection String**에 Chingmu Avatar가 실행 중인 PC의 IP 주소를 입력해야 해요.

### 소품 추적

Warudo에서 **Chingmu Avatar Rigidbody Receiver** 에셋을 생성하고, **Rigidbody ID**를 추적하려는 리지드바디의 ID로 설정하세요. 그런 다음, **Target Asset**에서 제어하려는 Warudo 소품 또는 카메라를 선택하세요.

:::tip
소품 추적 데이터를 Blueprint에서 사용하려면, **Get Chingmu Avatar Rigidbody Receiver Data** 노드를 사용할 수 있어요.
:::

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### 캐릭터가 이상한 포즈를 하고 있어요.

먼저 Warudo와 Chingmu Avatar에 동일한 모델을 로드했는지 확인하세요.

또한, 모델은 정규화된 뼈대를 가져야 해요. 즉, 모델이 T-포즈일 때 모든 뼈가 회전값이 <b>(0, 0, 0)</b>이어야 해요. 자세한 내용은 [이 페이지](../misc/normalizing-model-bones)를 참조해 주세요.

### 캐릭터가 움직이지 않아요.

**Settings → Chingmu → Restart Chingmu Plugin**을 클릭해 보세요. 그래도 해결되지 않으면, Chingmu Avatar와/또는 Warudo를 재시작해 보세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
