---
sidebar_position: 60
---

# Music Player

:::info
This feature is currently in beta.
:::

The music player asset is a simple music player that can play music files in Warudo. It can be useful for karaoke streams as it downloads and displays the lyrics for the currently playing song automatically.

![](pathname:///doc-img/en-music-player-1.png)
<p class="img-desc">Playing music with lyrics.</p>

## Setup

Click **Open Music Folder** to open the music folder. You can then copy your music files into the folder. The music player supports MP3, WAV, and OGG files.

The music player will automatically download lyrics for the currently playing song. If the lyrics do not match the song, you can  manually search for lyrics by clicking the **Search Online Lyrics** button, or put a `.lrc` lyrics file with the same name as the music file in the music folder.

:::caution
If you are using Universal RP, you must select a **Camera** to have the lyrics shown in the NDI/Spout/virtual camera output.
:::

:::caution
Note that the online lyrics feature may return results with bilingual lyrics, usually the original language and Chinese. We will be adding an option to only show lyrics in the original language in the future.
:::

## Title Image

You can add a line at the beginning of the lyrics file to specify the title image. For example, if you have a song named `Music.mp3` and a title image named `Title.png`, you can add the following to `Music.lrc`:

```
[warudo.title:00:22.50,1.5,5,1.5,0,0,1500,700]
```

This tells Warudo to show your title image at 22.5 seconds into the song, with a fade in duration of 1.5 seconds, a duration of 5 seconds, and a fade out duration of 1.5 seconds. The last two numbers are the width and height of the title image in pixels.

![](pathname:///doc-img/en-music-player-2.png)
<p class="img-desc">Showing a title image.</p>
