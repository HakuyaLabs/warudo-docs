---
sidebar_position: 41
---

# Mod de Partículas

Un mod de partículas es generalmente un [sistema de partículas](https://docs.unity3d.com/Manual/PartSysReference.html) que puede usarse en nodos como **Spawn Particle**.

## Configuración

### Paso 1: Preparar Modelo

Coloca tu GameObject de partículas en la escena, luego ajústalo a la posición y rotación deseadas. Haz clic derecho y selecciona **Create Empty Parent** para crear un GameObject vacío como raíz del prop.

Entra en Modo de Juego y mueve el GameObject padre; asegúrate de que el sistema de partículas esté emitiendo partículas como se espera. Si no es así, puede que necesites ajustar la configuración del sistema de partículas, como establecer **Simulation Space** en Local en lugar de World.

### Paso 2: Crear Prefab

Selecciona el GameObject de partículas raíz y arrástralo a la carpeta del mod para crear un prefab. Nombra el prefab **"Particle"** y asegúrate de que esté ubicado en la carpeta del mod (puede colocarse en cualquier subcarpeta).

### Paso 4: Exportar Mod

Selecciona **Warudo → Build Mod** y asegúrate de que el archivo `.warudo` generado se coloque en la carpeta de datos `Particles`.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'}
  ],
}} />
