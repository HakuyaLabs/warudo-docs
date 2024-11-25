---
sidebar_position: 510
---

# Autodesk MotionBuilder

:::info
이 기능은 [Warudo Pro](../pro)에서만 사용 가능해요.
:::

[Autodesk MotionBuilder](https://www.rokoko.com/)를 통한 몸 추적, 이 기능을 사용하면 [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)과 같은 광학 모션 캡처 시스템에서 Autodesk MotionBuilder와 통합된 모션 데이터를 수신할 수 있어요. 

캐릭터 추적 외에도 소품 추적도 지원돼요. 예를 들어, 광학 추적 시스템을 사용하여 의자나 휴대용 카메라를 추적하고, 해당 모션 데이터를 Warudo로 스트리밍하여 Warudo에서 의자 소품이나 카메라를 애니메이션화할 수 있어요.

## 설정

:::info
Autodesk MotionBuilder 2020 버전을 사용하고 있는지 확인해 주세요. 다른 버전의 호환성이 필요하다면 저희에게 문의해 주세요 (빌드를 제공하는 데 시간이 걸릴 수 있어요).
:::

**Mobu2Warudo** 플러그인이 이미 설치되어 있는지 확인하세요. 이 플러그인은 Warudo Pro 라이선스에 포함되어 있어요.

### 캐릭터 추적

MotionBuilder를 열고 캐릭터의 FBX 파일을 로드한 후, 캐릭터화(characterize)하세요. **모델의 뼈대는 정규화된 뼈대를 가져야 해요. 즉, 모델이 T-포즈에 있을 때 모든 뼈가 회전값이 (0, 0, 0) 이어야 해요.** 또한, Warudo에 로드된 캐릭터 모델과 동일한 뼈대 계층 구조를 가져야 해요.

:::info
FBX 모델에 정규화된 뼈대가 있는지 확인하려면, Unity에 해당 모델을 가져와서 뼈대 변환의 회전값이 0인지 확인하세요.
:::

**Devices → Warudo Device**를 씬 뷰에 드래그하세요.

![](/doc-img/en-motionbuilder-1.png)

:::caution
Warudo Device가 보이지 않는 경우, 플러그인이 로드에 실패한 거예요. 이 문제를 해결하려면 [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)을 다운로드하고 설치한 후, MotionBuilder를 재시작하세요.
:::

**Devices → Warudo Device → Characters**로 이동하고, **Add**를 클릭하여 새로운 행을 추가하세요. 기본 이름인 **MyCharacter**를 실제 캐릭터 이름으로 변경하고, "Online" 텍스트 옆의 빨간 상자를 클릭하세요. 상자가 즉시 초록색으로 바뀌어야 하며, 이는 MotionBuilder가 Warudo로 모션 데이터를 스트리밍 중임을 나타내요.

![](/doc-img/en-motionbuilder-2.png)

Warudo에서 **MotionBuilder Receiver → MotionBuilder Character Name**을 실제 캐릭터 이름으로 업데이트하세요.

### 소품 추적

**Devices → Warudo Device → Props**를 선택하고, **Add**를 클릭하여 새로운 행을 추가하세요. 기본 이름인 **MyProp**을 추적하고 싶은 객체의 레이블 이름으로 변경하세요. 객체는 씬 계층 구조 내 어디에 있든 상관없어요. "Online" 텍스트 옆의 빨간 상자를 클릭하여 추적을 시작하세요.

Warudo에서 새로운 **MotionBuilder Prop Receiver** 에셋을 만들고, **MotionBuilder Prop Name**에 추적 중인 객체 이름을 입력하세요. 그런 다음, **Target Asset**에는 제어하고 싶은 Warudo 소품 또는 카메라를 선택하세요.

:::tip
소품 추적 데이터를 Blueprint에서 사용하려면, **Get MotionBuilder Prop Receiver Data** 노드를 사용하면 돼요.
:::

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### 캐릭터가 이상한 포즈를 하고 있어요.

먼저 Warudo와 Autodesk MotionBuilder에 동일한 모델을 로드했는지 확인하세요.

또한, 모델은 정규화된 뼈대를 가져야 해요. 즉, 모델이 T-포즈일 때 모든 뼈의 회전값이 (0, 0, 0) 이어야 해요. 자세한 내용은 [이 페이지](../misc/normalizing-model-bones)를 참조해 주세요.

### Autodesk MotionBuilder가 Warudo를 실행 중인 다른 PC로 데이터를 스트리밍하고 있는데, Warudo가 데이터를 수신하지 못해요.

네트워크 설정이 올바른지 확인하세요. 즉, 두 PC가 같은 네트워크에 있으며 서로 통신할 수 있어야 해요. 양쪽 방향으로 핑 테스트를 해서 통신이 가능한지 확인할 수 있어요.

또한, 캐릭터에 큰 계층 구조가 있는 경우, 수신하는 PC의 MTU(최대 전송 단위) 크기가 데이터를 수신할 만큼 충분한지 확인하고, 필요하면 MTU 크기를 늘려 보세요. 자세한 내용은 [이 페이지](https://answers.microsoft.com/en-us/windows/forum/all/how-to-change-mtu-settings-in-windows-10/5c36c250-a0e8-47ee-b01c-de22139dc297)를 참조해 주세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
