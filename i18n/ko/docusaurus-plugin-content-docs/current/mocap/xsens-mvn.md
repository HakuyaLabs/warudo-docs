---
sidebar_position: 100
---

# Xsens MVN

[Xsens MVN Analyze/Animate](https://base.xsens.com/s/motion-capture-mvn-software?language=en\_US)을 이용한 몸 추적.

## 설정

**Xsens MVN → Options → Network Streamer**로 이동한 후, 아래에 표시된 대로 설정하세요.

![](/doc-img/zh-xens-1.webp)

그런 다음, **Xsens MVN Receiver** 에셋에서 **배우 ID**를 수신하려는 Xsens 배우의 ID로 업데이트하세요. 기본 값은 1로 설정되어 있어요.

:::caution
참고: 네트워크 스트리머 기능을 사용하려면 MVN Animate Plus 또는 Pro 구독이 필요해요.
:::

:::info
자세한 내용은 공식 문서를 참고해 주세요. [official documentation](https://base.xsens.com/s/article/MVN-Unity-Live-Plugin?language=en\_US).
:::

## 보정

Xsens 하드웨어의 보정은 Xsens MVN에서 이루어져요.

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
