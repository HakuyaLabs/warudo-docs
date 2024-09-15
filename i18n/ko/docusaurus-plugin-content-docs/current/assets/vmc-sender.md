---
sidebar_position: 50
---

# VMC 송신기

캐릭터의 애니메이션 데이터를 [VirtualMotionCapture protocol](https://protocol.vmc.info/english)을 지원하는 모든 소프트웨어로 보낼 수 있어요!!

:::tip
호환 가능한 프로그램 목록은 [여기](https://protocol.vmc.info/Reference)에서 확인할 수 있어요..
:::

## 속성

* IP Address: 데이터를 보낼 IP 주소.
* Port: 데이터를 보낼 포트 번호.
* Character: 애니메이션 데이터를 보낼 캐릭터를 선택.
* Send to VirtualMotionCapture: [VirtualMotionCapture](https://akira.works/VirtualMotionCapture-en/)(동명의 소프트웨어, VMC 프로토콜과는 별개)로 데이터를 전송할지 여부. 애니메이션 데이터를 구문 분석할 때 발생하는 버그 때문에 이 옵션을 활성화해야 해요.
  * Calibrating (VirtualMotionCapture): T-포즈 캘리브레이션 중 이 옵션을 활성화하고, 끝나면 비활성화해요.

:::caution
이 기능을 사용하려면 모델의 뼈대 초기 회전 값이 모두 0이어야 해요. 그렇지 않으면 다른 소프트웨어와의 데이터 호환성에 문제가 생길 수 있어요. [VRM format](https://vrm.dev/),의 모델인 경우 대부분 문제가 없지만, 드물게 모델러가 내보낼 때 T-포즈 강제 적용 옵션을 체크하지 않았을 수 있어요. 이 경우, 해당 옵션을 활성화한 후 다시 내보내면 문제를 해결할 수 있어요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
