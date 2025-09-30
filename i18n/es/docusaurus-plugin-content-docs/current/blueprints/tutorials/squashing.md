---
sidebar_position: 90
---

# Aplastando la Cabeza con Props

Ya que estamos [jugando con escalas de huesos](balloon), ¡vamos un paso más allá en este tutorial y aplastemos la cabeza del personaje hasta quedar plana!

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/squashing.mp4" /></div>
<p class="img-desc">Supongo que se puede decir que estoy... aplastado.</p>

## El Primer Intento

Empecemos con lo que nos es familiar: los clásicos nodos On Keystroke Pressed y Throw Prop At Character. (Por supuesto puedes reemplazar On Keystroke Pressed con cualquier nodo de evento que quieras, pero nos quedamos con él por simplicidad.) Nota que hemos establecido **Throw Prop At Character → From** a **Above Character Head** y la distancia a 5, así que el prop caerá desde arriba de la cabeza del personaje.

![](/doc-img/en-blueprint-squashing-1.png)

Igual que lo que hicimos en el último tutorial, podemos usar el nodo **Set Character Bone Scale** para escalar el hueso de la cabeza cuando el prop colisiona con el personaje, así:

![](/doc-img/en-blueprint-squashing-2.png)

Ahora cuando presionemos C, el prop cae desde arriba de la cabeza del personaje, y la cabeza del personaje se aplasta plana en la colisión.

También agregaremos un nodo **Set Character Bone Scale** separado que ayuda al hueso de la cabeza a regresar a su escala original:

![](/doc-img/en-blueprint-squashing-8.png)

¡Podemos hacer clic en la entrada de flujo Enter cada vez que queramos reiniciar la escala del hueso de la cabeza! (O si prefieres, puedes asignarle una tecla de acceso rápido.) Esto será bastante útil en las secciones de abajo cuando quieras reiniciar la escala de la cabeza.

## Multi Gate

Hasta ahora, sabemos cómo aplastar la cabeza del personaje y también resetearla. El problema es que queremos tener algo de progresión, es decir, la cabeza debería aplastarse más y más cada vez que presionamos C más y más veces. ¿Cómo hacemos eso?

¡El nodo **Multi Gate** puede ayudar! Diferente de todos los nodos que hemos visto antes, el nodo Multi Gate tiene un número variable de salidas de flujo, lo que significa que puedes tener tantas salidas de flujo como quieras. Configura el **Exit Count** a 4 como abajo, y verás 4 salidas de flujo desde Exit 1 hasta Exit 4:

![](/doc-img/en-blueprint-squashing-3.png)

Cada vez que el Multi Gate es activado, activará la **siguiente salida de flujo**. Por ejemplo, si el Multi Gate es activado por primera vez, activará Exit 1; si es activado por segunda vez, activará Exit 2; y así sucesivamente. Cuando el Multi Gate es activado por quinta vez, ya que no hay Exit 5, activará Exit 1 otra vez, y el ciclo se repite.

¡Eso es exactamente lo que necesitamos! Podemos resetear la escala del hueso de cabeza a 1 cuando el Multi Gate es activado por primera vez, y aplastar un poco cuando es activado por segunda vez, y aplastar un poco más cuando es activado por tercera vez, y así sucesivamente. Traducido a un blueprint, se ve así:

![](/doc-img/en-blueprint-squashing-4.png)

Empezamos con la escala normal (1, 1, 1), luego aplastada un poco (1.33, 0.83, 1.33), luego (1.66, 0.67, 1.66), luego (2, 0.5, 2). Nota que escalamos hacia arriba los ejes X y Z pero escalamos hacia abajo el eje Y, así la cabeza es aplastada; también puedes mantener X y Z en 1 y solo escalar hacia abajo Y, pero encuentro que se ve mejor cuando la cabeza es aplastada de esta manera.

¡Ahora ve y presiona C unas cuantas veces, y verás que la cabeza se aplasta más y más, mientras resetea cada 4 veces!

