# Advanced Nodes

### Debug

Warudo provides the following nodes to make blueprint debugging more convenient.

The **"Trigger Flow"** node allows you to trigger the flow output when you press the "Trigger" button. The following blueprint will play the specified idle animation on the character when the "Trigger" button is pressed:

![](</images/image(15)(3).png>)

The **"Show Toast"** node can display a pop-up message at the bottom of the configuration window.

![](</images/image(2)(4)(1).png>)

The **"Inspect Value"** node can be used to inspect the value of any data output. The following blueprint can be used to check if the iFacialMocap receiver has received data, troubleshooting network issues:

![](</images/image(26).png>)

<div className="hint hint-danger">
The **"Inspect Value"** node serializes the data every frame which may negatively impact the frame rate. It's important to remember to disconnect the node once you have finished checking the value to avoid affecting performance.
</div>

### **Switches**

The **"Switch…"** nodes output different data based on the input condition. When the condition is true, the data from the "If True" input is outputted, and when the condition is false, the data from the "If False" input is outputted. When the condition changes (true to false or false to true), the outputted data will transition smoothly between the two. The following blueprint will zoom in the camera (setting the field of view to 15) when the Z key is pressed, and zoom out the camera (setting the field of view to 35) when the Z key is released:

![](</images/image(16).png>)

### Variables

Sometimes we need to save some state within a blueprint. For example, we want the camera to shake only after pressing the Esc key five times. To keep track of the number of times the key has been pressed, we need something like a counter. Each time the Esc key is pressed, the counter increases by 1. When the counter reaches 5, the camera shakes. This counter-like object is called a **variable**.

You can define variables for your blueprint in the Properties panel on the right side. In this example, we define a variable called _PressCount_ with a data type of Integer and a starting value of 0.

![](</images/image(8)(1).png>)

<div className="hint hint-info">
In Warudo, the following data types can be set for variables:

* **Integer**: whole numbers
* **Float**: decimal numbers
* **Boolean**: a value that is either true or false
* **String**: a sequence of characters, such as "hello world".

</div>

The value of an integer variable can be set using the **"Set Integer Variable"** node, and it can be retrieved using the **"Get Integer Variable"** node. The following blueprint sets the value of the _PressCount_ variable to 1 when the Esc key is pressed.

![](</images/image(9)(2).png>)

The above blueprint is not very useful, as the value of _PressCount_ will always be set to 1! We want to increase _PressCount_ by 1 every time the Esc key is pressed. In other words, we want to set the value of the _PressCount_ variable to the current value of the _PressCount_ variable plus 1. In a blueprint, it would look like this:

![](</images/image(22).png>)

Here, the **"Integer Addition"** node is responsible for adding the values of integer data inputs A and B. A is the value of the _PressCount_ variable that is retrieved, and B is 1. Try pressing the Esc key and you will see that the value displayed on the right-side properties changes from 0 to 1:

![](</images/image(24).png>)

Now, let's check the value of the _PressCount_ variable after adding 1 to it. When it reaches 5, the camera will shake. (Otherwise, nothing will happen.) This can be represented in the blueprint as follows:

![](</images/image(29)(2).png>)

The **"Integer Greater Than or Equal"** node checks if the value of data input A is greater than or equal to the value of data input B (in this case, if the number of times the Esc key was pressed is greater than or equal to 5). The Boolean value (either "True" or "False") that this node outputs is then used as the condition for the **"Branch**" node. If the "Branch" node receives "True", then the "True" flow output of the "Branch" node will be triggered and the "Shake Camera" node will be executed. If not, the "False" flow output will be triggered, but since it's not connected to any other node, nothing will happen.

<div className="hint hint-info">
Here we use the **"Integer Greater Than or Equal"** node instead of the **"Integer Equal"** node to check for equality, and the result is the same, but it is safer (for example: if somehow _PressCount_ was set to a number greater than 5).
</div>

Finally, once we have shaken the camera, all we need to do is reset _PressCount_ back to 0:

![](</images/image(1)(5).png>)

### Flow Control

<div className="hint hint-info">
If you have used Unreal Engine's Blueprint functionality, you'll be pleasantly surprised to find that most of Warudo's flow control nodes were [brought over from Unreal Engine](https://docs.unrealengine.com/4.26/zh-CN/ProgrammingAndScripting/Blueprints/UserGuide/FlowControl/)! Thank you, Epic. 😉
</div>

The **"Branch"** node triggers either the "If True" or "If False" flow outputs based on the condition.

The **"Flip Flop"** node alternates triggering the flow outputs A and B. The following blueprint will display "Hello!" on the first execution, "Goodbye!" on the second execution, "Hello!" on the third execution and so on.

![](</images/image(20)(3).png>)

The **"Sequence"** node will trigger all flow outputs in sequence, without any delay between triggers, when executed. The following blueprint will display "Wa", "ru", and "do" when executed:

![](</images/image(19)(3).png>)

The **"Flow At Most Once"** (DoOnce) node will only trigger its flow output once. To reset it and trigger it again, the "Reset" flow input must be activated. The following blueprint will display a toast message when the Q key is pressed, but subsequent presses of the Q key will have no effect. To display the toast message again, the W key must be pressed followed by the Q key.

![](</images/image(18).png>)

The **"Flow At Most N Times"** (DoN) node is similar to the "Flow At Most Once" node, in that it triggers the flow output at most N times.

The **"Gate"** node only triggers the flow output when the "Opened" property is set to "True". The gate can be opened by triggering the "Open" flow input, and can be closed by triggering the "Close" flow input. The following blueprint opens the gate by pressing the W key and closes it by pressing the E key. When the gate is open, pressing the Q key will display the toast message.

![](</images/image(28).png>)

The **"Multi Gate"** node triggers all flow outputs in sequence (triggers only one output each time it's executed). If the "Loop" property is set to "No", the node will stop functioning after all flow outputs have been triggered, unless the "Reset" flow input is triggered to reset it. The following blueprint will display "1" the first time it's executed, "2" the second time, "3" the third time, "4" the fourth time, and "1" again the fifth time and so on:

![](</images/image(4)(1)(1).png>)

The **"Switch On..."** nodes trigger the corresponding flow outlet based on the input data. If there is no corresponding flow outlet, the default outlet is triggered. The following blueprint rolls a dice when you press the Space key. If it rolls a 6, it displays "You rolled a 6!", otherwise it displays "You didn't roll a 6."

![](</images/image(3)(3).png>)

The **"For Loop"** node is similar to the for loop in programming and is equivalent to the code snippet `for (int i = FirstIndex; i <= LastIndex; i++) LoopBody()`. The following blueprint will roll a dice 10000 times and display the number of times it rolled a 6:

![](</images/image(2)(4)(2).png>)

The **"Delay Control Flow"** node triggers the flow output after a given delay. The following blueprint will display the toast message 3 seconds after the Q key is pressed:

![](</images/image(25)(1).png>)

The **"Delay Data Flow"** node will buffer the received data and output the data after the given delay. The following blueprint will delay the face tracking data for 2 seconds:

![](</images/image(14)(3).png>)
