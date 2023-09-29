---
cover: .gitbook/assets/library_hero.png
coverY: -34.94419306184012
---

# Introduction to Warudo

## What is Warudo?

Warudo is an avatar animation software specifically designed for 3D VTuber livestreaming. Import your own [environments](modding/environment-mod.md) and [props](modding/prop-mod.md), customize your avatar in-depth with [blueprints](/docs/mocap/blueprints/overview), and further enhance the software capabilities via [C# plugins](modding/mod-sdk.md). Feature-packed and highly flexible, Warudo is dedicated to creating the perfect livestreaming setup for your VTuber avatar.

## Why Warudo?

Existing 3D livestreaming solutions fall into four categories:

* Simple and user-friendly software such as [Luppet](https://luppet.appspot.com/) and [VSeeFace](https://www.vseeface.icu/):
  * Pros: Easy to use and accessible.
  * Cons: Limited in features and customization options. Despite VSeeFace providing an SDK for developers, there are still many things that can't be done with the software, even technically it would only "require a few lines of code."
* Self-developed/in-house software:
  * Pros: Tailored to fit a VTuber's specific needs. As long as there is enough development support, any desired features can be added.
  * Cons: Building a custom solution from scratch is expensive and time-consuming. Even small modifications require the programmer's time and effort and often a rebuild of the entire project.
* VTuber software for specific use cases, such as [VRoom](https://ojousamaya.booth.pm/items/3949561) and [Keyboard Stuvio](https://booth.pm/ja/items/2956377):
  * Pros: Offers unique features, such as Keyboard Stuvio, which motion captures live piano performances through a webcam.
  * Cons: Besides the special features, the rest of the software is lacking in functionality due to developers not having the time or desire to recreate every wheel from scratch. The quality of the rendering can also vary from one software to another.
* [VRChat](https://hello.vrchat.com/):
  * Pros: Multiplayer features. And [you can have fun playing in VR!](https://www.bilibili.com/video/BV1HW4y1q7aP)
  * Cons: Requires additional hardware and software support for eye tracking and lipsync. Also, the VTuber must be wearing a VR headset and holding controllers, which limits the livestreaming content to VR.

Warudo aims to strike a balance between the different VTuber software options by offering:

* **Effortless motion capture at home:** Achieve face and upper body motion capture with [just an iPhone](mocap/rhylive.md) or [webcam](mocap/mediapipe.md)! Warudo also includes [over 500 idle animations](misc/idle-animations.md) and [character IK](assets/character/#body-ik), allowing you to pose your avatar in a variety of ways, even without a motion capture suit.
* **Rich feature set:** Experience a wealth of features with Warudo, including [seamless integration of motion capture and animation](assets/character/#animation), [multiple camera support](assets/camera.md#multiple-cameras), [fully customizable blendshape mapping](blueprints/mocap-nodes.md), and an [advanced expression system](assets/character/blendshape-expression.md). Customize your virtual avatar's animation to make it look more natural and expressive with a range of rich configuration options.
* **Intuitive configuration:** Easily create and control your virtual avatar with Warudo's simple and intuitive configuration interface, which can even be accessed remotely on other devices. Detailed usage instructions and configuration examples for common scenarios are also provided to make your experience as smooth as possible.
* **Modular scene management:** Stay organized and efficient with Warudo's modular configuration, allowing you to switch between different live streaming scenes with ease. Character models, environment models, camera setups, and interactivity logic are all saved in Warudo's scene file, making it convenient for developers and character artists to set up and provide pre-configured scenes for VTubers to use.
* **Customizable and expandable:** Take your virtual avatar to the next level with Warudo's expandability features, including support for [importing external 3D assets](modding/mod-sdk.md), compatibility with the [Steam Workshop](misc/steam-chuang-yi-gong-fang.md), and the [Unity URP rendering pipeline](https://github.com/ColinLeung-NiloCat/UnityURPToonLitShaderExample). A C# SDK is also provided for custom development, with support for hot recompiling and debugging of C# scripts at runtime.

<div className="hint hint-info">
Stay tuned as Warudo is actively working on developing new features, including collab and livestream interactions!
</div>
