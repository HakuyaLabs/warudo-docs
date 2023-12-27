---
sidebar_position: 70
---

# Anchor

An anchor is a 3D point in the scene, which can be used as the target for the character's [Look At IK](character/#look-ik) or [Body IK](character/#body-ik).

Some blueprint nodes also allow you to specify an anchor as the origin or destination. For example, the **Launch Liquid At Character** node by default launches the liquid from the main camera, but you can specify an anchor as the origin to launch the liquid from that anchor instead. Say you have the anchor attached to a hippo prop's mouth, then you can launch the liquid from the hippo's mouth.

![](pathname:///doc-img/en-anchor-1.png)
<p class="img-desc">The hippo prop has an anchor attached to its mouth, which is used as the origin of the liquid.</p>

## Setup

To set up an anchor, first set the **Attach To** option if you want the anchor to be attached to a character or prop. Then, use the transform gizmos to move and rotate the anchor, so that it is in the desired position.
