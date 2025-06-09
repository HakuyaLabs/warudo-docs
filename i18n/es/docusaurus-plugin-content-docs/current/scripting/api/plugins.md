---
sidebar_position: 50
---

# Plugins

Los plugins son los padres de todos los scripts personalizados en Warudo. También se usan para realizar tareas que son independientes de la escena, como registrar [resource providers & resolvers](resource-providers-and-resolvers), autenticar con un servicio externo, o permitir al usuario configurar las configuraciones globales de los assets y nodos del plugin.

:::tip
Puedes usar [Playground](../playground) para cargar assets y nodos personalizados sin crear un plugin; esos serán automáticamente registrados y gestionados por el plugin "Core" de Warudo. Sin embargo, para distribuir tus assets y nodos personalizados a otros usuarios, debes crear un [plugin mod](../plugin-mod) en el cual tu propio plugin registrará tus assets y nodos personalizados.
:::

:::info
Esta página discute las APIs de scripting para crear plugins. Por favor también consulta la página [Plugin Mod](../plugin-mod).
:::

## Definición de Tipo

Puedes crear un tipo de plugin que puede ser cargado y ejecutado en Warudo. Un tipo de plugin hereda del tipo `Plugin` y está decorado con el atributo `[PluginType]`, como se muestra abajo:

```csharp
[PluginType(
    Id = "hakuyatira.helloworld",
    Name = "Hello World",
    Description = "A simple plugin that says hello to the world.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    Icon = null,
    SupportUrl = "https://docs.warudo.app",
    AssetTypes = new [] { typeof(HelloWorldAsset) },
    NodeTypes = new [] { typeof(HelloWorldNode) }
)]
public class HelloWorldPlugin : Plugin {
    // Implementación del Plugin
}
```

Aquí hay un resumen de los parámetros:

