---
sidebar_position: 110
---

# Guardando y Cargando Datos {#io}

## Usando Data Inputs

Los [Data inputs](ports-and-triggers#data-inputs) en entities son serializados automáticamente. Eso significa que si necesitas almacenar algún dato en tu asset o nodo personalizado, la mejor forma es simplemente definir un data input:

```csharp
[DataInput]
public Vector3 MySpecialVector3;
```

También puedes tener data inputs ocultos si no quieres mostrarlos al usuario:

```csharp
[DataInput]
[Hidden]
public Vector3 MySpecialVector3;
```

Para estados más complejos, puedes serializarlos en una cadena JSON y deserializar cuando sea necesario:

```csharp
[DataInput]
[Hidden]
public string MyJSONState;

// Usa Newtonsoft.Json para serializar y deserializar
MyJSONState = JsonConvert.SerializeObject(mySerializableObject);
mySerializableObject = JsonConvert.DeserializeObject<MySerializableObject>(MyJSONState);
```

## Usando Persistent Data Manager

Para datos no serializables, puedes usar `Context.PersistentDataManager` para acceder a un API de sistema de archivos restringido a la carpeta de datos. Por ejemplo, para cargar y guardar una imagen desde un directorio personalizado:

```csharp
var bytes = await Context.PersistentDataManager.ReadFileBytesAsync("MyPlugin/MyProfileImage.png");
await Context.PersistentDataManager.WriteFileBytesAsync("MyPlugin/MyProfileImage.png", bytes);
```

## Usando Plugin Mod

Un [plugin mod](../plugin-mod) puede almacenar assets de texto en la carpeta del mod, que pueden ser accedidos por el plugin en tiempo de ejecución. Por ejemplo, puedes almacenar un archivo JSON `Animations.json` en la carpeta del mod y cargarlo en el plugin:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    var json = ModHost.Assets.Load<TextAsset>("Assets/MyModFolder/Animations.json"); // Cambia la ruta para coincidir con la estructura de carpetas de tu mod
}
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
