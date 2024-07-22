---
sidebar_position: 10
---

# 개요

![](/doc-img/blueprints-cover.jpg)

Blueprint는 프로그래머에게만 허용된 개념과 도구를 활용하여 누구나 VTubing 설정을 위한 독특한 상호작용을 만들 수 있는 유연하고 강력한 비주얼 스크립팅 시스템이에요. Blueprint는 Warudo 편집기를 사용하여 생성 및 편집되며, 모든 변경 사항은 화면에 실시간으로 반영돼요.

Blueprint는 간단히 말해 플로우차트예요. 이를 정의하자면 **"X가 발생하면 Y를 수행한다"** 할 수 있어요. 몇 가지 예시를 살펴볼게요:

* Esc 키를 누르면, 카메라를 흔든다.
* "beep boop"이라는 내용을 포함한 Twitch 메시지를 받으면, beep boop 소리를 재생한다.
* 내가 큰 소리로 외치면, 내 캐릭터가 공중으로 발사된다.

큰 영감을 주지 못하나요? 그렇다면 다음 예시는 어떨까요:

* 입을 열면 내 캐릭터가 [불을 뿜기 시작해요.](https://twitter.com/MVjagaimo/status/1725869971845333173/video/1). (By [@MVjagaimo](https://twitter.com/MVjagaimo))
* 키를 누르면 캐릭터가 [방 안의 다른 장소로 걸어가며 카메라가 캐릭터를 따라가요](https://twitter.com/FelineEntity/status/1730225167572615582). (By [@FelineEntity](https://twitter.com/FelineEntity))
* WASD를 누르면 캐릭터가 [트럭을 운전해요](https://twitter.com/sablokato/status/1731679138677768700). (By [@sablokato](https://twitter.com/sablokato))
* Twitch 리딤을 받으면 내 캐릭터가 [회전하며 헝겊인형처럼 공중으로 날아가요](https://twitter.com/Shellbunny_/status/1712629869488853260). (By [@Shellbunny_](https://twitter.com/Shellbunny_))
* 검지 손가락을 맞대면 [그 사이에 전기 불꽃이 발생해요](https://twitter.com/hakuyalabs/status/1724364814158360767). (By [@HakuyaTira](https://twitter.com/hakuyatira))
* 내 캐릭터가 손으로 소품을 치면 소품이 [멀리 날아가요](https://twitter.com/FelineEntity/status/1727379837185319176). (By [@FelineEntity](https://twitter.com/FelineEntity))
* 손을 함께 모으면 [Ring Fit 소품이 눌려요](https://twitter.com/VanJiha_Vtuber/status/1737645095095341397/video/1). (By [@VanJiha_Vtuber](https://twitter.com/VanJiha_Vtuber))
* MIDI 컨트롤러의 버튼을 누르면 [가상 MIDI 컨트롤러의 버튼이 빛나요](https://twitter.com/ChiuYukina/status/1734913824086729149). (By [@ChiuYukina](https://twitter.com/ChiuYukina))
  ...

가능성은 무궁무진해요! 우리 커뮤니티 [Discord](https://discord.gg/warudo)에서 미리 만들어진 blueprint를 찾고 공유하거나, 직접 새로운 blueprint를 만들어보세요. 이 핸드북 섹션은 blueprint의 기본 사항을 안내하고, 시작할 수 있는 몇 가지 예시를 제공하며, 더 고급 주제로 심화해 나갈 거예요.

:::tip
Warudo에서 Blueprints는 단순한 신기함을 넘어서, 시스템 구조의 핵심적인 부분이에요. 예를 들어, Warudo의 모션 캡처는 전적으로 Blueprints를 사용해 구현돼요. 이는 Blueprints 시스템의 지속적인 업데이트와 개선을 보장하며, 끝없는 조합 가능성을 위한 다양한 노드 유형을 제공해요.
:::

:::info
개발자라면 Warudo의 blueprint 시스템에 새로운 노드 유형을 추가하여 확장할 수 있다는 점이 반가울 거예요! 자세한 내용은 [Scripting](../scripting/overview) 섹션을 참조하세요.
:::

## 인터페이스

**Blueprints** 탭에서 화면에 있는 모든 blueprint 목록을 볼 수 있어요. 편집할 blueprint를 선택하면 노드 편집기에서 편집할 수 있어요. 그런 다음, **Node Palette** 탭에서 노드를 드래그하거나 **Properties** 탭에서 선택한 blueprint의 속성을 수정할 수 있어요.

![](/doc-img/en-blueprints-1.png)
<p class="img-desc">개요.</p>

툴바에는 다음 버튼들이 있어요:
* **Add Blueprint**: 화면에 새로운 blueprint를 추가해요.
* **Remove Blueprint**: 선택한 blueprint를 화면에서 제거해요.
* **Duplicate Blueprint**: 선택한 blueprint를 복제해요.
* **Rename Blueprint**: 선택한 blueprint의 이름을 변경해요..
* **Format Blueprint**: 선택한 blueprint를 정리해요, 즉 노드를 자동으로 배치해요.
* **Import Blueprint From Clipboard**: 클립보드에서 blueprint를 가져와요.
* **Export Blueprint To Clipboard**: 선택한 blueprint를 클립보드로 내보내요.
* **Import Blueprint From File**: JSON 파일에서 blueprint를 가져와요.
* **Export Blueprint To File**: 선택한 blueprint를 JSON 파일로 내보내요.

:::tip
import/export 기능을 사용하여 화면 간에 blueprints를 복사할 수 있어요.
:::

노드 편집기를 탐색하려면, **마우스 왼쪽 버튼**을 사용하여 이동하고, **마우스 휠**로 확대/축소하며, **마우스 오른쪽 버튼**으로 여러 노드를 선택할 수 있어요. 하나 이상의 노드를 선택한 상태에서 **마우스 왼쪽 버튼**을 사용하여 노드를 드래그할 수 있으며, **Delete** 키를 눌러 삭제할 수 있어요. 또한, **Ctrl+C**와 **Ctrl+V**를 사용하여 선택한 노드를 복사하고 붙여넣을 수 있어요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
