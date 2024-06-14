---
sidebar_position: 5
---

# Upper Body Rotation

:::caution
As of Warudo 0.12.0, this blueprint is no longer needed, as upper body rotation is now enabled by default. See [Customizing Face Tracking](../../mocap/face-tracking) for more information.
:::

This blueprint allows you to add subtle but realistic upper body rotation to your character, adding nuance to your character's body expression.

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/upper-body-rotation.mp4" /></div>
<p class="img-desc">Naturally rotating the upper body when turning the head.</p>

## Prerequisites

You should have already set up face tracking for your character.

## Setup

Download the blueprint below and import it into your scene.

<a href="/blueprints/upper-body-rotation.json" target="_blank" download>
<div className="file-box">
<p>
upper-body-rotation.json
</p></div>
</a>

This blueprint should work out of the box. Follow the instructions on the **Comment** nodes to adjust the settings.

:::tip
If you have created another character asset, you may need to update the **Character** option on the nodes.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
  ],
}} />
