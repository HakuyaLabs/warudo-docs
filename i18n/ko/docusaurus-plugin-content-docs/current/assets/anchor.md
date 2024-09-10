---
sidebar_position: 70
---

# 앵커

앵커는 씬에서 사용할 수 있는 3D 점으로, 캐릭터의 [Look At IK](character/#look-ik) 또는 [Body IK](character/#body-ik)의 목표 지점으로 사용할 수 있어요.

일부 blueprint 노드에서는 앵커를 출발지 또는 목적지로 지정할 수도 있어요. 예를 들어, **Launch Liquid At Character** 노드는 기본적으로 메인 카메라에서 액체를 발사하지만, 출발지로 앵커를 지정하면 해당 앵커에서 액체를 발사할 수 있어요. 예를 들어, 앵커를 하마 소품의 입에 부착했다면, 액체를 하마의 입에서 발사할 수 있어요.

![](/doc-img/en-anchor-1.png)
<p class="img-desc">하마 소품의 입에 부착된 앵커가 액체 발사의 시작점으로 사용되고 있어요.</p>

## 설정

앵커를 설정하려면, 먼저 **Attach To** 옵션을 설정하여 앵커를 캐릭터나 소품에 부착할지 결정하세요. 그런 다음, 변환 도구를 사용하여 앵커를 원하는 위치로 이동하고 회전시켜 배치하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
