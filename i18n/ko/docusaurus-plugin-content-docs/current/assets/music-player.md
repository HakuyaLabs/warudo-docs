---
sidebar_position: 60
---

# 뮤직 플레이어

:::info
이 기능은 현재 베타 서비스 중이에요.
:::

뮤직 플레이어 에셋은 Warudo에서 음악 파일을 재생할 수 있는 간단한 음악 플레이어예요. 노래방 스트림에 유용할 수 있으며, 현재 재생 중인 노래의 가사를 자동으로 다운로드하고 표시해줘요.

![](/doc-img/en-music-player-1.png)
<p class="img-desc">가사와 함께 음악 재생.</p>

## 설정

**Open Music Folder** 버튼을 클릭하여 음악 폴더를 열고, 그 안에 음악 파일을 복사하세요. 뮤직 플레이어는 MP3, WAV, OGG 파일을 지원해요.

뮤직 플레이어는 현재 재생 중인 노래의 가사를 자동으로 다운로드해요. 가사가 노래와 맞지 않는 경우, **Search Online Lyrics** 버튼을 클릭해 직접 가사를 검색하거나, 음악 파일과 동일한 이름의 `.lrc`가사 파일을 음악 폴더에 넣을 수 있어요.

:::caution
Universal RP를 사용하는 경우, 가사가 NDI/Spout/가상 카메라 출력에 표시되도록 하려면 **Camera**를 선택해야 해요.
:::

:::caution
참고로, 온라인 가사 기능은 이중 언어 가사(보통 원어와 중국어)를 반환할 수 있어요. 추후 원어로만 가사를 표시하는 옵션을 추가할 예정이에요.
:::

## 타이틀 이미지

가사 파일의 맨 앞에 줄을 추가하여 타이틀 이미지를 지정할 수 있어요. 예를 들어, `Music.mp3`라는 노래와 `Title.png`라는 타이틀 이미지가 있을 때, `Music.lrc` 파일에 다음과 같은 줄을 추가할 수 있어요:

```
[warudo.title:00:22.50,1.5,5,1.5,0,0,1500,700]
```

이 코드는 Warudo에게 노래가 22.5초에 제목 이미지를 표시하도록 지시하며, 페이드 인 시간이 1.5초, 이미지가 5초 동안 표시되고, 페이드 아웃 시간이 1.5초인 것을 의미해요. 마지막 두 숫자는 제목 이미지의 너비와 높이(픽셀 단위)예요.

![](/doc-img/en-music-player-2.png)
<p class="img-desc">타이틀 이미지 노출.</p>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
