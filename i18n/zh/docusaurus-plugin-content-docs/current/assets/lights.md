# 光源

场景内的光源，目前支持平行光源和点光源。

:::info
光源资源适合用来打角色光，或对原有[环境](https://tiger-tang.gitbook.io/warudo/assets/environment)打光作调整。如果光源数量较多且位置固定，建议直接在 Unity 内设置，并用 [Warudo SDK](https://tiger-tang.gitbook.io/warudo/advanced/sdk) 导出环境。
:::

## 属性

* 颜色：光照的颜色。
* 强度：光照的强度。
* 是否影响角色：光照是否影响[角色](https://tiger-tang.gitbook.io/warudo/assets/character)。
* 是否影响道具：光照是否影响[道具](https://tiger-tang.gitbook.io/warudo/assets/prop)。
* 是否影响环境：光照是否影响[环境](https://tiger-tang.gitbook.io/warudo/assets/environment)。

### 阴影

* 强度：阴影的强度。
* 软阴影：是否模糊阴影的边缘。
