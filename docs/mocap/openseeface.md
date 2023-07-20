# OpenSeeFace（Beta）

基于摄像头的面捕方案。可以捕捉基本 BlendShape，以及头部的旋转和移动。和 [VSeeFace ](https://www.vseeface.icu/)的面捕效果大致相仿。

<div className="hint hint-info">
OpenSeeFace 是 [VSeeFace](https://www.vseeface.icu/) 使用的面部识别技术，所以熟悉 VSeeFace 的用户可能会觉得非常亲切。大体上的捕捉效果也比较相似，不过单眼眨眼暂时没有 VSeeFace 稳定。
</div>

## 属性

* 角色：选择面捕要应用到的角色。
* 输入摄像头：选择摄像头。**目前不支持 IP 摄像头（例如** [**DroidCam**](https://play.google.com/store/apps/details?id=com.dev47apps.droidcam\&hl=en\_US\&gl=US\&pli=1)**）。**
* 校正：校正头部的位置和旋转，让角色望向正前方。
* 头部移动范围：头部上下左右前后的移动范围。
* 头部旋转范围：头部旋转的幅度。
* 眼睛移动幅度：眼睛移动的幅度。X 是水平幅度，Y 是垂直幅度。
* 强制同时眨眼：是否左右眼同时眨眼。如果眨眼不太稳定，建议开启。&#x20;

### 进阶

* 眼睛眨眼偏移：如果眼睛太难闭上，可以 +0.1 直到合适为止。如果眼睛太容易闭上就 -0.1。
* 睁大眼（EyeWideLeft / EyeWideRight）灵敏度：**需要模型适配 ARKit BlendShape。**调大此值，可以让睁大眼 BlendShape（EyeWideLeft / EyeWideRight）变得更容易触发。
* 眉毛移动灵敏度：**需要模型适配 ARKit BlendShape。**调大此值，可以让眉毛相关的 BlendShape 变得更容易触发。
* 歪嘴（MouthLeft / MouthRight）灵敏度：**需要模型适配 ARKit BlendShape。**调大此值，可以让歪嘴的 BlendShape（MouthLeft / MouthRight）变得更容易触发。
* 嘴巴张开阈值：如果嘴巴太容易张开，可以 +0.1 直到合适为止。如果太难张开就 -0.1。
* 张嘴（JawOpen）灵敏度：调大此值，可以让张嘴的 BlendShape（JawOpen，或 VRM 的 A）变得更容易触发。
* O嘴（MouthFunnel）灵敏度：调大此值，可以让O嘴的 BlendShape（MouthFunnel，或 VRM 的 O）变得更容易触发。
* 微笑（MouthSmileLeft / MouthSmileRight）灵敏度：**需要模型适配 ARKit BlendShape。**调大此值，可以让微笑的 BlendShape（MouthSmileLeft / MouthSmileRight）变得更容易触发。
* 身体移动幅度：随着头部的移动，身体自然移动的幅度。

## 提示

* OpenSeeFace 启动后，需要大概十几秒的时间内部校正，期间模型的嘴巴眼睛可能会乱动，这是正常现象。

