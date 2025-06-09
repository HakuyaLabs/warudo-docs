---
sidebar_position: 60
---

# Reproductor de Música

:::info
Esta característica está actualmente en beta.
:::

El asset del reproductor de música es un reproductor de música simple que puede reproducir archivos de música en Warudo. Puede ser útil para transmisiones de karaoke ya que descarga y muestra las letras de la canción que se está reproduciendo automáticamente.

![](/doc-img/en-music-player-1.png)
<p class="img-desc">Reproduciendo música con letras.</p>

## Configuración

Haz clic en **Open Music Folder** para abrir la carpeta de música. Luego puedes copiar tus archivos de música en la carpeta. El reproductor de música soporta archivos MP3, WAV y OGG.

El reproductor de música descargará automáticamente las letras de la canción que se está reproduciendo. Si las letras no coinciden con la canción, puedes buscar manualmente las letras haciendo clic en el botón **Search Online Lyrics**, o poner un archivo de letras `.lrc` con el mismo nombre que el archivo de música en la carpeta de música.

:::caution
Si estás usando Universal RP, debes seleccionar una **Camera** para que las letras se muestren en la salida NDI/Spout/cámara virtual.
:::

:::caution
Ten en cuenta que la función de letras en línea puede devolver resultados con letras bilingües, usualmente el idioma original y chino. Estaremos agregando una opción para mostrar solo letras en el idioma original en el futuro.
:::

## Imagen de Título

Puedes agregar una línea al comienzo del archivo de letras para especificar la imagen de título. Por ejemplo, si tienes una canción llamada `Music.mp3` y una imagen de título llamada `Title.png`, puedes agregar lo siguiente a `Music.lrc`:

```
[warudo.title:00:22.50,1.5,5,1.5,0,0,1500,700]
```

Esto le dice a Warudo que muestre tu imagen de título a los 22.5 segundos de la canción, con una duración de aparición gradual de 1.5 segundos, una duración de 5 segundos, y una duración de desaparición gradual de 1.5 segundos. Los últimos dos números son el ancho y alto de la imagen de título en píxeles.

![](/doc-img/en-music-player-2.png)
<p class="img-desc">Mostrando una imagen de título.</p>

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'}
  ],
}} />
