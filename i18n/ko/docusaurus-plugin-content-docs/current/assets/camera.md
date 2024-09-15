---
sidebar_position: 50
---

# 카메라

카메라는 씬의 뷰를 제어하는 데 사용돼요. 한 씬에 최대 8개의 카메라를 추가할 수 있어요!

## 설정

기본적으로 씬에는 이미 카메라가 하나 있어요. 새로운 카메라를 추가하려면 **Add Asset** 메뉴를 사용하세요. 새로운 카메라를 추가했더라도 메인 창에는 여전히 원래 카메라의 뷰가 표시될 거예요. 이는 **main camera**가 여전히 원래 카메라이기 때문이에요. 메인 카메라를 전환하려면 다음 중 하나를 사용할 수 있어요:

1. 카메라 이름 앞에 있는 카메라 아이콘을 클릭해 해당 카메라를 메인 카메라로 설정하세요.
2. **Tab** 키를 눌러 씬의 다음 카메라로 전환하거나, **Ctrl+Tab**을 눌러 이전 카메라로 전환하세요.

![](/doc-img/en-camera-1.png)
<p class="img-desc">카메라 이름 앞에 색이 채워진 카메라 아이콘은 이 카메라가 메인 카메라임을 나타냅니다.</p>

카메라는 기본적으로 **Free Look** 모드로 설정돼요. **Control Mode**를 **Orbit Character**로 설정하면 카메라가 캐릭터 주변을 회전하게 할 수 있어요. **Control Mode**를 **None** 으로 설정하면 카메라를 고정할 수 있어요.

:::tip
다른 캐릭터를 중심으로 카메라를 회전하게 하려면, **Focus Character**를 원하는 캐릭터로 설정하세요.
:::

카메라의 이동 속도를 높이거나 낮추려면 **Control Sensitivity**를 조정하면 돼요.ㅋㅋ

## 출력

기본적으로 Warudo의 NDI/Spout/가상 카메라는 메인 창의 뷰를 출력해요(이 옵션은 **Menu → Settings**에서 활성화하거나 비활성화할 수 있어요). 또한 각 카메라별로 **NDI/Spout/가상 카메라 출력**을 개별적으로 활성화할 수 있어요. 이를 통해 여러 카메라의 뷰를 동시에 출력할 수 있어요.

![](/doc-img/en-camera-1.webp)
<p class="img-desc">Spout/NDI/가상 카메라 출력을 활성화하면 여러 카메라의 뷰를 동시에 보여줄 수 있어요.</p>

