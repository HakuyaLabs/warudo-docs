---
sidebar_position: 30
---

# 포즈 추적 커스터마이징

## Blueprint 커스터마이징

온보딩 과정에서 <b>Customize Pose Tracking...</b>을 클릭하여 추적 Blueprint를 커스터마이즈할 수 있어요.

![](/doc-img/en-mocap-4.png)
<p class="img-desc">포즈 추적 커스터마이징.</p>

### 상반신 트래커

상반신 트래커(e.g., MediaPipe, RhyLive, Leap Motion Controller)에 대해 다음 옵션들을 사용할 수 있어요:

* **Use Keyboard/Trackpad:** 손이 추적되지 않을 때도 키보드나 트랙패드를 사용해 캐릭터의 애니메이션을 생성할지 여부를 설정해요.
  
  ![](/doc-img/zh-keyboard-1.webp)
  
  온보딩 후, **Character → Motion Capture → Blueprint Navigation → Input Interfaces Animation Settings**를 클릭하여 키보드/터치패드 설정을 조정할 수 있어요.
  
  키보드와 터치패드는 각 에셋을 비활성화하여 개별적으로 끌 수 있어요:
  
  ![](/doc-img/zh-keyboard-3.webp)
  :::danger
  키보드가 활성화된 상태에서는 비밀번호와 같은 민감한 정보를 입력하지 않도록 주의해 주세요.
  :::
* **Track Fingers Only:** 활성화하면 이 추적 시스템이 손가락만 추적해요. 이미 손을 추적하는 전신 포즈 추적 시스템을 사용하는 경우 유용해요.

### 전신 트래커

전신 트래커에 대해 다음 옵션들을 사용할 수 있어요:

* **Track Full Body / Tracked Body Parts:** 만약 **Track Full Body**가 **No**로 설정된 경우, 이 추적 시스템은 **Track Full Body**에서 선택한 신체 부위만 추적해요. 여러 전신 포즈 추적 시스템을 사용하고 있고, 각기 다른 시스템을 사용해 다른 신체 부위를 추적하고자 할 때 유용해요.

## 트래커 커스터마이징

온보딩 후, 해당 포즈 추적 에셋(예: MediaPipe Tracker, VMC Receiver)으로 이동하여 추적 데이터를 커스터마이즈할 수 있어요. 다음 옵션들을 사용할 수 있어요:

* **Mirrored Tracking:** 활성화하면 Warudo가 추적 데이터를 미러링해요.
* **Head Rotation Intensity/Offset:** 머리 회전의 강도와 오프셋을 조정해요.

## 자주 묻는 질문 {#FAQ}

### 여러 포즈 추적 시스템을 어떻게 결합할 수 있나요?

보조 포즈 추적을 설정하려면 온보딩 과정에서 Secondary Pose Tracking 옵션을 사용할 수 있어요. 이것은 VR 트래커/Mocopi를 기본 추적용으로 사용하면서 [MediaPipe](../mocap/mediapipe.md)나 [Leap Motion Controller](../mocap/leap-motion.md) 또는 [StretchSense Gloves](../mocap/stretchsense.md)를 추가 손가락 추적용으로 사용하고자 할 때 유용해요.

![](/doc-img/en-getting-started-8.png)
<p class="img-desc">보조 포즈 추적 설정하기.</p>

두 개 이상의 포즈 추적 시스템을 결합하려면, 온보딩 어시스턴트를 사용해 먼저 기본 포즈 추적을 설정한 후, **Character → Setup Motion Capture**로 이동하여 **Track Full Body**를 **No**로 설정하고 **Tracked Body Parts**를 해당 시스템으로 추적하려는 특정 신체 부위로 설정해 추가 포즈 추적 시스템을 설정할 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
