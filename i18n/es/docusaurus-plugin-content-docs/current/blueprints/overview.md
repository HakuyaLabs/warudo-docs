---
sidebar_position: 10
---

# Resumen

![](/doc-img/blueprints-cover.jpg)

Los blueprints son un sistema de scripting visual flexible y poderoso que permite a cualquiera crear interacciones únicas para su configuración de VTubing, utilizando conceptos y herramientas que típicamente están reservadas para programadores. Los blueprints se crean y editan usando el editor de Warudo, y todos los cambios se reflejan en tiempo real en la escena.

Un blueprint es, básicamente, un diagrama de flujo. Define **"Cuando X sucede, hacer Y."** Veamos algunos ejemplos sencillos:

* Cuando presiono la tecla Esc, sacudir la cámara.
* Cuando recibo un mensaje de Twitch que contiene "beep boop", reproducir un sonido beep boop.
* Cuando grito fuerte, mi personaje es lanzado al aire.

¿No es inspirador? ¿Qué tal estos?:

* Cuando abro mi boca, mi personaje [comienza a respirar fuego](https://twitter.com/MVjagaimo/status/1725869971845333173/video/1). (Por [@MVjagaimo](https://twitter.com/MVjagaimo))
* Cuando presiono una tecla, mi personaje [camina a otro lugar en la habitación, con la cámara siguiendo al personaje](https://twitter.com/FelineEntity/status/1730225167572615582). (Por [@FelineEntity](https://twitter.com/FelineEntity))
* Cuando presiono WASD, mi personaje [conduce un camión](https://twitter.com/sablokato/status/1731679138677768700). (Por [@sablokato](https://twitter.com/sablokato))
* Cuando recibo un canje de Twitch, mi personaje [gira y cae como un muñeco de trapo al aire](https://twitter.com/Shellbunny_/status/1712629869488853260). (Por [@Shellbunny_](https://twitter.com/Shellbunny_))
* Cuando toco mis dedos índices juntos, se [genera una chispa eléctrica entre ellos](https://twitter.com/hakuyalabs/status/1724364814158360767). (Por [@HakuyaTira](https://twitter.com/hakuyatira))
* Cuando mi personaje golpea un prop con la mano, el prop es [impulsado lejos](https://twitter.com/FelineEntity/status/1727379837185319176). (Por [@FelineEntity](https://twitter.com/FelineEntity))
* Cuando empujo mis manos juntas, el [prop Ring Fit es apretado](https://twitter.com/VanJiha_Vtuber/status/1737645095095341397/video/1). (Por [@VanJiha_Vtuber](https://twitter.com/VanJiha_Vtuber))
* Cuando presiono botones en mi controlador MIDI, los [botones en mi controlador MIDI virtual se iluminan](https://twitter.com/ChiuYukina/status/1734913824086729149). (Por [@ChiuYukina](https://twitter.com/ChiuYukina))
  ...

¡Las posibilidades son infinitas! Puedes encontrar y compartir blueprints pre-hechos en nuestro [Discord](https://discord.gg/warudo) de la comunidad, o crear tus propios blueprints desde cero. Esta sección del manual te guiará a través de los conceptos básicos de los blueprints, te proporcionará algunos ejemplos para empezar, y profundizará en temas más avanzados.

:::tip
Los blueprints en Warudo no son solo una novedad; más bien, son una parte crucial de su arquitectura. Por ejemplo, la captura de movimiento en Warudo está implementada completamente usando blueprints. Esto asegura actualizaciones y mejoras continuas al sistema de blueprints, proporcionando una variedad en expansión de tipos de nodos para posibilidades de combinación infinitas.
:::

:::info
Si eres un desarrollador, te alegrará saber que puedes extender el sistema de blueprints de Warudo agregando nuevos tipos de nodos! Por favor consulta la sección [Scripting](../scripting/overview) para más detalles.
:::

## Interfaz

En la pestaña **Blueprints**, puedes ver una lista de todos los blueprints en la escena. Puedes seleccionar un blueprint para editarlo en el editor de nodos; luego, puedes arrastrar nodos desde la pestaña **Node Palette**, o modificar las propiedades del blueprint seleccionado en la pestaña **Properties**.

![](/doc-img/en-blueprints-1.png)
<p class="img-desc">Resumen.</p>

La barra de herramientas tiene los siguientes botones:
* **Add Blueprint**: Agregar un nuevo blueprint a la escena.
* **Remove Blueprint**: Eliminar el blueprint seleccionado de la escena.
* **Duplicate Blueprint**: Duplicar el blueprint seleccionado.
* **Rename Blueprint**: Renombrar el blueprint seleccionado.
* **Format Blueprint**: Formatear el blueprint seleccionado, es decir, organizar automáticamente los nodos.
* **Import Blueprint From Clipboard**: Importar un blueprint desde el portapapeles.
* **Export Blueprint To Clipboard**: Exportar el blueprint seleccionado al portapapeles.
* **Import Blueprint From File**: Importar un blueprint desde un archivo JSON.
* **Export Blueprint To File**: Exportar el blueprint seleccionado a un archivo JSON.

:::tip
Puedes usar la función de importar/exportar para copiar blueprints entre escenas.
:::

Para navegar en el editor de nodos, puedes usar **Botón Izquierdo del Mouse** para desplazarte, **Rueda del Mouse** para hacer zoom, y **Botón Derecho del Mouse** para seleccionar múltiples nodos. Cuando uno o más nodos están seleccionados, puedes usar **Botón Izquierdo del Mouse** para arrastrarlos, y **Delete** para eliminarlos. También puedes usar **Ctrl+C** y **Ctrl+V** para copiar y pegar nodos seleccionados.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'}
  ],
}} />
