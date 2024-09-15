---
sidebar_position: 503
---

# 후처리 볼륨

:::info
이 기능은 [Warudo Pro](../pro)에서만 사용 가능해요. 씬에 Post Processing Volume을 추가하려면 **Settings → URP**에서 Universal RP를 활성화해야 해요..
:::

Post processing volume 에셋은 씬에 후처리 효과를 추가하는 데 사용돼요. [카메라](camera#post-processing)에 적용되는 후처리 효과와 유사하지만, Post Processing Volume은 한 카메라가 아니라 씬 전체에 영향을 미쳐요.

Post processing volume 에셋은 Unity의 [URP Volume](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@17.0/manual/volumes-landing-page.html)을 감싸는 역할을 하므로, 동일한 매개변수를 사용해요. 아래에서 사용 가능한 후처리 효과에 대한 간략한 개요를 제공하며, 자세한 내용은 [the Unity documentation](https://docs.unity3d.com/Packages/com.unity.render-pipelines.universal@17.0/manual/EffectList.html)를 참조하세요.

## 설정

**Import From Environment** 버튼을 클릭하여 환경에서 후처리 설정을 가져올 수 있어요(해당 설정이 있는 경우). 그런 다음, 원하는 대로 후처리 설정을 조정할 수 있어요. 설정이 적용되려면 각 항목 옆의 체크박스를 선택해 활성화해야 해요. 이를 통해 환경의 후처리 설정을 선택적으로 재정의할 수 있어요.

## 블룸

블룸은 씬의 밝은 부분을 발광하게 만드는 후처리 효과예요.

![](/doc-img/bloom-off.png)
<p class="img-desc">블룸 비활성화.</p>

![](/doc-img/bloom.png)
<p class="img-desc">블룸 활성화.</p>

:::info
만약 NiloToon을 사용 중이라면, 이 블룸 효과 대신 [NiloToon 볼륨](nilotoon-volume)의 블룸을 사용하는 것이 권장돼요. NiloToon 볼륨은 캐릭터와 환경에 서로 다른 강도와 임계값으로 블룸 효과를 별도로 적용할 수 있어요.
:::

## 채널 믹서

채널 믹서는 각 입력 색상 채널이 출력 채널의 전체 혼합에 미치는 영향을 수정해요. 예를 들어, 녹색 채널이 빨간색 채널에 미치는 영향을 증가시키면, 최종 이미지에서 녹색 영역(중립색/단색 포함)이 더 붉은 색조로 변하게 돼요.

## 색수차

색수차는 렌즈가 모든 색상을 동일한 지점에 맞추지 못할 때 발생하는 효과를 모방해요.

![](/doc-img/chromatic-aberration-off.png)
<p class="img-desc">색수차 비활성화.</p>

![](/doc-img/chromatic-aberration.png)
<p class="img-desc">색수차 활성화.</p>

## 색상 조정

이 효과를 사용하여 최종 렌더링된 이미지의 톤, 밝기, 대비를 조정할 수 있어요.

![](/doc-img/color-adjustments-off.png)
<p class="img-desc">색상 조정 비활성화.</p>

![](/doc-img/color-adjustments.png)
<p class="img-desc">색상 조정 활성화.</p>

## 피사계 심도

초점이 맞지 않는 물체를 흐리게 만들어요. **Focus Distance**를 재정의하면 **Auto Focus Character**를 설정할 수 있어, 초점 거리가 자동으로 캐릭터를 따라가도록 할 수 있어요.

![](/doc-img/dof-gaussian.png)
<p class="img-desc">가우시안 모드를 사용한 피사계 심도.</p>

![](/doc-img/dof-bokeh.png)
<p class="img-desc">보케 모드를 사용한 피사계 심도.</p>

## 필름 그레인

사진 필름에서 볼 수 있는 랜덤한 광학 질감을 시뮬레이션해요. 이는 보통 물리적 필름에 있는 작은 입자들로 인해 발생해요.

![](/doc-img/film-grain-off.png)
<p class="img-desc">필름 그레인 비활성화.</p>

![](/doc-img/film-grain.png)
<p class="img-desc">필름 그레인 활성화.</p>

## 렌즈 왜곡

실제 카메라 렌즈의 모양을 시뮬레이션하여 최종 렌더링된 이미지를 왜곡해요.

![](/doc-img/lens-distortion-off.png)
<p class="img-desc">렌즈 왜곡 비활성화.</p>

![](/doc-img/lens-distortion.png)
<p class="img-desc">렌즈 왜곡 활성화.</p>

## 리프트 감마 게인

3-way 색상 그레이딩을 수행해요. 

## 모션 블러

실제 카메라가 노출 시간보다 빠르게 움직이는 물체를 촬영할 때 발생하는 모션 블러를 시뮬레이션해요.

![](/doc-img/motion-blur-off.png)
<p class="img-desc">모션 블러 비활성화.</p>

![](/doc-img/motion-blur.png)
<p class="img-desc">모션 블러 활성화.</p>

## 파니니 투사

씬에서 매우 넓은 시야각을 가질 때 원근감을 표현하는 데 도움을 줘요.

![](/doc-img/panini-off.png)
<p class="img-desc">파니니 투사 비활성화.</p>

![](/doc-img/panini.png)
<p class="img-desc">파니니 투사 활성화.</p>

## 그림자 미드톤 하이라이트

렌더링에서 그림자, 중간톤, 하이라이트를 각각 제어해요.

## 스플릿 토닝

명암에 따라 이미지의 다른 부분에 색조를 입혀 독특한 스타일을 연출해요. 이를 통해 씬의 그림자와 하이라이트에 다른 색조를 추가할 수 있어요.

## 톤매핑

톤매핑은 이미지의 HDR 값을 새로운 값 범위로 재매핑하는 과정이에요. 주로 낮은 다이내믹 레인지의 이미지를 더 높은 다이내믹 레인지처럼 보이도록 하기 위해 사용돼요.

:::tip
**ACES** 톤매핑 모드는 대부분의 환경에서 더 시네마틱한 느낌을 연출하는 데 추천돼요.
:::

## 비네트

이미지의 중앙보다 가장자리를 어둡게 하거나 채도를 낮춰 이미지의 중앙에 집중하도록 만들어요.

## 화이트 밸런스

비현실적인 색상 왜곡을 제거하여, 실제로 흰색으로 보일 물체가 최종 이미지에서도 흰색으로 표현되도록 화이트 밸런스 효과를 적용해요. 또한, 최종 렌더에서 차가운 또는 따뜻한 느낌을 연출하는 데도 사용할 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
