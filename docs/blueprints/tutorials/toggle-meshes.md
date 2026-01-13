---
sidebar_position: 10
version: 2024-06-16
---

# Toggling Clothing & Accessories

Often character models will have multiple meshes for different clothing and accessories. This tutorial will show you how to toggle these meshes on and off using hotkeys.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/toggle-meshes.mp4" /></div>
<p class="img-desc">Toggling character meshes with hotkeys.</p>

## Toggling Meshes

Without further ado, let's get started! First, let's create a new blueprint. Just like in the [Creating Your First Blueprint](../understanding-blueprints.md) tutorial, we need to add a **On Keystroke Pressed** node. I will set the hotkey to **Ctrl+Shift+J** (J for "jacket"), but you can use whatever you want.

![](/doc-img/en-blueprint-toggle-meshes-1.png)

Next, we need to add a **Toggle Character Meshes** node——the name is pretty self-explanatory, isn't it? Add it to the blueprint, and connect the nodes like so:

![](/doc-img/en-blueprint-toggle-meshes-2.png)

Select your character from the **Character** dropdown. Then, click the **+** button to add a new entry to the **Meshes** list, and select the mesh you want to toggle. In this case, I want to toggle my character's jacket, so I select the "jacket" mesh. You can add as many meshes as you want to this list.

:::info
Note that models exported by [VRoid Studio](https://vroid.com/en/studio) only have two meshes: `Body` and `Face`. More detailed models often split the character's clothes, accessories, tail, animal ears, etc. into separate meshes. If you have no clothing or accessories to toggle, you can either skip this tutorial, or follow through to toggle your entire body mesh just for fun!
:::

Hey, can you believe it? We are already done! Now, when I press **Ctrl+Shift+J**, my character's jacket will be toggled on and off.

## Copy & Paste

I want to set up a hotkey for toggling my headphones as well. Instead of dragging out the nodes again, let's just copy and paste the nodes we already have. Hold **Mouse RMB** and drag a box around the nodes to select them like so:

![](/doc-img/en-blueprint-toggle-meshes-3.png)

Then, press **Ctrl+C** to copy the nodes, and **Ctrl+V** to paste them. The nodes will be pasted at the location of your mouse cursor. I am changing the hotkey to **Ctrl+Shift+H** (H for "headphones"), and selecting the "headphones" mesh from the dropdown, but you can of course set these to whatever you want.

![](/doc-img/en-blueprint-toggle-meshes-4.png)

Now, when I press **Ctrl+Shift+H**, my character's headphones will be toggled on and off.

## Event Nodes

Nodes like the On Keystroke Pressed node are called **event nodes**. Event nodes do not have an **Enter** flow input, so you cannot trigger them; they are triggered by Warudo automatically, in this case, when you press the hotkey.

There are other event nodes. like the **On YouTube Super Chat Received** node. If you have connected Warudo to your YouTube stream, this node is triggered when you receive a Super Chat. In the below example, I am using the **On YouTube Super Chat Received** node to toggle my character's jacket when I receive a Super Chat.

![](/doc-img/en-blueprint-toggle-meshes-5.png)

This "if X, then Y" paradigm is the foundation of blueprints. The X is an event, like pressing a hotkey or receiving a Super Chat, and the Y is all sorts of interesting interactions, like making your character dance, or ragdolling your character. In fact, that's exactly what we will look into in the next tutorial...

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
