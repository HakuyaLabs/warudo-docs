---
sidebar_position: 40
---

# Assets

Los assets son objetos autocontenidos que implementan una característica o comportamiento en la escena. A diferencia de los nodos, un asset usualmente encapsula una lógica más compleja. Se pueden pensar como clases en un programa y son más similares al `MonoBehaviour` de Unity.

## Definición de Tipo

Puedes crear tipos de asset que pueden ser instanciados y almacenados en la escena. Un tipo de asset hereda del tipo `Asset` y está decorado con el atributo `[AssetType]`, como se muestra abajo:

```csharp
[AssetType(
    Id = "c6500f41-45be-4cbe-9a13-37b5ff60d057",
    Title = "Hello World",
    Category = "CATEGORY_DEBUG",
    Singleton = false
)]
public class HelloWorldAsset : Asset {
    // Implementación del Asset
}
```

Aquí hay un resumen de los parámetros:

- **`Id`**: Un identificador único para el tipo de asset; debes [generar un nuevo GUID](https://www.guidgenerator.com/online-guid-generator.aspx) para cada nuevo tipo de asset. Ten en cuenta que esto es diferente del UUID de la instancia del asset (`asset.Id`).
- **`Title`**: El nombre del tipo de asset que se mostrará en el menú *Add Asset*.
- **`Category`**: Opcional. El grupo del asset en el menú *Add Asset*.
- **`Singleton`**: Opcional. Si se establece en `true`, solo una instancia del asset puede existir en la escena. Por defecto es `false`.

:::info
Aquí hay algunas categorías de asset comunes que puedes usar: `CATEGORY_INPUT`, `CATEGORY_CHARACTERS`, `CATEGORY_PROP`, `CATEGORY_ACCESSORY`, `CATEGORY_ENVIRONMENT`, `CATEGORY_CINEMATOGRAPHY`, `CATEGORY_EXTERNAL_INTERACTION`, `CATEGORY_MOTION_CAPTURE`.
:::

## Componentes

Un tipo de asset puede definir data inputs y triggers. A diferencia de los nodos, los assets no tienen data outputs o flow inputs/outputs.

![](/doc-img/en-scripting-concepts-4.png)

## Ciclo de Vida

Los assets tienen las etapas del ciclo de vida listadas en la página [Entities](entities#lifecycle). Puedes sobrescribir estos métodos para realizar varias tareas; por ejemplo, `OnUpdate()` es llamado cada frame, similar al método `Update()` de Unity.

## Estado Activo {#active-state}

A diferencia de los nodos, los assets tienen un estado activo que informa si el asset está "activo", o listo para usar. Por ejemplo, cuando un asset de personaje no tiene un `Source` seleccionado, se muestra como inactivo en el editor.

![](/doc-img/en-custom-asset-1.png)

Por defecto, los assets **NO** están activos cuando son creados. Puedes establecer el estado activo de un asset llamando a `SetActive(bool state)`. Por ejemplo, si tu asset siempre está listo para usar, puedes establecerlo como activo en el método `OnCreate`:

```csharp
public override void OnCreate() {
    base.OnCreate();
    SetActive(true);
}
```

Si tu asset solo funciona cuando está conectado a un servidor externo, por ejemplo, un dispositivo de seguimiento remoto, puedes establecerlo como activo solo si la conexión se establece exitosamente:

```csharp
[DataInput]
public string RemoteIP = "127.0.0.1";

[DataInput]
public string RemotePort = "12345";

public override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(RemoteIP), nameof(RemotePort) }, ResetConnection); // When RemoteIP or RemotePort changes, reset the connection
}

protected void ResetConnection() {
    SetActive(false); // Inactive until connection is established
    if (ConnectToRemoteServer(RemoteIP, RemotePort)) {
        SetActive(true);
    }
}
```

:::tip
Determinar si tu asset está "listo para usar" depende completamente de ti. La convención que usan los assets internos de Warudo es que un asset está activo cuando todos los data inputs requeridos para que el asset funcione correctamente están establecidos.
:::

## Creando GameObjects

Puedes crear GameObjects en la escena (Unity) cuando quieras. Por ejemplo, el siguiente asset crea un GameObject cubo cuando el asset es creado, y lo destruye cuando el asset es destruido:

```csharp
private GameObject gameObject;

public override void OnCreate() {
    base.OnCreate();
    gameObject = GameObject.CreatePrimitive(PrimitiveType.Cube);
}

public override void OnDestroy() {
    base.OnDestroy();
    Object.Destroy(gameObject);
}
```

Sin embargo, el usuario no puede mover este cubo, ¡ya que no hay data inputs que controlen el cubo! Puedes agregar data inputs para controlar la posición del cubo, escala, etc., pero una forma más fácil es heredar del tipo `GameObjectAsset`:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Plugins.Core.Assets;

[AssetType(
    Id = "4c00b14a-aed5-423e-abe6-6921032439c5",
    Title = "My Awesome Cube",
    Category = "CATEGORY_DEBUG"
)]
public class MyAwesomeCubeAsset : GameObjectAsset {
    protected override GameObject CreateGameObject() {
        return GameObject.CreatePrimitive(PrimitiveType.Cube);
    }
}
```

El `GameObjectAsset` maneja la creación y destrucción del GameObject por ti, y viene con un data input `Transform` que permite al usuario controlar la posición, rotación y escala del GameObject:

![](/doc-img/en-custom-asset-2.png)

:::tip
¿Cuándo usar `GameObjectAsset`? Si tu asset es "algo que puede ser movido por el usuario en la escena (Unity)", entonces probablemente sea una buena idea heredar de `GameObjectAsset`.
:::

## Eventos

El tipo `Asset` invoca los siguientes eventos a los que puedes escuchar:

- **`OnActiveStateChange`**: Llamado cuando el estado activo del asset cambia.
- **`OnSelectedStateChange`**: Llamado cuando el asset es seleccionado o deseleccionado en el editor.
- **`OnNameChange`**: Llamado cuando el nombre del asset cambia.

Por ejemplo, el asset integrado de [seguimiento Leap Motion](../../mocap/leap-motion) escucha al evento `OnSelectedStateChange` para mostrar un modelo del controlador Leap Motion en la escena (Unity) cuando el asset es seleccionado.

```csharp
public override void OnCreate() {
    base.OnCreate();
    OnSelectedStateChange.AddListener(selected => {
        if (selected) {
            // Mostrar el modelo
        } else {
            // Ocultar el modelo
        }
    });
}
```

## Ejemplos de Código

### Básico

- [AnchorAsset.cs](https://gist.github.com/TigerHix/c549e984df0be34cfd6f8f50e741aab2)  
Ejemplo de Attachable / GameObjectAsset.

### Avanzado

- [CharacterPoserAsset.cs](https://gist.github.com/TigerHix/8413f8e10e508f37bb946d8802ee4e0b)  
Asset personalizado para posar tu personaje con anchors IK.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
