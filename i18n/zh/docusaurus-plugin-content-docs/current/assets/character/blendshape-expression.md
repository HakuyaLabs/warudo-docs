---
sidebar_position: 10
---


# 表情

* 导入 VRM 表情：如果模型是 VRM 格式，导入模型内置的所有 VRM [BlendShapeClip ](https://vrm.dev/en/univrm/blendshape/univrm\_blendshape.html)作为表情。
* 生成按键绑定蓝图：根据当前配置好的表情，生成按键绑定蓝图。

:::info
最多生成 46 个表情热键，默认热键为：

Alt+1, Alt+2, Alt+3... Alt+=

Alt+Q, Alt+W, Alt+E... Alt+\\

Alt+A, Alt+S, Alt+D... Alt+'

Alt+Z, Alt+X, Alt+C... Alt+/

……前提你的模型真的有这么多表情！

**按下 Alt+Backspace 即可重置表情。**
:::

* 表情：
  *   列表元素：

      * 名称：表情名称。在蓝图中作为识别用。
      * 层：
        * 切换表情时，会淡出相同层的表情，而不同层的表情可以叠加。

      :::info
      在导入 VRM 表情时，VRM 模型中的默认 BlendShapeClip（即 Joy、Angry、Sorrow、Fun/Surprised）会被放在层 0，而模型师另外添加的 BlendShapeClip 则会被放在层 1、2、3……如此类推。
      :::

      * 禁用眨眼追踪：是否在应用此表情时，禁用眨眼的 BlendShape。
      * 禁用嘴部追踪：是否在应用此表情时，禁用嘴部的 BlendShape。
      * 禁用眉毛追踪：是否在应用此表情时，禁用眉毛的 BlendShape。
      * 目标 BlendShape 列表：
        * 列表元素：
          * 目标蒙皮网格：BlendShape 位于的蒙皮网格（Skinned Mesh）。
          * BlendShape：想要设置的 BlendShape。
          * 目标值：BlendShape 要设置成多少，正常为 0 到 1 之间；超过取值范围可能会穿模。
          * 淡入时长：应用此表情时，此 BlendShape 淡入到目标值的时长。
          * 淡入缓动函数：应用此表情时，此 BlendShape 淡入到目标值所使用的[缓动函数](https://easings.net/cn)。
          * 淡入延迟：应用此表情时，此 BlendShape 开始淡入到目标值之前的延迟。
          * 淡出时长：应用别的表情时，此 BlendShape 淡出到默认值的时长。
          * 淡出缓动函数：应用别的表情时，此 BlendShape 淡出到默认值所使用的[缓动函数](https://easings.net/cn)。
          * 淡出延迟：应用别的表情时，此 BlendShape 开始淡出到默认值之前的延迟。
      * 受约束 BlendShape 列表：
        * 列表元素：
          * 应用到所有蒙皮网格：是否控制所有蒙皮网格上的同名 BlendShape。
          * 目标蒙皮网格：BlendShape 位于的蒙皮网格（Skinned Mesh）。
          * 受约束 BlendShape：当此表情为激活状态时，控制此 BlendShape 的取值。
          * 最小值：当此表情为激活状态时，受约束 BlendShape 的值不能小于此值。
          * 最大值：当此表情为激活状态时，受约束 BlendShape 的值不能大于此值。
      * 目标材质属性：
        * 目前该选项仅为兼容 VRM BlendShapeClip 的 [MaterialValueBinding](https://vrm.dev/en/univrm/blendshape/univrm\_blendshape.html#id3)（用来修改模型某材质的属性，比如将衣服材质变透明实现换衣效果）。
* 默认 BlendShape 列表：模型默认设置的 BlendShape（除非被动捕数据覆盖）。
  * 列表元素：
    * 目标蒙皮网格：BlendShape 位于的蒙皮网格（Skinned Mesh）。
    * BlendShape：要设置的 BlendShape。
    * 默认值：BlendShape 的默认值。
* 默认材质属性（实验性功能）：模型默认设置的材质属性。

## 示例

:::info
以下示例假设你已经使用角色资源的「导入 VRM 表情」及「生成按键绑定蓝图」功能，即按下 Alt+1、Alt+2…… 可切换不同表情。
:::

### 我的某个表情会把眼睛合上。我不想在播放这个表情的时候，动捕还能捕捉到我的闭眼，这样会穿模。

两种办法：

1. 在表情列表展开该表情的详细设置，启用「禁用眨眼追踪」。
2. 在表情列表展开该表情的详细设置，点击**受约束 BlendShape 列表**右下角的 + 号，BlendShape 的下拉列表中选择闭上左眼的 BlendShape，最小值和最大值设置为 0。再次点击**受约束 BlendShape 列表**右下角的 + 号，BlendShape 的下拉列表中选择闭上右眼的 BlendShape，最小值和最大值设置为 0 即可。

第一种方法更为简单，但是第二种方法的自由度更高（例如除了约束眨眼 BlendShape 外，你还想约束别的 BlendShape）。

### 我想更改某个表情的切换速度。

在表情列表展开该表情的详细设置，调整「目标 BlendShape 列表」各个目标 BlendShape 的淡入时长即可。

### 我的模型有（举例）心心眼的 BlendShape。我想在播放某个表情的时候，也能显示心心眼。

在表情列表展开该表情的详细设置，点击**目标 BlendShape 列表**右下角的 + 号，BlendShape 的下拉列表中选择心心眼的 BlendShape，目标值设置为 1。其他输入可自由调整，保持默认也可。

### 我想更改切换表情的快捷键。

打开「表情按键绑定」蓝图，找到对应的「当按下键盘按键时」节点，按需要修改即可。例如，下图中，按下 Alt+2 会应用 Joy 表情：

![](pathname:///doc-img/zh-expression-1.webp)

如下修改左边节点的输入，即可把快捷键设置为 Ctrl+Shift+T：

![](pathname:///doc-img/zh-expression-2.webp)

### 我想创建新的表情。

在表情列表，点击右下角的 + 号新增列表元素。在「目标 BlendShape 列表」逐项添加表情对应的 BlendShape 即可。例如，以下表情在应用后，会激活模型上名为 `笑い` 的 BlendShape：

![](pathname:///doc-img/zh-expression-3.webp)

打开「表情按键绑定」蓝图（创建新的蓝图也可以），从右边的侧边栏拖出「当按下键盘按键时」及「切换角色表情」两个节点；在「当按下键盘按键时」节点设置快捷键，并在「切换角色表情」节点选择角色以及刚刚创建好的表情，最后将两个节点的出口与入口相连，如下：

![](pathname:///doc-img/zh-expression-4.webp)

### 我的表情切换了之后就会一直保持住。能不能只切换一段时间，过一阵子后自动切回之前的待机表情？

把蓝图中「切换 BlendShape 表情」节点的「临时」设置为是即可。表情显示的时长将由表情里每个 BlendShape 的淡出延迟决定。

![](pathname:///doc-img/zh-expression-5.webp)
