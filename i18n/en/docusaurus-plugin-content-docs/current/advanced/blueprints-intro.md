# Introduction to Blueprints

As one of Warudo's most unique features, what exactly are **blueprints**?

Before answering the "what", let's look at the "why" ——and that starts with "what is a VTuber software"...

## How to make a VTuber software?

Hold on, don't leave this page just yet. The basics of a VTuber software are extremely simple; face tracking, for example, can be illustrated by a flowchart as follows:

<figure><img src="/images/image(53).jpg" alt="" /><figcaption></figcaption></figure>

Not too much technical jargon, right? Though, "applying face tracking data to the model" can seem a bit abstract. Let's substantiate it with a basic face tracking solution that only detects if the eyes are open or closed, and if the mouth is open or closed. Here's a flowchart that represents the process:

<figure><img src="/images/image(47).jpg" alt="" /><figcaption></figcaption></figure>

Still, what does it mean to "apply data on the model"? The most common approach to implementing this is by applying **blendshapes** on the model. This is how it's done:

![Source: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/](https://user-images.githubusercontent.com/3406505/180678152-daf3ff76-1ab8-4add-b0c9-b28d0676fec3.gif)

<div className="hint hint-info">
As you can see, blendshapes work by **moving specific vertices** on the model mesh. An interesting side note for those have heard of [HANA\_Tool](https://kuniyan.booth.pm/items/2604269): the tool can automatically generate 52 ARKit blendshapes (also known as "perfect sync") for VRoid models because the number and arrangement of vertices on the face mesh are identical for VRM models exported from VRoid Studio. This means that the blendshapes of one VRoid model can be easily applied to another. If a model was created using different software (say, Blender), the model artist would need to manually create the ARKit blendshapes.
</div>

In the popular VRM format, the blendshape that corresponds to the eyes being open or closed is named `Blink`, and the one for the mouth being open or closed is named `A` (or sometimes `O` ). With this information, the flowchart can now be updated as follows:

<figure><img src="/images/image(46).jpg" alt="" /><figcaption></figcaption></figure>

You may still have questions about what is meant by "applying data on a blendshape". Let's use an example. In the face tracking data we received, the `eyes open/closed` data point is represented as a decimal number ranging from 0 to 1. If the value is 0, it means the eyes are tracked as open, if it's 1, the eyes are closed, and if it's 0.5, the eyes are half open. The same applies to the "mouth open/closed" data point.

When it comes to a blendshape of a model, a value of 0 means that vertices of that blendshape do not move, while a value of 1 means that vertices of that blendshape move to the target positions:

![Note that blendshapes in Unity use values ranging from 0-100, but in Warudo (and in most 3D tools) blendshapes use values ranging from 0-1. Source: https://developpaper.com/unity-realizes-facial-expression-transition-and-switching-animation-tutorial-through-blendshape/](https://user-images.githubusercontent.com/3406505/180681379-b20131f0-fe20-4368-b9e9-c45042b2491f.gif)

Great! The values range from 0 to 1 on both sides. With this information, the final flowchart should look like this:

<figure><img src="/images/image(1)(1)(2).jpg" alt="" /><figcaption></figcaption></figure>

Congratulations, you just made a VTuber software. 🎉

## However…

Here comes the problem—our flowchart made some key assumptions:

* The model has been adapted to the VRM format, so there are two blendshapes named `Blink` and `A`.
* The value of a face tracking data point matches the value of its corresponding blendshape all the time.
* The `Blink` blendshape should be set to 1 when the person blinks, and the `A` blendshape should be set to 1 when the person opens their mouth.

Are these assumptions necessarily valid?

* _The model has been adapted to the VRM format, so there are two blendshapes named `Blink` and `A`._\
  \
  Obviously, if your model hasn't been adapted to the VRM format (for example, it's a VRChat model or directly converted from a MMD model), then these two blendshapes won't be present.
* _The value of a face tracking data point matches the value of its corresponding blendshape all the time._\
  \
  We assumed that when a person closes their eyes, the `eyes opened/closed` data should be 1, and when they open their eyes, the `eyes opened/closed` data should be 0. However, this is not always the case. Keep in mind that the results of motion capture can be unreliable, especially for consumer-grade motion capture systems. For instance, if you have small eyes, the system may recognize them as only partially open even though you keep your eyes wide open. So instead of a range of 0-1, the actual range for you could be 0.2-0.7.
* _The `Blink` blendshape should be set to 1 when the person blinks, and the `A` blendshape should be set to 1 when the person opens their mouth._\
  \
  Isn't this always true? Not necessarily. Suppose my model has activated the `Smile` expression:

![Cute!](https://user-images.githubusercontent.com/3406505/180691970-c9ce152a-ef04-4e60-a014-4d6bb29105c1.png)

We know that this expression is actually represented by a blendshape, which pulls together the vertices of the model's upper and lower eyelids. So, what happens if we apply the closed-eye blendshape (`Blink`) at the same time as this expression?

&#x20;

<figure><img src="https://user-images.githubusercontent.com/3406505/180692226-3ab2d7f9-072e-436b-a736-c959ea6858d7.png" alt="" /><figcaption><p>Oops...</p></figcaption></figure>

The reason is straightforward: the `Blink` blendshape pulls down the model's upper eyelid. As a result, it shouldn't be used in conjunction with the `Smile` blendshape, or the model would look really weird.

So, what can we do? Let's take a look at how it's been handled in the past...

* _It's possible that the models haven't been adapted to the VRM format, meaning that there won't be `Blink` and `A` blendshapes present._\
  \
  **Most software:** Adapt your model to the VRM format please. Non-VRM models are simply unsupported.\
  **Self-developed/In-house:** Since the devs wrote and own the code, they can simply modify it to use the correct blendshape instead of `Blink`. For example, if using an MMD model, you could replace `Blink` with `まばたき`.
* _It's possible that the value of the motion capture data should not match the value of its corresponding blendshape._\
  \
  **Most software:** There are tools that allow for sensitivity adjustments to specific blendshapes, such as [VSeeFace](https://www.vseeface.icu/), which can adjust the blink sensitivity, or [RhyLive (Windows)](https://rhythmo.cn/rhylive/) which allows for adjustments to the sensitivity of each ARKit blendshape. However, these adjustments are usually simple multipliers that make it easier to trigger a blendshape (e.g., closing the eyes). Even a simple linear mapping from mocap data to blendshape values like [VTube Studio](https://denchisoft.com/) is unsupported in most 3D VTuber software:\
  ![image](https://user-images.githubusercontent.com/3406505/180693648-8c2408db-8cb7-410e-ab6b-403a99ff4205.png)\
  **Self-developed/In-house:** Since the devs wrote and own the code, they can manually adjust the values to correct for any discrepancies. They need to do this for every user though.
* _The values of certain blendshapes may need to be constrained based on the activation of other blendshapes. For instance, when the `Smile` blendshape is activated, the value of the `Blink` blendshape should be constantly 0, even if the_ user _blinks their eyes._\
  \
  **Most software:** There are tools that allow for constraints to be added to specific blendshapes when activating an expression, such as [Luppet](https://luppet.appspot.com/), which allows you to control whether or not blinking is allowed. However, most software only supports constraining blendshapes defined by VRM; other blendshapes are often unsupported, which can be a problem for custom models that often have many of them.\
  **Self-developed/In-house:** Again, since the devs wrote and own the code, they can manually adjust the values to correct for any discrepancies. They really should have come up with some automation like a config UI at this point though.

By now, you may have realized that even though our requirements seem simple (just tracking the eyes and mouth!), adapting to all scenarios is still challenging. Most publicly available 3D VTuber software has significant limitations in this area; while an in-house solution seems like it could solve all problems, the vast majority of self-developed projects do not consider customization and are only adapted for a single model and user. Thus, even simple changes in requirements, such as adjusting motion capture sensitivity, require updates to the program. And more complex requirements, such as changing scenes, character accessories, or adding special effects, add even more complexity. The technical demands of building a VTuber software from scratch are also a significant obstacle for many VTubers aspiring to stream in 3D.

## How to _use Warudo_ to make a VTuber software?

To address these issues, Warudo introduced the concept of **blueprints**. Remember the flowchart from the beginning of our journey?

<figure><img src="/images/image(53).jpg" alt="" /><figcaption></figcaption></figure>

In Warudo, a corresponding blueprint looks like this:

<figure><img src="/images/image(30).jpg" alt="" /><figcaption></figcaption></figure>

<div className="hint hint-info">
[RhyLive](../mocap/rhylive.md) is used here, but other face tracking solutions can also be used, by simply replacing the `Get RhyLive Receiver Data` node with a different receiver node.
</div>

Let's break down what's going on. The blueprint in the example above consists of three **nodes**. Each node has several **ports**, and ports with the same color can be connected to each other.

* <mark style={{color: "green"}}>**Green ports**</mark>: Determine the order in which the nodes are executed. In this blueprint, the `Set Character Tracking BlendShapes` node is executed after the `On Update` node has been executed.
* **Black ports**: Transmit data between nodes. In this example, the black connection transfers the `BlendShape List` from the `Get RhyLive Receiver Data` node to the `Set Character Tracking BlendShapes` node.

The `Set Character Tracking BlendShapes` node is responsible for setting the value of the model's BlendShapes to the input values (the `BlendShape List` port). So, if the receiver node has a `BlendShape List` output of X=0.55, Y=0.75, then the BlendShape named `X` on the model will be set to 0.55 and the BlendShape named `Y` on the model will be set to 0.75. The `On Update` node will be executed automatically at each frame, which means that the blueprint will continuously apply the blendshapes received by RhyLive on the model.

In fact, if your model is already set up to work with ARKit blendshapes (often referred to as "Perfect Sync"), then the blueprint shown above will work as is:

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180726572-9ddcf9c5-0473-4cdc-b152-ef9ba93853eb.mp4" /></div>

Congratulations! You have successfully created a VTuber software in Warudo—this time for real, not just on paper! 🎉

However, if you switch to a model that isn't compatible with ARKit, it won't move at all.

![](https://user-images.githubusercontent.com/3406505/180736152-2089d448-67dc-43be-a23b-fdaf5fa4ee02.png)

Alright, I know I have just put an image right there, but trust me, even if I record a video, the model's face won't be animated at all. The reason is that the RhyLive receiver sends us values corresponding to ARKit's 52 blendshapes, and this model doesn't have those blendshapes, which is why it doesn't work. What can we do? Well, let's use the `mouth opened/closed` blendshape as an example and modify the blueprint a bit:

<figure><img src="/images/image(56).jpg" alt="" /><figcaption></figcaption></figure>

The `Set BlendShape` node is simple - it takes a list on its left input, sets a specified blendshape in the list to a specified value (or adds the blendshape to the list if it doesn't exist), and then passes the list to the right. In this case, we specify the blendshape we want to set as `あ`, which is the blendshape that makes our model's mouth open. The value we set it to comes from the `Get BlendShape` node, which retrieves the value of the `jawOpen` blendshape from the list given to it on the left - which is the `mouth opened/closed` motion capture data received by RhyLive!

Essentially, the blueprint means "on each frame, get the blendshapes from RhyLive, set the value of the blendshape `あ` to the value of `jawOpen`, then apply all of these values to the corresponding blendshapes of the model."

Similarly, let's do the same for `eye opened/closed`:

<figure><img src="/images/image(55).jpg" alt="" /><figcaption></figcaption></figure>

The above blueprint means "on each frame, get the blendshapes from RhyLive, set the value of the blendshape `あ` to the value of `jawOpen`, the value of `ウィンク2` to `eyeBlinkLeft`, and the value of `ウィンク2右` to `eyeBlinkRight`, then apply all of these values to the corresponding blendshapes of the model."

Let's see it in action:

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180735646-3f4a6324-938f-404c-9500-1f47481ab887.mp4" /></div>

Nice! But it looks like I have difficulty closing my eyes. Hmm. Let's try to fix it:

<figure><img src="/images/image(58).jpg" alt="" /><figcaption></figcaption></figure>

The `Float Multiplication` node multiplies two values, A and B, and outputs the result to the right. In this case, it takes the value from the left node (A) and multiplies it with a value we set manually (B) which is 2. The `Float Clamp` node limits the value (A) received from the left node to a range between the mininum value (0) and the maximum value(1). This is done to prevent the blendshape from exceeding the value of 1, which, if you remember, will cause things to look weird.

Basically, the `eyeBlinkLeft` and `eyeBlinkRight` of the motion capture data are multiplied by a factor of 2, but the value is restricted to not go beyond 1. The effect is shown as follows:

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180757257-c815210a-74eb-4adb-8bc8-d867bb572e44.mp4" /></div>

Let's make this more interesting. Let's say I would like to make my model smile in `^^-eyes` when I puff up my face. We just simply add two nodes:

<figure><img src="/images/image(57).jpg" alt="" /><figcaption></figcaption></figure>

（`笑い` is the blendshape for the `^^-eyes` on this model.）

Let's try it out!

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180759207-28d1e5b5-c575-4f42-b127-afb20a2c3608.mp4" /></div>

Huh, the eyelids look weird? Well, this is exactly the problem we mentioned earlier: the `Smile` blendshape must not be used together with the eyes-closed blendshapes! But in Warudo, we can just do this:

<figure><img src="/images/image(59)(1).jpg" alt="" /><figcaption></figcaption></figure>

No more weird eyelids!

<div className="video-box"><video controls src="https://user-images.githubusercontent.com/3406505/180760044-f899f4df-7064-441d-bb6f-b1305899a6a4.mp4" /></div>

Let's revisit our concerns earlier:

* _It's possible that the models haven't been adapted to the VRM format, meaning that there won't be `Blink` and `A` blendshapes present._\
  \
  **Warudo:** Doesn't force you to stick to specific blendshape names. Just use what's available on your model.
* _It's possible that the value of the motion capture data should not match the value of its corresponding blendshape._\
  \
  **Warudo:** You have the freedom to manipulate the motion capture data as you please!
* _The values of certain blendshapes may need to be constrained based on the activation of other blendshapes. For instance, when the `Smile` blendshape is activated, the value of the `Blink` blendshape should be constantly 0, even if the_ user _blinks their eyes._\
  \
  **Warudo:** Simply add a `Constraint BlendShape` node.

Everything seems to be solved! Of course, you don't have to build blueprints from scratch like above: as shown [in the Getting Started tutorial](../tutorials/readme-1.md), Warudo allows you to generate blueprints with a single click that match your model's specific setup. We showed how to map motion capture data (such as puffing your face) to a specific blendshape—but this is just one of the thousands of possibilities. For example, the following blueprint can be used to change the model's idle animation and expression when you press Alt+C.

<figure><img src="/images/image(60).jpg" alt="" /><figcaption></figcaption></figure>

**The best part: all of this can be done without a developer (me)!** Want something special for Halloween? Just create a keyboard shortcut that equips a pumpkin head on your avatar, along with some special effects. Want to thank your viewers for their redeems? Trigger a special facial expression or animation on your avatar when you receive a redeem. Have a MIDI controller? How about using it to control the brightness of the lighting in the scene? All of these simple logic can be implemented in Warudo's blueprints in just a few minutes. Plus, you can even create your own custom node types by developing [C# mods](../modding/mod-sdk.md) if the existing nodes don't have the functionality you need. And because Warudo's blueprints are saved with the scene files, you can easily share your setups with others by copying the scene files and the accompanying assets to another computer.
