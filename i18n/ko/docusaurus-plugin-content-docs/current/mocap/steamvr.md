---
sidebar_position: 68
---

# SteamVR

[SteamVR](https://store.steampowered.com/app/250820/SteamVR/)의 VR 트래커 데이터를 이용한 추적..

## 설정

### 캐릭터 추적

Warudo는 현재 6-포인트 캐릭터 추적을 지원해요. SteamVR을 사용하도록 [모션 캡처 설정](body-tracking) 후, **SteamVR Character Tracker** asset으로 이동하여 **Setup / Calibrate** 버튼을 클릭하세요. 다양한 신체 부위에 할당할 수 있는 트래커 목록이 표시될 거예요. 그런 다음, T-포즈를 취하여 트래커를 보정하라는 요청을 받을 거예요.

:::tip
앞으로 팔꿈치, 무릎, 가슴 트래커 지원도 추가할 예정이에요.
:::

보정 후 각 트래커를 확장하여 추적 구체를 시각화하고 **Position Offset**과 **Rotation Offset**을 조정할 수 있어요. T이는 특히 트래커가 신체의 정확한 위치에 놓이지 않은 경우에 유용해요. 예를 들어, 헤드 트래커가 머리 위에 놓인 경우, **Position Offset**을 조정하여 추적 구체를 아래로 이동시켜 트래커에 상대적인 머리 위치와 일치하도록 할 수 있어요.

### 쇼품 추적

Warudo에서 새로운 **SteamVR Prop Tracker** asset을 생성하고 추적하고자 하는 **VR 장치**를 선택하세요. **Reference Frame**을 캐릭터 asset으로 선택할 수도 있어요. 그런 다음, **Target Asset**으로 제어하고자 하는 Warudo 소품/카메라를 선택하세요.

:::tip
소품 추적 데이터를 Blueprint에서 접근하려면, **Get SteamVR Prop Tracker Data** 노드를 사용할 수 있어요.
:::

## 원시 장치(Raw device) 데이터 접근

원시 장치 데이터를 blueprint에서 접근하려면, **Get SteamVR Device Data** 노드를 사용할 수 있어요. 이 노드는 지정된 VR 장치(예: 트래커, 컨트롤러, HMD)의 위치와 회전값을 결과로 돌려줘요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ)와 [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
