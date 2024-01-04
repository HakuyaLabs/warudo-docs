---
sidebar_position: 30
---

# Tail

Wag your tail! The tail asset animates the tail bones on your character. It can also be used to animate hierarchical bones on any character or [prop](prop).

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '53.2%'}} className="video-box"><video controls loop src="/doc-img/en-tail-1.mp4" />
<p>A waving tail.</p>
</div>

<div style={{width: '46.8%'}} className="video-box"><video controls loop src="/doc-img/zh-tail-2.mp4" />
<p>You can also apply this asset to any hierarchical bones, such as animal ears.</p>
</div>
</div>

## Setup {#setup}

To set up a tail, simply select a **Parent Asset** that the tail belongs to. Then, use the **Path** dropdown list to select the root bone of the tail.

:::info
For best results, the tail should contain at least 4 bones.
:::

If a tail is moving in an unexpected way, use the **Reset Tail** button to reset the tail to its default state.

## Waving

The waving feature allows the tail to wag on its own. You can customize the **Waving Speed** and **Waving Range** to make the tail wag faster or slower, and to a larger or smaller degree.

## Physics

Advanced physics settings for the tail.

* **Slithery**: 0 is more like a branch swaying in the wind, 1 is more suited for an animal's tail/tentacle.
* **Curling**: Bendiness of each joint.
* **Springiness**: The higher the value, the more elastic the tail.
* **Reaction Speed**: The lower the value, the more resistance there is to movement, like being in water.
* **Rotation Relevancy**: The lower the value, the more sluggish the tail feels, and the slower it returns to its original position.
* **Gravity**: Force applied to the tail.

## Collision Detection

Collision detection prevents the tail from passing through other models in the scene. Currently, only collision detection with characters is supported. You should adjust the **Collider Radius** such that the tail doesn't collide with the character's body while not staying too far away from it.

## Inverse Kinematics

Inverse Kinematics (IK) makes the tail follow a designated **IK Target** in the scene. **Angle Limit** is the maximum bend angle of each joint in the tail. If the tail cannot reach the IK target, you may need to increase this value.

## Additional Shaping

Additional shaping parameters for the tail.

* **Rotation Offset**: Offset angle of the tail's rotation.
* **Curving**: Additional bendiness of each joint in the tail.
* **Length Multiplier**: Allows the tail to stretch and shrink.

:::tip
**Rotation Offset** is useful to make the tail point more upwards or downwards, especially when the model is sitting down. **Curving** is frequently used to make the tail more round or pointy.
:::