:::info
Spout을 [OBS](https://obsproject.com/)로 출력하려면, [obs-spout2-plugin](https://github.com/Off-World-Live/obs-spout2-plugin/releases)을 설치하고 Spout2 Capture 소스를 추가하세요. NDI를 [OBS](https://obsproject.com/)로 출력하려면, [obs-ndi](https://github.com/Palakis/obs-ndi) 플러그인을 설치하고 NDI™ 소스를 추가하세요.

Warudo를 같은 네트워크 내의 다른 장치로 출력하려면 NDI를 사용하고, 같은 PC의 다른 애플리케이션(예: OBS)으로 출력하려면 Spout을 사용하세요. Spout은 리소스 사용량과 지연 시간이 더 적기 때문에 권장돼요.
:::

:::tip
모든 출력 방식은 투명 배경 출력을 지원해요. **Basic Properties → Transparent Background**을 활성화하면 배경을 투명하게 만들 수 있어요.

OBS에서 Spout 출력을 사용할 때, Spout2 Capture 속성에서 **Composite Mode**를 **Premultiplied Alpha**로 설정하면 투명 배경을 사용할 수 있어요.

![](/doc-img/en-camera-3.webp)

OBS에서 가상 카메라 출력을 사용할 때, Video Capture Device 속성에서 **Video Format**을 **ARGB**로 설정하면 투명 배경을 사용할 수 있어요.

![](/doc-img/en-camera-4.webp)
:::

이 카메라의 뷰를 스크린샷 촬영하려면 **Screenshot** 버튼을 클릭하세요.

:::tip
스크린샷 촬영을 위한 단축키를 설정하려면, bluprint에서 **Take Screenshot** 노드를 사용하세요.
:::


## 기본 속성

카메라에 **Chroma key**를 설정하여 씬의 배경을 특정 색으로 대체할 수 있어요. 배경을 투명하게 만들려면, **Chromna key color**를 (0, 0, 0, 0)으로 설정하거나 **Transparent Background**을 활성화하면 돼요.

:::caution
**Chroma Key**나 **Transparent Background**를 활성화하더라도, 씬의 [환경](environment.md)은 여전히 보일 거예요.
:::

카메라는 캐릭터/소품/환경을 렌더링할지 여부를 설정할 수 있어요. 예를 들어, **Render Environment**를 끄면 카메라 뷰에서 환경이 더 이상 보이지 않지만, 환경의 조명이 캐릭터와 소품에 미치는 영향은 여전히 나타나요. 이것은 투명한 배경이 필요하면서도 환경의 조명을 사용하고 싶을 때 유용해요. 환경을 끄는 대신 카메라에서 **Render Environment**만 끄면 돼요.

또한 유용한 매개변수는 **Field Of View**(시야각)로, 카메라가 얼마나 넓게 볼 수 있는지를 조절해요. 값이 클수록 카메라의 시야가 넓어져요. **Orthographic Projection**은 뷰를 가능한 평평하게 보이도록 만들고 싶을 때 유용해요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-ortho-off.webp"  />
<p class="img-desc">Orthographic projection 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-ortho-on.png"  />
<p class="img-desc">Orthographic projection 활성화.</p>
</div>
</div>

## 손떨림 효과

카메라가 사람 손에 들려 있는 것처럼 보이도록 하려면 **Handheld Movement**를 활성화하세요.이 옵션은 카메라에 약간의 흔들림을 추가해요. **Intensity**와 **Speed**를 조정하여 흔들림의 강도와 속도를 제어할 수 있어요.

## 후처리 효과 {#post-processing}

:::info
N[Warudo Pro](../pro)에서 Universal RP가 활성화된 경우, 다음 후처리 효과는 사용할 수 없어요. 대신 [Post Processing Volume](../ppv) 에셋을 사용해야 해요.
:::

### 톤매핑 & 컬러 그레이딩

**LUT Texture**를 설정하면 씬의 분위기를 완전히 바꿀 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-lut-off.png"  />
<p class="img-desc">LUT 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-lut-on.png"  />
<p class="img-desc">LUT 활성화.</p>
</div>
</div>

:::tip
Warudo에는 200개 이상의 내장 LUT 텍스처가 있어요. 씬에 어울리는 것을 선택해 보세요!
:::

**ACES Tonemapping**을 활성화할 수도 있어요. ACES는 영화 산업에서 널리 사용되는 색상 관리 시스템으로, 환경을 더 현실감 있게 만들어 줄 수 있어요. 다만, 채도가 높은 애니메이션 스타일 캐릭터와는 잘 어울리지 않을 수 있어요.

마지막으로, **Vibrance(생동감)**, **Contrast(대비)**, **Brightness(밝기)**, **Tint(색조)** 등을 사용하여 씬의 색상을 원하는 대로 조정할 수 있어요.

:::info
참고로 Warudo는 기본적으로 **Vibrance**, **Contrast**, **Brightness**를 각각 1, 1.02, 1.05로 설정하여 씬을 더 생동감 있게 보여줘요. 원래 색상을 그대로 유지하려면, 이 값을 0, 1, 1로 설정해야 해요.
:::

### 블룸

블룸 효과는 이미지의 밝은 부분 주위에 후광 효과를 만들어줘요. **Strength**는 블룸 효과의 강도를 제어하고, **Threshold**는 블룸 효과가 적용될 밝기의 하한선을 조절해요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-bloom-off.png"  />
<p class="img-desc">블룸 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-bloom-on.png"  />
<p class="img-desc">블룸 활성화.</p>
</div>
</div>

### 앰비언트 오클루전

씬에 더 많은 그림자를 추가하여 보다 현실적인 느낌을 만들어줘요. **Radius**는 그림자의 반경을 조절하고, **Intensity**는 그림자의 강도를 제어해요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-ssao-off.png"  />
<p class="img-desc">앰비언트 오클루전 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-ssao-on.png"  />
<p class="img-desc">앰비언트 오클루전 활성화.</p>
</div>
</div>

:::info
애니메이션 스타일 캐릭터 모델(특히 얼굴 메쉬가 완전히 평평하지 않은 경우)에서는 앰비언트 오클루전을 활성화하는 것이 권장되지 않아요. 앰비언트 오클루전을 활성화했는데 캐릭터의 그림자가 이상하게 보인다면, **Max Radius Pixels** 값을 조정해 보세요.
:::

### 아나모픽 플레어

왜곡된 렌즈의 수평/수직 플레어 효과를 제공해요. **Intensity**는 플레어의 강도를, **Threshold**는 플레어 효과를 발산하는 이미지 밝기의 하한선을 조절해요. 플레어가 더 넓게 퍼지게 하려면 **Spread** 값을 높일 수 있어요. 기본적으로 플레어는 수평으로 설정되어 있지만, **Vertical Flares**를 활성화하면 수직 플레어로 변경할 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-flare-off.png"  />
<p class="img-desc">아나모픽 플레어 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-flare-on.png"  />
<p class="img-desc">아나모픽 플레어 활성화.</p>
</div>
</div>

### 피사계 심도

초점이 맞지 않는 물체를 흐리게 만들어요. 특정 **Focus Distance**(초점 거리)를 수동으로 설정하거나, **Focus Character**를 활성화 하여 **Controls → Focus Character**에서 선택한 캐릭터에 자동으로 초점을 맞출 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-dof-off.png"  />
<p class="img-desc">피사계 심도 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-dof-bokeh-off.png"  />
<p class="img-desc">보케가 있는 피사계 심도 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-dof-on.png"  />
<p class="img-desc">보케가 있는 피사계 심도 활성화.</p>
</div>
</div>

### 색수차

렌즈가 모든 색을 동일한 초점에 맞추지 못할 때 발생하는 색수차 효과를 모방해요. **Intensity**는 이 효과의 강도를 제어해요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-color-abb-off.webp"  />
<p class="img-desc">색수차 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-color-abb-on.png"  />
<p class="img-desc">색수차 활성화.</p>
</div>
</div>

### 렌즈 먼지

렌즈에 묻은 먼지와 얼룩을 시뮬레이션해요. 먼저 렌즈 먼지 **텍스처**를 선택해야 해요. **Intensity**는 렌즈의 더러움 강도를, **Threshold**는 렌즈 먼지 효과가 적용될 이미지 밝기의 하한선을 조절해요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-lens-dirt-off.webp"  />
<p class="img-desc">렌즈 먼지 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-lens-dirt-on.png"  />
<p class="img-desc">렌즈 먼지 활성화.</p>
</div>
</div>

### 비네팅

이미지의 가장자리를 어둡게 만들어 줘요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-vignette-off.webp"  />
<p class="img-desc">비네팅 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-vignette-on.webp"  />
<p class="img-desc">비네팅 활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-vignette-blink.png"  />
<p class="img-desc">비네팅 깜빡임과 함께 활성화.</p>
</div>
</div>

### 야간 투시경

야간 투시경을 시뮬레이션해요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-nightvision-off.png"  />
<p class="img-desc">야간 투시경 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-nightvision-on.webp"  />
<p class="img-desc">야간 투시경 활성화.</p>
</div>
</div>

### 블러

이미지를 흐리게 만들어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-blur-off.webp"  />
<p class="img-desc">블러 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-blur-on.webp"  />
<p class="img-desc">블러 활성화.</p>
</div>
</div>

### 픽셀화

이미지에 모자이크 효과를 추가해요!

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-camera-pixelate-off.webp"  />
<p class="img-desc">픽셀화 비활성화.</p>
</div>
<div>
<img src="/doc-img/en-camera-pixelate-on.png"  />
<p class="img-desc">픽셀화 활성화.</p>
</div>
</div>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
