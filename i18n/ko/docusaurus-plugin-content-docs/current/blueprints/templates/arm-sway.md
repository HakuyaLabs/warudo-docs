---
sidebar_position: 10
---

# Live2D 팔 흔들기

:::caution
Warudo 0.12.3 부터는 기본 진자 물리(pendulum physics) 설정으로 팔의 흔들림이 활성화되므로, 이 blueprint는 더 이상 필요하지 않아요. 자세한 내용은 [Pendulum Physics](../../mocap/pendulum-physics) 섹션을 참고하세요. 이 blueprint는 blueprint를 사용해 캐릭터에 진자 물리를 수동으로 추가하는 데 참고자료로 유용할 수 있어요.
:::

팔의 흔들림은 Live2D 모델에서 흔히 볼 수 있는 효과로, 캐릭터의 팔이 앞뒤로 흔들리며 생동감을 더해줘요. 이 blueprint는 3D 모델에도 이 인기 있는 효과를 추가할 수 있어요!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/arm-sway.mp4" /></div>
<p class="img-desc">Live2D처럼 팔이 흔들리는 모습!</p>

## 설정

아래의 blueprint를 다운로드한 후, 씬에 가져오세요.

<a href="/blueprints/arm-sway.json" target="_blank" download>
<div className="file-box">
<p>
arm-sway.json
</p></div>
</a>

이 blueprint는 별도의 추가 설정 없이 바로 작동할 거예요. **Comment** 노드의 지침을 따라 설정을 조정하세요.

:::tip
다른 캐릭터 에셋을 생성한 경우, 노드에서 **Character** 옵션을 업데이트해야 할 수 있어요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