- **`Id`**: Un identificador único para el tipo de plugin; recomendamos usar la notación de nombre de dominio inverso (ej., `com.example.pluginname`). Dado que el tipo de plugin es un singleton, su propiedad `Id` (`plugin.Id`) es idéntica al ID del tipo de plugin (`plugin.PluginType.Id`).
- **`Name`**: El nombre del plugin.
- **`Description`**: Una breve descripción del plugin.
- **`Version`**: La versión del plugin. Recomendamos seguir el estándar [Semantic Versioning](https://semver.org/).
- **`Author`**: El autor del plugin.
- **`Icon`**: Opcional. El ícono SVG del plugin. Se recomienda definir un campo `const string` para almacenar este valor.
- **`SupportUrl`**: Opcional. La URL a la página de soporte del plugin.
- **`AssetTypes`**: Un array de tipos de asset en este plugin.
- **`NodeTypes`**: Un array de tipos de nodo en este plugin.

:::tip
`icon` debe ser un solo elemento SVG (ej., `<svg>...</svg>`). Por ejemplo:
```html
<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 512 512">
    <path>...</path>
</svg>
```
:::

## Ciclo de Vida

Además de las etapas del ciclo de vida listadas en la página [Entities](entities#lifecycle), los plugins tienen las siguientes etapas adicionales del ciclo de vida:

- **`OneTimeSetup()`:** Llamado una vez cuando el plugin es cargado por Warudo por primera vez, determinado por la existencia del archivo de datos del plugin en `Plugins/Data`.
- **`OnSceneLoaded(Scene scene, SerializedScene serializedScene)`:** Llamado cuando una escena es cargada, después de que todos los assets y nodos son deserializados.
- **`OnSceneUnloaded(Scene scene)`:** Llamado cuando una escena es descargada.

## Componentes

Un tipo de plugin puede definir data inputs y triggers.

![](/doc-img/en-custom-plugin-1.png)

## Cargando Assets de Unity {#loading-unity-assets}

Como se muestra en el tutorial [Creating Your First Plugin Mod](../creating-your-first-plugin-mod), puedes cargar assets de Unity en la carpeta de mod de tu plugin usando `ModHost`. Por ejemplo, para cargar un prefab:

```csharp
var prefab = ModHost.LoadAsset<GameObject>("Assets/MyModFolder/MyPrefab.prefab");
```

Para cargar un text asset (ej., archivo JSON):

```csharp
var text = ModHost.LoadAsset<TextAsset>("Assets/MyModFolder/MyText.json");
```

:::tip
Warudo usa [uMod 2.0](https://trivialinteractive.co.uk/products.html) como el framework de modding subyacente. Puedes consultar la [documentación de ModHost](https://trivialinteractive.co.uk/products/documentation/umod_20/scriptingreference/html/T_UMod_ModHost.htm) para más información sobre carga de assets.
:::

## Ícono de Barra de Herramientas

Puedes notar que algunos plugins integrados muestran un ícono en la barra de herramientas. Además, el ícono es clickeable y puede ser usado para abrir las configuraciones del plugin.

![](/doc-img/en-custom-plugin-2.png)

Para lograr esto, puedes incluir el [mixin](mixins) `ToolbarItemMixin` en tu clase de plugin:

```csharp
[Mixin]
public ToolbarItemMixin ToolbarItem;

private bool serverConnected; // Asume que este es un campo que indica si el plugin está conectado a un servidor externo

public override void OnCreate() {
    base.OnCreate();
    ToolbarItem.SetIcon(ToolbarIcon); // ToolbarIcon es un const string que contiene un ícono SVG
    ToolbarItem.OnTrigger = () => Context.Service.NavigateToPlugin(Type.Id); // Abrir las configuraciones del plugin cuando el ícono es clickeado
}

public override void OnUpdate() {
    base.OnUpdate();
    ToolbarItem.SetEnabled(serverConnected); // Solo mostrar el ícono si está conectado al servidor
    ToolbarItem.SetTooltip("Connected! Current time: " + DateTime.Now); // Establecer un tooltip que se muestra cuando el usuario pasa el mouse sobre el ícono
}
```

## Accediendo al Plugin Propietario desde Nodos y Assets

Puedes acceder al plugin propietario desde nodos y assets usando la propiedad `Plugin`. Por ejemplo:

```csharp
public override void OnCreate() {
    base.OnCreate();
    var myPlugin = (HelloWorldPlugin) Plugin;
    // Hacer algo con myPlugin
}
```

## Plugin vs. Nodo

La programación personalizada en Warudo funciona mejor cuando complementa, no reemplaza, el [sistema de blueprints](../../blueprints/overview.md). Si te encuentras escribiendo una clase `Plugin` enorme que maneja mucha lógica, piensa cuidadosamente si puede ser escrita como un nodo personalizado en su lugar. Por ejemplo, si tu idea es reproducir un efecto de fuegos artificiales cuando recibes un paquete UDP personalizado a través de la LAN, en lugar de una clase `Plugin` que haga ambas cosas, es mucho mejor (y más fácil de mantener) implementar dos nodos personalizados - uno que active el flujo de salida cuando el paquete UDP personalizado es recibido, y otro que directamente reproduzca un efecto de fuegos artificiales cuando el flujo de entrada es recibido. Esto también le da a tus usuarios más flexibilidad al usar tus nodos personalizados en sus blueprints.

## Ejemplos de Código

### Básico

- [Plugin de ejemplo](https://gist.github.com/TigerHix/b78aabffc2d03346ff3da526706ce2ca)  
La plantilla de un plugin (archivo único) con el uso básico de la clase `Plugin`.

- [WarudoPluginExamples](https://github.com/HakuyaLabs/WarudoPluginExamples)  
Los ejemplos completos de plugin (múltiples archivos), incluyendo el **Stream Deck Plugin** y **VMC Plugin**.
    - **Stream Deck Plugin**: Este plugin se comunica con una aplicación externa (el [plugin Stream Deck](https://apps.elgato.com/plugins/warudo.streamdeck) de Warudo) vía WebSocket. Demuestra el uso de la clase base del servicio WebSocket `WebSocketService`.
    - **VMC Plugin**: Este plugin agrega [VMC](https://protocol.vmc.info/english) como un método de captura de movimiento soportado vía registrar un `FaceTrackingTemplate` y un `PoseTrackingTemplate`.

### Avanzado

- [KatanaAnimations.cs](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3)  
Plugin personalizado para cargar AnimationClips desde la carpeta de mod y registrarlos como animaciones de personaje.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
