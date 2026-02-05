---
sidebar_position: 50
---

# 플레이그라운드

Playground는 Warudo에서 [플러그인 모드](plugin-mod)를 만들지 않고도 커스텀 스크립트를 로드할 수 있는 개발 환경이에요. `Playground` 폴더에 넣은 C# 스크립트(`.cs` 파일)는 Warudo에서 자동으로 컴파일 및 로드되며, 스크립트에 변경 사항이 생기면 자동으로 다시 로드돼요.

:::tip
Playground를 처음 사용하는 방법에 대해서는 [당신의 첫 스크립트를 만들어보세요](creating-your-first-script)를 확인해 보세요!
:::

Playground에는 어떤 C# 스크립트든 넣을 수 있지만, Warudo가 이를 인식하려면 적어도 하나의 클래스는 `Node`, `Asset` 또는 `Plugin` 중 하나의 [엔티티 유형](api/entities.md)을 상속해야 해요.

## 환경 설정

Playground를 사용하기 위해 IDE가 꼭 필요한 건 아니지만, 코드 완성과 구문 강조를 위해 IDE 사용을 권장해요. [JetBrains Rider](https://www.jetbrains.com/rider/)나 [Visual Studio Code](https://code.visualstudio.com/)를 추천해요..

그 다음, `.csproj` 파일을 [여기](/scripts/Playground.csproj)에서 다운로드해 Warudo 데이터 폴더 내 `Playground` 디렉터리에 넣어주세요(Menu → Open Data Folder). 이 파일을 IDE로 열면 준비가 완료돼요!

## 엔티티 핫리로딩

핫리로딩은 엔티티 데이터를 직렬화하고, 기존 엔티티 타입을 언로드한 후 새로운 엔티티 타입을 로드 및 인스턴스화한 다음, 기존 엔티티 데이터를 다시 역직렬화하는 방식으로 작동해요. 이 과정은 보통 몇 초 안에 완료돼요.

핫리로딩이 완료되면, 몇 개의 에셋, 노드 또는 플러그인이 다시 로드되었는지 나타내는 토스트 메시지가 표시될 거예요.

:::tip
오류가 발생하면, 토스트 메시지를 클릭해 컴파일 오류를 확인할 수 있어요.
:::

## 제한 사항

Playground에는 다음과 같은 제한이 있어요:

* 서드파티 DLLs 또는 NuGet 패키지를 쉽게 사용할 수 없어요. 이 부분은 앞으로 개선할 예정이에요.
* Unity 에셋(예: 프리팹, 재질, 텍스처)을 Playground 스크립트에서 추가하거나 참조할 수 없어요([플러그인 모드](plugin-mod)를 사용하세요).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'}
  ],
}} />