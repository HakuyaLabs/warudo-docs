---
sidebar_position: 40
---


# iFacialMocap

基于苹果 ARKit 的面捕方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并购买 [iFacialMocap](https://apps.apple.com/cn/app/id1489470545) App（国区售价 40 元）。可以捕捉 52 个 ARKit BlendShape，以及头部的旋转和移动。

:::info
iFacialMocap 提供的功能其实非常简单，并且有同类免费 App（例如 [waidayo](https://apps.apple.com/us/app/waidayo/id1513166077)）可以提供同样精度的 ARKit 面部捕捉。（你甚至可以[自己用 Unity 写一个](https://docs.unity3d.com/Packages/com.unity.xr.arkit-face-tracking@1.1/manual/index.html)。）不过，iFacialMocap 是最早也是最多人使用的同类 App，所以 Warudo 先加入了针对其的支持，之后会再支持其他同类 App。
:::

## 教程

iOS 设备上打开 iFacialMocap，右上角点击齿轮图标进入设置界面。点击「Destination IP address」，输入电脑的 IP 地址。

![](pathname:///doc-img/zh-ifacialmocap-1.webp)

:::info
如果不知道电脑的 IP，可以在「iFacialMocap 接收器」的配置页面查看：

![](pathname:///doc-img/zh-ifacialmocap-2.webp)

如果列出多个 IP，则需要一个一个尝试。通常来说，你的 WiFi 路由器分配给你电脑的 IP 是以 192.168. 开头的，所以以上图为例，可以先尝试 192.168.1.2。
:::

建议开启「Optimize for long-time streaming」，可以有助降低长时间使用导致的设备发热。

![](pathname:///doc-img/zh-ifacialmocap-3.webp)

## 属性

* 角色：选择面捕要应用到的角色。
* 端口：Warudo 接收数据使用的端口。可以在 iFacialMocap -> 设置 -> Details Settings -> Port 修改。
* 校正：校正头部的位置和旋转，让角色望向正前方。
* 头部移动范围：头部上下左右前后的移动范围。
* 允许头部上下移动：是否允许头部上下的移动。

![](pathname:///doc-img/zh-ifacialmocap-4.webp)
<p class="img-desc">开启后，头向下移动时，腿会自然地弯曲。</p>

* 反转头部前后移动：是否反转头部前后的移动。
* 头部旋转范围：头部旋转的幅度。
* 眼睛移动幅度：眼睛移动的幅度。
* 眼睛眨眼灵敏度：眼睛眨眼的灵敏度。
* 身体移动幅度：随着头部的移动，身体自然移动的幅度。
* 限制挤眼程度：如果你的模型适配了 ARKit BlendShape（即「完美同步」），根据模型师的偏好，你的模型眼睛可能无法完全闭起来（或者闭过头）。这种情况可以试着切换此选项。
* 使用 BlendShape 控制眼睛：**需要模型适配 ARKit BlendShape。**不使用骨骼而是使用眼睛移动 BlendShape（EyeLookInLeft、EyeLookInRight、EyeLookOutLeft、EyeLookOutRight）来控制角色眼睛的移动。如果你的模型没有眼睛骨骼，则需要开启此选项。

