---
sidebar_position: 0
---

# 개요

![](/doc-img/mod-cover.jpg)

Warudo는 3D 에셋을 직접 Warudo에 가져올 수 있는 완벽한 모딩 시스템을 제공합니다. 이를 통해 다음과 같은 항목을 추가할 수 있어요:

* [캐릭터](character-mod)
* [캐릭터 애니메이션](character-animation-mod)
* [소품](prop-mod)
* [파티클](particle-mod)
* [환경](environment-mod)

Warudo에서의 모드는 **Warudo SDK**를 사용하여 생성됩니다. SDK는 간단히 말해서 "모드를 만들 수 있도록 도와주는 도구 모음"이며, 이 경우 Unity 프로젝트로 이루어져 있어요! Warudo SDK에서 내보낸 모드는 `.warudo` 파일 확장자를 가지며, 해당 데이터를 Warudo의 폴더에 넣으면 인식됩니다. 여러분은 이 모드 파일을 직접 다른 사람과 공유할 수 있으며 **Discover** 탭을 통해 [Steam Workshop](https://steamcommunity.com/app/2079120/workshop/)에 업로드할 수도 있습니다.

![](/doc-img/en-mod-8.png)
<p class="img-desc">Discover 탭에서 모드를 찾아보고 공유하기</p>

## SDK 설정

SDK를 설정하려면 먼저 Unity를 올바르게 설치해야 해요.  
자세한 설치 방법은: [Unity & Warudo SDK 설치](../modding/sdk-installation.md) 가이드를 참고하세요.

## 커스텀 셰이더 {#custom-shaders}

Unity의 기본 렌더링 파이프라인과 호환되는 [lilToon](https://lilxyzw.github.io/lilToon/#/)과 [Poiyomi Shader](https://www.poiyomi.com/) 같은 모든 셰이더를 사용할 수 있어요.

[Warudo Pro](../pro.md)는 [Universal Render Pipeline](https://docs.unity3d.com/Manual/com.unity.render-pipelines.universal.html) (URP)도 지원하여 URP 호환 셰이더도 사용할 수 있어요.

## 커스텀 C# 스크립트 {#custom-scripts}

Warudo 모드를 특별하게 만드는 점은 [C# MonoBehaviour scripts](https://docs.unity3d.com/ScriptReference/MonoBehaviour.html)를 포함할 수 있다는 것이에요. 이를 통해 모드에 상호작용성을 추가할 수 있죠. 예를 들어, 캐릭터 모드에 스크립트를 추가해 캐릭터의 귀를 애니메이션으로 표현하거나, 환경 모드에 스크립트를 추가해 조명을 제어할 수 있어요. Warudo의 내장 컴포넌트와 상호작용하려면  [Scripting](../scripting/overview) 섹션을 참조하세요.

모드 폴더에 배치된 모든 C# 스크립트는 컴파일되어 모드에 포함됩니다. 이러한 스크립트는 일반 Unity 프로젝트에서와 마찬가지로 캐릭터, 소품, 환경에 부착할 수 있어요.

하지만 다음과 같은 제한 사항이 있습니다:

* [Assembly definitions (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html)는 현재 지원되지 않습니다. assembly definitions에 포함된 C# 스크립트는 모드에 패키지되지 않아요.
* [ScriptableObjects](https://docs.unity3d.com/ScriptReference/ScriptableObject.html)는 현재 지원되지 않습니다.
* 컴파일된 DLL은 지원되지 않으며, `.cs` 소스 파일만 포함할 수 있습니다.
* 모든 `UnityEditor` 네임스페이스를 참조하는 스크립트는 지원되지 않아요.

스크립트를 모드에 포함할 경우, **Log Level**을 All로 설정하고, Mod Settings 창에서 **Clear Console On Build**를 체크 해제할 것을 권장해요:

![](/doc-img/en-mod-13.png)

이것이 빌드 시 더 많은 정보를 제공해 주기 때문에, 콘솔에서 오류를 확인할 수 있어요. 스크립트가 모드 폴더에 배치되었는지 확인했음에도 빌드 로그에 스크립트가 없다는 메시지가 나타나고 컴파일이 생략된 경우, 프로젝트에서 `.csproj` 파일이 제대로 생성되지 않았을 가능성이 있습니다. 이 경우, **Edit → Preferences → External Tools**로 이동해 **Regenerate project files**를 클릭하세요:

![](/doc-img/en-mod-12.png)

그런 다음, 모드를 다시 빌드해 보세요.

## 모딩 프로젝트 백업

모딩 프로젝트를 정기적으로 백업하거나 [Unity Version Control](https://unity.com/solutions/version-control)을 사용하는 것을 권장해요. 특히 모드를 자주 만드는 경우, `Asset/Packages/UMod/ExportSettings.asset` 파일(이 파일은 Unity 에디터에서는 보이지 않아요)을 백업하는 것이 좋아요. 이 파일은 모드 내보내기 설정, 모드 내보내기 디렉터리나 모드 아이콘 같은 정보를 저장해요. 이 파일을 잃어버리면, 모든 모드를 수동으로 다시 만들어야 해요.

:::caution
모드를 내보낸 후 일부 사용자들이 내보내기 설정을 잃어버리는 문제를 보고한 사례가 있어요. 이 문제는 현재 조사 중이며, 그동안 `ExportSettings.asset` 파일을 정기적으로 백업하는 것을 권장해요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
