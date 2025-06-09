---
sidebar_position: 20
---

# Personalizando el Seguimiento Facial

## Personalización de Blueprint

Durante el proceso de incorporación, puedes hacer clic en **Customize Face Tracking...** para personalizar el blueprint de seguimiento.

![](/doc-img/en-mocap-3.png)
<p class="img-desc">Personalizando el seguimiento facial.</p>

Las siguientes opciones están disponibles:

* **BlendShape Mapping:** Selecciona el mapeo de blendshape que coincida con tu modelo. Por ejemplo, si tu modelo tiene blendshapes "Perfect Sync"/ARKit, selecciona **ARKit**; si tu modelo está convertido de un modelo MMD, selecciona **MikuMikuDance**; de lo contrario, selecciona **VRM**. Por defecto, Warudo intentará detectar automáticamente el mapeo de blendshape, pero puedes anularlo aquí.
* **Enable Head and Body Movements:** Si está habilitado, Warudo moverá la cabeza y el cuerpo de tu personaje según los datos de seguimiento. Si está deshabilitado, solo la cara (blendshapes y huesos de ojos) será animada. Esto se establece automáticamente en **No** por el asistente de incorporación si usas un sistema de seguimiento de pose de cuerpo completo que ya rastrea la cabeza y el cuerpo.
* **Idle Head Animation (Auto Blinking / Auto Eye Movements / Auto Head Movements):** Si está habilitado, Warudo agregará movimiento sutil de cabeza, movimiento de ojos y parpadeo a tu personaje.
* **Look At:** Si está habilitado, tu personaje mirará a un objetivo (por defecto la cámara) cuando mires hacia adelante. Esto ayuda a tu personaje / a ti a mantener contacto visual con la audiencia independientemente de la posición de la cámara, mientras aún permite que tu personaje / tú mires libremente alrededor.
* **Lip Sync**: Si está habilitado, Warudo animará la boca de tu personaje basándose en tu habla. Puedes elegir habilitar lip sync solo cuando el seguimiento se pierda, o habilitarlo siempre.

:::info
Estas opciones arriba afectan el blueprint generado; por lo tanto, para cambiar estas opciones después de la configuración, necesitas volver a ejecutar la configuración, o modificar manualmente el blueprint de seguimiento facial. **Character → Motion Capture → Blueprint Navigation** proporciona atajos a las partes específicas del blueprint que podrías querer modificar:

![](/doc-img/en-mocap-6.png)
:::

## Personalización del Tracker

Después de la incorporación, puedes ir al asset de seguimiento facial correspondiente (p. ej., iFacialMocap Receiver, MediaPipe Tracker) para personalizar los datos de seguimiento en sí. Las siguientes opciones están disponibles:

