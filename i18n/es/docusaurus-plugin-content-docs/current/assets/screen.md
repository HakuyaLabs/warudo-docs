---
sidebar_position: 60
---
# Screen

Capture your desktop or a window and display it in the scene just like OBS. You can also display images, videos and even webpages!

![](/doc-img/zh-screen-1.webp)
<p class="img-desc">Curved screens!</p>

## Setup

Depending on the **Content Type** you set, a screen can display:
* an image (**Image**)
* a video (**Video**)
* a webpage (**Browser**)
* your desktop (**Display**)
* a window (**Window**)
* a NDI source (**NDI**)
* a Spout source (**Spout**)

So it is quite versatile!

## Content Types

### Image

When **Content Type** is set to **Image**, you can specify an **Image Source** to display an image. The image can be a JPG, PNG, GIF, or WEBP file. Transparent images are supported.

### Video

When **Content Type** is set to **Video**, you can specify a **Video Source** to display a video. Major video formats are supported; transparent MP4 videos are also supported. You can enable **Auto Play** to automatically play the video when the scene is loaded.

### Browser

When **Content Type** is set to **Browser**, you can specify a **URL** to display a webpage. You can also specify a **Custom CSS** stylesheet to be inserted into the webpage after loading. This allows you to place custom chat widgets in the 3D space:

![](/doc-img/zh-screen-2.webp)
<p class="img-desc">Live chat in 3D!</p>

### Display

When **Content Type** is set to **Display**, you can specify a **Display** (monitor) to display. 

### Window

When **Content Type** is set to **Window**, you can specify a **Window** to display. Note the window is captured using the window title, so if you have multiple windows with the same title, only one of them will be captured.

### NDI

When **Content Type** is set to **NDI**, you can specify an **NDI Source** to display. This allows you to display the output of other applications that support NDI.

### Spout

When **Content Type** is set to **Spout**, you can specify a **Spout Source** to display. This allows you to display the output of other applications that support Spout.

## Appearance

The screen is by default curved. You can disable **Bend** to make it flat. You can also adjust the **Bend Radius** to change the curvature of the screen. The **Thickness** controls the thickness of the screen; the side of the screen will display the edge color of the content.

You can crop the four sides of the screen using the **Crop** settings; each value is a percentage of the screen's width/height. You can also make the four corners of the screen rounded by adjusting **Corner Radius**.

**Tint** allows you to adjust the overall hue of the screen. When the tint's alpha is less than 1, the screen will become semi-transparent.

You can set a **Chroma Key** color to make the corresponding color in the screen transparent. This is useful for displaying a collab partner's stream in the scene, for example.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
