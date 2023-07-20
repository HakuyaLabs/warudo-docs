# Screen

Capture your desktop or a window and display it in the scene just like OBS. You can also display images and even webpages!

![Curved screens!](https://user-images.githubusercontent.com/3406505/191217373-999ec1ec-e086-4e55-b6b6-48575b09d02f.png)

<figure><img src="/images/image(2)(1)(4).png" alt="" /><figcaption><p>Live chat in 3D!</p></figcaption></figure>

## Properties

* Content Type: Display / Window / Browser / Image.
  * Display:
    * Display: The desktop to be displayed.
  * Window:
    * Window: The window to be displayed.
  * Browser:
    * URL: The URL of the webpage to be displayed.
    * Reload Page: Reload the currently loaded webpage.
    * Pixel Size: The render size of the browser in pixels.
    * Allow Transparent Background: Allows the background of the webpage to be transparent when enabled.
    * Custom CSS: [CSS stylesheet](https://developer.mozilla.org/en-US/docs/Web/CSS) that will be inserted into the webpage after loading.
  * Image:
    * Image Source: The image to be displayed. Supports JPG, PNG, GIF, and WEBP formats, and supports transparency.

### Appearance

* Bend: Whether the screen is curved.
* Bend Radius: The radius of the screen's curvature. The smaller the radius, the greater the curvature.
* Thickness: The thickness of the screen. The side of the screen will display the edge color of the captured desktop / window.
* Crop: Crop the four sides of the screen.
* Corner Radius: Make the four corners of the screen rounded.
* Tint: The overall hue of the screen. When A (alpha) is less than 1, the screen will become semi-transparent.
* Use Chroma Key: Whether chroma key is enabled, which will make the corresponding color in the screen transparent.
* Chroma Key Color: The color of the chroma key.
* Receive Lighting: Whether the screen is affected by lighting in the scene.
  * When enabled, the smoothness, metallic, and emissive parameters of the screen material can be adjusted.
