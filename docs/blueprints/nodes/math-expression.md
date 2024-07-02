---
sidebar_position: 100
---

# Math Expression

## All supported functions

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
randint => Random.Range(int, int)
```

## Detail Tables

### Unary Functions

| Function   | Unity Code       | Description                                              |
|:---------- |:---------------- |:-------------------------------------------------------- |
| `sqrt(x)`  | `Mathf.Sqrt(x)`  | Returns the square root of x.                            |
| `abs(x)`   | `Mathf.Abs(x)`   | Returns the absolute value of x.                         |
| `ceil(x)`  | `Mathf.Ceil(x)`  | Returns the smallest integer greater than or equal to x. |
| `floor(x)` | `Mathf.Floor(x)` | Returns the largest integer less than or equal to x.     |
| `round(x)` | `Mathf.Round(x)` | Rounds x to the nearest integer by Banker's Rounding.    |
| `sign(x)`  | `Mathf.Sign(x)`  | Returns the sign (±1.0) of x.                            |

### Trigonometric Functions

| Function      | Unity Code          | Description                                                 |
|:------------- |:------------------- |:----------------------------------------------------------- |
| `deg(x)`      | `x * Mathf.Rad2Deg` | Converts an angle from radians to degrees.                  |
| `rad(x)`      | `x * Mathf.Deg2Rad` | Converts an angle from degrees to radians.                  |
| `sin(x)`      | `Mathf.Sin(x)`      | Returns the sine of an angle x given in radians.            |
| `cos(x)`      | `Mathf.Cos(x)`      | Returns the cosine of an angle x given in radians.          |
| `tan(x)`      | `Mathf.Tan(x)`      | Returns the tangent of an angle x given in radians.         |
| `asin(x)`     | `Mathf.Asin(x)`     | Returns the arc sine of x in radians.                       |
| `acos(x)`     | `Mathf.Acos(x)`     | Returns the arc cosine of x in radians.                     |
| `atan(x)`     | `Mathf.Atan(x)`     | Returns the arc tangent of x in radians.                    |
| `atan2(x, y)` | `Mathf.Atan2(x, y)` | Returns the angle between v1=(0,1) and v2=(x,y) in radians. |

### Exponential and Logarithmic Functions

| Function    | Unity Code        | Description                                  |
|:----------- |:----------------- |:-------------------------------------------- |
| `pow(x, y)` | `Mathf.Pow(x, y)` | Returns x raised to the power of y.          |
| `exp(x)`    | `Mathf.Exp(x)`    | Returns e raised to the power of x.          |
| `log(x, y)` | `Mathf.Log(x, y)` | Returns the logarithm of x in base y.        |
| `ln(x)`     | `Mathf.Log(x)`    | Returns the natural logarithm (base e) of x. |
| `log10(x)`  | `Mathf.Log10(x)`  | Returns the base 10 logarithm of x.          |

### Interpolation Functions

| Function              | Unity Code                     | Description                                                                  |
|:--------------------- |:------------------------------ |:---------------------------------------------------------------------------- |
| `lerp(x, y, t)`       | `Mathf.Lerp(x, y, t)`          | Linearly interpolates between x and y by t.                                  |
| `ulerp(x, y, t)`      | `Mathf.LerpUnclamped(x, y, t)` | Linearly interpolates between x and y by t without clamping the interpolant. |
| `alerp(x, y, t)`      | `Mathf.LerpAngle(x, y, t)`     | Interpolates between angles x and y by t.                                    |
| `smoothstep(x, y, t)` | `Mathf.SmoothStep(x, y, t)`    | Interpolates smoothly between x and y at t.                                  |


### Other Functions

| Function              | Unity Code                       | Description                                                                                          |
|:--------------------- |:-------------------------------- |:---------------------------------------------------------------------------------------------------- |
| `min(x, y)`           | `Mathf.Min(x, y)`                | Returns the smaller of two values.                                                                   |
| `max(x, y)`           | `Mathf.Max(x, y)`                | Returns the larger of two values.                                                                    |
| `noise(x, y)`         | `Mathf.PerlinNoise(x, y)`        | Generates Perlin noise for given coordinates x and y.                                                |
| `clamp(x, min, max)`  | `Mathf.Clamp(x, min, max)`       | Clamps a value x to the range \[min, max\].                                                          |
| `clamp01(x)`          | `Mathf.Clamp01(x)`               | Clamps a value x to the range \[0, 1\].                                                              |
| `repeat(t, length)`   | `Mathf.Repeat(t, length)`        | Repeats t so that it's never larger than length and never smaller than 0.                            |
| `pingpong(t, length)` | `Mathf.PingPong(t, length)`      | Ping-pongs the value t so it's never larger than length and never less than 0.                       |
| `ilerp(from, to, t)`  | `Mathf.InverseLerp(from, to, t)` | Calculates the linear parameter t that produces the interpolant value within the range \[from, to\]. |
| `rand(min, max)`      | `Random.Range(min, max)`         | Returns a random float number between min (inclusive) and max (inclusive).                           |
| `randint(min, max)`   | `Random.Range(min, max)`         | Returns a random integer number between min (inclusive) and max (exclusive).                         |

<AuthorBar authors={{
  creators: [
    {name: 'hanekit', github: 'hanekit'},
  ],
  translators: [
  ],
}} />
