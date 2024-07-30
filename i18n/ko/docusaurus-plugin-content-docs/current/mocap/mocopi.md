---
sidebar_position: 80
---

# Sony Mocopi

[Sony Mocopi](https://electronics.sony.com/more/mocopi/all-mocopi/p/qmss1-uscx)를 통한 몸 추적.

## 설정

[공식 튜토리얼 비디오](https://www.sony.com/electronics/support/articles/00298063)를 따라 Sony Mocopi를 설정하세요.

그런 다음, Mocopi 앱에서 설정 페이지로 들어가세요. **External device connection settings**에서 **Transfer format**으로 **mocopi UDP**를 선택하고, IP 주소에는 컴퓨터의 IP 주소를 입력하세요.

:::tip
컴퓨터의 IP를 모르는 경우, **Mocopi Receiver** 에셋의 설정 페이지에서 확인할 수 있어요.

![](/doc-img/en-ifacialmocap-1.png)

여러 개의 IP가 나열된 경우, 각 IP를 하나씩 시도해 보셔야 해요. 보통 WiFi 라우터가 컴퓨터에 할당한 IP 주소는 `192.168`로 시작해요. 예를 들어, 위 사진에서는 먼저 `192.168.1.151`을 시도해 볼 수 있어요.
:::

메인 인터페이스로 돌아가서, 메뉴 바에서 **Motion**을 탭한 다음, **SAVE** 아이콘을 탭하여 **SEND** 모드로 전환하세요. 화면 하단의 초록색 전송 버튼을 탭하여 추적 데이터를 전송하기 시작하세요.

![](/doc-img/en-mocopi-1.png)

## 보정

Sony Mocopi의 보정은 Mocopi 앱에서 이루어져요.

## 옵션

* **Motion Buffering**: Mocopi의 내장 모션 버퍼링을 활성화할지 여부. Warudo는 이미 모션 데이터를 부드럽게 하기 때문에 보통 비활성화해도 돼요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ) and [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### 내 추적이 시간이 지남에 따라 드리프트가 발생해요.

이것은 관성 모션 캡처 시스템에서 흔히 발생하는 문제로, 축적된 오류로 인해 시간이 지남에 따라 드리프트가 발생해요. 드리프트를 줄이려면 추적 센서 근처에 자석이나 전기 간섭이 없는지 확인하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
