---
sidebar_position: 90
---

# Rokoko

[Rokoko](https://www.rokoko.com/)를 이용한 얼굴 & 몸 추적.

## 설정

Rokoko Studio를 열고 **Livestream → Unity로 스트리밍 활성화**:

![](/doc-img/zh-rokoko-1.webp)

그런 다음, **Rokoko Receiver** 에셋에서 **Profile Name**을 업데이트하여, 수신하고자 하는 모션 캡처 데이터를 가진 Rokoko 배우의 이름으로 설정하세요.:

![](/doc-img/zh-rokoko-2.webp)

:::caution
참고: Unity로 스트리밍하려면 Rokoko Plus 또는 Pro 구독이 필요해요.
:::

:::info
자세한 내용은 공식 문서를 참고해 주세요. [official documentation](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity).
:::

## 보정

Rokoko 하드웨어의 보정은 Rokoko Studio에서 이루어져요.

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

