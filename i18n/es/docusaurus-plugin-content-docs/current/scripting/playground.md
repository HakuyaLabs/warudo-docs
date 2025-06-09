---
sidebar_position: 50
---

# Playground

Playground es un entorno de desarrollo en Warudo que te permite cargar scripts personalizados sin crear un [plugin mod](plugin-mod). Los scripts C# (archivos `.cs`) colocados en la carpeta `Playground` serán automáticamente compilados y cargados por Warudo, y cualquier cambio en los scripts también será automáticamente recargado.

:::tip
¡Revisa nuestro tutorial [Creando Tu Primer Script](creating-your-first-script) para comenzar con Playground!
:::

Puedes colocar cualquier script C# en Playground, pero para que Warudo los reconozca, al menos una clase debe heredar uno de los [tipos de entidad](api/entities.md), es decir, un `Node`, un `Asset`, o un `Plugin`.

## Configuración del Entorno {#environment-setup}

No necesitas un IDE para usar Playground, pero se recomienda usar uno para completado de código y resaltado de sintaxis. Recomendamos [JetBrains Rider](https://www.jetbrains.com/rider/) o [Visual Studio Code](https://code.visualstudio.com/).

Luego, descarga el archivo `.csproj` [aquí](/scripts/Playground.csproj) y colócalo en el directorio `Playground` dentro de tu carpeta de datos de Warudo (Menú → Open Data Folder). Abre el archivo con tu IDE, ¡y listo!

## Recarga en Caliente de Entidades

La recarga en caliente funciona serializando los datos de la entidad, descargando el tipo de entidad antiguo, cargando e instanciando el nuevo tipo de entidad, y luego deserializando los datos de la entidad antigua. Este proceso usualmente toma solo unos pocos segundos.

Cuando la recarga en caliente se complete, deberías ver un mensaje toast indicando cuántos assets, nodos, o plugins han sido recargados.

:::tip
Si ves un error, puedes hacer clic en el mensaje toast para ver el error de compilación.
:::

## Limitaciones

Playground tiene las siguientes limitaciones:

* No puedes (fácilmente) usar DLLs de terceros o paquetes NuGet. Mejoraremos esto en el futuro.
* No puedes agregar o referenciar assets de Unity (ej., prefabs, materiales, texturas) en scripts de Playground (usa [plugin mods](plugin-mod) en su lugar).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'hanekit', github: 'hanekit'}
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />