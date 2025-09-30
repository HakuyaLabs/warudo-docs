---
sidebar_position: 30
---

# Cola

¡Menea tu cola! El asset de cola anima los huesos de la cola en tu personaje. También puede usarse para animar huesos jerárquicos en cualquier personaje o [prop](prop).

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '53.2%'}} className="video-box"><video controls loop src="/doc-img/en-tail-1.mp4" />
<p>Una cola meciéndose.</p>
</div>

<div style={{width: '46.8%'}} className="video-box"><video controls loop src="/doc-img/zh-tail-2.mp4" />
<p>También puedes aplicar este asset a cualquier hueso jerárquico, como orejas de animal.</p>
</div>
</div>

## Configuración {#setup}

Para configurar una cola, simplemente selecciona un **Parent Asset** al que pertenece la cola. Luego, usa la lista desplegable **Path** para seleccionar el hueso raíz de la cola.

:::info
Para mejores resultados, la cola debería contener al menos 4 huesos.
:::

Si una cola se está moviendo de una manera inesperada, usa el botón **Reset Tail** para restablecer la cola a su estado predeterminado.

## Mecerse

La función de mecerse permite que la cola se mueva por sí sola. Puedes personalizar la **Waving Speed** y **Waving Range** para hacer que la cola se mueva más rápido o más lento, y en mayor o menor grado.

## Física

Configuraciones avanzadas de física para la cola.

* **Slithery**: 0 es más como una rama meciéndose en el viento, 1 es más adecuado para la cola/tentáculo de un animal.
* **Curling**: Flexibilidad de cada articulación.
* **Springiness**: Mientras más alto el valor, más elástica es la cola.
* **Reaction Speed**: Mientras más bajo el valor, más resistencia hay al movimiento, como estar en el agua.
* **Rotation Relevancy**: Mientras más bajo el valor, más lenta se siente la cola, y más lento regresa a su posición original.
* **Gravity**: Fuerza aplicada a la cola.

## Detección de Colisión

La detección de colisión previene que la cola pase a través de otros modelos en la escena. Actualmente, solo se soporta la detección de colisión con personajes. Debes ajustar el **Collider Radius** para que la cola no colisione con el cuerpo del personaje mientras no se queda muy lejos de él.

## Cinemática Inversa

La Cinemática Inversa (IK) hace que la cola siga un **IK Target** designado en la escena. **Angle Limit** es el ángulo máximo de curvatura de cada articulación en la cola. Si la cola no puede alcanzar el objetivo IK, podrías necesitar aumentar este valor.

## Forma Adicional

Parámetros adicionales de forma para la cola.

* **Rotation Offset**: Ángulo de desplazamiento de la rotación de la cola.
* **Curving**: Flexibilidad adicional de cada articulación en la cola.
* **Length Multiplier**: Permite que la cola se estire y se encoja.

:::tip
**Rotation Offset** es útil para hacer que la cola apunte más hacia arriba o hacia abajo, especialmente cuando el modelo está sentado. **Curving** se usa frecuentemente para hacer la cola más redonda o puntiaguda.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
