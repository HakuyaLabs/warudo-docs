---
sidebar_position: 5
---

# 당신의 첫 모드를 만들어보세요

이제 첫 번째 모드를 만들어봐요! 이번 튜토리얼에서는 간단한 흰색 큐브 [소품 모드](prop-mod)를 만들 거예요.

:::info
시작하기 전에 [Warudo SDK](mod-sdk.md)가 이미 설정되어 있는지 확인하세요..
:::

Unity를 사용해 본 경험이 없다면, Unity 에디터에 익숙해지기 위해 초보자 튜토리얼을 몇 개 보는 것을 추천해요. [Unity Learn](https://learn.unity.com/)이 좋은 출발점이에요!

:::tip
처음 모드를 만들 때는 다소 복잡할 수 있어요. 도움이 필요하면 언제든 [Discord](https://discord.gg/warudo)에서 문의하세요!
:::


## 튜토리얼

새로운 모드를 만들려면 메뉴 바에서 **Warudo → New Mod**를 선택하세요:

![](/doc-img/en-mod-sdk-3.webp)

**Mod Name**에 "WhiteCube"을 입력하고 <b>Create Mod!</b>을 클릭하세요:

![](/doc-img/en-mod-1.png)

Assets 폴더 아래에 모드 폴더가 생성된 것을 확인할 수 있어요:

![](/doc-img/en-mod-2.png)

이 폴더는 **mod folder**라고 불리며, 모드와 동일한 이름을 가집니다..
:::tip
**모든 assets(예: 프리팹, 셰이더, 재질)와 스크립트는 반드시 모드 폴더에 있어야 해요.** 만약 모드 폴더 밖에 있으면 모드에 포함되지 않아요.
:::

이제 씬에 큐브를 만들어 봅시다. 메뉴 바에서 **GameObject → 3D Object → Cube**를 선택하세요:

![](/doc-img/en-mod-3.png)

큐브를 모드로 내보내려면, 먼저 모드 폴더에 프리팹을 만들어야 해요. 씬에서 큐브를 선택한 후 모드 폴더로 드래그하여 프리팹(파란색 큐브 아이콘)을 만드세요:

![](/doc-img/en-mod-4.png)

Warudo는 당신이 어떤 유형의 모드를 만드는지 알아야 해요. 우리는 소품 모드를 만들고 있으니, 프리팹 이름을 Prop으로 변경해야 해요. 프리팹을 마우스 오른쪽으로 클릭하고 **Rename**을 선택하세요:

![](/doc-img/en-mod-5.png)

거의 완료됐어요! 모드를 내보내기 전에, 모드 설정이 올바른지 확인해 봅시다. **Warudo → Mod Settings**을 선택하여 모드 설정 창을 열고, 모드의 이름, 버전, 제작자, 설명을 설정할 수 있어요. 또한 Warudo의 미리보기 갤러리에서 표시될 모드 아이콘도 지정할 수 있습니다.

![](/doc-img/en-mod-6.png)

기본적으로 **Mod Export Directory**는 비어 있어요. 이 경우 모드는 프로젝트의 루트 폴더에 내보내지죠. 모드를 Warudo에서 바로 테스트할 수 있도록 해당 Warudo 데이터 폴더로 경로를 설정해 두는 것이 편리해요!

Warudo에서 **Menu → Open Data Folder**를 선택해 데이터 폴더를 열어요. 그런 다음, 데이터 폴더의 경로를 복사하여 **Mod Export Directory** 필드에 붙여넣습니다. 우리가 소품 모드를 만들고 있으니 경로 끝에 `\Props`를 추가해 주세요. 예를 들어, 데이터 폴더의 경로가 `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets`라면, **Mod Export Directory**는  `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Props`가 되어야 해요.

:::tip
마찬가지로, 캐릭터 모드를 만들고 있다면 **Mod Export Directory**를 `Characters` 데이터 폴더로 설정해야 합니다.
:::

마지막으로 **Warudo → Build Mod**를 선택하여 모드를 내보내세요. 모드가 내보내지고 나면 props 데이터 폴더에 `WhiteCube.warudo` 파일이 생긴 것을 확인할 수 있을 거예요. 이제 Warudo에서 소품 에셋을 만들고 **Source** 드롭다운에서 "WhiteCube"를 선택해 보세요. 씬에 흰색 큐브가 나타난다면 축하해요! 첫 번째 모드를 성공적으로 만들었어요!

![](/doc-img/en-mod-7.png)

다른 모드를 만드는 과정도 비슷해요: **Warudo → New Mod**로 새 모드를 만들고, 에셋과 스크립트를 모드 폴더에 넣은 후 **Warudo → Build Mod**를 통해 모드를 내보내세요. 다양한 모드 종류에 대한 더 자세한 정보는 사이드바의 관련 섹션을 참고하세요.

## 모드 이름 정하기

새로운 모드를 만들 때는 모드의 이름을 지정해야 해요. 모드 이름은 Warudo에서 모드를 식별하는 중요한 요소에요. "My Mod"나 "Test Mod"처럼 일반적인 이름은 피해주세요. 이런 이름은 다른 사람들이 모드를 찾기 어렵게 만들고, 다른 모드와 충돌할 수 있어요.

고유하고 설명적인 이름을 사용하는 것을 추천해요. 이름에는 공백을 포함할 수 있지만 특수 문자는 사용할 수 없어요.

:::caution
같은 이름의 모드는 한 번에 하나만 로드될 수 있다는 점을 주의해야 해요. 즉, 같은 모드 폴더를 재사용해서 다른 모드를 내보내면 안 돼요!
:::

## 핫 리로딩

Warudo는 핫 리로딩을 지원해요. Unity에서 새로운 버전의 모드를 내보내 기존 모드 파일을 덮어쓰면, Warudo가 자동으로 모드를 다시 로드하고 씬에서 변경 사항을 반영합니다. 예를 들어, 큐브의 소재를 빨간색으로 바꾸고 모드를 다시 내보내면, Warudo에서 즉시 큐브가 빨간색으로 변하는 것을 볼 수 있을 거예요!

:::info
단, 핫 리로딩이 항상 예상대로 작동하지 않을 수 있어요. 문제가 발생하면 Warudo를 다시 시작해보세요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
