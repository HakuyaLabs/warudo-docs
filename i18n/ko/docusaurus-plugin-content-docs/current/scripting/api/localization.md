---
sidebar_position: 999
---

# 현지화

Warudo에는 다국어 플러그인을 만들 수 있는 내장된 현지화 시스템이 있어요. 

현재 Warudo는 다음 언어들을 공식적으로 지원해요:

| Language           | Code    |
|--------------------|---------|
| English            | `en`    |
| Simplified Chinese | `zh_CN` |
| Japanese           | `ja`    |

## 문자열 현지화

모든 내장된 로컬라이즈 문자열은 Warudo 데이터 폴더의 `Localizations` 디렉터리에 저장돼 있어요. 해당 JSON 파일을 열면, 문자열 ID와 현지화된 문자열을 키-값 쌍으로 볼 수 있어요.

현지화된 문자열을 가져오려면 문자열 ID에 `Localized()` 확장 메서드를 호출하면 돼요:

```
using Warudo.Core.Localization; // Import the namespace that contains the extension method

// Assume the user language is set to English
"FACE_TRACKING".Localized() // "Face Tracking"
"ALIVE_TIME_DESCRIPTION".Localized() // "The prop will be destroyed after this time."
```

만약 현재 언어로 아직 현지화되지 않은 문자열이면 해당 문자열은 영어로 대체되고, 영어에서도 찾을 수 없으면 문자열 ID가 반환돼요.

:::tip
Unity의 `HumanBodyBones` 열거형도 `Localized()` 확장 메서드를 사용해 현지화할 수 있어요. 예를 들어, `HumanBodyBones.Head.Localized()`는 영어로 "Head", 중국어 간체로는 "头"를 반환해요.
:::

## 현지화 추가하기

[플러그인 모드](../plugin-mod)를 만들고 있다면, 현지화를 추가하는 가장 권장되는 방법은 `Localizations`라는 디렉터리를 모드 폴더에 만드는 것이에요. 이 디렉터리 안에 지원하고 싶은 각 언어에 대한 JSON 파일을 만들어야 해요. JSON 파일은 다음 형식으로 로컬라이즈된 문자열을 포함해야 해요:

```json
{
  "en": {
    "MY_STRING": "My String"
  },
  "zh_CN": {
    "MY_STRING": "我的字符串"
  },
  "ja": {
    "MY_STRING": "私の文字列"
  }
}
```

:::info
언어마다 하나의 JSON 파일을 만들 수도 있어요.
:::

플러그인이 로드될 때, Warudo는 자동으로 JSON 파일에서 현지화된 문자열을 불러와요.

만약 플러그인 모드를 만들고 있지 않다면 `Context.LocalizationManager`를 사용해 직접 현지화된 문자열을 추가할 수도 있어요.

:

```csharp
var localizationManager = Context.LocalizationManager;
localizationManager.SetLocalizedString("MY_STRING", "en", "My String");
localizationManager.SetLocalizedString("MY_STRING", "zh_CN", "我的字符串");
localizationManager.SetLocalizedString("MY_STRING", "ja", "私の文字列");
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
  {name: 'Willycho', github: 'Willycho'},
],
}} />
