---
sidebar_position: 130
---

# Spark It Up

Time to spark up your stream! This tutorial introduces you to Warudo's powerful contact system, which allows you to trigger a variety of fun effects when objects are in _contact_ with other objects.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/contact.mp4" /></div>
<p class="img-desc">Generating sparks between the fingers and pulling out a katana using the contact system.</p>

:::info
You need hand tracking or full-body tracking for this tutorial. For hand tracking, [MediaPipe](../../mocap/mediapipe) should be fine, but we recommend using [Leap Motion](../../mocap/leap-motion) for better accuracy.
:::

## Contact System

The contact system is simple in concept: when two objects are in contact, you can trigger a flow. One example is detecting when the fingertips of our index fingers are in contact, and then generating sparks between them. Let's see how we can implement this!

First, let's take a look at the **On Contact** node. You won't believe it, but this node alone is the entire contact system! In essence, this node automatically checks whether the objects in **Contact Senders** are in contact with the objects in **Contact Receivers**, and trigger the **On Contact Enter** (the instant the objects are in contact), **On Contact Stay** (while the objects are in contact), and **On Contact Exit** (the instant the objects are no longer in contact) flow outputs accordingly.

![](/doc-img/en-blueprint-contact-2.png)

Let's add an entry to **Contact Senders** and configure like below:

![](/doc-img/en-blueprint-contact-4.png)

Now when you raise your right hand, you should see a red sphere appear at the tip of your index finger:

![](/doc-img/en-blueprint-contact-3.png)

Next, let's add an entry to **Contact Receivers** and configure like below:

![](/doc-img/en-blueprint-contact-5.png)

Raise your hands, and you should see a green sphere appear at the tip of your left index finger:

![](/doc-img/en-blueprint-contact-6.png)

Now the only thing left to do is to actually generate the electric sparks! Fortunately, we can use the **Spawn Particle** node to do just that. Add it to the node editor, select your favorite particle (I am using "Basic Impact 3") in the **Source** option as well as selecting a suitable **Scale** (I am using 0.1). Then, connect **On Contact → On Contact Stay** to **Spawn Particle → Enter**, and connect **On Contact → Contact Position** to **Spawn Particle → Position Offset**, like below:

![](/doc-img/en-blueprint-contact-7.png)

Now when you put your hands together, you should see sparks flying between your fingertips! That's easier than you thought, right?

![](/doc-img/en-blueprint-contact-1.png)

:::tip
After you are done with the settings, you can set **Visualized** to No to hide the red and green spheres.
:::

## Throttle Flow

You may notice the particles are generated at a very high rate, resulting in a very dense spark effect. This is because the **On Contact Stay** flow output is triggered every frame the objects are in contact—if you are running Warudo at 60 FPS, then 60 particles will be generated every second!

To reduce the flow rate, we can use the **Throttle Flow** node. A throttle is a valve that regulates the flow rate of water, and the Throttle Flow node does the same thing: it regulates the flow rate of a flow output. In the following example, the Throttle Flow node with **Interval** set to 0.1 second will only trigger the flow output at most once every 0.1 second:

![](/doc-img/en-blueprint-contact-8.png)

You can adjust the interval to your liking. For example, if you want to generate sparks at a rate of 20 sparks per second, you can set the interval to 0.05 instead.

## Pulling Out a Katana

Let's look at another example: pulling out a katana from behind our back! Add a katana prop (or a sword, a knife, or any other weapon you like), and attach it to the character's left hand like below:

![](/doc-img/en-blueprint-contact-9.png)

Hide the katana for now by setting **Prop → Enabled** to No. Now let's set up our contact system: on a new On Contact node, add the following to the Contact Senders list:

![](/doc-img/en-blueprint-contact-12.png)

And add the following to the Contact Receivers list:

![](/doc-img/en-blueprint-contact-13.png)

You should see a red sphere at your right shoulder, and a green sphere at your left hand. Adjust the **Position Offset** options until you can comfortably reach the red sphere with your hand (green sphere).

![](/doc-img/en-blueprint-contact-11.png)

Finally, we just need to add a **Toggle Asset Enabled** whenever our hand is in contact with our shoulder:

![](/doc-img/en-blueprint-contact-10.png)

Now when you reach your left hand to your right shoulder, you should see the katana appear in your hand! You can also add a **Play Sound** node to play a sound effect when the katana appears, or a particle, or anything you like—that's the beauty of the contact system!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
