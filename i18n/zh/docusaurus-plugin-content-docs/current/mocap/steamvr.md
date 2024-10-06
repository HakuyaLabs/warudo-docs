---
sidebar_position: 68
---




# SteamVR

通过[SteamVR](https://store.steampowered.com/app/250820/SteamVR/)的解决方案进行VR追踪。

## 设置

### 角色追踪

Warudo 目前支持6点角色追踪。将[姿态追踪](body-tracking)设置为 SteamVR 后，转到 **SteamVR 角色追踪器** 并点击 **配置/校准** 按钮。您将看到一个追踪器列表，您可以将其分配给不同的身体部位。然后，您将需要摆 T-pose 来校准追踪器。

:::tip
我们将来会添加对 Elbow、Knee 和 Chest 追踪器的支持。
:::

校准后，您可以对每个追踪器以可视化追踪球的方式调整其 **位置偏移** 和 **旋转偏移** 。如果追踪器没有放置在您身体的精确位置，这将特别有用。例如，如果您的头部追踪器放在头顶上，则应调整追踪球 **位置偏移** 向下，使其与您的头部与追踪器的位置相匹配。

### 道具追踪

在 Warudo 中，创建新的 **SteamVR 道具追踪器** ，然后选择要进行追踪的 VR **设备** 。您可能还希望选择 **参考系** 作为您的角色资源。对于 **目标资源** ，选择您想控制的相机资源。

:::tip
如果要在蓝图中访问道具追踪数据，可以使用 **获取SteamVR道具追踪器数据** 节点。
:::

## 访问原始追踪器数据

如果要在蓝图中访问原始追踪器数据，可以使用 **获取SteamVR设备数据** 。此节点会返回指定 VR 设备（如追踪器、控制器、HMD）的位置和旋转。

## FAQ

有关常见问题，请参阅[概述](overview#FAQ)和[自定义动捕](body-tracking#FAQ)。

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'Eco', github: 'EcoFur'},
],
}} />