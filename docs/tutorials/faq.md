---
sidebar_position: 20
---


# Frequently Asked Questions

## Warudo's frame rate drops dramatically when running simultaneously with other 3D applications/games (e.g., Apex Legends).

This is because the other 3D application/game are using most of the GPU resources. You can run Warudo in administrator mode and turn on "Increased GPU Priority" in "Settings" -> "Core".

To run Warudo in administrator mode, go to your Steam library, right-click on Warudo and select "Manage" -> "Browse local files":

![](/doc-img/zh-faq-1.webp)

Right click on Warudo.exe and click on "Properties":

![](/doc-img/zh-faq-2.webp)

Then go to the "Compatibility" tab, check "Run this program as an administrator", and click "OK".

![](/doc-img/zh-faq-3.webp)

Open Warudo and go to "Settings" -> "Core" -> "Advanced" -> "Increase GPU Priority", then select "Yes".

![](/doc-img/zh-faq-4.webp)

:::caution
Increased GPU priority for Warudo can in turn result in decreased frame rates for other 3D applications/games running simultaneously. You can try shrinking the Warudo window (not minimizing to the taskbar) or lowering the rendering frame rate in Warudo ("Settings" -> "Core" -> "Graphics" -> "Limit FPS") until the frame rate for both Warudo and other 3D applications/games becomes acceptable.
:::

:::info
On an Intel i9-9900k + NVIDIA RTX 2080 Ti configuration, running Warudo at 1080p resolution (with a NiloToon-rendered model and a high-precision 3D [environment ](../assets/environment.md)as the background) and playing Elden Ring at high graphics settings, with OBS recording at 1080p, the frame rate stays stable at around 45 FPS.
:::

## I have selected a camera for motion capture, but my camera does not turn on / camera feed is black.&#x20;

Some antivirus software may block programs that are not on their whitelist from accessing the camera. Please disable the camera protection function of your antivirus software, or add Warudo to the whitelist.

Also note that Warudo currently does not support IP cameras (such as [DroidCam](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam)).

## I need other help!

Please join our [Discord](https://discord.gg/Df8qYYBFhH), or contact [tiger@warudo.app](mailto:tiger@warudo.app).
