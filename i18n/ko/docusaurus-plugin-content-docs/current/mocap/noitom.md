---
sidebar_position: 120
---

# Noitom Axis

[Noitom Axis Studio](https://neuronmocap.com/pages/axis-studio) 또는 Axis Neuron을 이용한 몸 추적. [Noitom Perception Neuron](https://neuronmocap.com/) 슈트가 필요해요.

## 설정

Noitom Axis Studio를 열고, **Settings → BVH Broadcasting**에서 BVH 스트리밍을 활성화하세요 (오른쪽 상단의 스위치를 켜세요).

![](/doc-img/en-noitom-1.png)

## 보정

Noitom 하드웨어의 보정은 Noitom Axis Studio 또는 Axis Neuron에서 이루어져요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### 시간이 지나면서 추적이 점점 어긋나요.

이는 관성 모션 캡처 시스템에서 흔히 발생하는 문제로, 시간이 지남에 따라 누적된 오류로 인해 어긋날 수 있어요. 추적 센서 근처에 자기적 또는 전기적 간섭이 없도록 해서 드리프트를 줄여 보세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
