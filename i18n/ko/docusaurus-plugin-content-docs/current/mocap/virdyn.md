---
sidebar_position: 110
---

# Virdyn Studio (VDMocapStudio)

[VDMocapStudio](https://www.virdynm.com/virdyn-vdmocap-studio-motion-capture-software-system-for-vdsuit-full-product/)를 이용한 몸 추적. VDMocapStudio를 사용하려면 [VDSuit](https://www.virdynm.com/virdyn-vdsuit-full-for-full-body-function-inertia-motion-capture-suit-product/)가 필요해요.

## 설정

VDMocapStudio를 열고 데이터 스트리밍을 활성화하려면 **Broadcast → OpenShare**를 클릭하세요. 선택한 IP가 Warudo에서 접근 가능하도록 설정되어 있는지 확인하세요.

![](/doc-img/en-virdyn-1.png)

## 보정

Virdyn 하드웨어의 보정은 VDMocapStudio에서 이루어져요. 또한 **Virdyn Studio Receiver → Calibrate Root Transform**을 사용하여 Warudo에서 캐릭터의 루트 위치와 회전을 재설정할 수 있어요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### 시간이 지나면서 추적이 점점 어긋나요.

이는 관성 모션 캡처 시스템에서 흔히 발생하는 문제로, 시간이 지남에 따라 누적된 오류로 인해 발생해요. 추적 센서 근처에 자기적 또는 전기적 간섭이 없도록 해서 드리프트를 줄이세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
