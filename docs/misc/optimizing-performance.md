---
sidebar_position: 10
---

# Optimizing Performance

## Warudo's frame rate drops dramatically when running simultaneously with other 3D applications/games (e.g., Apex Legends).

This is because the other 3D application/game are using most of the GPU resources. You can run Warudo in administrator mode and turn on "Increased GPU Priority" in "Settings" -> "Core".

To run Warudo in administrator mode, go to your Steam library, right-click on Warudo and select "Manage" -> "Browse local files":

![](pathname:///doc-img/zh-faq-1.webp)

Right click on Warudo.exe and click on "Properties":

![](pathname:///doc-img/zh-faq-2.webp)

Then go to the "Compatibility" tab, check "Run this program as an administrator", and click "OK".

![](pathname:///doc-img/zh-faq-3.webp)

Open Warudo and go to "Settings" -> "Core" -> "Advanced" -> "Increase GPU Priority", then select "Yes".

![](pathname:///doc-img/zh-faq-4.webp)

:::caution
Increased GPU priority for Warudo can in turn result in decreased frame rates for other 3D applications/games running simultaneously. You can try shrinking the Warudo window (not minimizing to the taskbar) or lowering the rendering frame rate in Warudo ("Settings" -> "Core" -> "Graphics" -> "Limit FPS") until the frame rate for both Warudo and other 3D applications/games becomes acceptable.
:::

:::info
On an Intel i9-9900k + NVIDIA RTX 2080 Ti configuration, running Warudo at 1080p resolution (with a NiloToon-rendered model and a high-precision 3D [environment ](../assets/environment.md)as the background) and playing Elden Ring at high graphics settings, with OBS recording at 1080p, the frame rate stays stable at around 45 FPS.
:::
