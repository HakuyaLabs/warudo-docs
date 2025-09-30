---
sidebar_position: 10
---

# Mod de Personaje

¡Puedes importar cualquier modelo de personaje a Warudo siempre que puedan ser importados a Unity! Esto incluye modelos FBX o [avatares de VRChat](https://booth.pm/en/search/avatar?tags%5B%5D=3D+Character). Incluso si estás usando un modelo VRM, aún hay beneficios en crear un mod de personaje, como agregar shaders personalizados o mejores componentes de física como [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) y [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144).

## Configuración

### Paso 1: Preparar Modelo

Primero, importa el modelo del personaje al proyecto de modding. Debería ser un modelo humanoide con un componente [Animator](https://docs.unity3d.com/ScriptReference/Animator.html). Si tu modelo no tiene un componente Animator, ve a las configuraciones de importación del modelo y establece **Animation Type** en Humanoid, luego haz clic en **Apply**.

![](/doc-img/en-character-mod-1.webp)

Si estás usando un modelo FBX, asegúrate de que **R/W Enabled** esté marcado en las configuraciones de importación del modelo.

![](/doc-img/en-character-mod-2.webp)

### Paso 2: Configurar Personaje

Coloca tu personaje en la escena y selecciónalo. Selecciona **Warudo → Setup Character...** en la barra de menú. En la ventana Setup Character, selecciona **Setup selected GameObject as character mod**:

![](/doc-img/en-character-mod-3.webp)

Deberías ver que se genera un prefab llamado **Character** en la carpeta del mod:

![](/doc-img/en-character-mod-4.webp)

:::tip
Si notas que los huesos del personaje se tuercen, o hay diferencias visuales en el modelo antes y después, por favor consulta la sección [Normalizar Huesos](#normalize-bones).
:::

### Paso 3: Exportar Mod

Selecciona **Warudo → Build Mod** y asegúrate de que el archivo `.warudo` generado se coloque en la carpeta de datos `Characters`.

## Escalado

Puedes escalar el personaje en Warudo usando la propiedad **Character → Transform → Scale**. Sin embargo, esto puede romper características como ragdoll, IK, y compatibilidad con algunos sistemas de captura de movimiento (ej., [Leap Motion](../mocap/leap-motion)). Si necesitas escalar el personaje, recomendamos escalar el personaje en el software de modelado 3D en su lugar, es decir, antes de haber importado el modelo a Unity o Warudo.

## Componentes de Terceros

Warudo incluye algunos componentes de terceros que puedes usar en tu mod de personaje. Aquí hay algunos componentes comúnmente usados:

* Componentes [VRM](https://vrm.dev/en/univrm/), como VRM Spring Bones, VRM Spring Bone Colliders
* Componentes [Animation Rigging](https://docs.unity3d.com/Packages/com.unity.animation.rigging@latest), como Rotation Constraint
* [Dynamic Bone](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743) 1.3.2
* [VRC PhysBones](https://docs.vrchat.com/docs/physbones) (Automáticamente convertido a Dynamic Bone en tiempo de ejecución)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144) 1.12.11
* [Magica Cloth 2](https://assetstore.unity.com/packages/tools/physics/magica-cloth-2-242307) 2.6.0

Ten en cuenta que necesitas importar los paquetes Unity correspondientes para Dynamic Bone y Magica Cloth, ya que no están incluidos en Warudo SDK.

Dado que Warudo te permite empaquetar scripts de C# en tu mod, ¡también puedes usar otros componentes Unity de terceros! Sin embargo, por favor ten en cuenta las limitaciones descritas en la sección [Scripts C# Personalizados](mod-sdk#custom-scripts).

## Animaciones

Puedes querer agregar animaciones personalizadas a tu personaje, como cambiar el color del cabello o batir alas. Dependiendo de la naturaleza de tu animación, puedes usar uno de los siguientes métodos:

* **La animación controla solo huesos humanos:** Crea un [mod de animación de personaje](character-animation-mod) y reproduce usando cualquier nodo de animación de personaje en Warudo o Character → Overlaying Animations. También puedes simplemente colocar un archivo `.anim` crudo de Unity en la carpeta `CharacterAnimations` para usarlo.
* **La animación controla propiedades de material:** Usa el sistema de expresiones de personaje de Warudo (Character → Expressions).
* **La animación controla transformaciones no-hueso:** Agrega un [Animator Controller](https://docs.unity3d.com/Manual/class-AnimatorController.html) al componente Animator, y usa los nodos de controlador de animador integrados de Warudo para controlar parámetros del Animator.

:::info
Si estás reutilizando un modelo de VRChat, también puedes simplemente usar el Animator Controller que viene con el modelo. Sin embargo, los primeros 2 métodos se integran mejor con el sistema de captura de movimiento y animación de Warudo, por lo tanto son recomendados.
:::

## Normalizar Huesos {#normalize-bones}

La normalización de huesos se refiere al proceso de asegurar que los huesos en un modelo tengan rotación cero en la T-pose. Puedes verificar si un modelo tiene huesos normalizados importándolo a Unity y verificando 1. si el modelo está en T-pose, y 2. si todas las transformaciones de huesos tienen rotación (0, 0, 0) _antes_ de usar Warudo SDK para configurar el personaje. La ventana **Setup Character** también te advertirá si el modelo no tiene huesos normalizados:

![](/doc-img/en-mod-11.png)

Si después de la configuración del personaje, los huesos de tu personaje se tuercen, es probable que el modelo no tuviera huesos normalizados, y Warudo SDK falló en normalizar automáticamente los huesos sin romper el modelo. Hay dos soluciones:

### Normalización manual

Si modelaste el personaje tú mismo, recomendamos que normalices manualmente los huesos _antes_ de importar el modelo FBX a Unity.

Hay muchas maneras de normalizar huesos en herramientas de modelado como Blender o Maya; sin embargo, la manera más probada y comprobada es crear un modelo [VRM](https://vrm.dev/en/univrm/) desde el modelo FBX, y luego importar el modelo VRM a Unity. Dado que los modelos VRM están garantizados de tener huesos normalizados, puedes estar seguro de que los huesos no se torcerán después de configurar el personaje usando Warudo SDK. La desventaja de esto es que tendrás que crear un modelo VRM para cada iteración de tu FBX, lo cual puede ser problemático.

Si eres usuario de Blender y buscas normalizar manualmente los huesos, puedes usar la opción **Set Rest Pose** de [Cats](https://github.com/absolute-quantum/cats-blender-plugin). Cuando exportes el FBX, deberías usar las configuraciones de abajo:

![](/doc-img/en-mod-15.png)
<p class="img-desc">Crédito: [@Kana_Fuyuko](https://twitter.com/Kana_Fuyuko)</p>

:::warning
El exportador FBX integrado de Blender es conocido por tener problemas con no exportar las rotaciones correctas de huesos; si tienes problemas, considera usar un complemento de terceros como [Better FBX Importer & Exporter](https://blendermarket.com/products/better-fbx-importer--exporter) (Recomendado) o [Cats](https://github.com/absolute-quantum/cats-blender-plugin) para exportar el modelo FBX.
:::

### Usando Denormalized Avatar Exporter

[Denormalized Avatar Exporter] es un paquete Unity desarrollado por [@vr_hai](https://x.com/vr_hai). Te permite exportar avatares normalmente diseñados para uso en VRChat a aplicaciones de VTubing incluyendo Warudo, pero también funciona en modelos no-VRChat.

Recomendamos que lo uses si no modelaste el personaje tú mismo y estás enfrentando problemas con la normalización de huesos. Para más información, por favor consulta la [documentación oficial](https://docs.hai-vr.dev/docs/products/denormalized-avatar-exporter#usage-in-warudo).

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
