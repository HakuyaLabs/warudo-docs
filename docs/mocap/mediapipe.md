---
sidebar_position: 50
sidebar_label: MediaPipe
---

# MediaPipe（Beta）

基于摄像头的上半身动捕方案。优点是可动范围较大，手部能够前后移动；反应更为及时，可以捕捉到快速甩手、挥拳等。缺点是初次配置和校正需要一点点时间，并且稳定性相对 [RhyLive ](rhylive.md)略有不足。

<div className="hint hint-success">
MediaPipe 是 [Webcam Motion Capture](https://webcammotioncapture.info/) 等软件使用的手部捕捉技术，不过 Warudo 的实现拥有更广的可动范围以及更稳定的捕捉效果。
</div>

## 属性

* 角色：选择动捕要应用到的角色。
* 输入摄像头：选择摄像头。**目前不支持 IP 摄像头（例如** [**DroidCam**](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)**）。**
* 校正：校正手部的位置。<mark style={{color:"orange"}}>**初次使用建议校正！**</mark>

<figure><img src="/images/image(51).png" alt="" /><figcaption><p>校正时的手部应保持放松的姿势，可以手指适当弯曲。</p></figcaption></figure>

* 显示摄像头内容：是否显示摄像头的画面。~~（小心暴露中之人）~~
* 反转双手：是否反转双手。

### 进阶

* 手部移动范围：手部可动的范围。X 是左右，Y 是上下，Z 是前后。
* 手部移动偏移：手部可动范围的偏移。正 X 是往左偏移，正 Y 是往上偏移，正 Z 是往前偏移。
* 手部水平距离补偿：使角色的双手更加接近。可以更容易做出交叉手指等手势。
* 手部 Y 阈值：如果手腕与摄像头画面上下边缘的距离低于此值，则忽略该手的追踪。有助于避免捕捉不稳定导致的手部瞬移问题。
* 摄像头对角线视场角：即摄像头的 FoV。准确的数值有助于估算手部的深度。你通常可以在摄像头的购买页面找到厂家列出的视场角。
* 摄像头长宽比：同视场角，准确的数值有助于估算手部的深度。市面上大部分的摄像头是 16:9。
* 手部最大 Z 前推：手部会被往前推以防止和身体穿模。这个值决定了往前推的最大距离。
* 手部前推 Y 范围：手部离肩膀越下，就会被越向前推。当手部距离肩膀的垂直距离大于或等于此值时，它们就会被向前推到最大。
* 手部前推 Y 起点：此值为 0 时，手部从肩部往下开始向前推。此值为正时，手部从肩膀以上就会开始被向前推。
* 手部校准距离：按下「校正」后设置的校准参数。不应手动调节。
* 肩膀旋转校正：调整肩膀的旋转以适应某些姿势胸部和/或头部的旋转。

<div>

<figure><img src="/images/image(3)(1).png" alt="" /><figcaption><p>禁用「肩膀旋转校正」</p></figcaption></figure>

 

<figure><img src="/images/image(20)(2).png" alt="" /><figcaption><p>启用「肩膀旋转校正」</p></figcaption></figure>

</div>

## 提示

* **建议将摄像头放在电脑屏幕上方，头显示在摄像头画面中央偏上为佳。**
* 使用 MediaPipe 动捕时，不能最小化追踪器窗口（MediaPipe Tracker），否则动捕会停止运作！（可以被别的窗口挡住，只要不点击窗口的最小化按钮即可。）
* 捕捉双手比捕捉单手更为稳定。
