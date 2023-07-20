# Mod SDK

你可以使用 Unity + Warudo Mod SDK 制作 Mod，包括[角色](https://tira.gitbook.io/warudo/advanced/character-mod)、[角色动画](https://tira.gitbook.io/warudo/advanced/character-animation-mod)、[道具](https://tira.gitbook.io/warudo/advanced/prop-mod)、[环境](https://tira.gitbook.io/warudo/advanced/environment-mod)等，甚至可以编写 C# 插件，给 Warudo 添加新的资源类型和蓝图节点类型。

Mod SDK 导出的 Mod 后缀名为 `.warudo`，放在 Warudo 数据文件夹相应的子文件夹下即可被识别。



<mark style={{color: "red"}}>**！！！**</mark>

<mark style={{color: "red"}}>**以下部分的内容暂时尚未更新到最新。请参阅**</mark>[<mark style={{color: "red"}}>**英文文档**</mark>](https://docs.warudo.app/warudo/v/en/modding/mod-sdk)<mark style={{color: "red"}}>**。**</mark>

<mark style={{color: "red"}}>**！！！**</mark>



## 配置 SDK

首先，请确保你已安装 [Unity 2021.3.6f1](https://unity.com/)（其他版本的 Unity 不保证兼容性）。

打开 Unity 项目文件夹下的 `Packages/manifest.json`（注意这个文件不会在 Unity 编辑器中显示），在 `"dependencies"` 内添加以下 **7** 项依赖：

```
{
  "dependencies": {
    "com.unity.burst": "1.6.6",
    "com.unity.collections": "1.2.4",
    "com.cysharp.unitask": "https://github.com/Cysharp/UniTask.git?path=src/UniTask/Assets/Plugins/UniTask",
    "com.vrmc.gltf": "https://github.com/vrm-c/UniVRM.git?path=/Assets/UniGLTF#v0.100.1",
    "com.vrmc.univrm": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRM#v0.100.1",
    "com.vrmc.vrmshaders": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRMShaders#v0.100.1",
    "com.unity.nuget.newtonsoft-json": "3.0.2",
    // ...
```

回到 Unity，等待项目重载，确保没有报错。

<div className="hint hint-warning">
如果出现错误，提示 An error occurred while resolving packages / Error adding package，点击后出现类似 `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub.` 信息：

![](</images/image(8)(1)(1).png>)\
\
请到 [https://git-scm.com/download](https://git-scm.com/download) 下载安装 Git，并重启 Unity 及 Unity Hub。
</div>

确认 File -> Build Settings... -> Player Settings... -> Other Settings -> Api Compatibility Level 为 .NET Framework：

<figure><img src="/images/image(6).png" alt="" /><figcaption></figcaption></figure>

下载 SDK 并导入到 Unity 项目内（可以新建项目，也可以是现有项目）：

{% file src="/images/WarudoSDK 0.9.0.unitypackage" %}

<div className="hint hint-warning">
如果是导入到**现有 Unity 项目**内，且你的项目内已经安装以下任意组件：

* [Animancer](https://assetstore.unity.com/packages/tools/animation/animancer-pro-116514)
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)
* [Final IK](https://assetstore.unity.com/packages/tools/animation/final-ik-14290)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)
* [PuppetMaster](https://assetstore.unity.com/packages/tools/physics/puppetmaster-48977)

请在导入时取消对应的勾选，否则你的组件文件将被替换：

* `Plugins/Animancer`
* `Packages/DynamicBone`
* `Plugins/RootMotion/FinalIK`
* `Plugins/MagicaCloth`
* `Plugins/RootMotion/PuppetMaster`

</div>

没有编译错误就大功告成啦。接着……

## 创建 Mod

要创建一个新的 Mod，菜单栏选择「Warudo」->「New Mod」：

![](https://user-images.githubusercontent.com/3406505/181208455-9ab46a52-4edd-401c-807e-2d2d6ae24eec.png)

在 Mod Name 处给你的 Mod 起个名，再点击「Create Mod!」即可：

![](https://user-images.githubusercontent.com/3406505/181208739-8916bccd-a669-4f48-aa41-3baf61670ef4.png)

你应该能看到 Assets 文件夹下创建了 Mod 数据文件夹：

![](https://user-images.githubusercontent.com/3406505/181209065-a63e4ba1-005a-45d3-853c-3aa4013f66a5.png)

这样就可以开始制作 Mod 了！

## FAQ

> Q：Mod 可以使用自定义 Shaders（着色器）吗？

A：可以！不过请注意，Warudo 的 Steam 版本仅支持 Built-in（Legacy）管线，如有需求使用 URP/HDRP 管线，请联系我。

> Q：Mod 可以使用 C# 脚本（MonoBehavior）吗？

A：可以！以[环境 Mod](https://tira.gitbook.io/warudo/advanced/environment-mod)为例，在 GameObject 上放置的 MonoBehavior 脚本也会被打包进 Mod 里，在环境加载后即会被激活（`Awake()`）。

不过，要留意以下限制：

* 暂不支持 [Assembly Definitions (`.asmdef`)](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html)。被涵盖在 Assembly Definition 里的 C# 脚本不会导出到 Mod 里。
* 暂不支持 [ScriptableObject](https://docs.unity3d.com/ScriptReference/ScriptableObject.html)。
