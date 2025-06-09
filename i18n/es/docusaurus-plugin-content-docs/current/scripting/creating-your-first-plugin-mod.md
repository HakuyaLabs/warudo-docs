---
sidebar_position: 2
---

# Creando Tu Primer Mod de Plugin

En el último tutorial, usamos [Playground](playground) para cargar un nodo personalizado y un asset personalizado. Sin embargo, esto viene con limitaciones: no puedes referenciar ningún asset de Unity, así que si estás buscando crear un nodo que genere un prefab de partículas personalizado de Unity, no tienes suerte con Playground.

En este tutorial, usaremos el [Warudo SDK](../modding/mod-sdk) para construir un mod de plugin que contenga el `HelloWorldNode` y `CookieClickerAsset` que acabamos de crear. Un mod de plugin no solo te permite almacenar y referenciar assets de Unity, sino que también te permite distribuir tus nodos y assets personalizados a otros usuarios.

## Paso 1: Crear un Proyecto de Warudo SDK

Si aún no lo has hecho, crea un nuevo proyecto de Warudo SDK siguiendo la guía de [Instalación del Warudo SDK](../modding/sdk-installation). También recomendamos seguir el tutorial [Creando Tu Primer Mod](../modding/creating-your-first-mod) para familiarizarte con el Warudo SDK primero.

:::tip
¡Construir un mod de plugin es extremadamente similar a construir otros tipos de mod! La única diferencia es que un mod de plugin necesita contener un script de C# que herede de `Plugin`, como veremos a continuación.
:::

## Paso 2: Crear un Nuevo Mod

Para crear un nuevo mod, ve a la barra de menú y selecciona **Warudo → New Mod**:

![](/doc-img/en-mod-sdk-3.webp)

Escribe "HelloWorldPlugin" en **Mod Name**, y haz clic en "Create Mod!":

![](/doc-img/en-plugin-mod-1.png)

Deberías ver que se acaba de crear una carpeta para tu mod en la carpeta Assets.

## Paso 3: Crear un Script de Plugin

## Paso 3: Crear un Script de Plugin

En la carpeta del mod "HelloWorldPlugin", haz clic derecho y crea un nuevo script de C# llamado `HelloWorldPlugin.cs`. Pega el siguiente código en el script:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;

[PluginType(
    Id = "hakuyatira.helloworld",
    Name = "Hello World",
    Description = "A simple plugin that says hello to the world.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    SupportUrl = "https://docs.warudo.app",
    AssetTypes = new [] { typeof(CookieClickerAsset) },
    NodeTypes = new [] { typeof(HelloWorldNode) })]
public class HelloWorldPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Debug.Log("The Hello World plugin is officially enabled! Hooray!");
    }

}
```

Copia los archivos `HelloWorldNode.cs` y `CookieClickerAsset.cs` del [tutorial anterior](creating-your-first-script) a la carpeta del mod "HelloWorldPlugin".

Tu carpeta del mod ahora debería verse así:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-plugin-mod-2.png" />
</div>
</div>

## Paso 4: Exportar el Mod de Plugin

¡Ya casi terminamos! Antes de exportar el mod, puedes verificar que la configuración del mod sea correcta en **Warudo → Mod Settings**. Puedes establecer el nombre del mod, versión, autor y descripción, que deberían ser los mismos que los parámetros de `[PluginType]`.

Por defecto, el **Mod Export Directory** está vacío; en este caso, el mod será exportado a la carpeta raíz del proyecto. En su lugar puedes configurarlo al directorio `Plugins` en la carpeta de datos de Warudo, por ejemplo `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Plugins`.

:::warning
Antes de exportar, cierra Warudo y elimina `HelloWorldNode.cs` y `CookieClickerAsset.cs` del directorio `Playground`. Esto es para prevenir conflictos entre el Playground y el mod de plugin.
:::

Selecciona **Warudo → Export Mod** para exportar el mod de plugin. Si todo va bien, deberías ver un mensaje `BUILD SUCCEEDED!` en la consola:

![](/doc-img/en-plugin-mod-4.png)

Es bueno realizar una verificación de cordura para asegurar que los scripts en la carpeta del mod sean efectivamente compilados en el mod de plugin. Desplázate hacia arriba en la consola, y deberías encontrar la siguiente línea:

![](/doc-img/en-plugin-mod-5.png)

:::warning
Si no ves esta línea, tu proyecto de Unity podría no estar configurado correctamente para scripting de C#. Por favor sigue los pasos en [esta sección](../modding/mod-sdk#custom-scripts) e intenta exportar el mod de plugin nuevamente.
:::

Asegúrate de que la carpeta exportada `HelloWorldPlugin.warudo` esté en el directorio `Plugins` en la carpeta de datos de Warudo. Ahora puedes abrir Warudo y verificar si el mod de plugin está cargado en el diálogo About:

![](/doc-img/en-plugin-mod-3.png)

Y por supuesto, el asset Cookie Clicker ahora está en el menú **Add Asset**, junto con el nodo Hello World en la paleta de nodos:

![](/doc-img/en-getting-started-playground-7.png)

![](/doc-img/en-getting-started-playground-2.png)

¡Voilà! ¡Tu primer mod de plugin en Warudo!

## Paso 5: Cargar un Asset de Unity

## Paso 5: Cargar un Asset de Unity

¡Ahora que tienes un mod de plugin, puedes cargar assets personalizados de Unity en Warudo! Intentemos cargar un asset de Unity en el script `CookieClickerAsset`.

Descarga [Cartoon FX Remaster Free](https://assetstore.unity.com/packages/vfx/particles/cartoon-fx-remaster-free-109565) de la Unity Asset Store. Importa el paquete a tu proyecto de Unity. Luego, selecciona un prefab de partículas del paquete, mantén presionado **Ctrl**, y arrástralo a la carpeta "HelloWorldPlugin". Usaremos el prefab "CFXR Explosion 1" en este ejemplo.

![](/doc-img/en-plugin-mod-6.png)

Renombra el prefab a `Particle`. Tu carpeta del mod ahora debería verse así:

![](/doc-img/en-plugin-mod-7.png)

Abre el script `CookieClickerAsset.cs` y reemplázalo con lo siguiente:

```csharp
using System;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;
using Object = UnityEngine.Object;
using Random = UnityEngine.Random;

