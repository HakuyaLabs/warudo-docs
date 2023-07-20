# Tail

Make your character's tail wag!

{% embed url="https://user-images.githubusercontent.com/3406505/180988526-bd40ac22-fb96-49c4-8546-863e33b4f250.mp4" %}

You can also apply this asset to any hierarchical bones, such as the ears on this model!

{% embed url="https://user-images.githubusercontent.com/3406505/180989631-2e13e06b-fd7e-4997-9afe-da93d8e43361.mp4" %}

### Properties

* Parent Asset: Who the tail belongs to.
* Path: Path of the tail bone. Please select the **root bone** of the tail from the dropdown list.
* Reset Tail: Resets the tail to its default state.

<div className="hint hint-info">
The model's tail must contain at least 4 bones to wag naturally.
</div>

### Waving

Allows the tail to wag on its own.

* Waving Speed: Speed at which the tail wags.
* Waving Range: Range of the tail's wag.

### Physics

* Slithery: 0 is more like a branch swaying in the wind, 1 is more suited for an animal's tail/tentacle.
* Curling: Bendiness of each joint.
* Springiness: The higher the value, the more elastic the tail.
* Reaction Speed: The lower the value, the more resistance there is to movement, like being in water.
* Rotation Relevancy: The lower the value, the more sluggish the tail feels, and the slower it returns to its original position.
* Gravity: Force applied to the tail.

### Collision Detection

Prevents the tail from passing through other models in the scene. Currently only supports collision detection with a character's body.

* Collider Radius: Collision volume of the tail. Adjust this value until the tail doesn't collide with the body but do not stay too far away from it.

### Inverse Kinematics

Lets the tail follow a designated target in the scene.

* IK Target: Target for the tail to follow. Must be an entity in the scene, such as a [camera](camera.md), [prop](prop.md), [anchor](anchor.md), etc.
* Weight: At 0, the tail stays in its original position; at 1, the tail is fully "pulled" towards the target.
* Angle Limit: Maximum bend angle of each joint in the tail. If the tail cannot reach the target, you may need to increase this value.

### Additional Shaping

* Rotation Offset: Offset angle of the tail's rotation.
* Curving: Additional bendiness of each joint in the tail.
* Length Multiplier: Allows the tail to stretch and shrink.
