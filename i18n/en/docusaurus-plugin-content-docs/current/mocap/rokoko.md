# Rokoko

Face & body tracking via [Rokoko](https://www.rokoko.com/).

## Setup

Open Rokoko Studio -> Livestream -> Activate streaming to Unity:

<figure><img src="/images/image(18)(1).png" alt="" /><figcaption></figcaption></figure>

Then, update Profile Name to the Rokoko actor whose motion capture data you would like to receive:

<figure><img src="/images/image(2)(2).png" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-warning">
Note: You need a Rokoko Plus or Pro subscription to stream to Unity.
</div>

<div className="hint hint-info">
For more details, see the [official documentation](https://support.rokoko.com/hc/en-us/articles/4410471183633-Getting-Started-Streaming-to-Unity).
</div>

## Properties

* Port: The port used by Rokoko Studio. The default is 14043.
* Profile Name: The name of the Rokoko Actor to receive.
* Eye Blink Sensitivity: The sensitivity of the eye blinking.
* Eye Movement Intensity: The range of eye movement.
* Adjust Hip Height Based On Studio Actor: Whether to adjust hip height based on studio actor.
