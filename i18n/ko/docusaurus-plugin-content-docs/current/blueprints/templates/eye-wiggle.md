---
sidebar_position: 30
---

# Live2D 눈 흔들림

:::caution
Warudo 0.12.3부터는 이 blueprint가 더 이상 필요하지 않으며, 진자 물리(pendulum physics) 편집기를 사용해 눈 흔들림을 설정하는 것이 권장돼요. 자세한 내용은 [Pendulum Physics](../../mocap/pendulum-physics) 섹션을 참고하세요.
:::

Eye wiggle은 Live2D 모델에서 흔히 볼 수 있는 효과로, 캐릭터의 눈을 더욱 생동감 있게 만들어줘요. 이 blueprint는 3D 모델에도 이 인기 있는 효과를 추가할 수 있어요!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/eye-wiggle.mp4" /></div>
<p class="img-desc">Live2D 스타일의 눈 흔들림 물리 효과!</p>

## 필수 조건

3D 모델에 눈 흔들림 효과를 추가하려면, 눈의 하이라이트와 동공을 분리하는 blendshape를 준비해야 해요. 예를 들어 아래와 같은 것들입니다:

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196832935-946222b5-e9a3-4efa-b9dc-7bdd04b9a3f2.mp4" /></div>
<p class="img-desc"></p>

:::tip
VRoid 모델을 사용하는 경우, [頼鳥ミドリ (@yoridrill)](https://twitter.com/yoridrill)님이 만든 blendshape 데이터를 사용할 수 있으며, [HANA_Tool](https://booth.pm/en/items/2604269)로 모델에 추가할 수 있어요. 자세한 내용은 [이 블로그 포스트](https://note.com/yoridrill/n/nfc15a0760a26)를 참조하세요.
:::

이 blueprint는 다음 여섯 가지 blendshape을 가지고 있다고 가정하고 있어요:

* `highlight_down_left`: 왼쪽 눈 하이라이트가 아래로 이동
* `highlight_down_right`: 오른쪽 눈 하이라이트가 아래로 이동
* `highlight_rotate_left`: 왼쪽 눈 하이라이트가 반시계 방향으로 회전
* `highlight_rotate_right`: 오른쪽 눈 하이라이트가 시계 방향으로 회전
* `highlight_scale_left`: 왼쪽 눈 하이라이트가 확대됨
* `highlight_scale_right`: 오른쪽 눈 하이라이트가 확대됨

만약 여러분의 blendshape 이름이 다르다면, blueprint를 그에 맞게 수정할 수 있어요.

마지막으로, 캐릭터의 얼굴 추적(face tracking)이 이미 설정되어 있어야 해요.

## 설정

아래의 blueprint를 다운로드한 후, 씬에 가져오세요.

<a href="/blueprints/eye-wiggle.json" target="_blank" download>
<div className="file-box">
<p>
eye-wiggle.json
</p></div>
</a>

**Comment** 노드의 지침을 따라 이 blueprint를 설정하세요.

:::tip
다른 캐릭터 에셋을 생성한 경우, 노드에서 **Character** 옵션을 업데이트해야 할 수 있어요.
:::

## 비고

**"Float Pendulum Physics"** 노드는 [Live2D 물리 시뮬레이션](https://docs.live2d.com/en/cubism-editor-manual/physics-operation/)과 동일한 원리로 작동해요. 다중 세그먼트 진자를 지정하면(아래 그림 참조), 진자의 가장 위 노드의 X 좌표가 입력값으로 사용되고, 가장 아래 노드의 X 좌표가 출력값으로 사용돼요. **Arms** 옵션은 각 세그먼트의 길이와 물리적 특성을 결정해요.

<div className="video-box"><video loop controls src="/doc-img/zh-blueprint-example-live2d-physics-video-4.mp4" />
</div>
<p class="img-desc">출처：<a href="https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/" target="_blank">https://docs.live2d.com/en/cubism-editor-manual/physical-operation-setting/</a></p>

**Visualize**를 Yes로 설정하면 진자 물리를 미리 볼 수 있어요:

<div className="video-box"><video loop controls src="https://user-images.githubusercontent.com/3406505/196835467-8eec329f-176f-47ba-af4e-fb4d0c4361d6.mp4" /></div>
<p class="img-desc"></p>

이 blueprint는 한 겹의 하이라이트 움직임만 구현했지만, 여러 개의 Float Pendulum Physics 노드와 더 많은 하이라이트 blendshape 레이어를 사용하여 더 정교한 눈 흔들림 효과를 만들 수 있어요.

:::tip
"Float Pendulum Physics"노드는 눈 흔들림 물리를 구현하는 데만 국한되지 않아요! 이 방식을 사용하여 Live2D에서 볼 수 있는 다른 물리 효과도 Warudo에서 구현할 수 있어요. 예를 들어, 팔이 튀어 오르는 물리 효과 같은 것도 만들 수 있어요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
