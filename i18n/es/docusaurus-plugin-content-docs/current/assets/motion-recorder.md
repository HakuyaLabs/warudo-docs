---
sidebar_position: 80
---

# Grabador de Movimiento

El grabador de movimiento te permite grabar la animación del personaje y generar un archivo de animación en formato FBX, BVH, o WANIM de Warudo.

## Configuración

Selecciona el **Personaje** que quieres grabar. Selecciona una **Velocidad de Fotogramas Objetivo** y **Formato de Exportación**, y haz clic en **Iniciar Grabación** para comenzar a grabar. Puedes presionar **Detener Grabación** para parar la grabación en cualquier momento.

Hay 3 formatos de exportación disponibles:
* **FBX**: Exportar a formato FBX que contiene tanto los datos del esqueleto del personaje como los blendshapes.
* **BVH**: Exportar a formato BVH que contiene solo los datos del esqueleto del personaje.
* **WANIM**: Exportar al formato WANIM de Warudo que contiene los datos del esqueleto y blendshapes del personaje, y las expresiones del personaje activadas durante la grabación. Si solo necesitas reproducir la animación en Warudo, este es el formato recomendado.

:::caution
Ten en cuenta que la exportación FBX es experimental y muy probablemente solo funcionará correctamente en modelos VRM, o modelos `.warudo` de un archivo FBX sin características específicas de Maya (p. ej., IK, restricciones, etc.).
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
