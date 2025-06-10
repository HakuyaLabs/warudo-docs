---
sidebar_position: 10
---


# Comenzando

## Configuración Básica

Primero, cuando abras Warudo, deberías ver dos ventanas: la **ventana principal** y la **ventana del editor**.

![](/doc-img/en-getting-started-1.png)
<p class="img-desc">Ventana principal.</p>

![](/doc-img/en-getting-started-2.png)
<p class="img-desc">Ventana del editor.</p>

El editor se usa para configurar tu personaje, entorno, etc., mientras que la ventana principal es donde todo está en acción. Puedes cerrar la ventana del editor en cualquier momento y reabrirla presionando **Esc** mientras la ventana principal esté enfocada.

¡Es hora de sumergirse! Haz clic en **Basic Setup → Get Started**.

![](/doc-img/en-getting-started-3.png)
<p class="img-desc">Ventana de configuración básica.</p>

Haz clic en **Open Characters Folder**, y deberías ver una carpeta llamada "Characters" abierta en el explorador de archivos. Aquí es donde pones tus modelos de personajes.

Warudo soporta dos formatos de modelo: `.vrm` y `.warudo`. El primero es un formato de avatar estándar exportado por software como [VRoid Studio](https://vroid.com/en/studio), mientras que el último es el formato propio de Warudo y soporta virtualmente cualquier modelo de personaje compatible con Unity ([detalles](../modding/character-mod.md)). Por ahora, simplemente pongamos un archivo `.vrm` en la carpeta "Characters".

:::info
**P:** ¿Warudo soporta modelos `.vsfavatar`?

**R:** No, Warudo no soporta modelos `.vsfavatar`. Sin embargo, si tienes acceso a los archivos fuente de Unity que se usan para crear el modelo `.vsfavatar`, crear un modelo `.warudo` es muy fácil; tanto `.vsfavatar` como `.warudo` se exportan desde Unity. Por favor sigue la [guía de modding](../modding/character-mod.md) para más detalles.
:::

Ahora, regresa a Warudo y abre el dropdown. Deberías ver el nombre de tu personaje en la lista. Selecciónalo, ¡y deberías ver tu personaje cargado en la escena!

![](/doc-img/en-getting-started-4.png)
<p class="img-desc">Personaje cargado en la escena.</p>

Hagamos clic en **OK** para pasar al siguiente paso. Aquí, se te pregunta si te gustaría que Warudo recomiende una configuración de captura de movimiento para ti. Si seleccionas "Yes," Warudo te hace algunas preguntas para decidir qué soluciones de seguimiento facial y de pose usar. Por ejemplo, si tienes un iPhone y una webcam, y no tienes un Leap Motion Controller o hardware de seguimiento de cuerpo completo, Warudo recomendará usar [iFacialMocap](../mocap/ifacialmocap.md) (una aplicación de iPhone) para seguimiento facial y [MediaPipe](../mocap/mediapipe.md) (un seguimiento integrado que usa tu webcam) para seguimiento de manos. Si seleccionas "No," entonces tendrás que seleccionar manualmente qué soluciones de seguimiento facial y de pose usar.

Si eres un usuario primerizo, recomendamos seleccionar "Yes" para que Warudo recomiende una configuración de captura de movimiento para ti. Haz clic en **OK**, y selecciona las opciones que mejor describan tu configuración, y haz clic en **OK** nuevamente.

![](/doc-img/en-getting-started-5.png)
<p class="img-desc">Configurar captura de movimiento.</p>

![](/doc-img/en-getting-started-6.png)
<p class="img-desc">Responde algunas preguntas.</p>

En la siguiente pantalla, se te pide confirmar las soluciones de seguimiento facial y de pose que Warudo ha seleccionado para ti:

![](/doc-img/en-getting-started-7.png)
![](/doc-img/en-getting-started-8.png)
<p class="img-desc">Confirmar configuración de captura de movimiento.</p>

:::tip
Si quieres configurar un seguimiento secundario, puedes usar la opción **Secondary Pose Tracking**; esto es útil si estás usando rastreadores VR/Mocopi para seguimiento primario y te gustaría usar [MediaPipe](../mocap/mediapipe.md) o [Leap Motion Controller](../mocap/leap-motion.md) o [StretchSense Gloves](../mocap/stretchsense.md) para seguimiento adicional de dedos.
:::

Haz clic en **OK** para pasar al siguiente paso. Si tu modelo contiene expresiones, Warudo puede ayudarte a importarlas y asignarles hotkeys. Selecciona **Yes** y haz clic en **OK** para continuar.

![](/doc-img/en-getting-started-9.png)
<p class="img-desc">Importar expresiones.</p>

Una ventana emergente aparecerá que contiene una lista de expresiones recién importadas junto con sus hotkeys. No te preocupes, puedes cambiar los hotkeys más tarde. Haz clic en **OK** para continuar.

![](/doc-img/en-getting-started-10.png)
<p class="img-desc">Confirmar hotkeys de expresiones.</p>

Finalmente, se te pide seleccionar un fondo para tu escena de VTubing. Puedes ir con un fondo transparente o el skybox por defecto, pero Warudo viene con algunos fondos bonitos para que uses (se llaman **Environments**). Seleccionemos **Yes** y elijamos el entorno **VR Room**. Haz clic en **OK** para completar la configuración.

![](/doc-img/en-getting-started-11.png)
<p class="img-desc">Seleccionar un entorno.</p>

Tu ventana principal ahora debería verse así:

![](/doc-img/en-getting-started-12.png)
<p class="img-desc">Escena después de la configuración.</p>

Si ya has conectado tu software/hardware de seguimiento——en mi caso, he abierto la aplicación iFacialMocap en mi iPhone——¡entonces deberías ver tu personaje moviéndose ya!

![](/doc-img/en-getting-started-13.png)
<p class="img-desc">Personaje en movimiento.</p>

¡Pasemos a aprender algunos controles básicos!

## Controles de Escena

Tomémonos un momento para admirar tu modelo de personaje. Por defecto, la cámara de la escena está configurada en modo **Orbit Character**, lo que significa que la cámara siempre rota alrededor del personaje. Puedes usar **Mouse LMB/RMB** para rotar la vista, **Mouse Wheel** para hacer zoom in o out, y **Mouse MMB** para panoramizar la vista. Intenta mover la cámara a este ángulo:

![](/doc-img/en-getting-started-14.png)
<p class="img-desc">Cámara orbitando alrededor del personaje.</p>

Ahora aprendamos cómo mover el personaje. En la ventana del editor, haz clic en **Character** para seleccionar el asset del personaje.

![](/doc-img/en-getting-started-15.png)
<p class="img-desc">Seleccionar el asset del personaje.</p>

Deberías ver un **gizmo de traslación** bajo los pies del modelo que puede usarse para mover el modelo. Simplemente arrastra en un eje para moverte a lo largo de ese eje. Aquí moví el modelo junto a la cama:

![](/doc-img/en-getting-started-16.png)
<p class="img-desc">Mover el modelo.</p>

:::tip
¿No puedes ver el gizmo? Intenta usar **Mouse MMB** para panoramizar la vista.
:::

Puedes cambiar al **gizmo de rotación** presionando **E** (y, por cierto, volver al gizmo de traslación presionando **W**). Rotemos un poco el modelo:

![](/doc-img/en-getting-started-17.png)
<p class="img-desc">Rotar el modelo.</p>

Presiona **R** para cambiar al **gizmo de escala**. Normalmente no querrías escalar tu personaje, pero hagamos el modelo más ancho solo por diversión:

![](/doc-img/en-getting-started-18.png)
<p class="img-desc">Escalar el modelo.</p>

¡Eso no se ve bien! ¿Cómo podemos restaurar la escala? Si has estado prestando atención, es posible que hayas notado que los valores en la sección **Transform** cambian cuando arrastras los gizmos. Por ejemplo, así es como se ve el mío ahora:

![](/doc-img/en-getting-started-19.png)
<p class="img-desc">Valores de transformación.</p>

Para volver a la escala inicial, simplemente establece los valores de **Scale** a **1**, o haz clic en el botón **Reset** que aparece cuando pasas el cursor sobre los valores de **Scale**:

![](/doc-img/en-getting-started-20.png)
<p class="img-desc">Restablecer escala.</p>

¡Eso está mucho mejor!

![](/doc-img/en-getting-started-21.png)
<p class="img-desc">De vuelta a lo normal.</p>

:::tip
También puedes cambiar entre diferentes gizmos en el editor.

![](/doc-img/en-getting-started-66.png)
:::

Además de orbitar alrededor del modelo, la cámara también puede cambiarse a un modo de vista libre, permitiendo que la cámara vuele a través de la escena. Selecciona el asset **Camera** y elige **Free Look** para el **Control Mode**:

![](/doc-img/en-getting-started-22.png)
<p class="img-desc">Cambiar a modo de vista libre.</p>

Mientras **mantienes presionado Mouse RMB**, usa **WASD** para moverte, **E** y **Q** para moverte arriba y abajo, y mantén **Left Shift** para moverte más rápido. Usa **Mouse MMB** para panoramizar la vista.

Después de que te hayas acostumbrado a los dos modos de cámara, cambia de vuelta al modo **Orbit Character** y haz clic en **Reset Camera Transform** para devolver la cámara a su posición predeterminada.

:::tip
También puedes presionar **V** para cambiar entre los modos **Orbit Character** y **Free Look**.
:::

![](/doc-img/en-getting-started-24.png)
<p class="img-desc">Restablecer transformación de cámara.</p>

![](/doc-img/en-getting-started-23.png)
<p class="img-desc">De vuelta a la posición predeterminada de la cámara.</p>

## Pestaña Assets

Ahora que tienes una noción básica de cómo mover el personaje y la cámara, ¡echemos un vistazo al editor!

Por defecto, estás en la pestaña **Assets**. Un **asset** es esencialmente cualquier cosa que esté "en la escena", como un personaje, una cámara, un prop, un rastreador de captura de movimiento, etc.

Puedes hacer clic en un asset para seleccionarlo. Por ejemplo, haz clic en el asset **Directional Light** para seleccionarlo y ajustar su color:

![](/doc-img/en-getting-started-25.png)
<p class="img-desc">Seleccionar la luz direccional y ajustar su color.</p>

¡Espeluznante!

![](/doc-img/en-getting-started-26.png)
<p class="img-desc">Color de la luz establecido a rojo.</p>

Un rastreador de captura de movimiento también es un asset. Por ejemplo, ya que he seleccionado **iFacialMocap** como mi solución de seguimiento facial, tengo un asset **iFacialMocap Receiver** en mi escena. Puedo hacer clic en él para seleccionarlo y hacer clic en el botón **Calibrate** para calibrar mi seguimiento facial:

![](/doc-img/en-getting-started-27.png)
<p class="img-desc">Calibrar iFacialMocap.</p>

Ya que estamos aquí, ¿qué tal si intentamos agregar un nuevo asset? Haz clic en **Add Asset** y selecciona **Prop**:

![](/doc-img/en-getting-started-28.png)
<p class="img-desc">Agregar asset.</p>

![](/doc-img/en-getting-started-29.png)
<p class="img-desc">Seleccionar "Prop".</p>

El asset prop se agrega a la escena, ¡pero aún no hemos seleccionado un modelo! Hagamos clic en el botón **Preview Gallery** junto al menú desplegable **Source**:

![](/doc-img/en-getting-started-30.png)
<p class="img-desc">Galería de vista previa.</p>

Seleccionemos el prop **Microphone**. Luego, haz clic en **X** (o en cualquier lugar fuera de la ventana emergente) para cerrar la galería de vista previa:

![](/doc-img/en-getting-started-31.png)
<p class="img-desc">Seleccionar el prop del micrófono.</p>

Hmm, ¿dónde está nuestro micrófono? ¡Aleja un poco el zoom, y deberías verlo... hundido en el suelo!

![](/doc-img/en-getting-started-32.png)
<p class="img-desc">Oh no.</p>

¡Eso no está bien! Queremos adjuntarlo a la mano de nuestro personaje. En la sección **Transform Attachment**, haz clic en el menú desplegable **Attach To** y selecciona **Character**:

![](/doc-img/en-getting-started-33.png)
<p class="img-desc">Adjuntar al personaje.</p>

¡El micrófono ahora está adjunto a la mano del personaje! Ahora podemos usar el gizmo de transformación para ajustar la posición del adjunto:

![](/doc-img/en-getting-started-34.png)
<p class="img-desc">Micrófono adjunto a la mano del personaje.</p>

![](/doc-img/en-getting-started-35.png)
<p class="img-desc">Ajustar la posición del adjunto.</p>

Si has configurado seguimiento de cuerpo completo o seguimiento de manos, ¡deberías poder ver tu micrófono moviéndose con tu mano!

![](/doc-img/en-getting-started-36.png)
<p class="img-desc">Micrófono moviéndose con la mano.</p>

Como puedes ver, cada tipo de asset viene con muchas opciones. Por ejemplo, puedes cambiar **Attach To Bone** para adjuntar el micrófono a la mano izquierda del personaje en su lugar, o cambiar **Override Hand Pose** para hacer que el personaje sostenga el micrófono con una pose de mano diferente:

![](/doc-img/en-getting-started-37.png)
<p class="img-desc">Ajustar opciones del prop.</p>

El asset del personaje también es altamente personalizable. Por ejemplo, nuestro personaje ha estado parado junto a la cama por un rato. ¡Hagamos que se siente en la cama! Haz clic en el asset **Character** para seleccionarlo, y haz clic en el botón **Preview Gallery** junto al menú desplegable **Idle Animation**:

![](/doc-img/en-getting-started-42.png)
<p class="img-desc">Seleccionar una animación de reposo del personaje.</p>

![](/doc-img/en-getting-started-41.png)
<p class="img-desc">Seleccionar la animación de reposo "Sitting".</p>

¡Cómodo!

![](/doc-img/en-getting-started-43.png)
<p class="img-desc">Personaje sentado en la cama.</p>

¡La mejor parte es que **la captura de movimiento de Warudo se combina perfectamente con las animaciones de reposo**! Por ejemplo, si levantas tu mano, el personaje seguirá levantando su mano mientras está sentado:

![](/doc-img/en-getting-started-55.png)
<p class="img-desc">El personaje levanta la mano mientras está sentado.</p>


:::info
**P:** ¡Ayuda! ¡Hay tantas opciones en Warudo, y no sé qué hacen!

**R:** Es fácil sentirse abrumado, pero no te preocupes, no necesitas entender todas ellas. Muchas opciones son para usuarios avanzados y no son necesarias para el uso diario.

Si eres nuevo en Warudo, simplemente juega con las opciones y ve qué hacen. Siempre puedes restablecer las opciones a sus valores predeterminados haciendo clic en el botón **Reset** cuando pases el cursor sobre ellas. Las secciones posteriores de este manual explorarán cada tipo de asset y sus opciones en detalle con ejemplos.
:::

Finalmente, intentemos agregar un asset **Screen**. Haz clic en **Add Asset** y selecciona **Screen**:

![](/doc-img/en-getting-started-38.png)
<p class="img-desc">Agregar asset de pantalla.</p>

El asset de pantalla se usa para mostrar imágenes y videos, ¡pero también puede capturar tus ventanas/monitores como OBS Studio! En el siguiente ejemplo, he seleccionado **Window** para la opción **Content Type** y **Warudo Editor** para la opción **Window**, y moví la pantalla detrás del personaje:

![](/doc-img/en-getting-started-39.png)
<p class="img-desc">Ejemplo de uso de pantalla.</p>

:::tip
Si la pantalla está muy brillante, puedes ajustar la opción **Tint** a un color gris para hacerla más oscura.
:::

## Pestaña Blueprints

Ahora que estás familiarizado con los assets, echemos un vistazo a la pestaña **Blueprints**. Haz clic en el ícono sigma para cambiar a la pestaña de blueprints:

![](/doc-img/en-getting-started-40.png)
<p class="img-desc">Cambiar a la pestaña de blueprints.</p>

Pero ¿qué es un blueprint? Esencialmente, los blueprints son "qué debería pasar cuando algo pasa". Por ejemplo, "cuando presiono la tecla **Espacio**, el personaje debería saludar con la mano". O, "cuando recibo un redeem de Twitch, un prop debería ser lanzado a mi personaje".

Nuestra escena ya tiene algunos blueprints. Por ejemplo, el blueprint **Expression Key Bindings** implementa las teclas de acceso rápido para cambiar entre expresiones. Hagamos clic en él para seleccionarlo:

![](/doc-img/en-getting-started-44.png)
<p class="img-desc">Seleccionar el blueprint de vinculaciones de teclas de expresión.</p>

Usa **Mouse Wheel** para acercar y alejar, y **Mouse LMB** para panoramizar la vista. Panoramiza hacia la derecha hasta que veas estos dos nodos:

![](/doc-img/en-getting-started-45.png)
<p class="img-desc">Alejar y panoramizar hacia la derecha.</p>

Los dos nodos aquí esencialmente están diciendo: "cuando se presione **Alt+1**, el asset del personaje **Character** debería cambiar a la expresión **Joy**". ¡Probémoslo! Presiona **Alt+1** en tu teclado, y deberías ver tu personaje cambiar a la expresión **Joy**:

![](/doc-img/en-getting-started-46.png)
<p class="img-desc">El personaje cambia a la expresión "Joy".</p>

Similarmente, los dos nodos de abajo están diciendo: "cuando se presione **Alt+Backspace**, el asset del personaje **Character** debería salir de todas las expresiones". Presiona **Alt+Backspace** para probarlo.

![](/doc-img/en-getting-started-47.png)
<p class="img-desc">El personaje sale de todas las expresiones.</p>

Regresemos a los dos nodos que cambian a la expresión **Joy**. Puedes cambiar la tecla de acceso rápido cambiando la opción **Keystroke** y otras opciones; por ejemplo, en lo siguiente, he cambiado la tecla de acceso rápido a **Ctrl+Shift+Q**:

![](/doc-img/en-getting-started-48.png)
<p class="img-desc">Cambiar tecla de acceso rápido.</p>

También puedes hacer que pasen más cosas cuando se presione la tecla de acceso rápido. ¿Qué tal reproducir un efecto de sonido? Escribe **play sound** en la barra de búsqueda y arrastra el nodo **Play Sound** a la derecha del nodo **Toggle Character Expression**:

![](/doc-img/en-getting-started-49.png)
<p class="img-desc">Localizar el nodo "Play Sound".</p>

Haz clic en el punto verde junto a la salida **Exit** del nodo **Toggle Character Expression** y arrástralo al punto verde junto a la entrada **Enter** del nodo **Play Sound**:

![](/doc-img/en-getting-started-50.png)
<p class="img-desc">Arrastrar el nodo "Play Sound" a la derecha del nodo "Toggle Character Expression".</p>

Esto conecta los dos nodos juntos. Ahora, haz clic en el menú desplegable **Source** y selecciona un efecto de sonido que te guste. Yo he seleccionado el efecto de sonido **Punch Light 01**.

![](/doc-img/en-getting-started-51.png)
<p class="img-desc">Seleccionar un efecto de sonido.</p>

:::tip
¡Puedes hacer clic en **Open Sounds Folder** y poner tus propios efectos de sonido!
:::

Ahora, cuando presiones **Ctrl+Shift+Q** (o la tecla de acceso rápido que asignaste), ¡tu personaje debería cambiar a la expresión **Joy**, y deberías escuchar un efecto de sonido!

Implementemos algo nuevo. Por ejemplo, reproduzcamos una animación de emote en el personaje cuando presionemos **Espacio**. Panoramiza a un área vacía e intenta agregar los siguientes nodos tú mismo y conéctalos como se muestra. Selecciona el asset del personaje en el menú desplegable **Character**, y selecciona **Energetic** para la opción **Animation**:

![](/doc-img/en-getting-started-52.png)
<p class="img-desc">Agregar nodos para reproducir una animación de emote.</p>

Si tu personaje está actualmente sentado, es posible que quieras enmascarar la animación para que solo se reproduzca en la parte superior del cuerpo. Para hacerlo, haz clic en **Mask Upper Body** en el nodo **Play Character One Shot Overlay Animation**:

![](/doc-img/en-getting-started-53.png)
<p class="img-desc">Enmascarar la animación para que solo se reproduzca en la parte superior del cuerpo.</p>

Ahora, cuando presiones **Espacio**, ¡tu personaje debería reproducir la animación de emote **Energetic**!

![](/doc-img/en-getting-started-54.png)
<p class="img-desc">El personaje reproduce la animación de emote "Energetic".</p>


¡Esa es nuestra breve introducción a los blueprints! Esperamos que te ofrezca una idea de lo que pueden hacer los blueprints. Los blueprints son una característica muy poderosa, pero incluso sin tocarlos para nada, aún puedes hacer muchas cosas con Warudo. Una vez que estés familiarizado con el resto de las características, recomendamos leer el [tutorial de blueprints](/docs/blueprints/overview) para aprender más sobre blueprints.

:::tip
Puedes usar **Mouse RMB** para arrastrar una caja de selección para seleccionar múltiples nodos. Para eliminar un nodo, selecciónalo y presiona **Delete**.
:::

:::info
Es posible que hayas notado que hay un blueprint para seguimiento facial y un blueprint para seguimiento de pose. Estos blueprints fueron generados automáticamente por el asistente de configuración inicial y pueden ser personalizados a tu gusto. Sin embargo, para los principiantes, pueden parecer intimidantes, así que recomendamos dejarlos solos por ahora.
:::

## Configuración de Interacción {#interaction-setup}

¡El VTubing no es divertido si no puedes interactuar con tus espectadores! Warudo ofrece una amplia gama de características de interacción, pero la forma más rápida de comenzar es usar nuestro asistente de configuración inicial. Selecciona el asset **Onboarding Assistant**, y haz clic en **Interaction Setup → Get Started**:

![](/doc-img/en-getting-started-58.png)
<p class="img-desc">Configuración de interacción.</p>

Se te pedirá seleccionar una plataforma de streaming:

![](/doc-img/en-getting-started-59.png)
<p class="img-desc">Seleccionar una plataforma de streaming.</p>

Sigue las instrucciones para configurar la integración de la plataforma de streaming. Por ejemplo, en lo siguiente, estoy configurando la interacción **Launching Liquid** para que se active cuando reciba un redeem de Twitch llamado "Water":

![](/doc-img/en-getting-started-60.png)
<p class="img-desc">Configurar integración.</p>

Cuando hayas terminado, notarás que se ha agregado un nuevo blueprint a la pestaña de blueprints. ¿Recuerdas lo que dijimos sobre los blueprints? Son "qué debería pasar cuando algo pasa". En este caso, el blueprint debería contener la lógica para lanzar líquido a nuestro personaje cuando recibamos un redeem de Twitch llamado "Water". Haz clic en el blueprint para seleccionarlo, y localiza el nodo **Launch Liquid At Character**:

![](/doc-img/en-getting-started-61.png)
<p class="img-desc">Se ha agregado un nuevo blueprint.</p>

![](/doc-img/en-getting-started-62.png)
<p class="img-desc">Localizar el nodo "Launch Liquid At Character".</p>

De hecho, los nodos de arriba esencialmente están diciendo: "cuando recibamos un redeem de Twitch, si el título del redeem es 'Water', entonces lanza líquido al asset del personaje 'Character'". Puedes hacer clic en el botón "Enter" en el nodo **Launch Liquid At Character** para probarlo:

![](/doc-img/en-getting-started-63.png)
<p class="img-desc">Probar la interacción.</p>

![](/doc-img/en-getting-started-64.png)
<p class="img-desc">¡Funciona!</p>

## Salida a OBS Studio / Streamlabs

¡Es hora de poner Warudo en tu software de streaming favorito! Hay cuatro formas de hacerlo:

* **Cámara virtual:** Warudo puede generar salida como una cámara virtual. Esto es útil para streams colaborativos en [VDO.Ninja](https://vdo.ninja/) o si quieres usar tu avatar de VTubing en Discord/Zoom. Para usar este método, ve a **Settings → Output** y habilita **Virtual Camera Output**.
* **NDI:** Warudo puede generar salida como una fuente [NDI](https://ndi.video/). Para usar este método, ve a **Settings → Output** y habilita **NDI Output**. Ten en cuenta que la salida de audio no está soportada.
* **Spout:** Warudo puede generar salida como una fuente [Spout](https://spout.zeal.co/). Para usar este método, ve a **Settings → Output** y habilita **Spout Output**. **Esto ya está habilitado por defecto**.
* **Captura de ventana/juego:** También puedes usar captura de ventana/juego en OBS Studio o Streamlabs para capturar la ventana de Warudo. No recomendamos este método, ya que consume significativamente más recursos de CPU/GPU que los otros métodos.

Recomendamos usar el método **Spout**, ya que tiene latencia cero y el mejor rendimiento. Además, oculta los gizmos de transformación, ¡así puedes mover/rotar personajes o props durante un stream sin mostrar los gizmos a la audiencia! Para configurar la salida Spout, sigue estos pasos:

* **OBS Studio:** Instala el [**Spout2 Plugin for OBS Studio**](https://github.com/Off-World-Live/obs-spout2-plugin) primero, luego agrega una fuente **Spout2 Capture**, y selecciona **Warudo** como el emisor.
* **Streamlabs:** Agrega una fuente **Spout2**, y selecciona **Warudo** como el emisor.

![](/doc-img/en-getting-started-65.png)
<p class="img-desc">Salida Spout a OBS Studio.</p>

:::tip
Todos los métodos de salida soportan salida de transparencia. Para habilitar fondo transparente, simplemente ve al asset de la cámara y habilita **Propiedades Básicas → Transparent Background**.
:::

## Guardar y Cargar Escenas

Ahora que has configurado tu escena, ¡recuerda guardarla! A diferencia de otro software, Warudo no guarda automáticamente tu escena, para que puedas experimentar con diferentes configuraciones sin preocuparte por arruinar tu escena. Haz clic en el ícono de Warudo, y selecciona **Save Scene**:

![](/doc-img/en-getting-started-56.png)
<p class="img-desc">Guardar escena.</p>

También puedes guardar la escena como un archivo nuevo seleccionando **Save Scene As**. Para cargar una escena, selecciona **Open Scene**.

![](/doc-img/en-getting-started-57.png)
<p class="img-desc">Abrir escena.</p>

Finalmente, puedes usar **Reload Scene** y **Restart Scene** para recargar y reiniciar la escena respectivamente. **Reload Scene** restablece el estado de la escena y abandona todos los cambios hechos a la escena desde el último guardado, mientras que **Restart Scene** solo restablece el estado de la escena pero mantiene los cambios hechos a la escena.

:::info
"Restablecer el estado de la escena" significa restablecer física, objetos temporales, etc. en la escena. Por ejemplo, si de alguna manera has generado 1,000 props lanzados en la escena, usar **Reload Scene** o **Restart Scene** los eliminará todos, ya que no son parte del archivo de escena.
:::

## Resumen

¡Felicidades! Ahora has aprendido los conceptos básicos de Warudo. Recomendamos leer el resto del manual para aprender más sobre las características de Warudo. Si tienes alguna pregunta, únete a nuestro [Discord](https://discord.gg/warudo), ¡y estaremos felices de ayudarte!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
