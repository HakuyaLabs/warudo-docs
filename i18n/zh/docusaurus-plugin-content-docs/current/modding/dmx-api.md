---
sidebar_position: 15
translate_from_version: 2026-01-14
---

# DMX 灯光控制

:::info

此功能仅在 [Warudo Pro](../pro.md) 中提供。

:::

Warudo 支持通过 Art-Net 接收 DMX 数据。您可以使用 DMX 灯光控制器操控场景对象，也可以通过 Mod API 将 DMX 通道映射到自定义行为。

Art-Net 插件通过 `PluginRouter` 广播 DMX 数据。Mod 可以连接到 `Warudo.Plugins.ArtNet`，监听每个 Universe 的通道值。

## 创建接收 DMX 数据的 Mod

首先，在环境 Mod 或其他 Mod 中创建一个插件。例如，下面的代码注册了 ID 为 `YourName.Environment.Plugin` 的插件：

```csharp
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;

[PluginType(Id = "YourName.Environment.Plugin")]
public class EnvPlugin : Plugin
{
}
```

然后，创建一个 `MonoBehaviour`，通过 `PluginRouter` 监听 DMX 数据，并将通道值映射到场景对象。

下面的示例监听 Universe 0，并将前三个 DMX 通道（数组索引 0–2，取值范围为 0–255）分别映射到对象在 X、Y、Z 轴上的旋转角度：

```csharp
using System;
using UnityEngine;
using Warudo.Core;
using Warudo.Core.Plugins;

public class DMXReceiver : MonoBehaviour
{
    public class DmxEvent : Warudo.Core.Events.Event
    {
        public int Universe { get; set; }
        public int[] Channel { get; set; }
    }

    private Guid dmxConnection;

    private void OnEnable()
    {
        Plugin targetPlugin = Context.PluginManager.GetPlugin("YourName.Environment.Plugin");
        dmxConnection = Context.PluginRouter.ConnectSlot<DmxEvent>(
            targetPlugin,
            "Warudo.Plugins.ArtNet",
            (dmx, source) =>
            {
                if (dmx.Universe != 0)
                {
                    return;
                }

                int channel1 = dmx.Channel[0];
                int channel2 = dmx.Channel[1];
                int channel3 = dmx.Channel[2];

                transform.eulerAngles = new Vector3(
                    channel1 / 255f * 360f,
                    channel2 / 255f * 360f,
                    channel3 / 255f * 360f
                );
            }
        );
    }

    private void OnDisable()
    {
        Context.PluginRouter.DisconnectSlot(dmxConnection);
    }
}
```

构建 `.warudo` 文件后，将其放入 Warudo 数据文件夹中的场景目录。

## 配置 Art-Net 接收器

在 Warudo 编辑器中添加并启用 **Art-Net 接收器**。请根据您使用的 DMX 控制器填写网络地址，或保留默认设置。

:::tip

Art-Net 接收器默认使用多播地址 `239.255.0.1:6454`。

:::

![](/doc-img/art-net-receiver.png)

启用接收器后，Warudo 会将收到的 Art-Net DMX 数据发送到场景中的 Mod。

## 重映射 Art-Net 通道

如果控制器通道与 Mod 使用的通道不一致，您可以对通道进行重映射。例如，可以将控制器的通道 1 映射到 Mod 的通道 3。

关闭 **直接发送频道数据**，然后编辑通道重映射表：

![](/doc-img/art-net-remap-channel.png)

重映射会在数据发送给 Mod 之前生效，因此 Mod 接收到的是重映射后的通道数据。
