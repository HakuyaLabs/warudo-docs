---
sidebar_position: 40
---

# Mod de Prop

Un mod de prop es cualquier [prefab](https://docs.unity3d.com/Manual/Prefabs.html) de Unity que está destinado a ser usado como prop en Warudo, como una silla o una espada.

## Configuración

### Paso 1: Preparar Modelo

Importa el modelo del prop al proyecto de modding. Coloca tu prop en la escena, luego ajústalo a la posición y rotación deseadas. Haz clic derecho y selecciona **Create Empty Parent** para crear un GameObject vacío como la raíz del prop.

:::tip
Creamos un padre vacío porque el asset del prop usa la transformación del GameObject raíz como la transformación del prop. Si no creas un padre vacío, los cambios que hagas a la transformación del prop no se preservarán.
:::

### Paso 2: Configurar Adjunto de Personaje (Opcional)

Si tu prop está destinado a ser adjuntado a un personaje (como un accesorio), puedes colocar el script `CharacterAttachmentSettings` en el prefab para especificar el hueso de personaje por defecto al cual adjuntar. De esta manera, si los usuarios seleccionan un personaje para Prop → Transform Attachment → Attach To, el prop será automáticamente adjuntado al hueso de personaje especificado, en lugar del hueso por defecto (cabeza).

También puedes colocar el script `CharacterAttachmentRotationConstraint` en cualquier transformación hija del prop para especificar el hueso de personaje con el cual el hueso del prop debería rotar junto. Por ejemplo, las transformaciones hijas de un prop de guante deberían rotar junto con los huesos de dedos del personaje.

### Paso 3: Crear Prefab

Selecciona el GameObject raíz del prop y arrástralo a la carpeta del mod para crear un prefab. Nombra el prefab **"Prop"** y asegúrate de que esté colocado en la carpeta del mod (puede ser colocado en cualquier subcarpeta).

### Paso 4: Exportar Mod

Selecciona **Warudo → Build Mod** y asegúrate de que el archivo `.warudo` generado se coloque en la carpeta de datos `Props`.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
