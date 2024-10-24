---
sidebar_position: 100
---

# 수학 표현식

## 지원되는 함수

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

## 세부 테이블

### 단항 함수

| 함수       | 유니티 코드      | 설명                                              |
|:---------- |:---------------- |:------------------------------------------------- |
| `sqrt(x)`  | `Mathf.Sqrt(x)`  | x의 제곱근을 계산해 줍니다.                       |
| `abs(x)`   | `Mathf.Abs(x)`   | x의 절대값을 계산해 줍니다.                       |
| `ceil(x)`  | `Mathf.Ceil(x)`  | x보다 크거나 같은 가장 가까운 정수를 찾아 줍니다. |
| `floor(x)` | `Mathf.Floor(x)` | x보다 작거나 같은 가장 가까운 정수를 찾아 줍니다. |
| `round(x)` | `Mathf.Round(x)` | x를 가장 가까운 정수로 반올림해 줍니다.           |
| `sign(x)`  | `Mathf.Sign(x)`  | x가 양수면 1, 음수면 -1을 알려 줍니다.            |

### 삼각 함수

| 함수          | 유니티 코드         | 설명                                                                   |
|:------------- |:------------------- |:---------------------------------------------------------------------- |
| `deg(x)`      | `x * Mathf.Rad2Deg` | 라디안 단위의 각도를 도(degree) 단위로 바꿔줍니다.                     |
| `rad(x)`      | `x * Mathf.Deg2Rad` | 도(degree) 단위의 각도를 라디안 단위로 바꿔줍니다.                     |
| `sin(x)`      | `Mathf.Sin(x)`      | 각도 x(라디안 단위)의 사인(sine) 값을 계산해 줍니다.                   |
| `cos(x)`      | `Mathf.Cos(x)`      | 각도 x(라디안 단위)의 코사인(cosine) 값을 계산해 줍니다.               |
| `tan(x)`      | `Mathf.Tan(x)`      | 각도 x(라디안 단위)의 탄젠트(tangent) 값을 계산해 줍니다.              |
| `asin(x)`     | `Mathf.Asin(x)`     | x의 역사인(arc sine) 값을 라디안 단위로 계산해 줍니다.                 |
| `acos(x)`     | `Mathf.Acos(x)`     | x의 역코사인(arc cosine) 값을 라디안 단위로 계산해 줍니다.             |
| `atan(x)`     | `Mathf.Atan(x)`     | x의 역탄젠트(arc tangent) 값을 라디안 단위로 계산해 줍니다.            |
| `atan2(x, y)` | `Mathf.Atan2(x, y)` | v1=(0,1)과 v2=(x,y) 두 벡터 사이의 각도를 라디안 단위로 계산해 줍니다. |

### 지수 및 로그 함수

| 함수        | 유니티 코드       | 설명                                               |
|:----------- |:----------------- |:-------------------------------------------------- |
| `pow(x, y)` | `Mathf.Pow(x, y)` | x를 y 제곱한 값을 계산해 줍니다.                   |
| `exp(x)`    | `Mathf.Exp(x)`    | e(자연 상수)를 x 제곱한 값을 계산해 줍니다.        |
| `log(x, y)` | `Mathf.Log(x, y)` | x의 y를 밑(base)으로 하는 로그 값을 계산해 줍니다. |
| `ln(x)`     | `Mathf.Log(x)`    | x의 자연 로그(밑이 e인 로그) 값을 계산해 줍니다.   |
| `log10(x)`  | `Mathf.Log10(x)`  | x의 밑이 10인 로그 값을 계산해 줍니다.             |

### 보간 함수

| 함수                  | 유니티 코드                    | 설명                                                          |
|:--------------------- |:------------------------------ |:------------------------------------------------------------- |
| `lerp(x, y, t)`       | `Mathf.Lerp(x, y, t)`          | t에 따라 x와 y 사이를 선형으로 보간(중간 값을 계산)해 줍니다. |
| `ulerp(x, y, t)`      | `Mathf.LerpUnclamped(x, y, t)` | t에 따라 x와 y 사이를 제한 없이 선형으로 보간해 줍니다.       |
| `alerp(x, y, t)`      | `Mathf.LerpAngle(x, y, t)`     | 각도 x와 y 사이를 t에 따라 보간해 줍니다.                     |
| `smoothstep(x, y, t)` | `Mathf.SmoothStep(x, y, t)`    | t에 따라 x와 y 사이를 부드럽게 보간해 줍니다.                 |

### 그 외 함수

| 함수                  | 유니티 코드                      | 설명                                                           |
|:--------------------- |:-------------------------------- |:-------------------------------------------------------------- |
| `min(x, y)`           | `Mathf.Min(x, y)`                | 두 값 중에서 더 작은 값을 골라 줍니다.                         |
| `max(x, y)`           | `Mathf.Max(x, y)`                | 두 값 중에서 더 큰 값을 골라 줍니다.                           |
| `noise(x, y)`         | `Mathf.PerlinNoise(x, y)`        | 주어진 좌표 x와 y에서 페를린 노이즈라는 값을 만들어 줍니다.    |
| `clamp(x, min, max)`  | `Mathf.Clamp(x, min, max)`       | x가 min보다 작지 않고 max보다 크지 않게 범위 안에 맞춰 줍니다. |
| `clamp01(x)`          | `Mathf.Clamp01(x)`               | x가 0보다 작지 않고 1보다 크지 않게 맞춰 줍니다.               |
| `repeat(t, length)`   | `Mathf.Repeat(t, length)`        | t가 0에서 length 사이에서 계속 반복되도록 해줍니다.            |
| `pingpong(t, length)` | `Mathf.PingPong(t, length)`      | t가 0과 length 사이에서 왔다 갔다 반복되도록 해줍니다.         |
| `ilerp(from, to, t)`  | `Mathf.InverseLerp(from, to, t)` | from과 to 사이에서 t가 어느 위치에 있는지 계산해 줍니다.       |
| `rand(min, max)`      | `Random.Range(min, max)`         | min과 max 사이의 무작위 숫자를 골라 줍니다. (실수)             |

<AuthorBar authors={{
  creators: [
    {name: 'hanekit', github: 'hanekit'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