[AssetType(Id = "82ae6c21-e202-4e0e-9183-318e2e607672", Title = "Cookie Clicker")]
public class CookieClickerAsset : Asset {

    [Markdown] 
    public string Status = "You don't have any cookies.";

    [DataInput] 
    [IntegerSlider(1, 10)]
    [Description("Increase me to get more cookies each time!")]
    public int Multiplier = 1;

    private int count;
    private GameObject particlePrefab; // Nuevo campo para almacenar el prefab de partículas

    [Trigger]
    public async void GimmeCookie() { // Nota la palabra clave async
        count += Multiplier;
        SetDataInput(nameof(Status), "You have " + count + " cookie(s).", broadcast: true);
        
        // Generar el prefab de partículas Multiplier veces
        for (var i = 0; i < Multiplier; i++) {
            var particle = Object.Instantiate(particlePrefab, Random.insideUnitSphere * 2f, Quaternion.identity);
            particle.SetActive(true);
            Object.Destroy(particle, 3f); // Destruir automáticamente la partícula clonada después de 3 segundos

            await UniTask.Delay(TimeSpan.FromSeconds(0.2f)); // Retrasar 0.2 segundos antes de generar la siguiente partícula
        }
    }

    protected override void OnCreate() {
        base.OnCreate();
        SetActive(true);
        
        // Cargar el prefab de partículas de la carpeta del mod. Cambia esta ruta si tu prefab está en una carpeta diferente
        particlePrefab = Plugin.ModHost.Assets.Instantiate<GameObject>("Assets/HelloWorldPlugin/Particle.prefab");
        // Deshabilitarlo para que no aparezca en la escena
        particlePrefab.SetActive(false);
    }

}
```

Exporta el mod nuevamente. ¡Warudo soporta recarga en caliente de plugins, así que simplemente puedes exportar el mod a la carpeta `Plugins` y ver los cambios en Warudo inmediatamente!

Presiona el botón "Gimme Cookie" en el asset Cookie Clicker, y deberías ver el prefab de partículas generándose en la escena:

![](/doc-img/en-plugin-mod-8.png)

:::info
Para usuarios de Warudo Pro, por favor cambia al pipeline de renderizado integrado para ver el efecto de partículas. Alternativamente, puedes usar un asset de partículas compatible con URP en su lugar.
:::

¿No es genial que puedas hacer esto en Warudo?

## Comparación con Playground

Crear un mod de plugin es más poderoso que usar [Playground](playground), pero también tiene desventajas:

* Desarrollar un mod de plugin puede ser mucho más lento, ya que necesitas exportar el mod cada vez que haces un cambio;
* Playground actualmente puede acceder a más librerías usadas por Warudo, como MessagePack, WebSocketSharp, etc. (estamos trabajando en mejorar esto para los mods de plugin);
* Los mods de plugin tienen más [limitaciones de seguridad](plugin-mod#limitations). Por ejemplo, no puedes acceder al namespace `System.IO` (aunque proporcionamos una [API de persistencia de archivos en sandbox](api/io)).

Cuándo usar un mod de plugin o Playground depende de tu caso de uso. Si estás prototipando una nueva característica o probando una nueva idea, Playground es una gran herramienta para iterar rápidamente y ver los resultados, especialmente si no necesitas referenciar assets de Unity. Si trabajas en desarrollo personalizado para VTubers, Playground es brillante para implementar características pequeñas y autocontenidas para tus clientes. Sin embargo, si necesitas cargar assets personalizados de Unity o distribuir tus nodos y assets personalizados en [nuestro Steam Workshop](../modding/sharing), un mod de plugin es el camino a seguir. (¡Incluso así, puedes usar Playground para prototipar tus nodos y assets personalizados antes de moverlos a un mod de plugin!)

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
