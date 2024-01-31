---
sidebar_position: 10
---

# Optimizing Performance

Warudo should run smoothly on most PCs. However, if you are experiencing performance issues, especially when other games/applications are running simultaneously, you can try the following methods to improve performance.

## Window Resolution

The resolution of the Warudo window is one of the most important factors affecting Warudo's performance. The higher the resolution, the lower the frame rate. You should almost never use 4K resolution unless you have a very powerful PC. The recommended resolution is 1920 x 1080, and most livestreaming platforms only support up to 1080p anyway.

If 1920 x 1080 is still too demanding on your GPU, you can try 1280 x 720. You can manually set the resolution of the Warudo window by adjusting **Menu → Settings → Window Width/Height**.

## Environment

[Environments](../assets/environment), or the 3D backgrounds in Warudo, are also a major factor affecting performance. The more complex the environment, the lower the frame rate. For example, the [Tokyo City](https://steamcommunity.com/sharedfiles/filedetails/?id=3004012790) environment is known to be very demanding on most GPUs. You can try using a simpler environment, or even no environment at all.

## Character

Are there too many mesh renderers on your character? Models exported from [VRoid Studio](https://vroid.com/en/studio) often have this problem if you forgot to optimize the export settings to reduce the mesh count. (We have seen models with 100+ meshes for the hair alone!) You can either re-export the model or combine the meshes in Blender.

Similarly, make sure there aren't too many materials on your character.

## Limit FPS

If you are streaming to a platform that only supports 30 FPS, or you are running a heavy game along side Warudo, you can limit FPS to 30 to reduce the load on your GPU. You can do this by adjusting **Menu → Settings → Limit FPS**. If you have enabled VSync, turn it off first.

## MediaPipe Tracking

[MediaPipe](../mocap/mediapipe) hand tracking can be quite demanding on your CPU or GPU, depending on whether you have enabled **MediaPipe Tracker → GPU Acceleration**. If you are experiencing performance issues, try turning off MediaPipe hand tracking, or disable GPU acceleration to use CPU tracking instead.

## Other Applications Fighting for GPU Resources

If you are running a GPU-intensive game or application alongside Warudo such as Apex Legends, you may notice Warudo's frame rate drops significantly. This is because the other game/application requests a higher GPU priority, so Warudo is not able to render as smoothly as it should.

To allow Warudo to have a higher GPU priority, first you must run Warudo as administrator. Go to your Steam library, right-click on Warudo and select **Manage → Browse local files**:

![](/doc-img/zh-faq-1.webp)

Right click on Warudo.exe and click on **Properties**:

![](/doc-img/zh-faq-2.webp)

Then go to the **Compatibility** tab, check **Run this program as an administrator**, and click OK.

![](/doc-img/en-performance-1.png)

Finally, open Warudo and enable **Menu → Settings → Increase GPU Priority**.

:::caution
Increased GPU priority for Warudo can in turn decrease frame rates of other 3D applications/games running simultaneously.
:::

:::info
If you are experiencing performance issues with other applications/games, you can try to run them as administrator as well.
:::
