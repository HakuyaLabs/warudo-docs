---
sidebar_position: 65
---

# RhyLive

ARKit 기반 얼굴 및 상반신 추적이에요. [Face ID](https://support.apple.com/en-us/HT208109)를 지원하는 iOS 기기와 무료 [RhyLive](https://apps.apple.com/us/app/rhylive/) 앱이 필요해요. 52개의 ARKit 블렌드셰이프, 머리 회전, 그리고 손 움직임을 추적해요.

:::info
RhyLive와 iFacialMocap은 얼굴 추적 정확도 측면에서 비슷하지만, iFacialMocap은 머리 움직임을 추적할 수 있기 때문에 더 유연하고, 모델이 보다 자연스럽게 움직일 수 있어요. 다음 비교를 참고해 주세요:

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-1.mp4" />
<p>RhyLive</p>
</div>

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-2.mp4" />
<p>iFacialMocap</p>
</div>
:::

## 설정

iOS 기기에서 RhyLive를 사용하려면, 앱을 열고 왼쪽 상단의 메뉴 아이콘을 눌러 설정으로 들어가세요. 컴퓨터와 휴대폰이 같은 WiFi 네트워크에 연결되어 있다면, "IP" 필드에 컴퓨터의 IP를 입력하고 "无线" (무선) 스위치를 켜세요. 또는, USB 케이블을 사용해 기기를 컴퓨터에 연결하고 "有线" (유선) 스위치를 켜면 돼요 ([iTunes](https://www.apple.com/itunes/) 필요).

![](/doc-img/zh-rhylive-1.webp)

:::tip
컴퓨터의 IP를 모를 경우, **RhyLive Receiver** 에셋의 설정 페이지에서 확인할 수 있어요.

![](/doc-img/en-ifacialmocap-1.png)

여러 개의 IP가 표시되면, 각 IP를 하나씩 시도해야 해요. 보통, WiFi 라우터가 컴퓨터에 할당한 IP 주소는 `192.168`로 시작해요. 예를 들어, 위 사진에서처럼 `192.168.1.151`을 먼저 시도할 수 있어요..
:::

:::info
"유선" 옵션을 사용할 경우, 먼저 RhyLive 앱을 열고, iPhone을 PC에 연결한 후에 Warudo를 실행해야 해요.
:::

"锁定弯腰" (몸 굽히기 잠금)을 끄고, "隐藏模型" (모델 숨기기)을 켜는 것을 권장해요. 전자는 모델의 움직임 범위를 늘려주고, 후자는 장시간 사용 시 기기의 과열을 줄이는 데 도움이 돼요.

![](/doc-img/zh-rhylive-3.webp)

## 보정

RhyLive의 추적을 보정하려면:
* **Character → Motion Capture → Quick Calibration → Calibrate RhyLive**을 클릭하거나,
* **RhyLive Receiver** 에셋에서 **Calibrate** 버튼을 클릭하면 돼요.

보정하는 동안에는 정면을 바라보고 머리를 고정한 상태로 있어야 해요. 보정이 완료되면 자유롭게 머리를 움직일 수 있어요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [얼굴 추적 커스터마이징](face-tracking#FAQ)을 참조해 주세요.

### "유선" 옵션을 사용하여 iPhone을 USB로 컴퓨터에 연결했는데, 캐릭터가 움직이지 않아요.

컴퓨터에 [iTunes for Windows](https://support.apple.com/en-us/HT210384)가 설치되어 있는지 확인해 주세요. 만약 Microsoft Store에서 설치한 iTunes를 사용 중이라면, 이를 삭제하고 Apple 웹사이트에서 제공하는 버전으로 다시 설치해야 할 수 있어요.

또는, "무선" 옵션을 대신 사용해 보는 것도 방법이에요.

### "무선" 옵션을 사용하고 컴퓨터와 iPhone이 같은 WiFi 네트워크에 연결되어 있는데, 캐릭터가 움직이지 않아요.

RhyLive 앱에서 "无线" (무선) 스위치를 껐다가 다시 켜보거나, 앱을 재시작해 보세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
