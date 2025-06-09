---
sidebar_position: 10
---

# Personaje

Los personajes son el núcleo de Warudo. Warudo soporta el formato de modelo estándar [VRM](https://vrm.dev/en/univrm/). Si el formato de tu modelo no es VRM (por ejemplo, es un modelo MMD o VRChat), puedes usar el [Mod SDK](../modding/mod-sdk.md) para exportarlo a formato `.warudo` y cargarlo en Warudo.

Los archivos de personajes deben colocarse en la subcarpeta `Characters` de la carpeta de datos de Warudo.

:::info
¿No puedes encontrar la carpeta de datos? Haz clic en **Menu → Open Data Folder** para abrirla.
:::

## Configuración

Por defecto, tu escena ya debería tener un personaje. Para agregar un nuevo personaje, usa el menú **Add Asset**.

Recomendamos usar **Onboarding Assistant → Basic Setup → Get Started** para configurar tu personaje. Esto importará automáticamente tu archivo de personaje, configurará la captura de movimiento e importará las expresiones VRM.

Alternativamente, puedes configurar manualmente tu personaje seleccionando un **Source** en el asset del personaje, configurando la captura de movimiento haciendo clic en **Setup Motion Capture**, e importando expresiones VRM haciendo clic en **Import VRM Expressions**.

## Captura de Movimiento {#mocap}

Para configurar la captura de movimiento para tu personaje, por favor consulta la página de [Captura de Movimiento](../mocap/overview#setup). Una vez que hayas configurado la captura de movimiento, puedes calibrar el seguimiento y acceder a partes específicas de los blueprints de seguimiento directamente en el asset del personaje.

![](/doc-img/en-character-1.png)
<p class="img-desc">Paneles de calibración rápida y navegación de blueprint.</p>

## Expresiones {#expressions}

Las expresiones son una forma de controlar las expresiones faciales del personaje además de tu seguimiento facial. El asset del personaje soporta tanto expresiones VRM (también conocidas como [VRM BlendShapeClips](https://vrm.dev/en/univrm/blendshape/univrm_blendshape/)) como expresiones personalizadas.

Durante la incorporación, Warudo importará automáticamente todas las expresiones VRM en tu personaje, y generará un blueprint para agregar hotkeys para ellas. También puedes importar expresiones VRM manualmente haciendo clic en **Import VRM Expressions**, y generar un blueprint para vinculación de teclas haciendo clic en **Generate Key Binding Blueprint**.

:::tip
Si estás usando un modelo `.warudo`, pero hay un componente `VRMBlendShapeProxy` en el GameObject, entonces Warudo aún podrá importar las expresiones VRM.
:::

Puedes expandir cada expresión en la lista de expresiones para previsualizarla (**Enter Expression**) y personalizar sus configuraciones.

![](/doc-img/en-character-2.png)
<p class="img-desc">Expandir una expresión.</p>

Puedes establecer el **Name** de la expresión, que se usa para identificación en el blueprint. También puedes establecer el **Layer** de la expresión. Al cambiar expresiones, las expresiones en la misma capa se desvanecerán, mientras que las expresiones en capas diferentes pueden superponerse.

:::info
Al importar expresiones VRM, los BlendShapeClips predeterminados (i.e. Joy, Angry, Sorrow, Fun/Surprised) en el modelo VRM se colocarán en la capa 0, mientras que los BlendShapeClips agregados por el modelador se colocarán en la capa 1, 2, 3, etc.
:::

Si una expresión ya cierra los ojos de tu modelo, puedes querer **Disable Eye Blink Tracking** para evitar que los ojos se cierren más. Similarmente, las opciones **Disable Mouth Tracking** y **Disable Brow Tracking** pueden usarse para evitar que los blendshapes de la boca y las cejas sean controlados por el seguimiento facial.

La lista **Target BlendShapes** contiene todos los blendshapes que serán controlados cuando esta expresión esté activa. Puedes agregar o eliminar blendshapes de esta lista, y personalizar el **Target Value**, **Enter Duration**, **Enter Easing**, **Enter Delay**, **Exit Duration**, **Exit Easing**, y **Exit Delay** para cada blendshape.

Por defecto, Warudo usa una duración de desvanecimiento de entrada y salida de 0.4s al cambiar expresiones. Puedes personalizar el **Enter Duration** y **Exit Duration** para cada blendshape en **Target BlendShapes**; alternativamente, si quieres deshabilitar el desvanecimiento por completo, puedes habilitar la opción **Is Binary**.

### Condiciones de Activación {#trigger-conditions}

¡Las expresiones usualmente se activan por teclas de acceso rápido, pero también puedes activar una expresión usando solo seguimiento facial!

Para configurar, agrega una nueva entrada a la lista **Trigger Conditions**. Configura las **Conditions** para tu activador de expresión, y personaliza otras opciones según sea necesario. Por ejemplo, las configuraciones siguientes activarán la expresión cuando los blendshapes `mouthSmileLeft` y `mouthSmileRight` sean ambos mayores que 0.5.

![](/doc-img/en-character-4.png)

Puedes tener más de una entrada en la lista **Trigger Conditions**, y cuando cualquiera de las **Conditions** en una entrada se cumplan, la expresión será activada.

:::info
Ten en cuenta que las condiciones se basan en blendshapes del modelo, no en blendshapes de seguimiento facial. Si estás usando un modelo compatible con ARKit, simplemente puedes seleccionar los blendshapes de ARKit como las condiciones. De otra manera, es posible que necesites encontrar los blendshapes del modelo correspondientes que tu seguimiento facial usa.
:::

### Avanzado

La lista **Target Material Properties** contiene las propiedades de material de Unity controladas por esta expresión. Ten en cuenta que necesitas conocer el nombre del material y el nombre de la propiedad de antemano; puedes inspeccionarlos en Unity.

La lista **Constrained BlendShapes** contiene todos los blendshapes que serán restringidos cuando esta expresión esté activa. Restringir blendshapes te permite controlar con precisión las expresiones faciales de tu personaje, asegurando que la transición entre blendshapes sea siempre suave. Por ejemplo, si quieres asegurarte de que la boca de tu modelo no se abra más de una cierta cantidad cuando la expresión esté activa, puedes agregar una nueva entrada a esta lista, establecer el **Constrained BlendShape** al blendshape de la boca (ej., `JawOpen`), y establecer el **Constrained Value Min** y **Constrained Value Max** al rango deseado (ej., 0 a 0.5).

Opcionalmente, puedes establecer el **Constraint BlendShape** para establecer un mapeo entre él y el blendshape restringido. Por ejemplo, las siguientes configuraciones harán que el valor del blendshape `JawOpen` siga el valor del blendshape `Smile` de tal manera que cuando `Smile` sea 0, `JawOpen` puede tomar de 0 a 1, y cuando `Smile` sea 1, `JawOpen` está restringido de 0 a 0.25.

![](/doc-img/en-character-3.png)
<p class="img-desc">Restringir el blendshape `JawOpen`.</p>

La lista **Toggle GameObjects** contiene todos los GameObjects hijos que serán alternados cuando esta expresión esté activa. Por ejemplo, puedes usar esto para alternar la visibilidad de un efecto de partículas cuando el personaje esté sonriendo.

Finalmente, debajo de la lista de expresiones, encontrarás **Default BlendShapes** y **Default Material Properties**, que se usan cuando ni ninguna expresión ni el seguimiento facial están activos.

## Animación {#animation}

Warudo soporta reproducir animaciones en tu personaje. Mejor aún, si estás usando un blueprint de seguimiento de la parte superior del cuerpo compatible (ej., [MediaPipe](../mocap/mediapipe.md), [RhyLive](../mocap/rhylive.md)), las animaciones se combinan automáticamente con la captura de movimiento, permitiéndote interactuar con tu audiencia de maneras divertidas o íntimas.

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180953465-7b91a347-452d-4c03-b860-45dc58ec0392.mp4" /></div>
<p class="img-desc">Aquí, la flexión de la parte superior del cuerpo viene de la animación de reposo, mientras que los movimientos de la cabeza y las manos vienen de la captura de movimiento. Cuando se pierde el seguimiento de las manos, las manos del avatar transicionan suavemente a la animación de reposo.</p>

En Warudo, hay tres tipos de animaciones:

* **Animación de Reposo**: La animación predeterminada que se reproduce cuando no se están reproduciendo otras animaciones.

  ![](/doc-img/en-character-5.png)
  <p class="img-desc">Seleccionar una animación de reposo.</p>
* **Animaciones Superpuestas**: Animaciones superpuestas encima de la animación de reposo.

  Por ejemplo, digamos que te gusta la animación "Cat" y quieres usarla. Sin embargo, también quieres que tu personaje se siente en una cama. Para combinar las dos animaciones, puedes establecer **Idle Animation** a una animación de sentado, mientras agregas una nueva entrada a la lista **Overlaying Animations**, estableciendo la **Animation** a "Cat", y hacer clic en **Mask Upper Body** para asegurar que la animación "Cat" solo afecte la parte superior del cuerpo.

  ![](/doc-img/en-character-6.png)
    <p class="img-desc">Combinar la animación "Cat" con una animación de sentado usando animaciones superpuestas.</p>

  ![](/doc-img/en-character-7.png)
    <p class="img-desc">La animación "Cat" solo afecta la parte superior del cuerpo.</p>

  Puedes agregar tantas animaciones superpuestas como quieras; cada capa de animación puede tener asignadas sus propias **Masked Body Parts**, **Weight** y **Speed**, permitiendo que diferentes partes del cuerpo reproduzcan diferentes animaciones. Mientras más abajo esté una animación en la lista, mayor es su prioridad.

  <div className="video-box"><iframe class="bilibili-video" src="//player.bilibili.com/player.html?aid=985941728&bvid=BV1Zt4y1c7Re&cid=843191749&p=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe></div>
  <p class="img-desc">Demo de animaciones superpuestas. Fuente: https://www.bilibili.com/video/BV1Zt4y1c7Re </p>
* Animaciones transitorias: Animaciones de una sola ejecución que son activadas por blueprints——por ejemplo, una animación corta de baile que se reproduce cuando recibes un redeem de Twitch. Consulta nuestros [tutoriales de blueprints](../blueprints/overview) para más detalles.

Además de las animaciones del cuerpo, también puedes configurar **Breathing Animation** y **Swaying Animation**, así como **Override Hand Poses**, es decir, establecer la pose de las manos del personaje a una pose específica, como un signo de paz.

Finalmente, puedes usar **Additional Bone Offsets** para hacer pequeños ajustes a la postura del personaje; por ejemplo, si quieres hacer que la cabeza del personaje se incline unos grados hacia un lado.

:::info
Por defecto, la prioridad de la animación de reposo, animaciones superpuestas, poses de mano sobrescritas, y [body IK](./#body-ik) son todas **menores** que la captura de movimiento.

Por ejemplo, incluso si has establecido una pose de mano sobrescrita para tu mano derecha, si tu mano derecha está siendo rastreada, digamos por MediaPipe, el modelo sigue la pose de tu mano derecha en lugar de la pose de mano sobrescrita. Para hacer que la pose de mano sobrescrita tenga prioridad sobre la captura de movimiento, puedes habilitar **High Priority** en la configuración de la pose de mano.
:::

## Look At IK {#look-ik}

Look At IK se usa para hacer que el personaje mire a un objetivo específico en la escena, como la cámara. ¡Esto es útil para capturar la selfie perfecta!

:::tip
Si solo quieres mantener contacto visual con tu audiencia, recomendamos habilitar **Look At** cuando configures el seguimiento facial en su lugar (está habilitado por defecto). Consulta [Personalizar Seguimiento Facial](../mocap/face-tracking) para más detalles.
:::

Para usar Look At IK, simplemente habilitalo y establece **Target** al objetivo al que el personaje debería mirar. Puedes ajustar los diferentes pesos para controlar cuánto deberían rotar la cabeza, ojos y cuerpo del personaje para mirar al objetivo. Las opciones **Clamp Weight** pueden usarse para limitar la rotación de la cabeza, ojos y cuerpo. Mientras mayores sean, menor será el rango de rotación.

## Body IK {#body-ik}

Body IK se usa para hacer que la columna vertebral o extremidades del personaje sigan un objetivo específico en la escena.

![](/doc-img/zh-assets-character.gif)
<p class="img-desc">Body IK en resumen.</p>

Para usar Body IK, simplemente habilitalo para la columna vertebral o una mano/pie, y establece **IK Target** al objetivo que el personaje debería seguir. El objetivo IK usualmente es una [cámara](camera.md), [prop](prop.md), o un [anchor](anchor.md). Si quieres crear un anchor temporal en la posición actual de la parte del cuerpo, puedes hacer clic en **Create Temporary IK Target Anchor At Current Position**. Cuando hayas terminado, puedes hacer clic en **Remove Temporary IK Target Anchor** para eliminar el anchor temporal.

:::tip
Crear un anchor temporal te permite fijar las manos del modelo en una posición ideal, evitando que las manos se desvíen a izquierda y derecha debido a movimientos de la cabeza. Esto puede ser bastante útil para algunas poses.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039288-aac4e485-c9f9-4686-948e-75f783586b25.mp4" />
Antes
</div>

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196039290-13b91459-110d-4706-9c77-3516b1c3b175.mp4" />
Después
</div>
</div>
:::

Las opciones **Bend Goal Target** y **Bend Goal Weight** pueden usarse para controlar la rotación de los codos y rodillas. El **Bend Goal Target** usualmente es un [anchor](anchor.md).

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-character-8.png"  />
<p class="img-desc">Objetivo de flexión deshabilitado.</p>
</div>
<div>
<img src="/doc-img/en-character-9.png"  />
<p class="img-desc">Objetivo de flexión habilitado</p>
</div>
</div>

## Ragdoll

Ragdoll permite que tu personaje sea golpeado por objetos físicos, y evita que el personaje penetre a través de objetos en la escena.

**Muscle Spring** y **Muscle Damper** pueden usarse para controlar la rigidez de los músculos del personaje. Mientras mayores sean, más rígidos serán los músculos del personaje.

Para evitar auto-penetración, como las manos del personaje penetrando a través del cuerpo, puedes habilitar **Internal Collisions**. Para mejores resultados, necesitarás ajustar los coliders manualmente haciendo clic en **Edit Ragdoll**.

:::caution
Aunque habilitar ragdoll puede hacer que el personaje se vea más realista, también puede causar que el personaje se comporte de maneras inesperadas debido a fallas en el motor de física. Recomendamos solo habilitar ragdoll cuando estés seguro de que es necesario.
:::

Ten en cuenta que algunos nodos habilitan temporalmente ragdoll independientemente de la configuración del asset. Por ejemplo, el nodo **Throw Prop At Character** habilitará temporalmente ragdoll en el personaje cuando el prop golpee al personaje.

## Mallas

Puedes alternar mallas y mallas skinned en el modelo.

:::info
Ten en cuenta que los modelos exportados por [VRoid Studio](https://vroid.com/en/studio) solo tienen dos mallas: `Body` y `Face`. Los modelos más detallados a menudo dividen la ropa del personaje, accesorios, cola, orejas de animal, etc. en mallas separadas, para lo cual esta característica es útil, como alternar la chaqueta del personaje.
:::

:::tip
Para alternar mallas en blueprints, puedes usar el nodo **Toggle Character Meshes**.
:::

## Escalado

Puedes escalar el personaje usando la propiedad **Transform → Scale**. Sin embargo, esto puede romper características como ragdoll, IK, y compatibilidad con algunos sistemas de captura de movimiento (ej., [Leap Motion](../mocap/leap-motion)). Si necesitas escalar el personaje, recomendamos escalar el personaje en el software de modelado 3D en su lugar, es decir, antes de que hayas importado el modelo a Unity o Warudo.

## Preguntas Frecuentes {#FAQ}

### ¿Cómo puedo activar una expresión automáticamente con seguimiento facial?

Puedes usar la característica **Trigger Conditions** para activar una expresión automáticamente. Por favor consulta la sección [Condiciones de Activación](#trigger-conditions) para más detalles.

### La pose del modelo es demasiado agresiva / demasiado suave / los brazos se hunden en el cuerpo / los brazos están muy lejos del cuerpo.

Intenta configurar **Animation → Additional Bone Offsets**. ¡El ángulo de rotación de las dos articulaciones de los hombros realmente afecta bastante la percepción de la personalidad del personaje!

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div>
<img src="/doc-img/en-character-10.png"  />
<p class="img-desc">Offsets de huesos adicionales deshabilitados.</p>
</div>
<div>
<img src="/doc-img/en-character-11.png"  />
<p class="img-desc">Offsets de huesos adicionales habilitados：LeftShoulder: (10, 0, -10), RightShoulder: (10, 0, 10).</p>
</div>
</div>

### ¿Cómo puedo cambiar la tecla de acceso rápido para una expresión?

Abre el blueprint **Expression Key Bindings** y localiza el nodo **On Keystroke Pressed**. Luego, modifícalo según sea necesario. Por ejemplo, en el blueprint original, presionar Alt+1 activará la expresión `Joy`:

![](/doc-img/en-expression-1.webp)

Lo siguiente cambia la tecla de acceso rápido a Ctrl+Shift+T.

![](/doc-img/en-expression-2.webp)

### ¿Puedo habilitar una expresión por un cierto período de tiempo y luego deshabilitarla automáticamente después de un rato?

Para hacer esto, habilita **Is Transient** en el nodo **Toggle Character Expression** en el blueprint **Expression Key Bindings**. La duración de la expresión será determinada por **Exit Delay** de cada BlendShape en la expresión.

![](/doc-img/en-expression-5.webp]

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
