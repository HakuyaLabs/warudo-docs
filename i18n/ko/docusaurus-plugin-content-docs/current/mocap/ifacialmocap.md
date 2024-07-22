---
sidebar_position: 60
---

# iFacialMocap/FaceMotion3D

ARKit 기반의 얼굴 추적으로, [Face ID](https://support.apple.com/en-us/HT208109)를 지원하는 iOS 기기와 $5.99의 [iFacialMocap](https://apps.apple.com/us/app/id1489470545) 앱이 필요해요. 52개의 ARKit 블렌드쉐이프, 머리 회전 및 머리 이동을 추적해요.

iFacialMocap의 대안으로 [FaceMotion3D](https://apps.apple.com/us/app/facemotion3d/id1507538005)가 있어요. 영구 라이선스는 $14.99이며, iFacialMocap보다 더 많은 기능을 가지고 있지만, Warudo의 얼굴 추적에 관해서는 두 앱이 기능적으로 동일해요.

:::tip
최상의 추적 품질을 위해 아이폰 12 또는 그 이상의 모델(아이폰 미니도 가능)을 사용하는 것을 추천해요. 구형 아이폰은 추적 품질이 낮을 수 있어요.
:::

:::info
아이폰이 Face ID와 호환되지 않더라도, A12 이상의 칩이 있고 iOS 14로 업데이트된 경우 iFacialMocap / FaceMotion3D를 사용할 수 있어요. 그러나 추적 품질이 다소 떨어질 수 있어요.
:::

## 설정

:::tip
컴퓨터의 IP를 모르는 경우, **iFacialMocap Receiver** asset의 설정 페이지에서 확인할 수 있어요.

![](/doc-img/en-ifacialmocap-1.png)

여러 개의 IP가 나열된 경우, 각 IP를 하나씩 시도해 보셔야 해요. 보통 WiFi 라우터가 컴퓨터에 할당한 IP 주소는 `192.168`로 시작해요. 예를 들어, 위 사진에서는 먼저 `192.168.1.151`을 시도해 볼 수 있어요..
:::

### iFacialMocap

iFacialMocap 앱을 열고, 오른쪽 상단의 기어 아이콘을 탭하여 설정 인터페이스로 들어가세요. **Destination IP address**를 탭하고 컴퓨터의 IP 주소를 입력하세요.

![](/doc-img/zh-ifacialmocap-1.webp)

**Optimize for long-time streaming**(장시간 스트리밍 최적화 옵션)을 활성화하는 것을 추천해요, 이는 장시간 사용으로 인한 장치 과열을 줄이는 데 도움이 돼요.

![](/doc-img/zh-ifacialmocap-3.webp)

### FaceMotion3D

FaceMotion3D 앱을 열고, 왼쪽 하단의 **설정(setting)** 아이콘을 탭하여 설정 인터페이스로 들어간 후, **Streaming settings**을 탭하세요. **Software Name**을 **Other**로 설정하고, **Compatible with iFacialMocap**을 활성화하세요.

메인 인터페이스로 돌아가서 왼쪽 상단의 **라이브(Live)** 버튼을 탭하고, 소프트웨어를 **Other**로 선택한 후 컴퓨터의 IP 주소를 입력하세요. 그런 다음, 연결(Connect)을 탭하여 스트리밍을 시작하세요.

## 보정

iFacialMocap의 추적을 보정하려면:
* **Character → Motion Capture → Quick Calibration → Calibrate iFacialMocap**을 클릭하거나,
* **iFacialMocap Receiver** asset에서 **Calibrate**를 클릭하세요.

보정 중에는 정면을 바라보고 머리를 움직이지 않아야 해요. 보정 후에는 자유롭게 머리를 움직일 수 있어요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [얼굴 추적 커스터마이징](face-tracking#FAQ)을 참조해 주세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
