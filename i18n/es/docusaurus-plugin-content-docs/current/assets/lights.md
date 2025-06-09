---
sidebar_position: 41
---

# Luz Direccional/Puntual/Volumétrica

Los assets de luz se usan para iluminar la escena. Hay tres tipos de assets de luz:
* **Directional Light**: Una luz direccional que ilumina toda la escena desde una dirección específica.
* **Point Light**: Una luz puntual que ilumina la escena desde un punto específico.
* **Volumetric Light**: Un foco que ilumina la escena desde un punto específico, con efectos de iluminación volumétrica.

![](/doc-img/en-light-1.png)
<p class="img-desc">Luz volumétrica.</p>

:::info
Los assets de luz son excelentes para iluminar personajes o ajustar la iluminación ambiental existente. Sin embargo, no se recomienda agregar demasiadas luces a la escena, ya que esto puede causar problemas de rendimiento.
:::

## Configuración

Por defecto, tu escena ya debería tener una luz direccional. Para agregar una nueva luz, usa el menú **Add Asset**.

Puedes ajustar la posición y rotación del asset de luz usando los gizmos de transformación. (Ten en cuenta que la posición de una luz direccional no importa.) El **Color** e **Intensity** de la luz pueden ser cambiados en las configuraciones del asset, donde también puedes habilitar o deshabilitar que la luz afecte a personajes, props y el entorno.

:::tip
Cuando estés usando un [entorno](environment), recomendamos desactivar **Environment → Allow Lights To Affect Characters** y **Directional Light → Affect Environment**. Esencialmente, esto significa que la iluminación del entorno no afectará al personaje, y la luz direccional no afectará al entorno. Esto te da control separado sobre la iluminación del personaje y del entorno, lo cual usualmente es deseado.
:::

### Sombra

Puedes habilitar **Shadow** para hacer que la luz proyecte sombras. Ten en cuenta que para proyectar la sombra de un personaje en el entorno (ej., el piso), necesitas habilitar **Main Properties → Affect Environment**.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
