---
sidebar_position: 200
---

# Proveedores de Recursos 

Los recursos en Warudo son cualquier dato externo que puede ser usado por assets y nodos.Por ejemplo, los recursos de personaje son los archivos `.vrm` y `.warudo` en el directorio `Characters`; los recursos de animación de personaje son las 500+ animaciones integradas proporcionadas por Warudo más cualquier [mod de animación de personaje](../../modding/character-animation-mod) personalizado en el directorio `CharacterAnimations`; los recursos de imagen de [pantalla](../../assets/screen) son los archivos de imagen en el directorio `Images`; y así sucesivamente.

## Visión General

Internamente, cada recurso es identificado únicamente por un **resource URI**, que se ve como `character://data/Characters/MyModel.vrm` o `character-animation://resources/Animations/AGIA/01_Idles/AGIA_Idle_generic_01`.

Cuando abres un dropdown de recursos como el dropdown `Source` en el asset de personaje, el dropdown consulta **resource providers** para obtener una lista de resource URIs compatibles; en el caso del asset de personaje, dos resource providers devolverán resultados: uno que busca archivos en el directorio `Characters`, y el otro que busca mods de personaje instalados desde el Steam Workshop.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '75%'}}>
![](/doc-img/en-resource-providers-1.png)
</div>
</div>

Cuando seleccionas un resource URI, Warudo invoca el **resource URI resolver** correspondiente para cargar los datos del recurso. Por ejemplo, un archivo `.vrm` y un archivo `.warudo` pueden ser cargados por dos resolvers diferentes, pero ambos resolvers devuelven un `GameObject` (que es el personaje cargado en la escena Unity), así que el asset de personaje puede tratarlos de la misma manera.

Ten en cuenta que los resource providers y resolvers deben ser registrados por un [plugin](plugins).

## Provider

Vamos a revisar un ejemplo de plugin de juguete para registrar un resource provider personalizado que proporciona recursos de prop que son solo cubos y esferas.

```csharp
using System;
using System.Collections.Generic;
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Core.Resource;

[PluginType(
    Id = "hakuyatira.primitiveprops", 
    Name = "Primitive Props",
    Description = "A simple plugin that registers primitive props.",
    Version = "1.0.0", 
    Author = "Hakuya Tira", 
    SupportUrl = "https://docs.warudo.app")]
public class PrimitivePropsPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Context.ResourceManager.RegisterProvider(new PrimitivePropResourceProvider(), this);
    }
    
}

public class PrimitivePropResourceProvider : IResourceProvider {
    public string ResourceProviderName => "Primitives"; // The name of your provider
    
    public List<Resource> ProvideResources(string query) {
        if (query != "Prop") return null; // If the query is not "Prop", we don't have any compatible resources
        return new List<Resource> {
            new Resource {
                category = "Primitives", // Category that will be shown in the dropdown
                label = "Cube", // Label that will be shown in the dropdown
                uri = new Uri("prop://primitives/cube") // Underlying resource URI
            },
            new Resource {
                category = "Primitives",
                label = "Sphere",
                uri = new Uri("prop://primitives/sphere")
            }
        };
    }
}
```

En el ejemplo anterior, registramos un proveedor de recursos personalizado que proporciona dos recursos de utilería: un cubo y una esfera. Observa que el método `ProvideResources` devuelve la lista de recursos solo cuando la consulta es `"Prop"`; esto se debe a que el asset de utilería consulta los recursos de utilería con la consulta `"Prop"`, así:

```csharp
// In the prop asset class
[AutoCompleteResource("Prop")]
public string Source;
```

