---
sidebar_position: 100
translate_from_version: 2024-10-23
---

# 数式

## 対応しているすべての関数

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

## 詳細表

### 単項関数

| 関数        | Unityコード       | 説明                                                   |
|:---------- |:---------------- |:----------------------------------------------------- |
| `sqrt(x)`  | `Mathf.Sqrt(x)`  | xの平方根を返します。                                   |
| `abs(x)`   | `Mathf.Abs(x)`   | xの絶対値を返します。                                   |
| `ceil(x)`  | `Mathf.Ceil(x)`  | x以上の最小の整数を返します。                            |
| `floor(x)` | `Mathf.Floor(x)` | x以下の最大の整数を返します。                            |
| `round(x)` | `Mathf.Round(x)` | 銀行丸めによりxを最も近い整数に丸めます。                 |
| `sign(x)`  | `Mathf.Sign(x)`  | xの符号（±1.0）を返します。                              |

### 三角関数

| 関数          | Unityコード          | 説明                                                        |
|:------------- |:------------------- |:---------------------------------------------------------- |
| `deg(x)`      | `x * Mathf.Rad2Deg` | 角度をラジアンから度へ変換します。                            |
| `rad(x)`      | `x * Mathf.Deg2Rad` | 角度を度からラジアンへ変換します。                            |
| `sin(x)`      | `Mathf.Sin(x)`      | ラジアンで指定された角度xの正弦を返します。                   |
| `cos(x)`      | `Mathf.Cos(x)`      | ラジアンで指定された角度xの余弦を返します。                   |
| `tan(x)`      | `Mathf.Tan(x)`      | ラジアンで指定された角度xの正接を返します。                   |
| `asin(x)`     | `Mathf.Asin(x)`     | xの逆正弦をラジアンで返します。                               |
| `acos(x)`     | `Mathf.Acos(x)`     | xの逆余弦をラジアンで返します。                               |
| `atan(x)`     | `Mathf.Atan(x)`     | xの逆正接をラジアンで返します。                               |
| `atan2(x, y)` | `Mathf.Atan2(x, y)` | v1=(0,1)とv2=(x,y)の間の角度をラジアンで返します。              |

### 指数関数と対数関数

| 関数        | Unityコード        | 説明                                      |
|:----------- |:----------------- |:---------------------------------------- |
| `pow(x, y)` | `Mathf.Pow(x, y)` | xのy乗を返します。                         |
| `exp(x)`    | `Mathf.Exp(x)`    | eのx乗を返します。                         |
| `log(x, y)` | `Mathf.Log(x, y)` | yを底とするxの対数を返します。               |
| `ln(x)`     | `Mathf.Log(x)`    | xの自然対数（底e）を返します。               |
| `log10(x)`  | `Mathf.Log10(x)`  | xの常用対数（底10）を返します。              |

### 補間関数

| 関数                    | Unityコード                     | 説明                                                    |
|:----------------------- |:------------------------------ |:------------------------------------------------------ |
| `lerp(x, y, t)`       | `Mathf.Lerp(x, y, t)`          | tによりxとyの間を線形補間します。                         |
| `ulerp(x, y, t)`      | `Mathf.LerpUnclamped(x, y, t)` | 補間係数をクランプせずに、tによりxとyの間を線形補間します。  |
| `alerp(x, y, t)`      | `Mathf.LerpAngle(x, y, t)`     | tにより角度xとyの間を補間します。                        |
| `smoothstep(x, y, t)` | `Mathf.SmoothStep(x, y, t)`    | tにおいてxとyの間を滑らかに補間します。                  |


### その他の関数

| 関数                    | Unityコード                       | 説明                                                                 |
|:----------------------- |:-------------------------------- |:------------------------------------------------------------------- |
| `min(x, y)`           | `Mathf.Min(x, y)`                | 2つの値のうち小さい方を返します。                                      |
| `max(x, y)`           | `Mathf.Max(x, y)`                | 2つの値のうち大きい方を返します。                                      |
| `noise(x, y)`         | `Mathf.PerlinNoise(x, y)`        | 指定された座標xとyに対するパーリンノイズを生成します。                   |
| `clamp(x, min, max)`  | `Mathf.Clamp(x, min, max)`       | 値xを範囲\[min, max\]にクランプします。                                |
| `clamp01(x)`          | `Mathf.Clamp01(x)`               | 値xを範囲\[0, 1\]にクランプします。                                    |
| `repeat(t, length)`   | `Mathf.Repeat(t, length)`        | 値tを0以上length未満の範囲で繰り返します。                                  |
| `pingpong(t, length)` | `Mathf.PingPong(t, length)`      | 値tを0とlengthの間で往復させます。                                          |
| `ilerp(from, to, t)`  | `Mathf.InverseLerp(from, to, t)` | 値tがfromからtoの間のどの位置にあるかを0から1の範囲で返します。             |
| `rand(min, max)`      | `Random.Range(min, max)`         | min（含む）からmax（含む）までのランダムなfloat値を返します。               |

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
