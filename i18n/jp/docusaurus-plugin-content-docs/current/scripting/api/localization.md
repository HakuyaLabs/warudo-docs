---
sidebar_position: 999
translate_from_version: 2024-06-16
---

# ローカライゼーション

Warudoには、多言語対応プラグインを作成できる組み込みのローカライゼーションシステムがあります。

現在、Warudoは公式に次の言語をサポートしています。

| 言語 | コード |
|---|---|
| 英語 | `en` |
| 簡体字中国語 | `zh_CN` |
| 日本語 | `ja` |

## 文字列のローカライズ

組み込みのローカライズ済み文字列はすべて、Warudoデータフォルダー内の`Localizations`ディレクトリに保存されています。いずれかのJSONファイルを開くと、キーが文字列ID、値がローカライズ済み文字列であるキー・値の組が一覧表示されます。

ローカライズ済み文字列を取得するには、文字列IDに対して拡張メソッド`Localized()`を呼び出すだけです。

```
using Warudo.Core.Localization; // Import the namespace that contains the extension method

// Assume the user language is set to English
"FACE_TRACKING".Localized() // "Face Tracking"
"ALIVE_TIME_DESCRIPTION".Localized() // "The prop will be destroyed after this time."
```

現在の言語で文字列がまだローカライズされていない場合は英語にフォールバックし、英語にも文字列が見つからない場合は文字列IDが返されます。

:::tip
Unityの`HumanBodyBones`列挙型も、`Localized()`拡張メソッドでローカライズできます。たとえば、`HumanBodyBones.Head.Localized()`は英語では「Head」、簡体字中国語では「头」を返します。
:::

## ローカライゼーションの追加

[プラグインMod](../plugin-mod)を作成している場合、ローカライゼーションを追加する推奨方法は、Modフォルダー内に`Localizations`というディレクトリを作成することです。このディレクトリ内に、サポートしたい言語ごとのJSONファイルを作成します。JSONファイルには、次の形式でローカライズ済み文字列を含めます。

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
言語ごとにJSONファイルを1つ作成することもできます。
:::

プラグインが読み込まれると、WarudoはJSONファイルからローカライズ済み文字列を自動的に読み込みます。

プラグインModを作成していない場合は、`Context.LocalizationManager`を使用してローカライズ済み文字列を直接追加することもできます。

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
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
