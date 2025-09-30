---
sidebar_position: 15
version: "2024.11.15"
---

# Mod de Entorno

¡Cualquier [escena](https://docs.unity3d.com/Manual/CreatingScenes.html) de Unity puede importarse a Warudo como un mod de entorno!

## Configuración

### Paso 1: Preparar la Escena

Configura tu escena de Unity como desees. Ten en cuenta que [Post Processing Stack v2](https://docs.unity3d.com/Packages/com.unity.postprocessing@3.3/manual/index.html) es compatible, por lo que puedes agregar efectos de post-procesamiento a tu escena.

Te recomendamos optimizar tu escena, por ejemplo:

* No uses demasiados modelos de alta poligonización;
* Desactiva las colisiones en modelos que no necesiten colisión;
* Si solo una pequeña parte de la escena será visible en tus transmisiones, desactiva o elimina el resto de la escena si es posible;
* Usa tan pocas luces en tiempo real como sea posible, y usa luces pre-calculadas siempre que sea posible.

:::warning

**No agregues más de un recurso "Camera"** en la escena, de lo contrario aumentará la carga de rendimiento del entorno e incluso puede causar errores.

:::

### Paso 2: Pre-calcular Iluminación (Opcional)

Generalmente recomendamos pre-calcular la iluminación en la escena, ya que puede mejorar significativamente la calidad visual y el rendimiento de tu mod de entorno.

:::warning

Actualmente, el pre-cálculo de materiales **"Standard"** **no es compatible** en el Pipeline de Renderizado Integrado (BiRP) de Unity.  
Si necesitas pre-calcular lightmaps, se recomienda usar otros materiales para obtener mejores resultados.

:::

#### Lightmapper Integrado de Unity

La mayoría de las veces, usar el lightmapper integrado de Unity es suficiente.

Ten en cuenta que Warudo usa lightmaps direccionales, así que asegúrate de que el **Modo Direccional** esté configurado en **Direccional** en **Windows → Rendering → Lighting**:

![](/doc-img/en-environment-mod-1.webp)

De lo contrario, la iluminación en la escena puede ser incorrecta.

:::info

Si la escena ya tiene lightmaps pre-calculados, después de cambiar el modo direccional de lightmapping, necesitas hacer clic en **Generate Lighting** para volver a pre-calcular los lightmaps.

:::

#### Bakery

También puedes usar [Bakery](https://assetstore.unity.com/packages/tools/level-design/bakery-gpu-lightmapper-122218), un lightmapper de terceros, siempre que pre-calcules lightmaps direccionales. Por ejemplo, en Bakery, [puedes configurar **Directional Mode** a Dominant Direction o MonoSH](https://geom.io/bakery/wiki/index.php?title=Manual#Directional\_mode).

Para asegurar que Bakery funcione correctamente con Warudo, sigue estos pasos:

1. Copia la carpeta `Bakery` en tu carpeta de mod (por defecto debería estar en la raíz de `Assets`);
2. En la configuración de Bakery, marca **Use scene named output path**. Esto asegura que los lightmaps de Bakery se almacenen en la carpeta del mod. Para **Directional Mode**, debes elegir uno que genere lightmaps direccionales, como Dominant Direction o MonoSH;
3. Haz clic en **Render** para renderizar los lightmaps. Luego, haz clic en **Render reflection probes** si también quieres pre-calcular sondas de reflexión;
4. **Importante:** Ve a la carpeta `Bakery/_tempScene` y elimina la escena de Unity `_tempScene` que se generó durante el pre-cálculo.

### Paso 3: Agregar Script `EnvironmentSettings`

Abre la escena de Unity que quieres exportar y agrega el script `EnvironmentSettings` (incluido en Warudo SDK) a un nuevo GameObject o cualquier GameObject existente. Haz clic en el botón `Copy from current environment settings`. Este script almacena la configuración del entorno de Unity para que el skybox, color de sombra, etc. se exporten al mod de entorno.

### Paso 4: Renombrar Escena

Nombra la escena **"Environment"** y asegúrate de que la escena esté ubicada en la carpeta del mod (puede colocarse en cualquier subcarpeta).

### Paso 5: Exportar Mod

Selecciona **Warudo → Build Mod** y asegúrate de que el archivo `.warudo` generado se coloque en la carpeta de datos `Environments`.

## Solución de Problemas

Crear un mod de entorno es definitivamente más complicado que crear otros tipos de mods, así que si notas que el entorno en Warudo no se ve como el de tu editor, puedes revisar esta lista para ver si te perdiste algo:

* ¿Colocaste el script `EnvironmentSettings` en un GameObject en la escena?
* ¿Te aseguraste de que la escena se llame **"Environment"**?
* ¿Te aseguraste de que todos los materiales, shaders, etc. estén incluidos en la carpeta del mod?
* Si usas iluminación pre-calculada, ¿te aseguraste de que los lightmaps y el asset `LightingSettings` estén incluidos en la carpeta del mod?
* Si usas iluminación pre-calculada, ¿te aseguraste de que haya solo **un** conjunto de lightmaps y asset `LightingSettings` en la carpeta del mod?

:::caution

Algunos usuarios han reportado que tener múltiples conjuntos de lightmaps y assets `LightingSettings` puede causar problemas, incluso si están fuera de la carpeta del mod. Intenta eliminar todos excepto un conjunto de lightmaps y asset `LightingSettings` si todo lo demás falla.

:::

* Si usas iluminación pre-calculada, ¿se configuró el modo direccional de lightmap a Direccional? (O Dominant Direction / MonoSH si usas Bakery)
* ¿Tenías más de una escena de Unity en la carpeta del mod? Si es así, elimina las otras escenas. (Puede haber escenas dentro de subcarpetas, ¡así que asegúrate de revisar todas tus subcarpetas!)
* ¿Tu escena tenía prefabs con cambios no aplicados? Si es así, aplica los cambios. Si ves las líneas verticales (lo que significa que los cambios no se pudieron aplicar completamente), haz clic derecho en ellos y selecciona **Prefab → Unpack Completely** para desempaquetar los prefabs, y exporta el mod nuevamente.

![](/doc-img/en-environment-mod-2.webp)

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
    {name: 'hanekit', github: 'hanekit'}
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'}
  ],
}} />