* **Mirrored Tracking:** Si está habilitado, Warudo reflejará los datos de seguimiento.
* **[BlendShape](../tutorials/3d-primer#blendshape) Sensitivity:** Ajusta la sensibilidad de las expresiones faciales del personaje. Si tus expresiones son demasiado sutiles, aumenta la sensibilidad; si tus expresiones son demasiado exageradas, disminuye la sensibilidad.
* **Configure BlendShapes Mapping:** Ajusta el umbral y sensibilidad de cada blendshape individual. Esto es útil si quieres deshabilitar ciertos blendshapes, o si quieres ajustar la sensibilidad de cada blendshape individualmente.
  ![](/doc-img/en-mocap-5.png)
  Los dos valores de la izquierda son el rango del valor de blendshape de entrada del tracker, y los dos valores de la derecha son el rango del valor de blendshape de salida al personaje. Por ejemplo, si el rango de entrada es 0-1 y el rango de salida es 0-2, entonces cuando el valor de blendshape de entrada sea 0.40, el valor de blendshape de salida será 0.80.
    - Para deshabilitar un blendshape, establece el valor superior derecho en 0.
    - Para hacer un blendshape más sensible, aumenta el valor superior derecho; para hacer un blendshape menos sensible, disminuye el valor superior derecho.
    - Para activar un blendshape en un umbral más alto (p. ej., la boca de tu personaje ya está ligeramente abierta pero tu boca aún está cerrada), aumenta el valor inferior derecho. Para activar un blendshape en un umbral más bajo, disminuye el valor inferior derecho.
* **Head Movement/Rotation Intensity:** Ajusta la intensidad del movimiento/rotación de cabeza.
* **Body Movement Intensity:** Ajusta la intensidad del movimiento automático del cuerpo debido al movimiento de cabeza.
* **Body Rotation Type:** Hace que el cuerpo rote naturalmente cuando la cabeza rota.
  Cuando se establece en None, el cuerpo no rotará cuando la cabeza rote.
  Cuando se establece en Normal, el cuerpo rota en la misma dirección que la cabeza.
  Cuando se establece en Inverted, el cuerpo rota en la misma dirección que la cabeza en los ejes X e Y, pero en la dirección opuesta en el eje Z.
  También puedes establecer **Body Rotation Type** en Custom, lo que te permite personalizar tanto la dirección como la magnitud de cada eje de rotación.
* **Eye Movement Intensity:** Ajusta la intensidad del movimiento de pupilas.
* **Eye Blink Sensitivity:** Ajusta la sensibilidad del parpadeo; esto es un atajo para ajustar la sensibilidad del blendshape de parpadeo en **Configure BlendShapes Mapping**.
* **Linked Eye Blinking:** Si está habilitado, fuerza ambos ojos a parpadear al mismo tiempo. Útil si tu seguimiento no es lo suficientemente preciso para parpadear cada ojo individualmente.
* **Use Bones/BlendShapes for Eye Movement:** Si usar huesos de ojos o blendshapes para el movimiento de ojos. Si tu modelo tiene huesos de ojos, se recomienda usar huesos de ojos, ya que son más precisos y permiten [IK](../tutorials/3d-primer#IK). Hay dos casos donde podrías querer habilitar **Use BlendShapes For Eye Movement**:
    - Tu modelo no tiene huesos de ojos.
    - Los blendshapes de ojos de tu modelo son complementarios a los huesos de ojos, es decir, los blendshapes de ojos cambian la forma de los ojos, además de que los huesos de ojos mueven las pupilas. (Tu modelador debería poder decirte si este es el caso.)

## Preguntas Frecuentes {#FAQ}

### Cuando muevo mi cabeza, el cuerpo de mi personaje también se mueve. ¿Cómo deshabilito esto?

Esto es causado por la opción **Body Movement Intensity** en el asset receptor de captura de movimiento. Establécelo en 0 para deshabilitar el movimiento corporal.

### ¿Cómo habilito lip sync?

Durante el proceso de incorporación, puedes habilitar lip sync haciendo clic en **Customize Face Tracking...** y habilitando **Lip Sync**.

Puedes ajustar las configuraciones de lip sync después de la incorporación haciendo clic en **Character → Motion Capture → Blueprint Navigation → Lip Sync Settings**.

### La boca de mi modelo está ligeramente abierta incluso cuando mi boca está cerrada.

Esto usualmente es causado por aplicar seguimiento ARKit en un modelo no compatible con ARKit. Para arreglar esto, puedes:

* Agregar blendshapes ["Perfect Sync" / ARKit](../tutorials/3d-primer#arkit) a tu modelo. Esto se recomienda ya que el seguimiento facial basado en ARKit es mucho más expresivo, y ya tienes los datos de seguimiento.
* Hacer clic en **Configure BlendShapes Mapping** en el asset tracker, y aumentar el umbral (es decir, establecer el valor inferior derecho a un número negativo como `-0.25`) de los blendshapes de boca ARKit `jawOpen`, `mouthFunnel`, `mouthPucker`.

### Mi cuerpo rota en la dirección opuesta cuando giro mi cabeza.

Por defecto, **Body Rotation Type** está establecido en Inverted para imitar modelos Live2D y lograr una apariencia más anime. Si quieres deshabilitar esto, establece **Body Rotation Type** en Normal o None.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (h.o.r.o)', github: 'Arukaito'},
  ],
}} />
