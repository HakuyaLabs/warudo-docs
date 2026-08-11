---
sidebar_position: 3
translate_from_version: 2026-08-11
---

# 펜 디스플레이 손 동기화

## 소개

![](/doc-img/pen-display-hand-sync-9.png)

이 페이지는 **그림 그리기나 디자인 작업을 위한 라이브 방송을 직접 구성**하는 데 도움이 되는 예제 씬을 제공해요.
**펜을 잡고** 있는 상태에서 Warudo 세계의 **스크린 에셋 안에서 커서를 완벽하게 따라가도록** 할 수 있어요!

<div style={{width: '100%'}} className="video-box">
<video controls loop src="/doc-img/pen-display-hand-sync-10.mp4" />
</div>
<p class="img-desc">쇼케이스!</p>

## 튜토리얼

###  1단계 - 준비

1. 먼저, 다음 튜토리얼을 진행하기 위해 Steam 워크샵에서 아래 항목들을 구독해야 해요:

	| 항목        | Steam 워크샵 URL                                                                         |
	|:----------- |:------------------------------------------------------------------------------------------ |
	| 환경 | [🔗 Loft Apartment](https://steamcommunity.com/sharedfiles/filedetails/?id=3033191267)        |
	| 캐릭터   | [🔗 VRoid Avatar Sample A](https://steamcommunity.com/sharedfiles/filedetails/?id=3003820352) |
	| 소품 1      | [🔗 Square Grid](https://steamcommunity.com/sharedfiles/filedetails/?id=3295273541)           |
	| 소품 2      | [🔗 Drawing Tablet Set](https://steamcommunity.com/sharedfiles/filedetails/?id=3146409616)    |
	| 노드        | [🔗 Mouse Position Nodes](https://steamcommunity.com/sharedfiles/filedetails/?id=3159188937)  |

2. 다음으로, 아래 파일을 다운로드하여 `<WARUDO_DATA_FOLDER>\Scenes` 폴더에 넣어주세요:

<ol style={{ "list-style-type": "none" }}><li>
<ul><li>
    <a
    target="_blank"
    href="/scenes/Warudo_PenDisplay_SampleScene_v20240828.json"
    download="Warudo_PenDisplay_SampleScene_v20240828.json">
      🔗 Warudo_PenDisplay_SampleScene_v20240828.json
    </a>
</li></ul>
</li></ol>

3. 그런 다음, Warudo에서 `Open scene` 옵션을 통해 다운로드한 씬을 열 수 있어요.

:::warning[Warudo Pro 사용자의 경우]

이 튜토리얼을 따르려면 URP (Nilotoon)에서 BiRP로 전환해야 해요.
설정이 완료된 후 다시 전환하고, 환경과 캐릭터를 URP 버전으로 교체할 수 있어요.

:::

### 2단계 - 디스플레이 할당 (멀티 디스플레이 사용자용)

1. Warudo 메인 창을 표시할 모니터를 결정하세요.
(이를 **모니터 A**라고 부를게요)
2. Warudo에서 표시할 모니터를 결정하세요.
(이를 **모니터 B**라고 부를게요)

모니터 A = 모니터 B인 경우, **3단계**로 바로 건너뛸 수 있어요. 그렇지 않다면:

3. ✨ `Mouse Position Relative To Screen` 노드에서 `Output Offset X/Y` 값을 변경하여 마우스가 모니터 B의 **좌측 상단 모서리**에 있을 때 `Output`이 `(0,0)`이 되도록 해주세요.

	![](/doc-img/pen-display-hand-sync-1.png)

:::tip[오프셋 값을 결정하는 방법]

1. 마우스를 모니터 B의 **좌측 상단 모서리**로 이동하세요.
2. 현재 `Output`의 ❗ **반대 값** ❗을 `Output Offset X/Y`에 입력하세요.
**예시:** 마우스가 좌측 상단 모서리에 있을 때 Output이 (1920, -1080)이라면, 다음과 같이 입력해야 해요:
`Output Offset X` = `-1920`
`Output Offset Y` = `+1080`
3. ✨ 단계를 다시 확인하세요.

:::

:::warning

모니터 A 또는 B의 선택을 변경할 때마다 오프셋 값을 다시 조정해야 해요.

:::

### 3단계 - 디스플레이 해상도 입력

`Decompose Vector2` 노드에 **모니터 B**의 해상도(픽셀 단위)를 입력하세요.

![](/doc-img/pen-display-hand-sync-2.png)

:::note[일반적인 16:9 해상도]

| 크기  |  X   |  Y   |
|:-----:|:----:|:----:|
| 1080p | 1920 | 1080 |
|  2K   | 2560 | 1440 |
|  4K   | 3840 | 2160 |
|   ⋯   |  ⋯   |  ⋯   |

:::

### 4단계 - 디스플레이 선택

`Prop - Drawing Screen`의 `Content` - `Display`에서 **모니터 B에 해당하는 디스플레이**를 선택하세요.

![](/doc-img/pen-display-hand-sync-3.png)

### 5단계 - (선택 사항) 에셋 커스터마이징

:::info

**처음 시도할 때는 이 단계를 건너뛰는 것을 권장해요.**

:::

**Onboarding Assistant**를 사용하여 자신만의 캐릭터, 환경, 모션 캡처를 설정할 수 있어요.

캐릭터와 스크린의 위치도 커스터마이징할 수 있어요.

캐릭터에 따라 **`Anchor - Right Hand IK`**의 **`Transform`** - **`Position`** 값을 조정하여 캐릭터가 펜을 더 잘 잡도록 해야 할 수 있어요.

:::warning

모션 캡처 설정에서 **`Finger Movements` 진자 물리를 비활성화해야 해요!**

![](/doc-img/pen-display-hand-sync-6.png)

- 다른 신체 관련 진자 물리(`Arm Movements`나 `Body Lean` 등)도 끄는 것을 권장해요.

:::

### 6단계 - 매핑 보정

`Prop - Calibration Border`의 `Scale`에서 **`X`**와 **`Y`** 값을 각각 조정하세요.
스크린이 빨간색 상자의 **안쪽 가장자리**에 최대한 완벽하게 맞도록 해주세요.

:::note

매번 스케일을 조정하기 전에 🔗 **`Uniform Scaling`**을 해제해야 해요.

:::

![](/doc-img/pen-display-hand-sync-4.png)

### 7단계 - 보정 경계선 숨기기

마지막으로, **`Prop - Calibration Border`** 에셋의 `Enabled` 옵션을 `No`로 전환하여 숨길 수 있어요.

![](/doc-img/pen-display-hand-sync-5.png)

:::warning

`Prop - Calibration Border`를 삭제하지 마세요. 삭제하면 다음에 보정을 할 수 없게 돼요.

:::

## 참고 사항

- 모션 캡처 에셋에서 **`Mirrored Tracking`** 또는 **`Invert Hands`**를 변경하여 원하는 추적 방식을 선택해야 할 수 있어요.

- 모니터 A 또는 모니터 B의 선택을 변경하려면, 2~6단계를 반복해야 해요.

- **`Prop - Drawing Screen`**의 두께를 조정하거나, **`Prop - Tablet`**을 활성화하고 스케일을 조정하여 현실감을 더 높일 수 있어요.

## 알려진 문제

### 손-펜 클리핑

이 blueprint의 최우선 순위가 **펜 끝을 커서에 맞추는 것**이기 때문에, 손 IK의 구현 원리상 손이 스크린 중심에서 너무 멀어지면 펜이 손에 완벽하게 맞지 않을 수 있어요.

따라서 스크린의 스케일을 너무 크게 조정하지 않는 것을 권장해요.


![](/doc-img/pen-display-hand-sync-7.png)

펜을 손가락 본에 바인딩하면 이 문제를 피할 수 있지만, 펜이 커서를 완벽하게 따라가지 못하게 돼요. 이 방식은 펜 디스플레이보다는 펜 태블릿에 더 적합해요.
(현재 이 씬은 이 모드를 지원하지 않아요)

### 디스플레이 사라짐

Warudo 메인 창의 우측 상단 닫기 버튼을 클릭하고 프로그램을 완전히 종료하지 않으면, 스크린이 사라질 수 있어요 (디스플레이 옵션 목록이 null이 되기 때문).

이것은 수정 대기 중인 버그로, 현재는 Warudo를 종료하고 다시 열어야만 해결할 수 있어요. (변경 사항은 저장할 수 있어요)


![](/doc-img/pen-display-hand-sync-8.png)

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'Puri', github: 'Puri12'},
  ],
}} />
