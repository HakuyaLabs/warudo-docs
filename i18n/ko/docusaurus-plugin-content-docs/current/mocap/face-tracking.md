---
sidebar_position: 20
---

# 얼굴 추적 커스터마이징

## Blueprint 커스터마이징

온보딩 과정에서 <b>Customize Face Tracking...</b>을 클릭해 추적 Blueprint를 커스터마이즈할 수 있어요.

![](/doc-img/en-mocap-3.png)
<p class="img-desc">얼굴 추적 커스터마이징.</p>

사용 가능한 옵션:

* **BlendShape Mapping:** 모델에 맞는 블렌드쉐이프 매핑을 선택하세요. 예를 들어, 모델이 "Perfect Sync"/ARKit 블렌드쉐이프를 가지고 있다면 **ARKit**을 선택하세요. 모델이 MMD 모델에서 변환된 경우 **MikuMikuDance**를 선택하세요. 그렇지 않으면 **VRM**을 선택하세요. 기본적으로 Warudo는 블렌드쉐이프 매핑을 자동으로 감지하려고 하지만, 여기서 이를 재설정할 수 있어요.
* **Enable Head and Body Movements:** 활성화하면 Warudo가 추적 데이터에 따라 캐릭터의 머리와 몸을 움직여요. 비활성화하면 얼굴(블렌드쉐이프와 눈 뼈)만 애니메이션으로 움직여요. 이미 머리와 몸을 추적하는 전신 포즈 추적 시스템을 사용하는 경우 온보딩 어시스턴트가 자동으로 이 옵션을 **No**로 설정해요.
* **Idle Head Animation (Auto Blinking / Auto Eye Movements / Auto Head Movements):** 활성화하면 Warudo가 캐릭터에 미세한 머리 움직임, 눈 움직임, 깜박임을 추가해요.
* **Look At:** 활성화하면 캐릭터가 앞으로 볼 때 목표물(기본적으로 카메라)을 바라봐요. 이는 카메라 위치에 상관없이 캐릭터/사용자가 시청자와의 눈맞춤을 유지하도록 도와주며, 자유롭게 주위를 둘러볼 수 있도록 해줘요.
* **Lip Sync**: 활성화하면 Warudo가 사용자의 말에 따라 캐릭터의 입을 애니메이션으로 움직여요. 추적이 손실되었을 때만 립 싱크를 활성화하거나 항상 활성화할 수 있어요.

:::info
위 옵션들은 생성된 Blueprint에 영향을 미쳐요. 따라서 설정 후 이러한 옵션을 변경하려면 설정을 다시 실행하거나 얼굴 추적 Blueprint를 수동으로 수정해야 해요. **Character → Motion Capture → Blueprint Navigation**은 수정하고자 하는 Blueprint의 특정 부분으로 가는 바로가기를 제공해요:

![](/doc-img/en-mocap-6.png)
:::

## 트래커 커스터마이징

온보딩 후, 해당 얼굴 추적 에셋(예: iFacialMocap Receiver, MediaPipe Tracker)으로 이동하여 추적 데이터를 커스터마이즈할 수 있어요. 다음 옵션들을 사용할 수 있어요:

