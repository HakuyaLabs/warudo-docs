---
sidebar_position: 70
---

# Leap Motion Controller

[Leap Motion Controller](https://leap2.ultraleap.com/leap-motion-controller-2/)를 통한 손 추적.

## 설정

더 정확하고 안정적인 추적을 위해 Leap Motion Controller 2를 사용하는 것을 추천해요. 오리지널 Leap Motion Controller도 지원돼요.

Leap Motion Controller를 Warudo에 연결하려면 [Leap Motion's 웹사이트](https://leap2.ultraleap.com/gemini-downloads/)에서 최신 Gemini 소프트웨어를 다운로드하여 설치해야 해요.

Warudo는 Leap Motion Controller가 제공하는 모든 3가지 추적 모드를 지원해요: **데스크탑(Desktop)**, **화면 상단(Screen Top)**, 그리고 **가슴 장착 모드(Chest mounted)**. 최상의 경험을 위해 **가슴 장착 모드**를 [넥/체스트 마운트](https://www.etsy.com/market/leap_motion_mounting)와 함께 사용하는 것을 추천해요.

## 보정 {#Calibration}

일반적으로 Leap Motion Controller를 보정할 필요는 없어요. 하지만, **Leap Motion Controller** 에셋에서 **Controller Position Offset**, **Controller Rotation Offset**, 그리고 **Controller Scale**을 조정하여 추적을 조정할 수 있어요. 추적 시각화를 돕기 위해 씬에 가상 **Leap Motion Controller**가 표시될 거예요.

![](/doc-img/en-leapmotion-1.png)
<p class="img-desc">버츄얼 Leap Motion Controller 조정.</p>

## 옵션

* **Controller Position Offset**: 컨트롤러 위치의 오프셋. X 양수는 왼쪽으로, Y 양수는 위쪽으로, Z 양수는 앞쪽으로의 오프셋을 의미해요.
* **Controller Rotation Offset**: 컨트롤러 회전의 오프셋.
* **Controller Scale**: 컨트롤러의 크기. 손을 몸에서 더 멀리 위치시키고 싶다면 이 값을 증가시키세요. **Per-Axis Scale**을 활성화하여 각 축별로 컨트롤러의 크기를 개별적으로 조정할 수도 있어요.
* **Fix Finger Orientations Weight**: 모델 사양의 차이로 인해 Leap Motion Controller의 손가락 방향이 모델의 손가락 방향과 일치하지 않을 수 있어요. 이 옵션은 Leap Motion Controller의 손가락 방향을 모델에 맞게 조정할 수 있게 해줘요. 0은 조정하지 않음을, 1은 완전한 조정을 의미해요. 손가락이 자연스럽게 보일 때까지 이 값을 조정하세요.
* **Shoulder Rotation Weight**: 어깨가 얼마나 회전해야 하는지. 0은 회전하지 않음을, 1은 완전한 회전을 의미해요. 어깨가 자연스럽게 보일 때까지 이 값을 조정하세요.

## 자주 묻는 질문 {#FAQ}

일반적인 질문은 [개요](overview#FAQ) 그리고 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조 해주세요.

### Leap Motion Tracker 에셋에서 "Tracker not started"라고 표시돼요.

최신 [Gemini 소프트웨어](https://leap2.ultraleap.com/gemini-downloads/)를 설치하고 백그라운드에서 실행 중인지 확인해 주세요.

### 모델의 손목/손가락이 부자연스러워 보여요.

**Leap Motion Tracker** 에셋에서 **Fix Finger Orientations Weight** 옵션을 조정해 보세요. **Wrist Rotation Offset**과 **Global Finger Rotation Offset** 옵션도 조정해야 할 수도 있어요(왼쪽 체크박스를 선택하여 활성화).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
