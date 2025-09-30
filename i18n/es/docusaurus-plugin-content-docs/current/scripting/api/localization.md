---
sidebar_position: 999
---

# Localización

Warudo viene con un sistema de localización integrado que te permite crear plugins multiidioma.

Actualmente, Warudo soporta oficialmente los siguientes idiomas:

| Idioma             | Código  |
|--------------------|---------|
| Inglés             | `en`    |
| Chino Simplificado | `zh_CN` |
| Japonés            | `ja`    |

## Localizando Cadenas

Todas las cadenas localizadas integradas se almacenan en el directorio `Localizations` en la carpeta de datos de Warudo. Si abres cualquiera de los archivos JSON, verás una lista de pares clave-valor, donde la clave es el ID de la cadena y el valor es la cadena localizada.

Para obtener una cadena localizada, simplemente llama al método de extensión `Localized()` en un ID de cadena:

```
using Warudo.Core.Localization; // Importa el namespace que contiene el método de extensión

// Asume que el idioma del usuario está configurado en inglés
"FACE_TRACKING".Localized() // "Face Tracking"
"ALIVE_TIME_DESCRIPTION".Localized() // "The prop will be destroyed after this time."
```

Ten en cuenta que si la cadena aún no está localizada en el idioma actual, la cadena volverá al inglés; si la cadena no se encuentra en inglés, se devolverá el ID de la cadena.

:::tip
El enum `HumanBodyBones` de Unity también puede ser localizado usando el método de extensión `Localized()`. Por ejemplo, `HumanBodyBones.Head.Localized()` devolverá "Head" en inglés y "头" en chino simplificado.
:::

## Agregando Localizaciones

Si estás creando un [plugin mod](../plugin-mod), la forma recomendada de agregar localizaciones es crear un directorio llamado `Localizations` en tu carpeta de mod. Dentro de este directorio, crea un archivo JSON para cada idioma que quieras soportar. El archivo JSON debe contener las cadenas localizadas en el siguiente formato:

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
También puedes crear un archivo JSON para cada idioma.
:::

Cuando el plugin es cargado, Warudo automáticamente cargará las cadenas localizadas de los archivos JSON.

Si no estás creando un plugin mod, también puedes agregar cadenas localizadas directamente usando `Context.LocalizationManager`:

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
{name: 'かぐら', github: 'Arukaito'},
],
}} />
