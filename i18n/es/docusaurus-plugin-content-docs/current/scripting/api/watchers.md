---
sidebar_position: 80
---

# Data Input Watchers {#watchers}

A menudo estás interesado en saber cuándo cambia el valor de un data input. Por ejemplo, digamos que tienes el siguiente código que permite al usuario seleccionar un archivo del directorio `MyPluginFiles` en la carpeta de datos:

```csharp
[DataInput]
[AutoCompleteList(nameof(AutoCompletePluginFiles), forceSelection: true)]
public string SelectedFile;

protected async UniTask<AutoCompleteList> AutoCompletePluginFiles() {
    return AutoCompleteList.Single(Context.PersistentDataManager.GetFileEntries("MyPluginFiles").Select(it => new AutoCompleteEntry {
        label = it.fileName,
        value = it.path
    }));
}
```

Quieres saber cuándo el usuario selecciona un nuevo archivo. La forma ingenua es verificar el valor de `SelectedFile` cada frame, pero esto es ineficiente y engorroso. En su lugar, puedes registrar un watcher en `OnCreate()`:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    Watch<string>(nameof(SelectedFile), OnSelectedFileChanged);
}

protected void OnSelectedFileChanged(string from, string to) {
    if (to == null) {
        // El usuario ha limpiado el archivo seleccionado
    }
    // Más lógica para manejar el cambio de archivo
}
```

También puedes observar el data input de otra entity usando el método sobrecargado `Watch<T>(Entity otherEntity, string dataInputKey, Action<T, T> onChange, bool deep = true)`.

:::tip
Los watchers se desregistran automáticamente cuando la entity es destruida.
:::

## Observando Estados de Assets

A veces, quieres observar más que solo el cambio de valor. Por ejemplo, considera el siguiente asset simple que imprime un mensaje cada vez que el usuario selecciona un nuevo `Character`:

```csharp
[DataInput]
public CharacterAsset Character;

protected override void OnCreate() {
    base.OnCreate();
    Watch<CharacterAsset>(nameof(Character), OnCharacterChanged);
}

protected void OnCharacterChanged(CharacterAsset from, CharacterAsset to) {
    if (to != null) Debug.Log("New character file selected! " + to.Source);
}
```

Sin embargo, el watcher solo se activa cuando el valor del data input `Character` en el asset actual cambia; eso significa que si la escena tiene dos personajes, el watcher se activa cuando el usuario cambia de un personaje a otro. Sin embargo, digamos que solo hay un asset de personaje en la escena, y el usuario entra al asset de personaje y cambia el data input `Source`, entonces este watcher no se activará.

En este caso, puedes usar `WatchAsset`:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAsset(nameof(Character), OnCharacterChanged);
}

protected void OnCharacterChanged() {
    if (Character.IsNonNullAndActive()) Debug.Log("New character file selected! " + Character.Source);
}
```

El watcher ahora se activa tanto cuando el valor de `Character` cambia como cuando el data input `Source` del asset `Character` cambia.

:::info
¿Por qué funciona esto? El método `WatchAsset` adicionalmente activará el watcher cuando el [estado activo](assets#active-state) de un asset cambie. En Warudo, todos los assets que tienen un data input `Source` cambian el estado activo basado en el data input `Source`. Por ejemplo, `CharacterAsset` usa `Source` para cargar un modelo .vrm o un mod de personaje .warudo, `PropAsset` usa `Source` para cargar un mod de prop .warudo, y así sucesivamente. El estado activo solo es `true` si el `Source` es cargado exitosamente.

Digamos que tenemos un asset actualmente activo con un `Source` seleccionado. Cuando el usuario selecciona un nuevo `Source`, el estado activo se establece en `false` (activando el watcher), y luego si el nuevo `Source` es cargado exitosamente, se establece en `true` otra vez (activando el watcher nuevamente). En el código anterior, solo el segundo trigger imprimirá el mensaje, ya que cuando el primer trigger es llamado, el asset de personaje aún no está activo.
:::

## Observando Múltiples Data Inputs

Si necesitas observar múltiples data inputs y solo te importa ejecutar una función callback cuando cualquiera de ellos cambie, puedes usar el método `WatchAll`:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    WatchAll(new [] { nameof(A), nameof(B), nameof(C) }, OnAnyDataInputChanged);
}

protected void OnAnyDataInputChanged() {
    // Llamado cuando A, B, o C cambian
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
