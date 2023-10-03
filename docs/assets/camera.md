---
sidebar_position: 50
---

# Camera

Cameras are... well, cameras!

## Multiple Cameras

Warudo's supports up to 8 cameras in a single scene.


![](pathname:///doc-img/en-camera-1.webp)
<p class="img-desc">Using the Spout and NDI output features, you can achieve a multi-camera setup in OBS.</p>

## Main Camera

The "Main Camera" refers to the camera that is rendered in the main window and can be controlled using the keyboard and mouse.

There are two ways to switch the main camera:

1. When the main window is focused, press Tab / Ctrl Tab to switch the main camera to the next / previous camera in the scene;
2. In the configuration window, click the icon on the left side of any camera to set that camera as the main camera.

## Properties

### Controls

* Control Mode:
  * None: Camera is fixed in place.
  * Free Look: Similar to the camera in the Unity Editor, when right-clicking the mouse, use WASD to move, E and Q to ascend and descend, and Shift to speed up. Use the middle mouse button to pan the view.
  * Orbit Character: Camera orbits around the character. Left or right mouse click to rotate the view, use the mouse wheel to zoom in and out, and the middle mouse button to pan the view.
* Control Sensitivity: Speed of camera movement.
* Focus Character: The character the camera will focus on when "Control Mode" is set to "Orbit Character". It is also the character the camera will focus on when "Depth of Field" -> "Focus Character" is enabled.
* Follow Character Speed: Speed of camera following character when "Control Mode" is set to "Orbit Character".
* Show Gizmos: Whether to display the transform gizmos.

![](pathname:///doc-img/en-camera-2.webp)

:::tip
You can turn on/off the main camera's gizmos at any time by pressing the **G key** when the main window is focused.
:::

:::info
If you need to use Warudo during a livestream, it is recommended to turn off the gizmos before starting the stream.

A better solution would be to create a dedicated camera view for the audience which outputs to a livestreaming software like OBS using NDI or Spout. This way, you can continue to make adjustments to the scene using the main window without worrying about affecting the viewing experience.
:::

* Reset Camera Transform: Reset the camera's position and rotation to default.

### Output

* Spout Output: Sends a video stream to a [Spout](https://github.com/leadedge/Spout2) receiver on the same machine.
* Spout Output Name: The name of the Spout output.

:::info
To use Spout output in [OBS](https://obsproject.com/), install the [obs-spout2-plugin](https://github.com/Off-World-Live/obs-spout2-plugin/releases) and add a Spout2 Capture source.
:::

* NDI Output: Sends a video stream to an [NDI](https://www.ndi.tv) receiver on another machine within the same network.
* NDI Output Name: The name of the NDI output.

:::info
To use NDI output in [OBS](https://obsproject.com/), install the [obs-ndi](https://github.com/Palakis/obs-ndi) plugin and add an NDI™ Source.
:::

:::info
When to use Spout and when to use NDI? Simply put, use NDI if you want to output the screen to another device within the same network and use Spout if you only want to output the screen to another program on the same PC (such as OBS). Spout is recommended for its lower resource usage and latency.
:::

* Virtual Camera Output: Outputs the video to a Warudo virtual camera.
* Mirror Virtual Camera Output: Whether to flip the virtual camera output horizontally.
* Screenshot: Takes a screenshot and saves it in the Screenshots subfolder in the data folder.

:::tip
**Spout output, NDI output, virtual camera output, and screenshots all support transparency!** Simply enable the chroma key (see below) and set the alpha value of the chroma key color to 0.
:::

:::info
When using Spout output in OBS, set the Composite Mode in the Spout2 Capture properties to Premultiplied Alpha to achieve transparency.

![](pathname:///doc-img/en-camera-3.webp)
:::

:::info
When using virtual camera output in OBS, set the Video Format in the Video Capture Device properties to ARGB to achieve transparency.

![](pathname:///doc-img/en-camera-4.webp)
:::

### Basic Properties

* Use Chroma Key: Whether to show a solid color instead of the skybox.&#x20;

:::caution
Even when chroma key is enabled, the [environment ](environment.md)in the scene will still be visible.&#x20;
:::

* Chroma Key Color: The solid color displayed as the background when "Use Chroma Key" is enabled.
* Field of View: The field of view of the camera.
* Orthographic Projection: Whether to use orthographic projection.

![](pathname:///doc-img/en-camera-5.webp)

### Handheld Movement

* Intensity: The range of movement for the handheld camera effect.
* Speed: The speed of movement for the handheld camera effect.

### Tonemapping & Color Grading

* LUT Texture: Adjust the colors of the scene with a LUT texture to create the desired vibes.


![](pathname:///doc-img/en-camera-6.webp)

:::tip
**Warudo has over 200 built-in LUT textures** that you can choose from. Try picking the right one for your environment to give off great vibes!
:::

* LUT Intensity: The strength of the LUT texture's effect on the image.
* Vibrance: The saturation of the image's colors.
* Contrast: The contrast of the image's colors.
* Brightness: The brightness of the image's colors.
* Tint: An additional tint that is overlayed onto the image.

### Bloom

The bloom effect creates a halo effect around the bright parts of the image.

![](pathname:///doc-img/en-camera-7.webp)

* Strength: The intensity of the bloom effect.
* Threshold: The lower the threshold, the more areas that are not as bright in the image will also emit a bloom effect.
* Tone: The color of the bloom effect.
* Depth Attenuation: The degree to which the intensity of the bloom effect decreases with distance.
* Near Attenuation Distance: The bloom effect produced by bright parts of objects within this distance will be attenuated.
* High Quality: Whether to improve the rendering quality of the bloom effect at cost of performance.

### Ambient Occlusion

Adds more shadow to the scene for a more realistic visual effect (in most cases).


![](pathname:///doc-img/en-camera-8.webp)

:::info
For anime models (especially when the face mesh is not completely flat), enabling ambient occlusion is not recommended.


![](pathname:///doc-img/en-camera-9.webp)
:::

* Radius: The radius of the shadow.
* Max Radius Pixels: The maximum pixels for shadow sampling. If your character shadow looks strange, try to adjust this value.
* Intensity: The intensity of the shadow.
* Color: The color of the shadow.
* High Quality: Whether to improve the rendering quality of the ambient occlusion at cost of performance.

### Anamorphic Flares

Provides the horizontal/vertical flare effect of a distorted lens.


![](pathname:///doc-img/en-camera-10.webp)

* Intensity: The intensity of the flares.
* Threshold: The lower the threshold, the more areas that are not as bright in the image will emit flares.
* Tint: The color of the flares.
* Spread: The extent to which the flares overflow.
* Vertical Flares: Whether the light overflows vertically instead of horizontally.
* High Quality: Whether to improve the rendering quality of the anamorphic flares at cost of performance.

### Depth Of Field

Blur objects that are not in focus.

![](pathname:///doc-img/en-camera-11.webp)

* Focus Character: Whether the camera should automatically focus on the character selected in "Controls" -> "Focus Character".
* Focusing Distance: The distance between the focus and the camera.
* Focusing Speed: The speed at which the focus will be re-acquired when the focus object changes distance and becomes out of focus.
* Focal Length: The larger the value, the blurrier the objects outside the depth of field will be.
* Aperture: The larger the value, the blurrier the objects outside the depth of field will be.
* Bokeh Effect: The spread of color on objects outside the depth of field.
* Bokeh Effect Threshold: The threshold for the bokeh effect.
* Bokeh Effect Strength: The strength of the bokeh effect.
* High Quality: Whether to improve the rendering quality of the depth of field at cost of performance.

### Chromatic Aberration

Mimics the effect produced when a lens is unable to blend all colors to the same point.

![](pathname:///doc-img/en-camera-12.webp)

* Intensity: The strength of the chromatic aberration.
* Smoothing: The higher the value, the smoother the transition between the chromatic aberration and the original color.

### Lens Dirt

Simulates dirt and specks on the lens.


![](pathname:///doc-img/en-camera-13.webp)

* Texture: The texture of the lens dirt and specks.
* Intensity: The strength of the lens dirt.
* Threshold: The lower the value, the more noticeable it is in bright areas.

### Vignetting

Makes the edges of the image darker.

![](pathname:///doc-img/en-camera-14.webp)

* Color: The vignette color.
* Fade Out: The higher the value, the larger the area of the vignette.
* Blink: Simulates the blinking effect commonly seen in first-person games.


![](pathname:///doc-img/en-camera-15.webp)

### Night Vision

Simulates the night vision goggles.


![](pathname:///doc-img/en-camera-16.webp)

* Color: The color of the night vision.

### Blur

Blur the image.


![](pathname:///doc-img/en-camera-17.webp)

* Intensity: The strength of the blur.

### Pixelate

Add a mosaic effect to the image!


![](pathname:///doc-img/en-camera-18.webp)

* Intensity: The strength of the pixelation.
