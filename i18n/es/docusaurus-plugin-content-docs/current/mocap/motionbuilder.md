---
sidebar_position: 510
---

# Autodesk MotionBuilder

:::info
Esta característica solo está disponible en [Warudo Pro](../pro).
:::

Seguimiento corporal a través de [Autodesk MotionBuilder](https://www.autodesk.com/products/motionbuilder/), permitiéndote recibir datos de movimiento de sistemas de captura de movimiento ópticos (ej., [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)) que tienen integración con Autodesk MotionBuilder.

Además del seguimiento de personaje, también se soporta el seguimiento de props. Por ejemplo, puedes querer rastrear una silla o una cámara de mano usando tu sistema de seguimiento óptico y transmitir los datos de movimiento a Warudo, animando un prop de silla o cámara en Warudo acordemente.

## Configuración

:::info
Por favor asegúrate de estar usando Autodesk MotionBuilder 2020. Si necesitas compatibilidad para una versión diferente, por favor contáctanos (puede tomar un tiempo antes de que podamos entregar una compilación).
:::

Asegúrate de que el plugin **Mobu2Warudo** ya esté instalado. Está incluido en tu licencia de Warudo Pro.

### Seguimiento de Personaje

Abre MotionBuilder y carga el archivo FBX de tu personaje, y caracterízalo. **El modelo debe tener huesos normalizados, es decir, todos los huesos en el modelo deben tener rotación cero (0, 0, 0) cuando el modelo esté en T-pose.** El modelo también debe tener jerarquía de huesos idéntica al modelo de personaje cargado en Warudo.

:::info
Puedes verificar si un modelo FBX tiene huesos normalizados importándolo a Unity y verificando si las transformaciones de huesos tienen rotación cero.
:::

Arrastra **Devices → Warudo Device** hacia la vista de escena.

![](/doc-img/en-motionbuilder-1.png)

:::caution
Si no puedes ver "Warudo Device", significa que el plugin falló al cargar. Por favor descarga e instala [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) y reinicia MotionBuilder.
:::

Selecciona **Devices → Warudo Device → Characters**, haz clic en **Add** para agregar una nueva fila. Cambia el nombre por defecto **MyCharacter** al nombre real del personaje, y haz clic en la caja roja junto al texto "Online". Debería volverse verde inmediatamente, indicando que MotionBuilder ahora está transmitiendo datos de movimiento a Warudo.

![](/doc-img/en-motionbuilder-2.png)

En Warudo, actualiza **MotionBuilder Receiver → MotionBuilder Character Name** al nombre real del personaje.

### Seguimiento de Props

Selecciona **Devices → Warudo Device → Props**, haz clic en **Add** para agregar una nueva fila. Cambia el nombre por defecto **MyProp** al nombre de etiqueta del objeto que te gustaría rastrear. El objeto puede estar en cualquier lugar de la jerarquía de escena. Haz clic en la caja roja junto al texto "Online" para comenzar el seguimiento.

En Warudo, crea un nuevo asset **MotionBuilder Prop Receiver** e ingresa el nombre del objeto rastreado para **MotionBuilder Prop Name**. Luego, para **Target Asset**, selecciona el prop/cámara de Warudo que te gustaría controlar.

:::tip
Si te gustaría acceder a datos de seguimiento de props en blueprints, puedes usar el nodo **Get MotionBuilder Prop Receiver Data**.
:::

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### Mi personaje está en poses extremadamente extrañas.

Primero, asegúrate de haber cargado el mismo modelo en Warudo y Autodesk MotionBuilder.

También requerimos que los modelos tengan huesos normalizados, es decir, todos los huesos en el modelo deben tener rotación cero (0, 0, 0) cuando el modelo esté en T-pose. Por favor consulta [esta página](../misc/normalizing-model-bones) para más detalles.

### He confirmado que Autodesk MotionBuilder está transmitiendo datos a otra PC ejecutando Warudo, pero Warudo no ha recibido ningún dato.

Por favor asegúrate de que la configuración de red sea correcta, es decir, las dos PCs están en la misma red y pueden comunicarse entre sí. Puedes intentar hacer ping en ambas direcciones para confirmar.

Adicionalmente, si tu personaje tiene una jerarquía bastante grande, por favor verifica si la PC receptora tiene un tamaño MTU (Maximum Transmission Unit) lo suficientemente grande para recibir los datos, y auméntalo si es necesario. Ve [esta página](https://answers.microsoft.com/en-us/windows/forum/all/how-to-change-mtu-settings-in-windows-10/5c36c250-a0e8-47ee-b01c-de22139dc297) para más detalles.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
