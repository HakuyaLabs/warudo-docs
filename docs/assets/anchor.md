# 锚点

锚点是场景空间中的某个绝对点或相对点，可作为[角色视线 IK](https://tiger-tang.gitbook.io/warudo/assets/character#shi-xian-ik) 及 [身体 IK](https://tiger-tang.gitbook.io/warudo/assets/character#shen-ti-ik) 的目标。

## 属性

* 父变换：选中场景中实体作为父变换时，锚点会跟着父变换移动（变换中的数值也为相对值）。
  * 父变换为[角色](character/)时：
    * 绑定类型：锚点绑定的方式。
      * 人体骨骼：
        * 绑定骨骼：锚点绑定的人体骨骼。
      * 变换路径：
        * 绑定变换路径：锚点绑定的变换在模型层级中的相对路径，用来将锚点道具绑定在非标准 Unity Humanoid 人体骨骼（例如模型的尾巴上）。
  * 父变换为[道具](prop.md)时：
    * 绑定变换路径：锚点绑定的变换在模型层级中的相对路径，用来将锚点道具绑定在非标准 Unity Humanoid 人体骨骼（例如模型的尾巴上）。
* 传送至主摄像机：传送此锚点到[主摄像机](camera.md#duo-she-xiang-ji)的位置。
* 传送主摄像机至此锚点：传送主摄像机到此锚点的位置。

## 示例

### 我想实现这种手机自拍的效果。

{% embed url="https://user-images.githubusercontent.com/3406505/181163859-793e78de-3dda-4551-85f4-de6c866451ea.mp4" %}

这里用右手作为例子。创建锚点，把父变换设置为摄像机。将角色「身体 IK」->「右手」->「IK 变换」设置为锚点，「旋转权重」设置为 0.5。调整锚点变换的位置和旋转，直到画面看起来自然即可。

![视频中的锚点变换使用的数值](https://user-images.githubusercontent.com/3406505/181164261-8ce9dbc6-f0c2-4b3f-aecf-b0e6a42c3aea.png)

<div className="hint hint-info">
锚点离画面太近（或者在画面背后），无法使用变换 Gizmo？可以先将摄像机的视场角调大，使用变换 Gizmo 调整锚点位置后再调回来即可。
</div>

<div className="hint hint-info">
适当调低摄像机「控制」->「控制灵敏度」，即可更精细地操作摄像机。
</div>