## Variables {#variables}

Podemos darlo por terminado, pero sabes que siempre queremos hacer las cosas más interesantes. ¿Qué si queremos aplastar la cabeza 10 veces? ¿O 100 veces? Crear 100 salidas de flujo y 100 nodos Set Character Bone Scale no es una buena idea; debe haber una manera mejor.

Ahí es cuando una **variable** ayuda. Una variable es una pieza de datos que puede ser cambiada y leída por nodos. En el blueprint de arriba, creamos 4 nodos Set Character Bone Scale, pero las configuraciones en cada nodo son esencialmente las mismas excepto la opción **Scale**. Esto significa que en lugar de crear muchos nodos, podemos solo crear un nodo, ¡y decirle a ese nodo que use un valor cambiante (es decir, una variable) como la escala!

Empecemos creando una variable. Ve a la pestaña **Properties** en el editor de nodos, y haz clic en el botón **+** para crear una variable. Configura su nombre a **BumpedTimes** y tipo a **Integer** (un integer es una manera elegante de decir "número entero", ya que no podemos aplastar la cabeza 1.5 veces o 2.3 veces):

![](/doc-img/en-blueprint-squashing-5.png)

Usamos el nodo **Integer Variable Add** justo después del nodo Throw Prop At Character para incrementar la variable por 1 cada vez que el prop colisiona con el personaje:

![](/doc-img/en-blueprint-squashing-6.png)

Regresa a Warudo y presiona C unas cuantas veces, y verás que la variable se incrementa por 1 cada vez que el prop colisiona con el personaje:

![](/doc-img/en-blueprint-squashing-7.png)

Para leer de esta variable, podemos usar el nodo **Get Integer Variable**. Reseteemos la variable **BumpedTimes** a 0 en la pestaña Properties, y agreguemos nodos Set Character Bone Scale, Get Integer Variable, y Scale Vector3 como abajo. Nota que **Scale Vector3 → Scale** está configurado a (1, 1, 1):

![](/doc-img/en-blueprint-squashing-9.png)

:::tip
Antes de seguir leyendo, ¿puedes adivinar qué hace el blueprint?
:::

¡Ahora si presionas C, el hueso de cabeza debería crecer más y más grande cada vez que el prop colisiona con el personaje! Esto tiene sentido, porque lo que estamos diciendo es: cada vez que un prop golpea, incrementamos BumpedTimes por 1, y luego configuramos la escala del hueso de cabeza a (1, 1, 1) multiplicado por BumpedTimes. Así, la primera vez que el prop golpea, BumpedTimes es 1, y la escala del hueso de cabeza es (1, 1, 1) × 1 = (1, 1, 1); la segunda vez que el prop golpea, BumpedTimes es 2, y la escala del hueso de cabeza es (1, 1, 1) × 2 = (2, 2, 2); y así sucesivamente.

¡Pero queremos aplastar la cabeza, no hacerla crecer como un globo! Ve y recrea el blueprint de abajo:

![](/doc-img/en-blueprint-squashing-10.png)

Resetea la variable BumpedTimes a 0 en la pestaña Properties, y presiona C unas cuantas veces. ¡Deberías ver que el hueso de cabeza se aplasta más y más! ¿Pero cómo funciona eso?

Un truco personal que uso cuando leo blueprints como este es seguir el flujo de los datos de derecha a izquierda. En este caso, empezamos con el nodo literal **Vector3** que outputearía nuestra escala final al nodo Set Character Bone Scale. Nota que los valores X y Z son proporcionados por el nodo **Float Addition** de arriba, y el valor Y es proporcionado por el nodo Float Addition de abajo. El path de arriba **Get Integer Variable → Float Multiplication → Float Addition** está esencialmente calculando (BumpedTimes × 0.1 + 1), mientras que el path de abajo está calculando (BumpedTimes × -0.1 + 1).

:::tip
Usamos los nodos Float Multiplication/Addition en lugar de Integer Multiplication/Addition porque el resultado final es un número decimal (float), no un número entero (integer).
:::

