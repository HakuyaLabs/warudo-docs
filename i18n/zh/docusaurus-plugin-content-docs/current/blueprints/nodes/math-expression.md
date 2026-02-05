---
sidebar_position: 100
---

# 数学表达式

## 所有支持的函数

```
deg => x * Mathf.Rad2Deg
rad => x * Mathf.Deg2Rad
sin => Mathf.Sin
cos => Mathf.Cos
tan => Mathf.Tan
asin => Mathf.Asin
acos => Mathf.Acos
atan => Mathf.Atan
atan2 => Mathf.Atan2
noise => Mathf.PerlinNoise
sqrt => Mathf.Sqrt
abs => Mathf.Abs(float)
min => Mathf.Min(float, float)
max => Mathf.Max(float, float)
pow => Mathf.Pow(float, float)
exp => Mathf.Exp
log => Mathf.Log(float, float)
ln => Mathf.Log(float)
log10 => Mathf.Log10
ceil => Mathf.Ceil
floor => Mathf.Floor
round => Mathf.Round
sign => Mathf.Sign
clamp => Mathf.Clamp(float, float, float)
clamp01 => Mathf.Clamp01
lerp => Mathf.Lerp(float, float, float)
ulerp => Mathf.LerpUnclamped(float, float, float)
alerp => Mathf.LerpAngle(float, float, float)
smoothstep => Mathf.SmoothStep(float, float, float)
repeat => Mathf.Repeat(float, float)
pingpong => Mathf.PingPong(float, float)
ilerp => Mathf.InverseLerp(float, float, float)
rand => Random.Range(float, float)
```

## 详细表格

### 一元函数

| 函数       | Unity 代码       | 描述                          |
|:---------- |:---------------- |:----------------------------- |
| `sqrt(x)`  | `Mathf.Sqrt(x)`  | 返回 x 的平方根。             |
| `abs(x)`   | `Mathf.Abs(x)`   | 返回 x 的绝对值。             |
| `ceil(x)`  | `Mathf.Ceil(x)`  | 返回大于或等于 x 的最小整数。 |
| `floor(x)` | `Mathf.Floor(x)` | 返回小于或等于 x 的最大整数。 |
| `round(x)` | `Mathf.Round(x)` | 将 x 银行家舍入到最近的整数。 |
| `sign(x)`  | `Mathf.Sign(x)`  | 返回 x 的符号（±1.0）。       |

### 三角函数

| 函数          | Unity 代码          | 描述                                           |
|:------------- |:------------------- |:---------------------------------------------- |
| `deg(x)`      | `x * Mathf.Rad2Deg` | 从弧度制转换为角度制。                         |
| `rad(x)`      | `x * Mathf.Deg2Rad` | 从角度制转换为弧度制。                         |
| `sin(x)`      | `Mathf.Sin(x)`      | 返回给定弧度角 x 的正弦值。                    |
| `cos(x)`      | `Mathf.Cos(x)`      | 返回给定弧度角 x 的余弦值。                    |
| `tan(x)`      | `Mathf.Tan(x)`      | 返回给定弧度角 x 的正切值。                    |
| `asin(x)`     | `Mathf.Asin(x)`     | 返回 x 的反正弦值，以弧度表示。                |
| `acos(x)`     | `Mathf.Acos(x)`     | 返回 x 的反余弦值，以弧度表示。                |
| `atan(x)`     | `Mathf.Atan(x)`     | 返回 x 的反正切值，以弧度表示。                |
| `atan2(x, y)` | `Mathf.Atan2(x, y)` | 返回 v1=(0,1) 与 v2=(x,y) 的夹角，以弧度表示。 |

### 指数和对数函数

| 函数        | Unity 代码        | 描述                          |
|:----------- |:----------------- |:----------------------------- |
| `pow(x, y)` | `Mathf.Pow(x, y)` | 返回 x 的 y 次幂。            |
| `exp(x)`    | `Mathf.Exp(x)`    | 返回 e 的 x 次幂。            |
| `log(x, y)` | `Mathf.Log(x, y)` | 返回以 y 为底 x 的对数。      |
| `ln(x)`     | `Mathf.Log(x)`    | 返回 x 的自然对数（底数 e）。 |
| `log10(x)`  | `Mathf.Log10(x)`  | 返回 x 的以 10 为底的对数。   |

### 插值函数

| 函数                  | Unity 代码                     | 描述                                                      |
|:--------------------- |:------------------------------ |:--------------------------------------------------------- |
| `lerp(x, y, t)`       | `Mathf.Lerp(x, y, t)`          | 在 x 和 y 之间通过 t 进行线性插值。                       |
| `ulerp(x, y, t)`      | `Mathf.LerpUnclamped(x, y, t)` | 在 x 和 y 之间通过 t 进行线性插值，不对插值结果进行限制。 |
| `alerp(x, y, t)`      | `Mathf.LerpAngle(x, y, t)`     | 在角度 x 和 y 之间通过 t 进行插值。                       |
| `smoothstep(x, y, t)` | `Mathf.SmoothStep(x, y, t)`    | 在 x 和 y 之间在 t 处进行平滑插值。                       |

### 其他函数

| 函数                  | Unity 代码                       | 描述                                                        |
|:--------------------- |:-------------------------------- |:----------------------------------------------------------- |
| `min(x, y)`           | `Mathf.Min(x, y)`                | 返回两个值中较小的一个。                                    |
| `max(x, y)`           | `Mathf.Max(x, y)`                | 返回两个值中较大的一个。                                    |
| `noise(x, y)`         | `Mathf.PerlinNoise(x, y)`        | 为给定的坐标 x 和 y 生成 Perlin 噪声。                      |
| `clamp(x, min, max)`  | `Mathf.Clamp(x, min, max)`       | 将值 x 限制在 \[min, max\] 范围内。                         |
| `clamp01(x)`          | `Mathf.Clamp01(x)`               | 将值 x 限制在 \[0, 1\] 范围内。                             |
| `repeat(t, length)`   | `Mathf.Repeat(t, length)`        | 重复 t，使其永远不大于 length 且永远不小于 0。              |
| `pingpong(t, length)` | `Mathf.PingPong(t, length)`      | 对值 t 进行乒乓操作，使其永远不大于 length 且永远不小于 0。 |
| `ilerp(from, to, t)`  | `Mathf.InverseLerp(from, to, t)` | 计算产生范围 \[from, to\] 内插值值的线性参数 t。            |
| `rand(min, max)`      | `Random.Range(min, max)`         | 返回一个介于 min（含）和 max（含）之间的随机浮点数。        |

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'Hane', github: 'hanekit'},
  ],
}} />
