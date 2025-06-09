---
sidebar_position: 520
---

# Chingmu Avatar

:::info
Esta característica solo está disponible en [Warudo Pro](../pro).
:::

Seguimiento corporal a través de [Chingmu Avatar](https://www.chingmu.com/software/downloaddetail_7.shtml). Requiere acceso a un sistema de seguimiento óptico [Chingmu](https://chingmu.com).

Además del seguimiento de personaje, también se soporta el seguimiento de props. Por ejemplo, puedes querer rastrear una silla o una cámara de mano usando tu sistema de seguimiento óptico y transmitir los datos de movimiento a Warudo, animando un prop de silla o cámara en Warudo acordemente.

## Configuración

### Seguimiento de Personaje

Abre Chingmu Avatar y carga el archivo FBX de tu personaje, y caracterízalo. **El modelo debe tener huesos normalizados, es decir, todos los huesos en el modelo deben tener rotación cero (0, 0, 0) cuando el modelo esté en T-pose.** El modelo también debe tener jerarquía de huesos idéntica al modelo de personaje cargado en Warudo.

:::info
Puedes verificar si un modelo FBX tiene huesos normalizados importándolo a Unity y verificando si las transformaciones de huesos tienen rotación cero.
:::

Asegúrate de que **VRPN Livestream** (启用Vrpn) esté marcado, junto con **Rigidbodies** (刚体), **Bones** (骨骼), y **Motion Retargeting** (重定向).

![](/doc-img/en-chingmu-1.png)

Si tienes múltiples personajes en la escena, en Warudo, establece **Chingmu Avatar Receiver → Object ID** al índice del personaje que te gustaría rastrear. El índice comienza desde 0.

Si estás ejecutando Chingmu Avatar en una PC diferente, necesitas ingresar la dirección IP de la PC ejecutando Chingmu Avatar en **Settings → Chingmu → VRPN Connection String** de Warudo.

### Seguimiento de Props

En Warudo, crea un nuevo asset **Chingmu Avatar Rigidbody Receiver** y establece **Rigidbody ID** al ID del rigidbody que te gustaría rastrear. Luego, para **Target Asset**, selecciona el prop/cámara de Warudo que te gustaría controlar.

:::tip
Si te gustaría acceder a datos de seguimiento de props en blueprints, puedes usar el nodo **Get Chingmu Avatar Rigidbody Receiver Data**.
:::

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### Mi personaje está en poses extremadamente extrañas.

Primero, asegúrate de haber cargado el mismo modelo en Warudo y Chingmu Avatar.

También requerimos que los modelos tengan huesos normalizados, es decir, todos los huesos en el modelo deben tener rotación cero (0, 0, 0) cuando el modelo esté en T-pose. Por favor consulta [esta página](../misc/normalizing-model-bones) para más detalles.

### Mi personaje no se está moviendo.

Puedes intentar hacer clic en **Settings → Chingmu → Restart Chingmu Plugin**. Si esto no funciona, intenta reiniciar Chingmu Avatar y/o Warudo.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
