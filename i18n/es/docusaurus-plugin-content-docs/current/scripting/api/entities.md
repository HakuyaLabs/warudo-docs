---
sidebar_position: 2
---

# Entities

Una entity es un objeto que es persistente en una [escena](scene) (ej., nodos, assets) o a través de escenas (ej., plugins). La programación en Warudo se trata completamente de definir tus propios tipos de entity e interactuar con el runtime de Warudo. Puedes definir tu propio tipo de entity heredando de una clase base proporcionada por Warudo:

- **Node:** Hereda de `Node` para crear un nuevo tipo de nodo. Un tipo de nodo puede definir data inputs, data outputs, flow inputs, flow outputs, y triggers. Un nodo es instanciado arrastrándolo desde la paleta de nodos al editor de blueprint; la instancia del nodo se guarda junto con el blueprint.
- **Asset:** Hereda de `Asset` para crear un nuevo tipo de asset. Un tipo de asset puede definir data inputs y triggers. Un asset es instanciado usando el menú *Add Asset*; la instancia del asset se guarda junto con la escena.
- **Plugin:** Hereda de `Plugin` para crear un nuevo tipo de plugin. Un tipo de plugin puede definir data inputs y triggers. Un plugin es cargado cuando Warudo inicia, o cuando el plugin es recargado en caliente. Solo hay una instancia de plugin por tipo de plugin, y los data inputs se guardan a través de escenas.
- **Structured Data:** Hereda de `StructuredData` para crear un nuevo tipo de [structured data](structured-data). Structured data es un tipo de datos complejo que puede ser usado como un data input "embebido" en nodos, assets, o plugins.

:::info
En el tutorial [Creating Your First Script](../creating-your-first-script.md), creamos un tipo de nodo personalizado llamado `HelloWorldNode` y un tipo de asset personalizado llamado `CookieClickerAsset`.
:::

:::tip
El concepto de entities es vagamente similar al MonoBehaviour de Unity, pero con un enfoque más estructurado.
:::

Después de que una entity es instanciada, se le asigna automáticamente un UUID (identificador único) por Warudo. Puedes acceder a él vía la propiedad `Id`. Este UUID es entonces usado para identificar la entity en la escena, y se guarda junto con la escena.

Un tipo de entity puede contener campos y métodos regulares de C#. Sin embargo, para interfaz con el runtime de Warudo, necesitas crear [**ports y triggers**](ports-and-triggers) en la entity. Todas las entities pueden tener [data input ports](ports-and-triggers#data-input-ports) y [triggers](ports-and-triggers#triggers), mientras que los nodos pueden adicionalmente tener [data output ports](ports-and-triggers#data-output-ports), [flow input ports](ports-and-triggers#flow-input-ports), y [flow output ports](ports-and-triggers#flow-output-ports).

![](/doc-img/en-custom-node-1.png)

![](/doc-img/en-scripting-concepts-4.png)

## Ciclo de Vida {#lifecycle}

Una entity tiene un ciclo de vida que consiste en varias etapas:

- **`OnCreate()`:** Llamado cuando la entity es creada. Aquí es donde debes inicializar los campos de instancia, suscribirte a eventos, etc.
    - **Assets:** Llamado cuando un nuevo asset es agregado a la escena por el usuario, o cuando la escena es cargada.
    - **Nodes:** Llamado cuando un nuevo nodo es agregado al blueprint por el usuario, o cuando la escena es cargada. Los nodos siempre son creados _después_ de los assets.
    - **Plugins:** Llamado cuando el plugin es cargado por Warudo al inicio, o cuando el plugin es recargado en caliente.
    - **Structured Data:** Llamado cuando la entity padre es creada, o cuando el usuario agrega un nuevo structured data a un array de structured data.
- **`OnDestroy()`:** Llamado cuando la entity es destruida. Aquí es donde debes liberar recursos, etc.
    - **Assets:** Llamado cuando el asset es removido de la escena por el usuario, o cuando la escena es descargada.
    - **Nodes:** Llamado cuando el nodo es removido del blueprint por el usuario, o cuando la escena es descargada. Los nodos siempre son destruidos _después_ de los assets.
- **`Deserialize(TSerialized data)`:** Llamado cuando la entity es deserializada desde un estado guardado. Por ejemplo, este método es llamado en un asset cuando la escena es apenas abierta y cargada. _Usualmente no necesitas sobrescribir este método._
- **`Serialize()`:** Llamado cuando la entity necesita ser serializada a un estado guardado. Por ejemplo, este método es llamado en un asset cuando la escena está a punto de ser guardada, o necesita ser enviada al editor. _Usualmente no necesitas sobrescribir este método._

Assets, nodos, y plugins tienen etapas extras del ciclo de vida:

- **`OnUpdate()`:** Llamado cada frame cuando la entity no está destruida. Esto es similar al método `Update()` de Unity.
  - `OnPreUpdate()` y `OnPostUpdate()` también se proporcionan. Son llamados antes y después de `OnUpdate()`, respectivamente.
- **`OnLateUpdate()`:** Llamado cada frame después de `OnUpdate()`. Esto es similar al método `LateUpdate()` de Unity.
- **`OnFixedUpdate()`:** Llamado cada frame fijo. Esto es similar al método `FixedUpdate()` de Unity.
- **`OnEndOfFrame()`:** Llamado al final del frame. Esto es similar a usar la [`WaitForEndOfFrame` coroutine](https://docs.unity3d.com/ScriptReference/WaitForEndOfFrame.html) de Unity.
- **`OnDrawGizmos()`:** Llamado cuando la entity debe dibujar gizmos. Esto es similar al método `OnDrawGizmos()` de Unity.

:::info
El orden de actualización es el siguiente: plugins → assets → nodos.
:::

Puedes sobrescribir estos métodos del ciclo de vida para implementar comportamiento personalizado para tus entities. Por ejemplo, si quieres ejecutar algo en cada frame, sobrescribe el método `OnUpdate()`.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
