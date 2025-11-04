---
sidebar_position: 50
---

# Dance Dance Dance

Looking for a fun way to thank your viewers for their support? In this tutorial, we will make the character dance when you receive a donation, be it a YouTube Super Chat or a Twitch redeem.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/dance.mp4" /></div>
<p class="img-desc">Dance to thank your viewers for their support!</p>

## Connecting to Streaming Platforms

Before we get started, you need to use the onboarding assistant to connect Warudo to your Twitch, YouTube or Bilibili account. If you haven't done so, please refer to the [Getting Started](../../tutorials/getting-started.md#interaction-setup) tutorial. We will assume you stream on Twitch in this tutorial, but the steps are similar for other platforms.

:::tip
You can also use third-party integration such as [Streamer.bot](Streamer.bot) that can send a WebSocket message to Warudo when you receive a donation or other stream events. In that case, you don't need to use the onboarding assistant.
:::

Let's start with a minimal example: when I receive a Twitch redeem, I want my character to dance. We need only two nodes:

![](/doc-img/en-blueprint-dance-1.png)

:::info
The **Play Character One Shot Overlay Animation** node plays a one-shot animation on the character, so instead of switching the character's idle animation, the animation is played on top of the playing idle animation. When the animation ends, the character will automatically return to the idle animation.
:::

:::tip
Instead of the **On Twitch Channel Points Redeemed** node, you can of course use any event node you want. For example, if you are streaming on YouTube, you may use the **On YouTube Super Chat Received** node instead. Or, if you are using a third-party integration that can communicate using WebSockets, you may use the **On WebSocket Message Received** node.
:::

How do we test it? Well, we can just wait for someone to redeem a Twitch reward, but that's not very efficient. Instead, Warudo allows you to trigger a node manually. Click on the **Enter** flow input of the Play Character One Shot Overlay Animation node:

![](/doc-img/en-blueprint-dance-2.png)

Your character should now start dancing!

## If Branch

Right now, our character starts dancing no matter which Twitch redeem we receive. But what if we want to dance only when we receive a specific redeem named "Dance"? Introducing the **If Branch** node—let's add it in between the two nodes, like this:

![](/doc-img/en-blueprint-dance-3.png)

Like the Flip Flop node we have seen before, the If Branch node has two flow outputs, **If True** and **If False**. Instead of alternating between the two flow outputs, the flow output that is triggered depends on the value of the **Condition** data input. If the Condition is Yes, the If True flow output is triggered; otherwise, the If False flow output is triggered.

To test this, we can click on the Enter flow input of the If Branch node. Since the Condition is currently set to No, the If False flow output is triggered, but nothing comes after it, so nothing happens.

Let's set the Condition to Yes, and click on the Enter flow input again. This time, the If True flow output is triggered, and the character starts dancing!

Now, the only thing left to do is to set the Condition to something meaningful. In this case, we want to check if the Twitch redeem name is equal to "Dance". There's a node to do exactly that: the **String Equal** node. Add it to the node editor, and connect **String Equal → Output Boolean** data output to **If Branch → Condition**, like below:

![](/doc-img/en-blueprint-dance-4.png)

The String Equal node is quite simple: it compares two strings, outputs Yes if they are equal, and No otherwise. (A string is a fancy way of saying "text.") In this case, we connect **On Twitch Channel Points Redeemed → Reward Title** to **String Equal → A**, and set **String Equal → B** to "Dance". So, when the String Equal node is triggered, it will check if the Twitch redeem name is equal to "Dance", and pass the result to the If Branch node. (A boolean is a fancy way of saying "yes or no.")

:::tip
You can also connect Reward Title to B, and set A to "Dance". The order does not matter in this case.
:::

![](/doc-img/en-blueprint-dance-5.png)

There you go! Try redeeming the "Dance" reward on your Twitch channel, and your character should start dancing!

## Randomizing the Dance

What if we want to pick a random dance animation instead of always playing the same one? Well, if you still remember the Get Random Prop node from the [previous tutorial](buried), it is not surprising that there is also a **Get Random Character Animation** node. Thus, we can set up our blueprint like below:

![](/doc-img/en-blueprint-dance-6.png)

When the Play One Shot Overlay Animation node is triggered, the Get Random Character Animation node will be triggered and output a random animation from the **Character Animations** list, in my case, any of "Short Dance 1", "Short Dance 2" and "Short Dance 3".

## Randomizing the Outcome

As a VTuber, you may want to keep an element of surprise when you receive a donation. Instead of just starting a dance, maybe you want to have a chance to do something else, like [launching yourself into the air](ragdoll) or [spawning a bunch of plushies](buried). Let's try to implement this!

:::tip
Below we have removed the **Get Random Character Animation** node for simplicity, but you can keep it if you want.
:::

First, let's remove the connection between If Branch ↔ Play Character One Shot Overlay Animation. Add a **Switch On Integer** node right after the If Branch node, and add 3 entries to the **Cases** list, like this:

![](/doc-img/en-blueprint-dance-7.png)

The Switch On Integer node works like this: when the node is triggered, it will check the value of the **Input Integer** data input, and trigger the corresponding flow output. For example, if Input Integer is 1, the flow output labeled 1 will be triggered; if Input Integer is 2, the flow output labeled 2 will be triggered; and so on.

Let's connect each flow output to a different outcome. For example, I have connected the flow output labeled 1 to the Play Character One Shot Overlay Animation node, 2 to a **Play Sounds** node, and 3 to a **Spawn Particle** node. Remember to set the **Source** option of both nodes:

![](/doc-img/en-blueprint-dance-8.png)

Now let's test it! Manually set **Switch On Integer → Input Integer** to any number between 1 and 3, and click on the Enter flow input. If everything goes well, you should see the corresponding node being triggered.

![](/doc-img/en-blueprint-dance-9.png)

The last thing we need to do is to randomize the Input Integer. You may have already guessed it: there is a **Generate Random Integer** node! We set **Value Min** to 1 and **Value Max** to 3, so that it outputs an integer between 1 and 3.

![](/doc-img/en-blueprint-dance-10.png)

Below is the final blueprint. Now go have some fun with your viewers!

![](/doc-img/en-blueprint-dance-11.png)

## More on If Branch

We used the String Equal node for the If Branch condition, but there are other conditions you can use. For example, you can use the **Integer Greater Than Or Equal** node to check if **On Twitch Channel Points Redeemed → Reward Cost** is greater than or equal to 1,000, such that the character will dance whenever you receive a Twitch redeem that costs 1,000 points or more.

You can also combine multiple conditions using the **Boolean AND** and **Boolean OR** nodes. The following blueprint checks if the Twitch redeem name is equal to "DJ", **_and_** if the redeemed user has "bot" in their name:

![](/doc-img/en-blueprint-dance-12.png)

The following blueprint will make the character dance when you receive a Twitch redeem that costs 500 points or more, **_or_** when that redeem comes from the user "hakuyatira":

![](/doc-img/en-blueprint-dance-13.png)

## Interaction Blueprints

If you have used the onboarding assistant to set up an interaction blueprint, you may have noticed it is doing very similar things as the blueprint we have just created! It may contain more nodes, but the core logic is the same: when you receive a stream event, do something interesting.

With your newfound knowledge, you can now create your own interaction blueprints! Feel free to incorporate what you have learned from the previous tutorials and create something unique for your channel. Or, if you are still looking for more funsies, read on!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
