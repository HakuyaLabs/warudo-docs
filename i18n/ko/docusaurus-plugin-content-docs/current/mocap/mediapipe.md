---
sidebar_position: 50
---

# MediaPipe

웹캠 기반 얼굴 및 손 추적 시스템으로 얼굴 추적의 경우, MediaPipe는 40개 이상의 ARKit 블렌드쉐이프, 머리 회전 및 머리 이동을 추적해요. 포즈 추적의 경우, MediaPipe는 손목과 손가락을 추적해요.

## 설정

MediaPipe는 Warudo에 내장되어 있어 추가 소프트웨어를 설치할 필요가 없어요. 대부분의 웹캠이 MediaPipe와 호환되지만, 작동에 문제가 있는 경우 아래의 [FAQ](#FAQ) 섹션을 참고하세요.

MediaPipe는 CPU 또는 GPU에서 실행할 수 있어요. 더 나은 성능을 위해 GPU를 사용하는 것이 권장돼요. 기본적으로 MediaPipe는 이미 GPU에서 실행돼요. 대신 CPU를 사용하려면 **MediaPipe Tracker** 에셋으로 이동하여 **GPU Acceleration**을 비활성화하세요.

:::tip
많은 GPU 자원을 사용하는 게임을 할 때는 성능 문제를 피하기 위해 MediaPipe를 CPU로 실행하는 것이 좋을 수 있어요.
:::

MediaPipe를 손 추적에 사용하는 경우, 당신이 카메라 중앙에 위치하고 있으면서 손이 카메라 뷰에 완전히 보이는지 확인해 주세요. **MediaPipe Tracker** 에셋에서 **Show Camera**를 활성화하여 카메라 뷰를 볼 수 있어요. 아래 사진처럼 보여야 해요:

![](/doc-img/en-mediapipe-1.png)

보통 카메라는 컴퓨터 화면 위에 두고, 머리는 카메라 뷰의 중심보다 약간 위에 위치해야 해요. 사용 전에 손 추적을 보정하는 것도 추천해요. 자세한 내용은 [보정](#Calibration)을 참조하세요.

## 보정 {#Calibration}

### 얼굴 추적

MediaPipe의 얼굴 추적을 보정하려면:
* **Character → Motion Capture → Quick Calibration → Calibrate MediaPipe**를 클릭하거나,
* **MediaPipe Tracker** 에셋에서 **Calibrate**를 클릭하세요.

보정 중에는 정면을 바라보고 머리를 움직이지 않아야 해요. 보정 후에는 자유롭게 머리를 움직일 수 있어요.

### 손 추적

MediaPipe의 손 추적을 보정하려면 **MediaPipe Tracker** 에셋에서 **Calibrate Hand Tracking**을 클릭하세요. 손바닥이 카메라를 향하게 하여 귀 옆에 한 손을 올리세요. 다른 손으로 **OK** 버튼을 눌러 보정하세요.

![](/doc-img/en-mediapipe-2.png)
<p class="img-desc">보정 중에는 손바닥이 카메라를 향하도록 하고, 손가락을 약간 굽힌 채로 손을 편안한 자세로 두세요.</p>

손이 너무 빠르거나 너무 느리게 움직인다고 느끼면 **Hand Movement Range** 옵션을 조정할 수 있어요. 손을 머리 가까이 움직이게 하려면 **Hand Movement Offset** 옵션도 조정할 수 있어요.

## 옵션

* **Hand Movement Range**: 손의 움직임 범위. X는 좌우, Y는 상하, Z는 앞뒤 방향이에요.
* **Hand Movement Offset**: 손 움직임 범위의 오프셋. X 양수는 왼쪽으로의 오프셋, Y 양수는 위쪽으로의 오프셋, Z 양수는 앞쪽으로의 오프셋을 의미해요.
* **Arm Swivel Offset**: 팔꿈치를 안쪽 또는 바깥쪽으로 회전시켜요.
* **Hand Horizontal Distance Compensation**: 캐릭터의 양손을 더 가깝게 모아서 손가락을 교차하는 제스처를 쉽게 만들 수 있게 해줘요.
* **Hand Y Threshold**: 만약 손목과 카메라 뷰의 위쪽 및 아래쪽 가장자리 사이의 거리가 이 값보다 작으면 해당 손의 추적이 무시돼요. 이는 불안정한 추적으로 인한 떨림 문제를 방지하는 데 도움이 돼요.
* **Camera Diagonal Field of View**: 카메라의 시야. 정확한 값은 손의 깊이를 추정하는 데 도움이 돼요. 보통 카메라 제조사의 스토어 페이지에서 시야를 확인할 수 있어요.
* **Hand Push Z Max**: 몸을 통과하는 것을 방지하기 위해 손을 앞으로 밀어요. 이 값은 손이 앞으로 밀리는 최대 거리를 결정해요.
* **Hand Push Y Range**: 어깨에서 손이 아래로 내려갈수록 더 앞으로 밀려요. 손과 어깨의 수직 거리가 이 값보다 크거나 같을 때 최대한 앞으로 밀려요.
* **Hand Push Y Offset**: 이 값이 0이면 손은 어깨 아래에서 앞으로 밀리기 시작해요. 이 값이 양수이면 손은 어깨 위에서 앞으로 밀리기 시작해요.
* **Shoulder Rotation Weight**: 어깨가 얼마나 회전해야 하는지를 결정해요. 0은 회전하지 않음을, 1은 완전 회전을 의미해요. 어깨가 자연스럽게 보일 때까지 이 값을 조정하세요.

## 자주 묻는 질문 {#FAQ}

일반적인 질문은 [개요](overview#FAQ), [얼굴 추적 커스터마이징](face-tracking#FAQ), 그리고 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### MediaPipe 트래커 창이 검게 나오거나 "Loading..."에서 멈춰 있어요.".

일부 웹캠은 **GPU 가속**이 활성화된 경우에만 지원되며(e.g.,  [DroidCam](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)과 같은 IP 카메라), 일부는 **GPU 가속**이 비활성화된 경우에만 지원돼요. **MediaPipe Tracker** 에셋에서 **GPU 가속**을 전환하여 문제가 해결되는지 확인해 보세요.

또한, 일부 안티바이러스 소프트웨어가 Warudo의 카메라 접근을 차단할 수 있어요. 안티바이러스 소프트웨어의 카메라 보호 기능을 비활성화하거나 Warudo를 화이트리스트에 추가해 주세요.

### 내 볼을 부풀리거나 혀를 내밀 수 없어요.

이것은 MediaPipe의 알려진 제한 사항이에요. 우리는 구글의 [수정](https://github.com/google/mediapipe/issues/4403)을 기다리고 있어요.

### 내 트래킹이 떨려요.

먼저, 웹캠이 실제로 30 FPS 이상으로 작동하고 있는지 확인하세요. [이 웹사이트](https://webcamtests.com/fps)를 사용하여 웹캠의 FPS를 확인할 수 있어요. 웹캠이 낮은 FPS로 작동 중이라면, 방이 너무 어두울 수 있어요. 방의 조명을 잘 조절해 보세요.

웹캠이 30 FPS 이상으로 작동 중이지만, 트래커 창에서 훨씬 낮은 FPS가 표시되는 경우, **MediaPipe Tracker** 에셋에서 **GPU 가속**을 전환해 보세요.

:::tip
추적 FPS는 보통 15-30 사이에요. 3D 게임을 플레이할 때는 추적 FPS가 약 10까지 떨어질 수 있어요.
:::

### 트래킹이 멈췄어요.

혹시 노트북을 사용 중이라면 전원이 연결되어 있고 배터리로 작동 중이지 않은지 확인하세요.

### 손 추적에 MediaPipe를 사용할까요, [Leap Motion](leap-motion.md)을 사용할까요?

예산이 충분하다면, 손 추적에는 넥/체스트 마운트를 사용한 Leap Motion Controller 2를 사용하는 것을 일반적으로 추천해요. Leap Motion 추적은 일반적으로 더 안정적이며, 특히 3D 게임을 플레이할 때 MediaPipe보다 CPU/GPU 자원을 덜 사용해요.

Leap Motion Controller 1은 추적을 쉽게 놓치는 경향이 있어 추천하지 않아요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
