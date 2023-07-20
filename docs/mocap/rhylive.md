# RhyLive

由[域动数字 RhythMo](https://rhythmo.cn/) 研发的基于苹果 ARKit 的面捕 +上半身捕捉方案，需要一台支持[面容 ID ](https://support.apple.com/zh-cn/HT208109)的 iOS 设备，并下载 [RhyLive ](https://apps.apple.com/us/app/rhylive/)App（免费）。可以捕捉 52 个 ARKit BlendShape，头部的旋转及上半身的姿态。

<div className="hint hint-info">
RhyLive 和 iFacialMocap 的面捕精度仅相差在 iFacialMocap 可以捕捉头部的移动，在可动性更高之余，可以带动模型的全身更自然地移动。可以参考下面的对比：

{% embed url="https://user-images.githubusercontent.com/3406505/209767938-26ae5946-0fea-48f2-96c8-4d37a76eb4f4.mp4" %}
RhyLive
{% endembed %}

{% embed url="https://user-images.githubusercontent.com/3406505/209767940-fd308011-2343-4f41-a33b-9da21136ab6b.mp4" %}
iFacialMocap
{% endembed %}
</div>

## 教程

iOS 设备上打开 RhyLive，左上角点击菜单图标进入设置界面。电脑和手机用的是同一个 WiFi 的话，就在 「IP」处输入电脑 IP，然后开启「无线」开关；或者也可以把设备用 USB 连上电脑，然后开启「有线」开关（需要安装 [iTunes](https://www.apple.com/itunes/)）。

![](</images/image(8).png>)

<div className="hint hint-info">
如果不知道电脑的 IP，可以在「RhyLive 接收器」的配置页面查看：

<img src="/images/image(26).png" alt="" data-size="original" />

如果列出多个 IP，则需要一个一个尝试。通常来说，你的 WiFi 路由器分配给你电脑的 IP 是以 192.168. 开头的，所以以上图为例，可以先尝试 192.168.1.2。
</div>

<div className="hint hint-info">
如果你使用「有线」选项，你必须在打开 Warudo 之前，在 iPhone 打开 RhyLive，并通过 USB 线连接到电脑。
</div>

建议关闭「锁定弯腰」并开启「隐藏模型」。前者可以让模型的可动范围更广，后者可以有助降低长时间使用导致的设备发热。

![](</images/image(14).png>)

## 属性

* 端口：Warudo 接收数据使用的端口。可以在 RhyLive -> 设置 -> 端口 修改。
* 校正：校正头部的位置和旋转，让角色望向正前方。
* 身体移动范围：身体移动的幅度。
* 眼睛眨眼灵敏度：眼睛眨眼的灵敏度。
* 眼睛移动幅度：眼睛移动的幅度。
* 眨眼灵敏度：眨眼的灵敏度。
* 限制挤眼程度：如果你的模型适配了 ARKit BlendShape（即「完美同步」），根据模型师的偏好，你的模型眼睛可能无法完全闭起来（或者闭过头）。这种情况可以试着切换此选项。
* 使用 BlendShape 控制眼睛：**需要模型适配 ARKit BlendShape。**不使用骨骼而是使用眼睛移动 BlendShape（EyeLookInLeft、EyeLookInRight、EyeLookOutLeft、EyeLookOutRight）来控制角色眼睛的移动。如果你的模型没有眼睛骨骼，则需要开启此选项。
