---
sidebar_position: 20
---

# Contribución de Documentación

:::tip
¡El Handbook de Warudo ahora es de código abierto en Github, échale un vistazo!<br />
https://github.com/HakuyaLabs/warudo-docs/
:::

Mientras usas las características flexibles de Warudo, documentación clara y comprensible es esencial para que todos puedan usar Warudo fácilmente.

El handbook de Warudo usa con orgullo [Docusaurus](https://docusaurus.io/) como framework del sitio, y el contenido está escrito en [Markdown](https://www.markdownguide.org/). Hemos agregado algunas características fantásticas que proporcionan función de ayuda en la aplicación en la app de Warudo.

El handbook de Warudo es un proyecto de código abierto. Si encuentras algo difícil de entender o quieres proporcionar contenido nuevo, como tutoriales o guías, siéntete libre de crear issues en GitHub, o contribuir directamente enviando código o traducciones al proyecto de GitHub. ¡Tu nombre aparecerá en la lista de contribuidores al final de la documentación!


## Cómo Contribuir

### Proporcionar Retroalimentación y Sugerencias vía GitHub Issues

Proporcionar retroalimentación directamente a través de GitHub Issues es una forma directa y simple. Hemos configurado algunas plantillas de issues para ayudar a enviar problemas.<br />
https://github.com/HakuyaLabs/warudo-docs/issues

consejo: La retroalimentación aquí es para el sitio del handbook de Warudo. Para discusiones sobre el software Warudo en sí, siéntete libre de unirte a los canales de Discord.<br />
https://discord.gg/warudo

### Enviar Código y Convertirse en Contribuidor

Si estás familiarizado con Git y herramientas de desarrollo, puedes enviar directamente un Merge Request en GitHub para contribuir código.<br />

Si no estás familiarizado, no te preocupes. El siguiente contenido te guiará sobre cómo ejecutar una versión local del Handbook de Warudo y hacer tus propias modificaciones.

## Detalles Técnicos

### Estructura de Directorios

| Ruta | Contenido |
|--|--|
| `/docs` | Documentos en inglés (principal) |
| `/i18n/zh/docusaurus-plugin-content-docs/current` |  Documentos en chino (traducción) |
| `/i18n/jp/docusaurus-plugin-content-docs/current` |  Documentos en japonés (traducción) |
| `/i18n/es/docusaurus-plugin-content-docs/current` |  Documentos en español (traducción) |

Los archivos de versiones que no están en inglés deben tener exactamente la misma estructura que la versión en inglés para que el cambio de idioma funcione correctamente.

:::tip

La barra de navegación del lado izquierdo también es generada por los archivos de la versión en inglés, 
Se recomienda copiar cada archivo en la carpeta `/docs` a `/i18n/[lang]/docusaurus-plugin-content-docs/current` y asegurarse de que cada archivo esté alineado en diferentes idiomas.

:::



### Comandos

| Comando | Descripción |
|--|--|
| `yarn` | Instalar dependencias |
| `yarn start:en` |  Iniciar versión en inglés |
| `yarn start:zh` | Iniciar versión en chino |
| `yarn start:jp` | Iniciar versión en japonés |
| `yarn start:all` | Iniciar multiversión en diferentes puertos |
|`yarn build` | Construir sitio |

 
## Ejecutando sitio de desarrollo local

Si no estás familiarizado con el desarrollo, no te preocupes, comencemos.


<details>

<summary>Tutorial de desarrollo de documentación</summary>

### Preparar entorno

Primero, descarga el runtime.

 - Node.js download: https://nodejs.org/en/download/  
	<small>Node.js is the programming language we used. </small> <br />
	<small>Select LTS version - installer (.msi/.exe for Windows, .pkg for macOS).</small> 
 - Descarga de GitHub Desktop: https://desktop.github.com/  
    <small>GitHub Desktop es un excelente software de control de versiones para que gestionemos y confirmemos cambios.</small>

 - Descarga de VSCode: https://code.visualstudio.com/  
	<small>VSCode es un editor común que funciona genial para sitios front-end como este, también puedes usar otros editores de texto.</small>

### Usando línea de comandos

 - Para Windows, usa `Win+R` e introduce `cmd` para abrir la terminal.

 - Para macOS, usa la aplicación `Terminal` en tu launchpad.

Después de la instalación, deberías poder usar el comando `node -v` para ver la versión de node.js en la terminal.

### Configurar el proyecto usando GitHub desktop
 - Iniciar sesión con cuenta de Github

 - Buscar `HakuyaLabs/warudo-docs` 

 - Clonar proyecto  
   <small>Entonces el proyecto habrá sido descargado a tu computadora.</small>

 - Hacer clic en `Current branch` - `New branch` - introducir nombre - `Create branch`    
   <small>Para que puedas editar archivos en tu rama independiente.</small>

 - Hacer clic en `Publish branch`  
   <small>Todos deberían ver tu rama y estás listo para comenzar a editar.</small>

### Ejecutar sitio local

Abre la terminal.

 - **`cd <ruta_para_tu_carpeta_dev>`**  
   <small>Navegar a la carpeta donde colocamos los archivos del sitio.</small>

 - **`corepack enable`**   
   <small>That set up package manager we used for node.js.</small><br />
   <small>*Usually you just need run this command once.*</small>

 - **`yarn`**  
   <small>Install dependencies.</small><br />
   <small>*When project dependencies (package.json) updated, re-run this command is necessary.*</small>

 - **`yarn start:en`** Start EN version  
   **`yarn start:zh`** Start ZH version  
   **`yarn start:all`** Start multi-version at different port  

¡Entonces todo está listo, puedes ver el sitio local en tu máquina!  
Cuando cambies y guardes los docs, el navegador se actualizará automáticamente.  
¡Pruébalo, y adelante, comienza a editar archivos de documentación!  

### Comenzar a editar

 - Edita archivos markdown y verifica la página en vivo en el navegador

La mayoría de archivos de documentación se guardan como .md o .mdx, conocidos como archivos [Markdown](https://www.markdownguide.org/),   
que es solo texto plano con algo de código de formato en él.

### Confirmar y subir tus cambios

Después de guardar todos los archivos que cambiaste.   

 - Abre GitHub desktop, entonces puedes ver todos los cambios en el lado izquierdo.  
  Marca todos los archivos cambiados que quieres confirmar.  
  Introduce un resumen, y haz clic en `Commit`.  

 - Has confirmado tus cambios y deberías verlo en el panel `History`.  

 - Pero está solo en tu computadora ahora mismo.  
  Para publicar en Github, haz clic en `Push Origin`.  

 - ¡Genial! Todos deberían verlo en github.

 ### Contactar Miembros de Mantenimiento del Manual de Warudo para Revisión y Publicación
 - ¡Envía un pull request y contacta a los miembros de mantenimiento de la documentación en la comunidad para fusionar tus cambios y publicarlos!

</details>

## Agrega Tu Propio Nombre

Al final de cada documento, hay una sección de código que marca a los editores del documento. Cuando modifiques o completes un documento, no olvides agregar tu nombre aquí. El avatar será obtenido automáticamente a través de tu ID de GitHub.
```
<AuthorBar authors={{
  creators: [
    {name: 'Tu Nombre', github: 'Tu ID de GitHub'},
  ],
  translators: [
    {name: 'Tu Nombre', github: 'Tu ID de GitHub'},
  ],
}} />
```

<AuthorBar authors={{
  creators: [
    {name: 'Nekotora', github: 'Nekotora'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
