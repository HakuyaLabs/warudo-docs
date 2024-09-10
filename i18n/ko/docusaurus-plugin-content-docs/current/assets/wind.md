---
sidebar_position: 42
---

# 바람

바람 에셋은 씬에서 바람을 시뮬레이션하는 데 사용돼요. 이 에셋은 머리카락, 옷, 그리고 [VRM 스피링 본](https://vrm.dev/en/univrm/springbone/index.html)이나 [Magica Cloth](https://magicasoft.jp/en/magica-cloth-2/) 구성 요소가 있는 다른 객체들이 바람에 반응하도록 만들어 줘요.

:::info
모델에 VRM 스프링 본 또는 Magica Cloth 구성 요소가 있는지 확인하려면? 모델 제작자에게 문의할 수 있지만, 일반적인 규칙은 머리카락이나 옷이 움직이는 모델이라면, VRM 스프링 본 또는 Magica Cloth 구성 요소가 있을 가능성이 높아요. 단, [Mod SDK](../modding/mod-sdk.md)를 사용해 내보낸 `.warudo` 모델만이 Magic cloth 구성 요소를 가질 수 있다는 점을 참고하세요.
:::

![](/doc-img/en-wind-1.png)
<p class="img-desc">바람이 캐릭터의 머리카락과 재킷을 휘날리는 모습.</p>

## Setup

모델의 물리 구성 요소 유형에 따라 **Wind (VRM)** 또는 **Wind (Magica Cloth)** 에셋을 생성하세요. 그런 다음, 다양한 매개변수를 조정하여 바람 효과를 원하는 대로 설정하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
