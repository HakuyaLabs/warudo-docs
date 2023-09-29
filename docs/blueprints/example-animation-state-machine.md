---
sidebar_position: 70
---

# Example: Hotkey Switch Between Animations / Props

With Warudo's [extensive character configuration options](../assets/character/), you can pose the model in almost any way you want. However, as a VTuber, you can't just adjust the options on-the-fly during a livestream! Here is a blueprint example that uses the character's [body IK](../assets/character/#body-ik) to allow the model to switch freely between four states: "default", "holding a rose", "victory sign", and "holding a microphone", while achieving a smooth transition. The best part is that these animations are procedurally generated in realtime, without the need to create animations in a 3D tool like Blender.

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/196837021-1697da39-8988-4a12-9277-78040e4ef4a9.mp4" />
The movements of the hands in the video (except for the initial movement of the left hand through motion capture) are all achieved through IK.
</div>

### Preparations

<div className="hint hint-info">
Not familiar with IK? Check out the[ instructions for body IK](../assets/character/#body-ik)!
</div>

First, we need to create an [anchor](../assets/anchor.md) that will serve as the IK target. Create an anchor called "Microphone Right Hand" and configure it as follows:

![](</images/image(5)(5).jpg>)

<div className="hint hint-info">
This binds the anchor to the character so that even if the character's posture or position changes, the anchor's position will still maintain the same relative position to the character's chest.
</div>

Place the anchor in a suitable location:

![](/images/Warudo\_2022-10-19-19-06-05\_1024x1024.jpg)

Create another anchor named "Microphone Right Elbow", with the following configuration:

![](</images/image(65).jpg>)

<div className="hint hint-info">
Similarly, we bind the anchor to the character's spine so that the anchor's position always maintains the same relative position to the spine, regardless of how the character moves. The reason why we bind to the spine instead of the chest is because the anchor is closer to the spine. Generally speaking, it is most appropriate to bind to the closest bone.
</div>

Create a "Microphone" prop, select the source as "Built-In - Miscellaneous -> Microphone", and configure the character attachment section as follows:

![](</images/image(2)(1).jpg>)

At this step, we can configure the [IK properties of the character's right hand](../assets/character/#body-ik) as follows to verify that the two IK anchors are properly configured:

![](</images/image(9)(3).jpg>)

<div className="hint hint-info">
You do not need to match the config to the ones above, as these weights will be overridden by the nodes in the blueprint created below anyway.
</div>

Next, you can enable the microphone prop and adjust the position of both anchors and the microphone prop until it looks natural.

![](/images/Warudo\_2022-10-19-19-20-44\_1024x1024.jpg)

Next, create the "V-sign Left Hand", "V-sign Right Hand", "V-sign Left Elbow", "V-sign Right Elbow", "Rose Right Hand" anchors, as well as a rose prop. The following only shows the position of each anchor; the anchor configurations are similar to the above and can be bound to the bone nearest to the anchor; the properties of the rose prop are also similar to the microphone, except that the override hand pose has been changed to "Hold 2".

<div>

<figure><img src="/images/Warudo_2022-10-19-19-06-24_1024x1024.jpg" alt="" /><figcaption><p>V-sign Left Hand</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-19-19-06-21_1024x1024.jpg" alt="" /><figcaption><p>V-sign Right Hand</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-19-19-06-28_1024x1024.jpg" alt="" /><figcaption><p>V-sign Left Elbow</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-19-19-06-27_1024x1024.jpg" alt="" /><figcaption><p>V-sign Right Hand</p></figcaption></figure>

 

<figure><img src="/images/Warudo_2022-10-19-19-06-33_1024x1024.jpg" alt="" /><figcaption><p>Rose Right Hand</p></figcaption></figure>

</div>

### Setup

Create a new blueprint (or you can use an existing one), and add the following nodes and connections:

<figure><img src="/images/image(8)(2).jpg" alt="" /><figcaption></figcaption></figure>

This consists of four lines of nodes, and you may have guessed it, each line of nodes corresponds to the transformation of one state. By clicking the first "Trigger" button (from top to bottom), you can show the rose and make the character lift it up. The second "Trigger" button will fade out the character's IK with both hands. The third "Trigger" button will display the microphone and put it in front of the chest. The fourth "Trigger" button will make the character give V-signs with both hands. It's worth noting that for each "Trigger" button, before the corresponding logic is executed (the second button being after), the "Sequence" node disables the override hand pose and two props through the ["Sequence"](advanced-nodes.md#flow-control) node.

<figure><img src="/images/image(6).jpg" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-info">
You can also move the two "Disable Character IK" nodes in the second row to the right of the "Toggle Asset Enabled" node, this way the IK for both hands will be reset when switching poses. The downside is that the model's hands may twitch when switching states.
</div>

Using the "Trigger Flow" node is just an example, in actual use, you can replace it with the "When Keyboard Key is Pressed" node to switch the character's animation state using hotkeys. Additionally, using the same method, you can also switch the character's idle animation using hotkeys!

Using the "Trigger Flow" node is just one example and in practical use, you can replace it with a ["On Keystroke Pressed"](basic-nodes.md#events) node to switch the character's animation state with hotkeys. Additionally, you can use the same method to [switch the character's idle animation with hotkeys](basic-nodes.md#character) as well!
