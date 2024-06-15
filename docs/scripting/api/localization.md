---
sidebar_position: 999
---

# Localization

Warudo comes with a built-in localization system that allows you to create multilingual plugins. 

Currently, Warudo officially supports the following languages:

| Language           | Code    |
|--------------------|---------|
| English            | `en`    |
| Simplified Chinese | `zh_CN` |
| Japanese           | `ja`    |

## Localizing Strings

All built-in localized strings are stored in the `Localizations` directory in the Warudo data folder. If you open any of the JSON files, you will see a list of key-value pairs, where the key is the string ID and the value is the localized string.

To get a localized string, simply call the extension method `Localized()` on a string ID:

```
using Warudo.Core.Localization; // Import the namespace that contains the extension method

// Assume the user language is set to English
"FACE_TRACKING".Localized() // "Face Tracking"
"ALIVE_TIME_DESCRIPTION".Localized() // "The prop will be destroyed after this time."
```

Note if the string is not yet localized in the current language, the string will fall back to English; if the string is not found in English, the string ID will be returned.

:::tip
Unity's `HumanBodyBones` enum can also be localized using the `Localized()` extension method. For example, `HumanBodyBones.Head.Localized()` will return "Head" in English and "头" in Simplified Chinese.
:::

## Adding Localizations

If you are creating a [plugin mod](../plugin-mod), the recommended way to add localizations is to create a directory called `Localizations` in your mod folder. Inside this directory, create a JSON file for each language you want to support. The JSON file should contain the localized strings in the following format:

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
You can also create one JSON file for each language.
:::

When the plugin is loaded, Warudo will automatically load the localized strings from the JSON files.

If you are not creating a plugin mod, you can also add localized strings directly using `Context.LocalizationManager`:

```csharp
var localizationManager = Context.LocalizationManager;
localizationManager.SetLocalizedString("MY_STRING", "en", "My String");
localizationManager.SetLocalizedString("MY_STRING", "zh_CN", "我的字符串");
localizationManager.SetLocalizedString("MY_STRING", "ja", "私の文字列");
```

