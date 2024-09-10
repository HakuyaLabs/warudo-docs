---
sidebar_position: 5
---

# 상반신 회전

:::caution
Warudo 0.12.0부터는 상반신 회전이 기본적으로 활성화되어 있으므로, 이 blueprint는 더 이상 필요하지 않아요. 자세한 내용은 [얼굴 추적 커스터마이징](../../mocap/face-tracking) 섹션을 참고하세요.
:::

이 blueprint는 캐릭터의 상반신에 미묘하지만 현실적인 회전을 추가하여, 캐릭터의 신체 표현에 세련된 변화를 줄 수 있어요.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/upper-body-rotation.mp4" /></div>
<p class="img-desc">머리를 돌릴 때 상반신이 자연스럽게 회전하는 모습.</p>

## 필수 조건

캐릭터의 얼굴 추적(face tracking)이 이미 설정되어 있어야 해요.

## 설정

D아래의 blueprint를 다운로드한 후, 씬에 가져오세요.

<a href="/blueprints/upper-body-rotation.json" target="_blank" download>
<div className="file-box">
<p>
upper-body-rotation.json
</p></div>
</a>

T이 blueprint는 별도의 추가 설정 없이 바로 작동할 거예요. **Comment** 노드의 지침을 따라 설정을 조정하세요.

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
