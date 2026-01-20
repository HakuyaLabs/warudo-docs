---
sidebar_position: 60
translate_from_version: 2023-12-27
---
# Pantalla

Captura tu escritorio o una ventana y muéstrala en la escena igual que OBS. ¡También puedes mostrar imágenes, videos e incluso páginas web!

![](/doc-img/zh-screen-1.webp)
<p class="img-desc">¡Pantallas curvas!</p>

## Configuración

Dependiendo del **Content Type** que configures, una pantalla puede mostrar:
* una imagen (**Image**)
* un video (**Video**)
* una página web (**Browser**)
* tu escritorio (**Display**)
* una ventana (**Window**)
* una fuente NDI (**NDI**)
* una fuente Spout (**Spout**)

¡Así que es bastante versátil!

## Tipos de Contenido

### Imagen

Cuando **Content Type** está configurado en **Image**, puedes especificar un **Image Source** para mostrar una imagen. La imagen puede ser un archivo JPG, PNG, GIF o WEBP. Las imágenes transparentes son soportadas.

### Video

Cuando **Content Type** está configurado en **Video**, puedes especificar un **Video Source** para mostrar un video. Los principales formatos de video son soportados; los videos MP4 transparentes también son soportados. Puedes habilitar **Auto Play** para reproducir automáticamente el video cuando se carga la escena.

### Navegador

Cuando **Content Type** está configurado en **Browser**, puedes especificar una **URL** para mostrar una página web. También puedes especificar una hoja de estilo **Custom CSS** para insertarla en la página web después de cargar. Esto te permite colocar widgets de chat personalizados en el espacio 3D:

![](/doc-img/zh-screen-2.webp)
<p class="img-desc">¡Chat en vivo en 3D!</p>

### Monitor

Cuando **Content Type** está configurado en **Display**, puedes especificar un **Display** (monitor) para mostrar.

### Ventana

Cuando **Content Type** está configurado en **Window**, puedes especificar una **Window** para mostrar. Ten en cuenta que la ventana se captura usando el título de la ventana, así que si tienes múltiples ventanas con el mismo título, solo una de ellas será capturada.

### NDI

Cuando **Content Type** está configurado en **NDI**, puedes especificar un **NDI Source** para mostrar. Esto te permite mostrar la salida de otras aplicaciones que soportan NDI.

### Spout

Cuando **Content Type** está configurado en **Spout**, puedes especificar un **Spout Source** para mostrar. Esto te permite mostrar la salida de otras aplicaciones que soportan Spout.

## Apariencia

La pantalla es curvada por defecto. Puedes deshabilitar **Bend** para hacerla plana. También puedes ajustar el **Bend Radius** para cambiar la curvatura de la pantalla. El **Thickness** controla el grosor de la pantalla; el lado de la pantalla mostrará el color del borde del contenido.

Puedes recortar los cuatro lados de la pantalla usando la configuración **Crop**; cada valor es un porcentaje del ancho/alto de la pantalla. También puedes hacer que las cuatro esquinas de la pantalla sean redondeadas ajustando **Corner Radius**.

**Tint** te permite ajustar el tono general de la pantalla. Cuando el alfa del tinte es menor que 1, la pantalla se volverá semi-transparente.

Puedes establecer un color **Chroma Key** para hacer transparente el color correspondiente en la pantalla. Esto es útil para mostrar el stream de un compañero de colaboración en la escena, por ejemplo.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />

### Spout

Cuando **Content Type** está configurado en **Spout**, puedes especificar un **Spout Source** para mostrar. Esto te permite mostrar la salida de otras aplicaciones que soportan Spout.

## Apariencia

La pantalla es curvada por defecto. Puedes deshabilitar **Bend** para hacerla plana. También puedes ajustar el **Radio de Curvatura** para cambiar la curvatura de la pantalla. El **Grosor** controla el grosor de la pantalla; el lateral de la pantalla mostrará el color del borde del contenido.

Puedes recortar los cuatro lados de la pantalla usando la configuración **Crop**; cada valor es un porcentaje del ancho/alto de la pantalla. También puedes hacer que las cuatro esquinas de la pantalla sean redondeadas ajustando **Radio de Esquina**.

**Tint** te permite ajustar el matiz general de la pantalla. Cuando el alfa del tinte es menor que 1, la pantalla se volverá semi-transparente.

Puedes establecer un color **Chroma Key** para hacer transparente el color correspondiente en la pantalla. Esto es útil para mostrar el stream de un compañero de colaboración en la escena, por ejemplo.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
