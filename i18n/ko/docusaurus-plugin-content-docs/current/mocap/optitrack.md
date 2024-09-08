---
sidebar_position: 515
---

# OptiTrack Motive

:::info
이 기능은 [Warudo Pro](../pro)에서만 사용 가능해요.
:::

[OptiTrack Motive](https://optitrack.com/software/motive/)를 통한 몸 추적. [OptiTrack](https://chingmu.com) 광학 추적 시스템에 접근할 수 있어야 해요.

캐릭터 추적 외에도 소품 추적이 지원돼요. 예를 들어, 광학 추적 시스템을 사용하여 의자나 휴대용 카메라를 추적하고, 해당 모션 데이터를 Warudo로 스트리밍하여 Warudo에서 의자 소품이나 카메라를 애니메이션화할 수 있어요.

## 설정

Warud에서 **Menu -> Settings -> OptiTrack**으로 이동하세요. **서버 주소**와 **로컬 주소**가 모두 정확한지 확인하세요. 서버 주소와 로컬 주소가 모두 정확한지 확인하세요. 서버 주소는 OptiTrack PC의 IP가 되어야 하고, 로컬 주소는 Warudo PC의 IP로 설정해야 해요. Warudo와 OptiTrack Motive를 같은 컴퓨터에서 실행하는 경우, 둘 다 `127.0.0.1`로 입력하세요. 그런 다음  **Enabled**를 Yes로 설정하세요. "Connected to OptiTrack Motive"라는 상태 메시지를 확인할 수 있을 거예요.

![](/doc-img/en-optitrack-1.png)

### 캐릭터 추적

OptiTrack Motive를 Warudo에 연결하려면, OptiTrack Motive에서 **Streaming**을 활성화하고 **Transmission Type**을 **Unicast**로 설정하세요. 또한, Local Interface 드롭다운에서 올바른 IP를 선택해야 해요. 이 IP는 Warudo가 실행되는 PC와 동일한 서브넷에 있어야 해요. Warudo와 OptiTrack Motive를 같은 컴퓨터에서 실행하는 경우, "loopback"을 선택하세요.

![](/doc-img/en-optitrack-2.png)

**OptiTrack Skeleton Receiver** 에셋에서, 이름이 OptiTrack Motive에서 사용된 이름과 일치하는지 확인하세요.

![](/doc-img/en-optitrack-3.png)

### 소품 추적

Warudo에서 **OptiTrack Rigid Body Receiver** 에셋을 생성하고, **OptiTrack Rigid Body ID**를 추적하려는 리지드바디의 ID로 설정하세요. 그런 다음, **Target Asset**에서 제어하려는 Warudo 소품 또는 카메라를 선택하세요.

:::tip
소품 추적 데이터를 blueprint에서 사용하려면, **Get OptiTrack Rigid Body Receiver Data** 노드를 사용할 수 있어요.
:::

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
