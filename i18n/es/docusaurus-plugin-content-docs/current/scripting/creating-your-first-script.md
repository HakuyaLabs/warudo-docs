---
sidebar_position: 1
version: "2024.11.22"
---

# Creando Tu Primer Script

Hay dos formas de hacer scripting en Warudo: usando **Playground**, o creando un mod de plugin. En este tutorial, veremos cómo usar Playground para escribir tu primer nodo personalizado!

:::tip
**¿Qué es playground?** Piensa en Playground como una caja de arena donde puedes escribir y probar tus nodos y assets personalizados. En lugar de compilar y empaquetar tu código C#, puedes escribir tu código directamente en el directorio `Playground` en tu carpeta de datos de Warudo. Esto te permite iterar rápidamente y probar tu código sin necesidad de construir mods o reiniciar Warudo.
:::

¡Sin más preámbulos, vamos a sumergirnos!

:::info
Ten en cuenta que si tienes alguna pregunta, tenemos un canal dedicado **#plugins-scripting** en [nuestro servidor de Discord](https://discord.gg/warudo) donde puedes pedir ayuda!
:::

## Paso 1: Configuración del Entorno

## Paso 1: Configuración del Entorno

Primero, asegúrate de tener [.NET 8 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) instalado. Luego, descarga el archivo `.csproj` [aquí](/scripts/Playground.csproj) y ponlo en el directorio `Playground` dentro de tu carpeta de datos de Warudo (Menú → Abrir Carpeta de Datos). Este archivo ayuda a tu IDE a proporcionar autocompletado de código y resaltado de sintaxis.

Abre tu IDE de C# favorito - usaremos [JetBrains Rider](https://www.jetbrains.com/rider/), pero otros IDEs como [Visual Studio Code](https://code.visualstudio.com/) funcionarían perfectamente bien (para Visual Studio Code, podrías necesitar instalar la [extensión de lenguaje C#](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)). 

Abre el directorio `Playground` en tu IDE. Crea un archivo llamado `HelloWorldNode.cs` en el directorio, y pega lo siguiente en el archivo:

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660", Title = "Hello World")]
public class HelloWorldNode : Node {

    [FlowInput]
    public Continuation Enter() {
        Context.Service.PromptMessage("Hello World!", "This node is working!");
        return Exit;
    }
        
    [FlowOutput]
    public Continuation Exit;
    
}
```

## Paso 2: Nodo Personalizado

Abre Warudo. Al iniciar, deberías ver un mensaje emergente (llamado _toast_) como este:

![](/doc-img/en-getting-started-playground-1.png)

Esto indica que el `HelloWorldNode.cs` ha sido compilado y cargado exitosamente, y como el código anterior define un nodo personalizado, vemos `Nodes: 1` en el mensaje.

Ve a la pestaña de blueprints. Crea un nuevo blueprint y encuentra el nodo `Hello World` en la paleta de nodos. Arrástralo y deberías ver algo así:

![](/doc-img/en-getting-started-playground-2.png)

Haz clic en la entrada de flujo `Enter`, y deberías ver este mensaje:

![](/doc-img/en-getting-started-playground-3.png)

Si todo está funcionando, ¡felicitaciones! ¡Acabas de crear tu primer nodo de Warudo!

## Paso 3: Recarga en Caliente

Una cosa increíble es que no necesitas reiniciar Warudo cada vez que haces cambios en el código. ¡De hecho, Warudo detecta automáticamente cualquier cambio que hayas hecho en el directorio `Playground` y recarga tu código en caliente!

Veámoslo en acción. Regresa al `HelloWorldNode.cs` y pega el siguiente código nuevo (o actualiza tu código existente si quieres practicar escribiendo):

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Id = "c76b2fef-a7e7-4299-b942-e0b6dec52660", Title = "Hello World")]
public class HelloWorldNode : Node {

    // Código nuevo abajo
    [DataInput]
    [IntegerSlider(1, 100)] 
    public int LuckyNumber = 42;
    // Código nuevo arriba

    [FlowInput]
    public Continuation Enter() {
        // Código cambiado abajo
        Context.Service.PromptMessage("Hello World!", "This node is working! My lucky number: " + LuckyNumber);
        return Exit;
    }
        
    [FlowOutput]
    public Continuation Exit;
    
}
```

Inmediatamente después de presionar Ctrl+S, debería aparecer otro mensaje toast, indicando que el nodo ha sido compilado y recargado en caliente exitosamente. El nodo en el blueprint también se actualiza en consecuencia:

![](/doc-img/en-getting-started-playground-4.png)

¡Intenta establecer un número de la suerte y verifica que el nodo aún funciona!

![](/doc-img/en-getting-started-playground-5.png)

## Paso 4: Asset Personalizado

Warudo también puede detectar nuevos archivos `.cs`. Intentemos crear un asset personalizado esta vez. Crea un archivo llamado `CookieClickerAsset.cs` en el directorio `Playground`, y pega el siguiente código:

```csharp
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;

[AssetType(Id = "82ae6c21-e202-4e0e-9183-318e2e607672", Title = "Cookie Clicker")]
public class CookieClickerAsset : Asset {

    [Markdown] 
    public string Status = "You don't have any cookies.";

    [DataInput] 
    [IntegerSlider(1, 10)]
    [Description("Increase me to get more cookies each time!")]
    public int Multiplier = 1;

    private int count;

    [Trigger]
    public void GimmeCookie() {
        count += Multiplier;
        SetDataInput(nameof(Status), "You have " + count + " cookie(s).", broadcast: true);
    }

    protected override void OnCreate() {
        base.OnCreate();
        SetActive(true);
    }

}
```

Deberías ver un mensaje toast que indica que un nodo personalizado (`HelloWorldNode.cs`) y un asset personalizado (`CookieClickerAsset.cs`) han sido cargados:

![](/doc-img/en-getting-started-playground-6.png)

Puedes encontrar el nuevo asset en el menú **Add Asset**:

![](/doc-img/en-getting-started-playground-7.png)

¡Agrégalo a tu escena y diviértete! ¿Quién necesita VTubing cuando puedo hacer esto todo el día?

![](/doc-img/en-getting-started-playground-8.png)

## Resumen

En este breve tutorial, aprendimos cómo usar Playground y echamos un vistazo a cómo funcionan los nodos y assets personalizados. ¡En el siguiente tutorial, veremos cómo crear un mod de plugin para distribuir el nodo personalizado y el asset que acabamos de crear!

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
