# Camera

Cameras are... well, cameras!

## Multiple Cameras

Warudo's supports up to 8 cameras in a single scene.

![Using the Spout and NDI output features, you can achieve a multi-camera setup in OBS.](https://user-images.githubusercontent.com/3406505/181742333-40660636-1947-46eb-b1be-7f8a19c2274f.png)

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

<div>

<figure><img src="/images/Warudo_2022-10-16-05-44-53_1024x1024.png" alt="" /><figcaption><p>Show Gizmos disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-05-44-42_1024x1024.png" alt="" /><figcaption><p>Show Gizmos enabled, and character asset selected</p></figcaption></figure>

</div>

<div className="hint hint-success">
You can turn on/off the main camera's gizmos at any time by pressing the **G key** when the main window is focused.
</div>

<div className="hint hint-info">
If you need to use Warudo during a livestream, it is recommended to turn off the gizmos before starting the stream.

A better solution would be to create a dedicated camera view for the audience which outputs to a livestreaming software like OBS using NDI or Spout. This way, you can continue to make adjustments to the scene using the main window without worrying about affecting the viewing experience.
</div>

* Reset Camera Transform: Reset the camera's position and rotation to default.

### Output

* Spout Output: Sends a video stream to a [Spout](https://github.com/leadedge/Spout2) receiver on the same machine.
* Spout Output Name: The name of the Spout output.

<div className="hint hint-info">
To use Spout output in [OBS](https://obsproject.com/), install the [obs-spout2-plugin](https://github.com/Off-World-Live/obs-spout2-plugin/releases) and add a Spout2 Capture source.
</div>

* NDI Output: Sends a video stream to an [NDI](https://www.ndi.tv) receiver on another machine within the same network.
* NDI Output Name: The name of the NDI output.

<div className="hint hint-info">
To use NDI output in [OBS](https://obsproject.com/), install the [obs-ndi](https://github.com/Palakis/obs-ndi) plugin and add an NDI™ Source.
</div>

<div className="hint hint-info">
When to use Spout and when to use NDI? Simply put, use NDI if you want to output the screen to another device within the same network and use Spout if you only want to output the screen to another program on the same PC (such as OBS). Spout is recommended for its lower resource usage and latency.
</div>

* Virtual Camera Output: Outputs the video to a Warudo virtual camera.
* Mirror Virtual Camera Output: Whether to flip the virtual camera output horizontally.
* Screenshot: Takes a screenshot and saves it in the Screenshots subfolder in the data folder.

<div className="hint hint-success">
**Spout output, NDI output, virtual camera output, and screenshots all support transparency!** Simply enable the chroma key (see below) and set the alpha value of the chroma key color to 0.
</div>

<div className="hint hint-info">
When using Spout output in OBS, set the Composite Mode in the Spout2 Capture properties to Premultiplied Alpha to achieve transparency.

![](</images/image(16)(3).png>)
</div>

<div className="hint hint-info">
When using virtual camera output in OBS, set the Video Format in the Video Capture Device properties to ARGB to achieve transparency.

![](</images/image(33).png>)
</div>

### Basic Properties

* Use Chroma Key: Whether to show a solid color instead of the skybox.&#x20;

<div className="hint hint-warning">
Even when chroma key is enabled, the [environment ](environment.md)in the scene will still be visible.&#x20;
</div>

* Chroma Key Color: The solid color displayed as the background when "Use Chroma Key" is enabled.
* Field of View: The field of view of the camera.
* Orthographic Projection: Whether to use orthographic projection.

<div>

<figure><img src="/images/Warudo_2022-10-16-03-53-28_1024x1024.png" alt="" /><figcaption><p>Orthographic Projection disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-03-52-58_1024x1024.png" alt="" /><figcaption><p>Orthographic Projection enabled</p></figcaption></figure>

</div>

### Handheld Movement

* Intensity: The range of movement for the handheld camera effect.
* Speed: The speed of movement for the handheld camera effect.

### Tonemapping & Color Grading

* LUT Texture: Adjust the colors of the scene with a LUT texture to create the desired vibes.

![Without LUT Texture](https://user-images.githubusercontent.com/3406505/181156909-7c5b0f96-3860-463b-be97-98e57c954a7f.png) ![LUT Texture: Sunset](https://user-images.githubusercontent.com/3406505/181157012-7bc1bc20-eb6d-43f3-ab9e-c3ef5cceb040.png)

<div className="hint hint-success">
**Warudo has over 200 built-in LUT textures** that you can choose from. Try picking the right one for your environment to give off great vibes!
</div>

* LUT Intensity: The strength of the LUT texture's effect on the image.
* Vibrance: The saturation of the image's colors.
* Contrast: The contrast of the image's colors.
* Brightness: The brightness of the image's colors.
* Tint: An additional tint that is overlayed onto the image.

### Bloom

The bloom effect creates a halo effect around the bright parts of the image.

![Bloom disabled](https://user-images.githubusercontent.com/3406505/181158305-ca083489-4675-40e9-834b-36c93c8f96da.png) ![Bloom enabled](https://user-images.githubusercontent.com/3406505/181158391-f57f4892-a7ff-4260-9092-dd68f3aac031.png)

* Strength: The intensity of the bloom effect.
* Threshold: The lower the threshold, the more areas that are not as bright in the image will also emit a bloom effect.
* Tone: The color of the bloom effect.
* Depth Attenuation: The degree to which the intensity of the bloom effect decreases with distance.
* Near Attenuation Distance: The bloom effect produced by bright parts of objects within this distance will be attenuated.
* High Quality: Whether to improve the rendering quality of the bloom effect at cost of performance.

### Ambient Occlusion

Adds more shadow to the scene for a more realistic visual effect (in most cases).

![Ambient Occlusion disabled](https://user-images.githubusercontent.com/3406505/181158774-0153a616-a795-44c7-b14c-539706f57e92.png) ![Ambient Occlusion enabled](https://user-images.githubusercontent.com/3406505/181158813-13a921a2-12ec-4da8-b860-a97fe78d3e22.png)

<div className="hint hint-info">
For anime models (especially when the face mesh is not completely flat), enabling ambient occlusion is not recommended.

<img src="https://user-images.githubusercontent.com/3406505/181159458-8df6b8bd-757f-4e40-afc8-525deb79371c.png" alt="关闭环境光遮蔽" data-size="original" /><img src="https://user-images.githubusercontent.com/3406505/181159488-09be23c0-6be6-48e8-bba8-0d46b6122765.png" alt="开启环境光遮蔽" data-size="original" />
</div>

* Radius: The radius of the shadow.
* Max Radius Pixels: The maximum pixels for shadow sampling. If your character shadow looks strange, try to adjust this value.
* Intensity: The intensity of the shadow.
* Color: The color of the shadow.
* High Quality: Whether to improve the rendering quality of the ambient occlusion at cost of performance.

### Anamorphic Flares

Provides the horizontal/vertical flare effect of a distorted lens.

![Anamorphic Flares disabled](https://user-images.githubusercontent.com/3406505/181159870-b8a72b86-fcd8-42f1-a27b-f90f32d4eab5.png) ![Anamorphic Flares enabled](https://user-images.githubusercontent.com/3406505/181159892-1a9a2b03-fc38-458c-b660-d2b57c10b101.png)

* Intensity: The intensity of the flares.
* Threshold: The lower the threshold, the more areas that are not as bright in the image will emit flares.
* Tint: The color of the flares.
* Spread: The extent to which the flares overflow.
* Vertical Flares: Whether the light overflows vertically instead of horizontally.
* High Quality: Whether to improve the rendering quality of the anamorphic flares at cost of performance.

### Depth Of Field

Blur objects that are not in focus.

![Depth Of Field disabled](https://user-images.githubusercontent.com/3406505/181161085-01e2e620-fcb7-421b-8cec-2824fdc1ab1f.png) ![Depth Of Field enabled, Bokeh Effect disabled](https://user-images.githubusercontent.com/3406505/181161099-7ada6b35-90a5-445f-98e1-701d385253d3.png) ![Depth Of Field and Bokeh Effect enabled](https://user-images.githubusercontent.com/3406505/181161123-f27921b4-f6b3-46e0-9fdd-8276d7013725.png)

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

<div>

<figure><img src="/images/Warudo_2022-10-16-03-53-28_1024x1024.png" alt="" /><figcaption><p>Chromatic Aberration disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-03-57-39_1024x1024.png" alt="" /><figcaption><p>Chromatic Aberration enabled</p></figcaption></figure>

</div>

* Intensity: The strength of the chromatic aberration.
* Smoothing: The higher the value, the smoother the transition between the chromatic aberration and the original color.

### Lens Dirt

Simulates dirt and specks on the lens.

<div>

<figure><img src="/images/Warudo_2022-10-16-04-03-18_1024x1024.png" alt="" /><figcaption><p>Lens Dirt disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-04-03-15_1024x1024.png" alt="" /><figcaption><p>Lens Dirt enabled: Dirt3</p></figcaption></figure>

</div>

* Texture: The texture of the lens dirt and specks.
* Intensity: The strength of the lens dirt.
* Threshold: The lower the value, the more noticeable it is in bright areas.

### Vignetting

Makes the edges of the image darker.

<div>

<figure><img src="/images/Warudo_2022-10-16-04-03-18_1024x1024.png" alt="" /><figcaption><p>Vignetting disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-04-07-26_1024x1024.png" alt="" /><figcaption><p>Vignetting enabled</p></figcaption></figure>

</div>

* Color: The vignette color.
* Fade Out: The higher the value, the larger the area of the vignette.
* Blink: Simulates the blinking effect commonly seen in first-person games.

<div>

<figure><img src="/images/Warudo_2022-10-16-04-03-18_1024x1024.png" alt="" /><figcaption><p>Blink = 0</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-04-12-01_1024x1024.png" alt="" /><figcaption><p>Blink = 0.5</p></figcaption></figure>

</div>

### Night Vision

Simulates the night vision goggles.

<div>

<figure><img src="/images/Warudo_2022-10-16-04-13-16_1024x1024.png" alt="" /><figcaption><p>Night Vision disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-04-13-18_1024x1024.png" alt="" /><figcaption><p>Night Vision enabled</p></figcaption></figure>

</div>

* Color: The color of the night vision.

### Blur

Blur the image.

<div>

<figure><img src="/images/Warudo_2022-10-16-04-03-18_1024x1024.png" alt="" /><figcaption><p>Blur disabled</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-04-22-23_1024x1024.png" alt="" /><figcaption><p>Blur enabled</p></figcaption></figure>

</div>

* Intensity: The strength of the blur.

### Pixelate

Add a mosaic effect to the image!

<div>

<figure><img src="/images/Warudo_2022-10-16-04-03-18_1024x1024.png" alt="" /><figcaption><p>Pixelate off</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-16-04-23-26_1024x1024.png" alt="" /><figcaption><p>Pixelate on</p></figcaption></figure>

</div>

* Intensity: The strength of the pixelation.
