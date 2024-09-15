---
sidebar_position: 51
---

# OpenSeeFace

웹캠 기반 얼굴 추적이에요. 기본적은 블렌드셰이프 세트, 머리 회전, 머리 이동을 추적해요. 얼굴 추적의 품질은 [VSeeFace](https://www.vseeface.icu/)와 비슷해요.

:::info
OpenSeeFace는 [VSeeFace](https://www.vseeface.icu/)에서 사용되는 얼굴 추적 기술이에요, 그래서 VSeeFace에 익숙한 사용자들은 이 기술을 꽤 친숙하게 느낄 수 있을 거예요.
:::

:::caution
저희는 일반적으로 얼굴 추적을 위해 [MediaPipe](./mediapipe.md) 사용을 권장해요. MediaPipe는 더 많은 블렌드셰이프를 추적하고, 추적 품질도 더 뛰어나요. OpenSeeFace는 주로 MediaPipe를 사용할 수 없는 사용자들을 위해 제공돼요.
:::

## 설정

OpenSeeFace는 Warudo에 내장되어 있어서 추가 소프트웨어를 설치할 필요가 없어요.

:::tip
OpenSeeFace 추적기가 시작된 후 내부 보정에 10-15초가 걸려요. 이 시간 동안 모델의 입과 눈이 무작위로 움직일 수 있는데, 이는 정상적인 과정이에요.
:::

## 보정

OpenSeeFace의 추적을 보정하려면:
* **Character → Motion Capture → Quick Calibration → Calibrate OpenSeeFace**을 클릭하거나
* **OpenSeeFace Tracker** 에셋에서 **Calibrate** 버튼을 클릭하면 돼요.

보정하는 동안에는 정면을 바라보고 머리를 고정한 상태로 있어야 해요. 보정이 완료되면 자유롭게 머리를 움직일 수 있어요.

## 옵션

* **Eye Blinking Offset**: 모델의 눈이 완전히 감기지 않는다면, 값을 0.1씩 추가해서 조정해요. 반대로, 너무 많이 감긴다면 0.1씩 값을 줄여요.
* **Eye Wide Sensitivity**: **모델에 ARKit 블렌드셰이프가 있어야 해요.** 이 값을 높이면 EyeWideLeft/EyeWideRight 블렌드셰이프가 더 쉽게 작동해요.
* **Eyebrow Movement Sensitivity**: **모델에 ARKit 블렌드셰이프가 있어야 해요.** 이 값을 높이면 눈썹과 관련된 블렌드셰이프가 더 쉽게 작동해요.
* **Mouth Left Right Sensitivity**: **모델에 ARKit 블렌드셰이프가 있어야 해요.** 이 값을 높이면 MouthLeft/MouthRight 블렌드셰이프가 더 쉽게 작동해요.
* **Mouth Open Threshold**: 모델의 입이 너무 쉽게 열린다면, 값을 0.1씩 추가해서 조정해요. 그렇지 않다면 0.1씩 값을 줄여요.
* **Mouth Open Sensitivity**: 이 값을 높이면 JawOpen 블렌드셰이프(또는 "A" VRM 애니메이션 클립)가 더 쉽게 작동해요.
* **Mouth Funnel Sensitivity**: 이 값을 높이면 MouthFunnel 블렌드셰이프(또는 "O" VRM 애니메이션 클립)가 더 쉽게 작동해요.
* **Mouth Smile Sensitivity**: **모델에 ARKit 블렌드셰이프가 있어야 해요.** 이 값을 높이면 MouthSmileLeft/MouthSmileRight 블렌드셰이프가 더 쉽게 작동해요.
* **Body Movement Intensity**: 머리 움직임에 따라 자연스럽게 몸이 움직이는 범위예요.

## 자주 묻는 질문 {#FAQ}

일반적인 질문은 [개요](overview#FAQ)와 [얼굴 추적 커스터마이징](face-tracking#FAQ)을 참조해 주세요.

### OpenSeeFace를 사용할 때 빈 콘솔 창이 계속 나타나고 추적이 작동하지 않아요.

이것은 Windows의 버그로 인해 발생해요. 이를 해결하려면 시작 메뉴에서 **Terminal**을 검색하고 열어주세요. 아래쪽 화살표 아이콘을 클릭하고 **설정**을 선택하세요. **기본 터미널 응용 프로그램**으로 **Windows 콘솔 호스트**를 선택 한 후  **저장**을 클릭하세요. 그 후 Warudo를 재시작하면 해결돼요.
(윈도우 10을 사용하는 경우 [Microsoft 스토어](https://apps.microsoft.com/detail/9n0dx20hk701?hl=ko-kr&gl=KR)에서 다운로드가 가능해요)

### OpenSeeFace 추적기 창은 보이지만 추적이 작동하지 않아요.

일부 안티바이러스 소프트웨어가 Warudo가 카메라에 접근하는 것을 차단할 수 있어요. 안티바이러스 소프트웨어의 카메라 보호 기능을 비활성화하거나 Warudo를 화이트리스트에 추가해 주세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
