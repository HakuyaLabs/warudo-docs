---
sidebar_position: 60
translate_from_version: 2023-12-27
---
# 스크린

데스크톱이나 윈도우 화면을 캡처하여 OBS처럼 씬에 표시할 수 있어요. 또한 이미지, 비디오, 심지어 웹페이지도 표시할 수 있어요!

![](/doc-img/zh-screen-1.webp)
<p class="img-desc">커브드 스크린!</p>

## 설정

설정한 **콘텐츠 유형(Content Type)** 에 따라, 스크린은 다음을 표시할 수 있어요:
* 이미지 (**Image**)
* 비디오 (**Video**)
* 웹페이지 (**Browser**)
* 테스크탑 화면(**Display**)
* 윈도우 (**Window**)
* NDI 소스 (**NDI**)
* Spout 소스 (**Spout**)

그래서 매우 다재다능하게 사용할 수 있어요!

## 콘텐츠 유형

### 이미지

**Content Type**이 **Image**로 설정된 경우, **Image Source**를 지정하여 이미지를 표시할 수 있어요. 지원되는 파일 형식은 JPG, PNG, GIF, WEBP이며, 투명 이미지도 지원돼요.

### 비디오

**Content Type**이 **Video**로 설정된 경우, **Video Source**를 지정하여 비디오를 표시할 수 있어요. 주요 비디오 형식이 지원되며, 투명한 MP4 비디오도 지원돼요. **Auto Play**를 활성화하면 씬이 로드될 때 비디오가 자동으로 재생되도록 할 수 있어요.

### 브라우저

**Content Type**이 **Browser**로 설정된 경우, **URL**을 지정하여 웹페이지를 표시할 수 있어요. 또한 **Custom CSS** 스타일시트를 지정하여 웹페이지 로드 후 삽입할 수 있어요. 이를 통해 커스텀 채팅 위젯을 3D 공간에 배치할 수 있어요:

![](/doc-img/zh-screen-2.webp)
<p class="img-desc">3D 라이브 챗!</p>

### 디스플레이

**Content Type**이 **Display**로 설정된 경우, 표시할 **Display**(모니터)를 지정할 수 있어요. 

### 윈도우

**Content Type**이 **Window**로 설정된 경우, 표시할 **Window**를 지정할 수 있어요. 창은 창 제목을 기준으로 캡처되므로, 같은 제목을 가진 여러 창이 있을 경우, 그중 하나만 캡처돼요.

### NDI

**Content Type**이 **NDI**로 설정된 경우, **NDI Source**를 지정하여 표시할 수 있어요. 이를 통해 NDI를 지원하는 다른 애플리케이션의 출력을 표시할 수 있어요.

### Spout

**Content Type**이 **Spout**로 설정된 경우, **Spout Source**를 지정하여 표시할 수 있어요. 이를 통해 Spout을 지원하는 다른 애플리케이션의 출력을 표시할 수 있어요.

## 외관(Appearnace)

기본적으로 스크린은 곡선 형태로 설정되어 있어요. **Bend**를 비활성화하면 스크린을 평평하게 만들 수 있어요. 또한, **Bend Radius**를 조정하여 스크린의 곡률을 변경할 수 있어요. **Thickness**는 스크린의 두께를 조절하며, 스크린 측면에는 콘텐츠의 가장자리 색상이 표시돼요.

**Crop** 설정을 사용하여 스크린의 네 면을 잘라낼 수 있으며, 각 값은 스크린 너비/높이의 백분율로 설정돼요. 또한, **Corner Radius**를 조정하여 스크린의 네 모서리를 둥글게 만들 수 있어요.

**Tint**를 사용하여 스크린의 전체 색조를 조정할 수 있어요. Tint의 알파 값이 1보다 작으면 스크린이 반투명 상태가 돼요.

**Chroma Key** 색상을 설정하여 스크린에서 해당 색상을 투명하게 만들 수 있어요. 예를 들어, 콜라보 파트너의 스트림을 씬에 표시할 때 유용하게 사용할 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