* **Mirrored Tracking:** 활성화하면 Warudo가 추적 데이터를 미러링해요.
* **[BlendShape](../tutorials/3d-primer#blendshape) Sensitivity:** 캐릭터의 얼굴 표정 민감도를 조정해요. 표정이 너무 미세하면 민감도를 높이고, 표정이 너무 과장되면 민감도를 낮추세요.
* **Configure BlendShapes Mapping:** 각 블렌드쉐이프의 임계값과 민감도를 조정해요. 특정 블렌드쉐이프를 비활성화하거나 각 블렌드쉐이프의 민감도를 개별적으로 조정하고자 할 때 유용해요.
  ![](/doc-img/en-mocap-5.png)
  왼쪽 두 값은 트래커에서 입력 블렌드쉐이프 값의 범위를 나타내고, 오른쪽 두 값은 캐릭터로 출력되는 블렌드쉐이프 값의 범위를 나타내요. 예를 들어, 입력 범위가 0-1이고 출력 범위가 0-2인 경우, 입력 블렌드쉐이프 값이 0.40일 때 출력 블렌드쉐이프 값은 0.80이 돼요.
    - 블렌드쉐이프를 비활성화하려면 오른쪽 상단 값을 0으로 설정하세요.
    - 블렌드쉐이프를 더 민감하게 만들려면 오른쪽 상단 값을 증가시키고, 덜 민감하게 만들려면 오른쪽 상단 값을 감소시키세요.
    - 더 높은 임계값에서 블렌드쉐이프를 트리거하려면(예: 캐릭터의 입이 이미 약간 열려 있지만 실제로는 입이 닫혀 있는 경우), 오른쪽 하단 값을 증가시키세요. 더 낮은 임계값에서 블렌드쉐이프를 트리거하려면 오른쪽 하단 값을 감소시키세요.
* **Head Movement/Rotation Intensity:** 머리 움직임/회전의 강도를 조정해요.
* **Body Movement Intensity:** 머리 움직임에 따른 자동 몸 움직임의 강도를 조정해요.
* **Body Rotation Type:** 머리가 회전할 때 몸이 자연스럽게 회전하도록 설정해요.
  None으로 설정하면 머리가 회전해도 몸은 회전하지 않아요.
  Normal로 설정하면 몸이 머리와 같은 방향으로 회전해요.
  Inverted로 설정하면 몸이 X와 Y축에서는 머리와 같은 방향으로, Z축에서는 반대 방향으로 회전해요.
  **Body Rotation Type**을 Custom으로 설정하면 각 회전 축의 방향과 크기를 모두 사용자 지정할 수 있어요.
* **Eye Movement Intensity:** 동공 움직임의 강도를 조정해요.
* **Eye Blink Sensitivity:** 눈 깜박임의 민감도를 조정해요. **Configure BlendShapes Mapping**에서 눈 깜박임 블렌드쉐이프의 민감도를 조정하는 빠른 방법이에요.
* **Linked Eye Blinking:** 활성화하면 두 눈을 동시에 깜박이도록 강제해요. 각각의 눈을 개별적으로 깜박이는 추적이 정확하지 않은 경우에 유용해요.
* **Use Bones/BlendShapes for Eye Movement:** 눈 움직임에 눈 뼈나 블렌드쉐이프를 사용할지 여부를 결정해요. 모델에 눈 뼈가 있는 경우, 눈 뼈를 사용하는 것이 더 정확하고 [IK](../tutorials/3d-primer#IK)를 허용하기 때문에 추천해요. **Use BlendShapes For Eye Movement**를 활성화해야 할 경우는 두 가지예요:
    - 모델에 눈 뼈가 없는 경우.
    - 모델의 눈 블렌드쉐이프가 눈 뼈를 보완하는 경우, 즉, 눈 블렌드쉐이프가 눈 뼈가 동공을 움직이는 것 외에도 눈의 모양을 바꾸는 경우. (모델러가 이 경우인지 여부를 알려줄 수 있어요.)

## 자주 묻는 질문 {#FAQ}

### 머리를 움직일 때 캐릭터의 몸도 움직여요. 이를 어떻게 비활성화하나요??

이 문제는 모션 캡처 수신 에셋의 **Body Movement Intensity** 옵션 때문이에요. 해당 값을 0으로 설정하면 몸 움직임을 비활성화할 수 있어요.

### 립 싱크를 어떻게 활성화하나요?

온보딩 과정에서 <b>Customize Face Tracking...</b>을 클릭하고 **Lip Sync**를 활성화하여 립 싱크를 설정할 수 있어요.

온보딩 후에는 **Character → Motion Capture → Blueprint Navigation → Lip Sync Settings**를 클릭하여 립 싱크 설정을 조정할 수 있어요.

### 제가 입을 다물고 있어도 제 모델의 입은 약간 열려 있어요.

이 문제는 ARKit 추적을 비호환 모델에 적용했을 때 주로 발생해요. 이를 해결하려면 다음 중 하나를 시도할 수 있어요:

* 모델에 ["Perfect Sync" / ARKit blendshapes](../tutorials/3d-primer#arkit)를 추가하세요. ARKit 기반 얼굴 추적은 훨씬 더 표현력이 풍부하고, 이미 추적 데이터를 가지고 있기 때문에 이를 추가하는 것이 좋습니다.
* 트래커 asset에서 **Configure BlendShapes Mapping**을 클릭하고, ARKit 입 블렌드쉐이프의 임계값 (즉, 오른쪽 하단 값을 `-0.25`와 같은 음수로 설정)을 증가시키세요. 예: `jawOpen`, `mouthFunnel`, `mouthPucker`.

### 머리를 돌릴 때 몸이 반대 방향으로 회전해요.

기본적으로 **Body Rotation Type**은 Live2D 모델을 모방하고 더 애니메이션 같은 느낌을 주기 위해 Inverted로 설정돼 있어요. 이를 비활성화하려면 **Body Rotation Type**을 Normal 또는 None으로 설정하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
