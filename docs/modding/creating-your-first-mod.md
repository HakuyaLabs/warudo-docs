---
sidebar_position: 5
---

# Creating Your First Mod

Let's create your first mod! We will create a [prop mod](prop-mod) that is a simple white cube in this tutorial.

:::info
Before getting started, make sure you have already set up the [Warudo SDK](mod-sdk.md).
:::

:::tip
Creating mods the first time can be a little overwhelming. If you need help, feel free to reach out to us on [Discord](https://discord.gg/warudo)!
:::

## Tutorial

To create a new mod, go to the menu bar and select **Warudo → New Mod**:

![](pathname:///doc-img/en-mod-sdk-3.webp)

Type "WhiteCube" in **Mod Name**, and click "Create Mod!":

![](pathname:///doc-img/en-mod-1.png)

You should see a folder for your mod has just been created under the Assets folder:

![](pathname:///doc-img/en-mod-2.png)

This folder which has the same name as your mod is called the **mod folder**.
:::tip
Remember, **all assets (e.g., prefabs, shaders, materials) and scripts for your mod should be placed in the mod folder.** If you place them outside the mod folder, they will not be included in your mod.
:::

Let's create a cube in the scene. Go to the menu bar and select **GameObject → 3D Object → Cube**:

![](pathname:///doc-img/en-mod-3.png)

To export the cube as a mod, we must create a prefab in the mod folder. Select the cube in the scene, and drag it to the mod folder to create a prefab, which has a blue cube icon:

![](pathname:///doc-img/en-mod-4.png)

Warudo needs to know what type of mod you are creating. Since we are creating a prop mod, we need to rename the prefab to "Prop". Right-click on the prefab and select **Rename**:

![](pathname:///doc-img/en-mod-5.png)

We are almost done! Before exporting the mod, let's check the mod settings are correct. Select **Warudo → Mod Settings** to open the mod settings window, in which you can set the mod's name, version, author, and description. You can also specify a mod icon, which will be shown in Warudo's preview galleries.

![](pathname:///doc-img/en-mod-6.png)

By default, the **Mod Export Directory** is empty; in this case, the mod will be exported to the project's root folder. It is often convenient to set it to the corresponding Warudo data folder, so after exporting, you can test your mod in Warudo right away!

In Warudo, select **Menu → Open Data Folder** to open the data folder. Then, copy the path to the data folder and paste it into the **Mod Export Directory** field. Since we are creating a prop mod, we add `\Props` to the end of the path. For example, if the data folder is `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets`, the **Mod Export Directory** should be `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Props`.

:::tip
Similarly, if you are creating a character mod, you should set the **Mod Export Directory** to the `Characters` data folder, and so on.
:::

Finally, select **Warudo → Build Mod** to export the mod. After the mod is exported, you should see a `WhiteCube.warudo` in the props data folder. Now create a prop asset in Warudo and select "WhiteCube" from the **Source** dropdown. If you see a white cube in the scene, hooray! You just created your first mod!

![](pathname:///doc-img/en-mod-7.png)

The process of creating other mods is similar: create a new mod using **Warudo → New Mod**, put assets and scripts in the mod folder, and export the mod using **Warudo → Build Mod**. For more information on creating different types of mods, please refer to the corresponding sections in the sidebar.

## Naming Your Mod

When you create a new mod, you need to specify a name for your mod. The name of your mod is important, as it is used to identify your mod in Warudo. Please don't use generic names such as "My Mod" or "Test Mod", as it will be both difficult for others to find your mod and may cause conflicts with other mods.

We recommend using a name that is unique and descriptive; you can include spaces in the name, but not special characters.

:::caution
Be careful that only one mod of the same name can be loaded at a time, which means you should not reuse the mod folder to export a different mod!
:::

## Hot Reloading

Warudo supports hot reloading, which means if you have exported a new version of your mod from Unity, which overrides the existing mod file, Warudo will automatically reload the mod and reflect the changes in the scene. For example, if you change the cube's material to red and export the mod again, you should see the cube turns red in Warudo immediately!

:::info
Note that hot reloading may not always work as expected. If you encounter any issues, please restart Warudo.
:::