Calculemos manualmente la escala final para diferentes valores de BumpedTimes:

| BumpedTimes | X and Z | Y | Final Scale |
| BumpedTimes | X y Z | Y | Escala Final |
| ----------- | ------- | - | ----------- |
| 1 | 1 × 0.1 + 1 = 1.1 | 1 × -0.1 + 1 = 0.9 | (1.1, 0.9, 1.1) |
| 2 | 2 × 0.1 + 1 = 1.2 | 2 × -0.1 + 1 = 0.8 | (1.2, 0.8, 1.2) |
| 3 | 3 × 0.1 + 1 = 1.3 | 3 × -0.1 + 1 = 0.7 | (1.3, 0.7, 1.3) |
| 4 | 4 × 0.1 + 1 = 1.4 | 4 × -0.1 + 1 = 0.6 | (1.4, 0.6, 1.4) |

Estoy seguro de que puedes ver el patrón aquí: los valores X y Z están aumentando por 0.1 cada vez, mientras que el valor Y está disminuyendo por 0.1 cada vez. Esto es exactamente lo que queremos: ¡el hueso de cabeza se aplasta más y más cada vez que el prop golpea!

## Reseteando una Variable

Sin embargo, si presionas C unas cuantas veces más, eventualmente verás que el hueso de cabeza crece en la dirección opuesta, así:

![](/doc-img/en-blueprint-squashing-11.png)

¿Por qué? Bueno, continuemos nuestros cálculos de arriba:

| BumpedTimes | X y Z | Y | Escala Final |
| ----------- | ------- | - | ----------- |
| 8 | 8 × 0.1 + 1 = 1.8 | 8 × -0.1 + 1 = 0.2 | (1.8, 0.2, 1.8) |
| 9 | 9 × 0.1 + 1 = 1.9 | 9 × -0.1 + 1 = 0.1 | (1.9, 0.1, 1.9) |
| 10 | 10 × 0.1 + 1 = 2 | 10 × -0.1 + 1 = 0 | (2, 0, 2) |
| 11 | 11 × 0.1 + 1 = 2.1 | 11 × -0.1 + 1 = -0.1 | (2.1, -0.1, 2.1) |
| 12 | 12 × 0.1 + 1 = 2.2 | 12 × -0.1 + 1 = -0.2 | (2.2, -0.2, 2.2) |

¡El valor Y se está volviendo negativo, lo que significa que el hueso de cabeza crece hacia abajo! Esto no es lo que queremos. Reseteemos la escala del hueso de cabeza a (1, 1, 1) cuando BumpedTimes sea 10; esa es la más plana que podemos obtener sin que la cabeza crezca hacia abajo. Afortunadamente, ya sabemos cómo hacer esto: ¡usando el nodo If Branch que aprendimos en el tutorial de [dance](dance#if-branch)!

![](/doc-img/en-blueprint-squashing-12.png)

Los nodos recién agregados son bastante simples: verificamos si BumpedTimes es mayor o igual a 10, y si es así, lo reseteamos a 0, y reseteamos la escala del hueso de cabeza de vuelta a 1.

:::tip
Usamos el nodo **Integer Greater Than Or Equal** aquí, pero también puedes usar el nodo **Integer Equal** para verificar si BumpedTimes es igual a 10. La diferencia es que el primero activará la salida de flujo If True cuando BumpedTimes sea 10, 11, 12, etc., mientras que el último solo activará la salida de flujo If True cuando BumpedTimes sea exactamente 10. Usualmente usamos el primero porque es más flexible (imagina que de alguna manera BumpedTimes se vuelve 11 por error, entonces nunca podremos resetearlo de vuelta a 0).
:::

El blueprint final se ve así (¡bastante grande!):

![](/doc-img/en-blueprint-squashing-13.png)

¡Felicidades! Esas son las variables de blueprint para ti. Este es un tutorial más desafiante que los anteriores, ¡así que felicidades por llegar tan lejos!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