:::tip
Una lista de las consultas utilizadas por los assets integrados se puede encontrar en la sección [Tipos de Recursos Integrados](#built-in-resource-types).
:::

:::tip
Escribimos los URI como `prop://primitives/cube` porque es una convención usar el esquema `prop://` para los recursos de utilería, pero no necesariamente tienes que seguirla, especialmente si vas a escribir un resolver personalizado para tus URI de recursos.
:::

Una vez que el plugin está cargado, cuando abres el menú desplegable `Source` en un asset de utilería, deberías poder ver los dos recursos proporcionados por nuestro proveedor de recursos personalizado:

![](/doc-img/en-resource-providers-2.png)

Seleccionarlos invocará el resolver de URI de recurso correspondiente para cargar los datos de la utilería. ¡Pero nadie sabe cómo resolver nuestros URI! Vamos a crear un resolver para nuestros URI.

## Resolver de URI

Agrega la siguiente clase a nuestro plugin:

```csharp
public class PrimitivePropResourceUriResolver : IResourceUriResolver {
    public object Resolve(Uri uri) {
        if (uri.Scheme != "prop" || uri.Authority != "primitives") return null;
        var path = uri.LocalPath.TrimStart('/');
        
        return path switch {
            "cube" => GameObject.CreatePrimitive(PrimitiveType.Cube),
            "sphere" => GameObject.CreatePrimitive(PrimitiveType.Sphere),
            _ => throw new Exception("Unknown primitive prop: " + path)
        };
    }
}
```

Las primeras dos líneas verifican si el URI coincide con nuestro formato personalizado, es decir, `prop://primitives/xxx`. Si es así, extraemos la última parte del URI (`path`) y creamos un cubo o una esfera en consecuencia. Devolvemos un `GameObject` directamente, porque es lo que espera el asset de utilería cuando selecciona un recurso de utilería.

:::tip
El tipo de objeto devuelto debe ser compatible con el asset que utiliza el recurso. Por ejemplo, un asset de personaje espera un `GameObject` cuando selecciona un recurso de personaje, un asset de pantalla espera un `ImageResource` cuando selecciona un recurso de imagen, etc. Una lista de los tipos esperados para los assets internos se puede encontrar en la sección [Tipos de Recursos Integrados](#built-in-resource-types).
:::

Ahora solo necesitamos registrarlo en el método `OnCreate` del plugin:

```csharp
Context.ResourceManager.RegisterUriResolver(new PrimitivePropResourceUriResolver(), this);
```

Una vez que el plugin se recarga, cuando seleccionas un cubo o una esfera en el asset de utilería, ¡Warudo creará un cubo o una esfera en la escena de Unity!

## Colección de Mods

Un caso de uso común de los proveedores y resolvers de recursos es proporcionar una colección de mods. Por ejemplo, si tienes 100 prefabs de utilería en Unity y te gustaría usarlos en Warudo, en lugar de exportar 100 [mods de utilería](../../modding/prop-mod) al directorio `Props`, puedes escribir un proveedor y resolver de recursos personalizado para cargar los prefabs directamente desde la carpeta de mods del plugin (consulta [Cargar Assets de Unity](plugins#loading-unity-assets)). Esto tiene el beneficio adicional de que tus usuarios podrán ver todos tus recursos bajo la misma categoría en el menú desplegable.

:::tip
Para conocer las mejores prácticas sobre cómo escribir un plugin de colección de mods, consulta el plugin de ejemplo [Katana Animations](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3).
:::

## Tipos de Recursos Personalizados

Los recursos están diseñados para ser genéricos, por lo que puedes usarlos para cualquier tipo de datos. Por ejemplo, si estás escribiendo un plugin que permite al usuario generar un emote, es posible que desees crear un tipo de recurso personalizado llamado `Emote`:

```csharp
[AutoCompleteResource("Emote")]
public string Emote; // This will be used by the user to select the emote URI
```

Luego, escribe un proveedor de recursos personalizado que proporcione una lista de URI de emotes (por ejemplo, `emote://xxx/yyy`) cuando la consulta sea `"Emote"`, y un resolver de URI de recurso personalizado que cargue los datos del emote cuando el esquema del URI coincida con tu esquema personalizado.

## Tipos de Recursos Integrados {#built-in-resource-types}

Aquí hay una lista de los tipos de recursos integrados utilizados por los assets integrados:

| Consulta             | Ejemplo(s)                               | Espera                                     |
|--------------------|------------------------------------------|--------------------------------------------|
| `"Character"`          | Personaje                                | `GameObject `                                |
| `"CharacterAnimation"` | Personaje, Reproducir Animación Inactiva de Personaje | `AnimationClip`                              |
| `"Environment"`        | Entorno                                  | `Scene` o `ValueTuple<ModHost, Scene>`       |
| `"Image"`              | Pantalla                                   | `Warudo.Plugins.Core.Utils.ImageResource`    |
| `"Music"`              | Reproductor de Música                      | `string` (ruta de archivo absoluta)          |
| `"Particle"`           | Lanzar Utilería al Personaje             | `GameObject`                                 |
| `"Prop"`               | Utilería                                 | `GameObject`                                 |
| `"Sound"`              | Reproducir Sonido, Lanzar Utilería al Personaje | `AudioClip`                                  |
| `"Video"`              | Pantalla                                   | `string` (ruta de archivo absoluta)          |

## Resolver de Miniaturas

Cuando los menús desplegables de recursos están anotados con el atributo `[PreviewGallery]`, el usuario puede hacer clic en el botón "Galería de Vistas Previas" para ver una cuadrícula de miniaturas de los recursos. Esto es útil cuando los recursos son imágenes, utilerías, poses o cualquier otro dato visual.

Para proporcionar miniaturas, necesitas implementar la interfaz `IResourceUriThumbnailResolver` que devuelve asincrónicamente un `byte[]` de los datos de la imagen en miniatura. Luego, registra el resolver en el método `OnCreate` del plugin:

```csharp
Context.ResourceManager.RegisterUriThumbnailResolver(new MyUriThumbnailResolver(), this);
```

:::tip
Para una mejor experiencia, asegúrate de que tus imágenes en miniatura se puedan cargar en 50 ms.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
