---
sidebar_position: 30
---

# 꼬리

꼬리를 흔들어 보세요! 꼬리 에셋은 캐릭터의 꼬리 뼈대를 애니메이션화해요. 이 에셋은 캐릭터나 [소품](prop)의 계층 구조를 가진 뼈대를 애니메이션화하는 데도 사용할 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '53.2%'}} className="video-box"><video controls loop src="/doc-img/en-tail-1.mp4" />
<p>꼬리를 흔드는 모습.</p>
</div>

<div style={{width: '46.8%'}} className="video-box"><video controls loop src="/doc-img/zh-tail-2.mp4" />
<p>이 에셋은 동물의 귀와 같은 계층적인 뼈대에도 적용할 수 있습니다.</p>
</div>
</div>

## 설정 {#setup}

꼬리를 설정하려면, 꼬리가 속하는 **Parent Asset**을 선택하세요. 그런 다음, **경로(Path)** 드롭다운 목록에서 꼬리의 루트 뼈를 선택하세요.

:::info
최상의 결과를 얻으려면, 꼬리에는 최소 4개의 뼈가 포함되어 있어야 해요.
:::

꼬리가 예상치 못한 방식으로 움직일 경우, **Reset Tail** 버튼을 사용하여 꼬리를 기본 상태로 재설정할 수 있어요.

## 흔들기

꼬리 흔들기 기능을 사용하면 꼬리가 자동으로 흔들려요. **흔들기 속도(Waving Speed)**와 **흔들기 범위(Waving Range)**를 조정하여 꼬리가 더 빠르거나 느리게, 그리고 더 크게 또는 작게 흔들리도록 맞출 수 있어요.

## 물리 설정

꼬리를 위한 고급 물리 설정이에요.

* **Slithery**: 값이 0일 때는 바람에 흔들리는 나뭇가지와 비슷하고, 1일 때는 동물의 꼬리나 촉수에 더 적합해요.
* **Curling**: 각 관절의 굽힘 정도를 조정해요.
* **Springiness**: 값이 높을수록 꼬리가 더 탄력적으로 움직여요.
* **Reaction Speed**: 값이 낮을수록 움직임에 저항이 커져서 물속에 있는 것처럼 느껴져요.
* **Rotation Relevancy**: 값이 낮을수록 꼬리가 더 무겁게 느껴지고, 원래 위치로 돌아가는 속도가 느려져요.
* **Gravity**: 꼬리에 적용되는 중력 힘이에요.

## 충돌 감지

충돌 감지는 꼬리가 씬의 다른 모델을 관통하지 않도록 해줘요. 현재는 캐릭터와의 충돌 감지만 지원돼요. 꼬리가 캐릭터의 몸에 부딪히지 않으면서도 너무 멀리 떨어지지 않도록 **Collider Radius**을 조정해야 해요.

## 역운동학

역운동학(IK)은 꼬리가 씬에서 지정된 **IK 타겟**을 따라가도록 해줘요. **Angle Limit**은 꼬리의 각 관절이 구부러질 수 있는 최대 각도예요. 꼬리가 IK 타겟에 도달하지 못할 경우, 이 값을 더 높여야 할 수 있어요.

## 추가 셰이프

꼬리의 추가 셰이프 매개변수

* **Rotation Offset**: 꼬리 회전의 오프셋 각도.
* **Curving**: 꼬리 각 관절의 추가적인 굽힘 정도.
* **Length Multiplier**: 꼬리를 늘리거나 줄일 수 있는 값.

:::tip
**Rotation Offset**은 특히 모델이 앉아 있을 때, 꼬리를 더 위쪽이나 아래쪽으로 향하게 할 때 유용해요. **Curving**은 꼬리를 더 둥글게 또는 뾰족하게 만들 때 자주 사용돼요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
