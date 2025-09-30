---
sidebar_position: 100
---

# Expresión Matemática

## Todas las funciones soportadas

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

## Tablas Detalladas

### Funciones Unarias

| Función    | Código Unity     | Descripción                                                  |
|:---------- |:---------------- |:------------------------------------------------------------ |
| `sqrt(x)`  | `Mathf.Sqrt(x)`  | Devuelve la raíz cuadrada de x.                              |
| `abs(x)`   | `Mathf.Abs(x)`   | Devuelve el valor absoluto de x.                             |
| `ceil(x)`  | `Mathf.Ceil(x)`  | Devuelve el entero más pequeño mayor o igual a x.           |
| `floor(x)` | `Mathf.Floor(x)` | Devuelve el entero más grande menor o igual a x.            |
| `round(x)` | `Mathf.Round(x)` | Redondea x al entero más cercano usando Redondeo Bancario.  |
| `sign(x)`  | `Mathf.Sign(x)`  | Devuelve el signo (±1.0) de x.                              |

### Funciones Trigonométricas

| Función       | Código Unity        | Descripción                                                     |
|:------------- |:------------------- |:--------------------------------------------------------------- |
| `deg(x)`      | `x * Mathf.Rad2Deg` | Convierte un ángulo de radianes a grados.                      |
| `rad(x)`      | `x * Mathf.Deg2Rad` | Convierte un ángulo de grados a radianes.                      |
| `sin(x)`      | `Mathf.Sin(x)`      | Devuelve el seno de un ángulo x dado en radianes.              |
| `cos(x)`      | `Mathf.Cos(x)`      | Devuelve el coseno de un ángulo x dado en radianes.            |
| `tan(x)`      | `Mathf.Tan(x)`      | Devuelve la tangente de un ángulo x dado en radianes.          |
| `asin(x)`     | `Mathf.Asin(x)`     | Devuelve el arco seno de x en radianes.                        |
| `acos(x)`     | `Mathf.Acos(x)`     | Devuelve el arco coseno de x en radianes.                      |
| `atan(x)`     | `Mathf.Atan(x)`     | Devuelve el arco tangente de x en radianes.                    |
| `atan2(x, y)` | `Mathf.Atan2(x, y)` | Devuelve el ángulo entre v1=(0,1) y v2=(x,y) en radianes.     |

### Funciones Exponenciales y Logarítmicas

| Función     | Código Unity      | Descripción                                      |
|:----------- |:----------------- |:------------------------------------------------ |
| `pow(x, y)` | `Mathf.Pow(x, y)` | Devuelve x elevado a la potencia de y.           |
| `exp(x)`    | `Mathf.Exp(x)`    | Devuelve e elevado a la potencia de x.           |
| `log(x, y)` | `Mathf.Log(x, y)` | Devuelve el logaritmo de x en base y.            |
| `ln(x)`     | `Mathf.Log(x)`    | Devuelve el logaritmo natural (base e) de x.     |
| `log10(x)`  | `Mathf.Log10(x)`  | Devuelve el logaritmo base 10 de x.              |

### Funciones de Interpolación

| Función               | Código Unity               | Descripción                                                                      |
|:--------------------- |:--------------------------- |:-------------------------------------------------------------------------------- |
| `lerp(x, y, t)`       | `Mathf.Lerp(x, y, t)`          | Interpola linealmente entre x e y por t.                                    |
| `ulerp(x, y, t)`      | `Mathf.LerpUnclamped(x, y, t)` | Interpola linealmente entre x e y por t sin limitar el interpolante.        |
| `alerp(x, y, t)`      | `Mathf.LerpAngle(x, y, t)`     | Interpola entre ángulos x e y por t.                                        |
| `smoothstep(x, y, t)` | `Mathf.SmoothStep(x, y, t)`    | Interpola suavemente entre x e y en t.                                      |


### Otras Funciones

| Función               | Código Unity                 | Descripción                                                                                                  |
|:--------------------- |:---------------------------- |:------------------------------------------------------------------------------------------------------------ |
| `min(x, y)`           | `Mathf.Min(x, y)`                | Devuelve el menor de dos valores.                                                                       |
| `max(x, y)`           | `Mathf.Max(x, y)`                | Devuelve el mayor de dos valores.                                                                       |
| `noise(x, y)`         | `Mathf.PerlinNoise(x, y)`        | Genera ruido Perlin para las coordenadas dadas x e y.                                               |
| `clamp(x, min, max)`  | `Mathf.Clamp(x, min, max)`       | Limita un valor x al rango \[min, max\].                                                            |
| `clamp01(x)`          | `Mathf.Clamp01(x)`               | Limita un valor x al rango \[0, 1\].                                                                |
| `repeat(t, length)`   | `Mathf.Repeat(t, length)`        | Repite t para que nunca sea mayor que length y nunca menor que 0.                                   |
| `pingpong(t, length)` | `Mathf.PingPong(t, length)`      | Hace ping-pong al valor t para que nunca sea mayor que length y nunca menor que 0.                  |
| `ilerp(from, to, t)`  | `Mathf.InverseLerp(from, to, t)` | Calcula el parámetro lineal t que produce el valor interpolante dentro del rango \[from, to\].      |
| `rand(min, max)`      | `Random.Range(min, max)`         | Devuelve un número flotante aleatorio entre min (inclusivo) y max (inclusivo).                      |

<AuthorBar authors={{
  creators: [
    {name: 'hanekit', github: 'hanekit'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
