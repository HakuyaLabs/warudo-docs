---
sidebar_position: 50
version: 2024-06-18
---

# Playground

Playground is a development environment in Warudo that allows you to load custom scripts without creating a [plugin mod](plugin-mod). C# scripts (`.cs` files) put in the `Playground` folder will be automatically compiled and loaded by Warudo, and any changes to the scripts will also be automatically reloaded.

:::tip
Check out our [Creating Your First Script](creating-your-first-script) tutorial to get started with Playground!
:::

You can put any C# scripts in Playground, but for Warudo to recognize them, at least one class must inherit one of the [entity types](api/entities.md), i.e., a `Node`, an `Asset`, or a `Plugin`.

## Environment Setup

You do not need an IDE to use Playground, but it is recommended to use one for code completion and syntax highlighting. We recommend [JetBrains Rider](https://www.jetbrains.com/rider/) or [Visual Studio Code](https://code.visualstudio.com/).

Then, download the `.csproj` file [here](/scripts/Playground.csproj) and put it into the `Playground` directory inside your Warudo data folder (Menu → Open Data Folder). Open the file with your IDE, and you are good to go!

## Entity Hot-reloading

Hot-reloading works by serializing the entity data, unloading the old entity type, loading and instantiating the new entity type, and then deserializing the old entity data. This process usually takes only a few seconds.

When hot-reloading completes, you should see a toast message indicating how many assets, nodes, or plugins have been reloaded.

:::tip
If you see an error, you can click on the toast message to see the compilation error.
:::

## Limitations

Playground has the following limitations:

* You cannot (easily) use third-party DLLs or NuGet packages. We will improve this in the future.
* You cannot add or reference Unity assets (e.g., prefabs, materials, textures) in Playground scripts (use [plugin mods](plugin-mod) instead).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'Hane', github: 'hanekit'}
  ],
  translators: [
  ],
}} />
