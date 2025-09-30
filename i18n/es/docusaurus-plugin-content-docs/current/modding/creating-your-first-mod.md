---
sidebar_position: 5
---

# Creando Tu Primer Mod

¡Vamos a crear tu primer mod! Crearemos un [mod de prop](prop-mod) que es un simple cubo blanco en este tutorial.

:::info
Antes de comenzar, asegúrate de haber configurado el [Warudo SDK](mod-sdk.md).
:::

Si no tienes experiencia con Unity, recomendamos revisar algunos tutoriales para principiantes para familiarizarte con el editor de Unity. ¡[Unity Learn](https://learn.unity.com/) es un gran lugar para empezar!

:::tip
Crear mods por primera vez puede ser un poco abrumador. Si necesitas ayuda, ¡no dudes en contactarnos en [Discord](https://discord.gg/warudo)!
:::


## Tutorial

Para crear un nuevo mod, ve a la barra de menús y selecciona **Warudo → New Mod**:

![](/doc-img/en-mod-sdk-3.webp)

Escribe "WhiteCube" en **Mod Name**, y haz clic en "Create Mod!":

![](/doc-img/en-mod-1.png)

Deberías ver que se acaba de crear una carpeta para tu mod bajo la carpeta Assets:

![](/doc-img/en-mod-2.png)

Esta carpeta que tiene el mismo nombre que tu mod se llama **carpeta del mod**.
:::tip
Recuerda, **todos los assets (ej. prefabs, shaders, materiales) y scripts para tu mod deben colocarse en la carpeta del mod.** Si los colocas fuera de la carpeta del mod, no se incluirán en tu mod.
:::

Vamos a crear un cubo en la escena. Ve a la barra de menús y selecciona **GameObject → 3D Object → Cube**:

![](/doc-img/en-mod-3.png)

Para exportar el cubo como un mod, debemos crear un prefab en la carpeta del mod. Selecciona el cubo en la escena, y arrástralo a la carpeta del mod para crear un prefab, que tiene un ícono de cubo azul:

![](/doc-img/en-mod-4.png)

Warudo necesita saber qué tipo de mod estás creando. Como estamos creando un mod de prop, necesitamos renombrar el prefab a "Prop". Haz clic derecho en el prefab y selecciona **Rename**:

![](/doc-img/en-mod-5.png)

¡Ya casi terminamos! Antes de exportar el mod, revisemos que la configuración del mod sea correcta. Selecciona **Warudo → Mod Settings** para abrir la ventana de configuración del mod, donde puedes establecer el nombre, versión, autor y descripción del mod. También puedes especificar un ícono del mod, que se mostrará en las galerías de vista previa de Warudo.

![](/doc-img/en-mod-6.png)

Por defecto, el **Mod Export Directory** está vacío; en este caso, el mod se exportará a la carpeta raíz del proyecto. ¡A menudo es conveniente configurarlo a la carpeta de datos correspondiente de Warudo, para que después de exportar, puedas probar tu mod en Warudo inmediatamente!

En Warudo, selecciona **Menu → Open Data Folder** para abrir la carpeta de datos. Luego, copia la ruta a la carpeta de datos y pégala en el campo **Mod Export Directory**. Como estamos creando un mod de prop, agregamos `\Props` al final de la ruta. Por ejemplo, si la carpeta de datos es `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets`, el **Mod Export Directory** debería ser `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Props`.

:::tip
De manera similar, si estás creando un mod de personaje, debes configurar el **Mod Export Directory** a la carpeta de datos `Characters`, y así sucesivamente.
:::

Finalmente, selecciona **Warudo → Build Mod** para exportar el mod. Después de que el mod se exporte, deberías ver un `WhiteCube.warudo` en la carpeta de datos de props. Ahora crea un asset de prop en Warudo y selecciona "WhiteCube" del menú desplegable **Source**. Si ves un cubo blanco en la escena, ¡hurra! ¡Acabas de crear tu primer mod!

![](/doc-img/en-mod-7.png)

El proceso de crear otros mods es similar: crea un nuevo mod usando **Warudo → New Mod**, coloca assets y scripts en la carpeta del mod, y exporta el mod usando **Warudo → Build Mod**. Para más información sobre crear diferentes tipos de mods, consulta las secciones correspondientes en la barra lateral.

## Nombrando Tu Mod

Cuando creas un nuevo mod, necesitas especificar un nombre para tu mod. El nombre de tu mod es importante, ya que se usa para identificar tu mod en Warudo. Por favor no uses nombres genéricos como "My Mod" o "Test Mod", ya que será difícil para otros encontrar tu mod y puede causar conflictos con otros mods.

Recomendamos usar un nombre que sea único y descriptivo; puedes incluir espacios en el nombre, pero no caracteres especiales.

:::caution
Ten cuidado de que solo un mod con el mismo nombre puede cargarse a la vez, ¡lo que significa que no debes reutilizar la carpeta del mod para exportar un mod diferente!
:::

## Recarga en Caliente

Warudo soporta recarga en caliente, lo que significa que si has exportado una nueva versión de tu mod desde Unity, que sobrescribe el archivo de mod existente, Warudo automáticamente recargará el mod y reflejará los cambios en la escena. Por ejemplo, si cambias el material del cubo a rojo y exportas el mod nuevamente, ¡deberías ver que el cubo se vuelve rojo en Warudo inmediatamente!

:::info
Ten en cuenta que la recarga en caliente puede no siempre funcionar como se espera. Si encuentras algún problema, reinicia Warudo.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'}
  ],
}} />
