# Overview

**Blueprints** in Warudo is a flexible and powerful visual scripting system that allows even those without programming backgrounds to utilize concepts and tools that are typically reserved for programmers, creating unique animations and interactive effects for VTuber avatars. Blueprints can be created and edited within Warudo's configuration window, and all changes are reflected in realtime in the scene.

<div className="hint hint-success">
The blueprint system in Warudo is not just a novelty. Rather, it is a crucial part of Warudo's architecture: [motion capture in Warudo is implemented completely with blueprints.](mocap-nodes.md) This ensures that the blueprint system will continue to be updated and improved, providing more and more node types for you to combine in endless ways. You can also create new node types through the [Mod SDK](../modding/mod-sdk.md).
</div>

To browse the blueprints in the current scene, simply click the "Blueprints" button on the left side of the configuration window. If you have just created a scene, there won't be any blueprints in it.

<figure><img src="/images/image(5)(1).png" alt="" /><figcaption></figcaption></figure>

To create a blueprint, click the + icon in the lower left corner:

<figure><img src="/images/image(7)(1)(3).png" alt="" /><figcaption></figcaption></figure>

<figure><img src="/images/image(4)(1)(5).png" alt="" /><figcaption></figcaption></figure>

Each blueprint is comprised of **nodes** and **connections**. Connections come in two types: <mark style={{color: "green"}}>**flow connections**</mark> (<mark style={{color: "green"}}>**green**</mark>) and **data connections** (**black**), while each node can have both flow and data inputs and outputs.

To create a new node, simply drag the desired node from the palette (right) to the node editor (center). To create a connection, press the input/output and then drag it to another node's output/input. Here's a simple blueprint example: **when the Esc key is pressed, the main camera will shake.**

<figure><img src="/images/image(2)(1)(1).png" alt="" /><figcaption></figcaption></figure>

<mark style={{color: "green"}}>**Flow connections**</mark> determine the order in which the nodes are executed. In the example above, after "On Keystroke Pressed" is executed, "Shake Camera" will be executed next.

**Data connections** are responsible for transmitting data between nodes. When a node is executed, all of its data inputs are evaluated. In the example above, when "Shake Camera" is executed, "Camera" will be set to the main camera because the "Camera" data input is connected to the "Get Main Camera -> Camera" data output. So it's the main camera that will shake, not any other camera.

**Note that the data types of the two ends of a data connection must be compatible.** In the example above, you cannot connect "Get Main Camera -> Camera" (data type: camera) to "Shake Camera -> Sustain Time" (data type: float).

<div className="hint hint-success">
Not all data inputs require a connection to a data output. For example, data such as "Sustain Time" can be set directly on the node.
</div>

<div className="hint hint-info">
A flow input can connect to multiple flow outputs, but a flow output can only connect to one flow input. Otherwise, it would be unclear which node should be executed first.&#x20;

A data output can connect to multiple data inputs, but a data input can only connect to one data output. Otherwise, it would be unclear from which node the data should be transmitted.
</div>

The blueprint can be disabled in the sidebar (left). When the blueprint is disabled, the nodes in the blueprint will not receive events. For example, in the above picture, even if the Esc key is pressed, the "On Keystroke Pressed" node will not receive an event and the flow will not be executed, and as a result the camera will not shake.

<div className="hint hint-info">
You can determine if a flow is being executed or if data is being transmitted by checking if there's a ball rolling on the connection:

![](</images/image(6)(4).png>)
</div>

Let's take a look at some of the common nodes used in Warudo's blueprint system.
