---
sidebar_position: 0
---

# Visión General

:::tip
Esta sección profundiza en las APIs de scripting de Warudo. No necesitas estar familiarizado con cada detalle para comenzar a hacer scripts en Warudo, ¡pero recomendamos al menos echar un vistazo a esta sección para tener una idea de cómo funcionan las cosas!
:::

Warudo son dos aplicaciones en una: el editor y el runtime (lo llamamos la _ventana principal_ en las secciones no programadoras de este manual). El editor es donde creas y editas escenas: actualizas configuraciones de assets y plugins, agregas y conectas nodos en blueprints, etc. El runtime actúa como un motor de renderizado/scripting y ejecuta las escenas que creas.

![](/doc-img/en-scripting-concepts-1.png)
<p class="img-desc">El editor (derecha) y el runtime (izquierda).</p>

El editor y runtime se comunican entre sí a través de una conexión WebSocket. Cuando haces cambios en el editor, los cambios se envían al runtime, que luego actualiza la escena en consecuencia. Esta arquitectura te permite ver los cambios que haces en tiempo real. Por el contrario, cuando haces cambios en el runtime (ej., cambiar la entrada de datos de un nodo programáticamente), los cambios necesitan ser enviados de vuelta al editor (consulta [Accediendo Entradas de Datos](ports-and-triggers#accessing-data-inputs)).

El runtime de Warudo está construido usando [Unity 2021.3](https://unity.com/); sin embargo, el framework central está diseñado para ser lo más agnóstico al motor posible, lo que permite que nodos, assets, y plugins interactúen entre sí y con el usuario a través de un conjunto de APIs simples y limpias, así como habilitando características como [recarga en caliente](../playground).

En lugar de escribir clases C# que deriven de `MonoBehaviour` en proyectos típicos de Unity, escribirás clases que deriven de las clases base de Warudo como `Node` y `Asset`. Estas clases son luego instanciadas y gestionadas por el runtime de Warudo. Luego, dentro de estas clases, puedes llamar APIs de Unity para interactuar con la escena de Unity, como crear GameObjects, agregar componentes, etc.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
