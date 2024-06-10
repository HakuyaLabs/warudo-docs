---
sidebar_position: 1
---

# Getting Started With Playground

There are two ways of scripting in Warudo: using Playground, or creating a [plugin mod]. In this tutorial, we will look into using Playground to write your first custom node!

Without further ado, let's dive in.

## Step 1: Environment Setup

First, download the `.csproj` file here and put it into the `Playground` directory inside your Warudo data folder (Menu → Open Data Folder). This file helps your IDE to provide code auto-completion and syntax highlighting.

Open your favorite C# IDE - we will use [Rider], but other IDEs such as [Visual Studio Code] would work just fine (for Visual Studio Code, you may need to install the C# language server). 

Open the `Playground` directory in your IDE. Create a file called `HelloWorldNode.cs` in the directory, and paste the following into the file:

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Title = "Hello World")]
public class HelloWorldNode : Node {

    [FlowInput]
    public Continuation Enter() {
        Context.Service.PromptMessage("Hello World!", "This node is working!");
        return Exit;
    }
        
    [FlowOutput]
    public Continuation Exit;

}
```

## Step 2: Custom Node

Open Warudo. Upon startup, you should see a pop-up message (called a **toast**) like this:

[image]

This indicates the `HelloWorldNode.cs` has been successfully compiled and loaded, and since the code above defines a custom node, we see `Nodes: 1` in the message.

Go to the blueprints tab. Create a new blueprint and find the `Hello World` node in the node palette. Drag it out and you should see something like this:

[image]

Click on the `Enter` flow input, and you should see this message:

[image]

If all is working, congratulations! You have just created your first Warudo node in C#!

## Step 3: Hot Reload

One thing awesome is that you don't need to restart Warudo every time you make code changes. In fact, Warudo automatically detects any changes you have made in the `Playground` directory and hot-reload your code!

Let's see that in action. Go back to the `HelloWorldNode.cs` and paste the following new code (or update your existing code if you want to practice typing):

```csharp
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;

[NodeType(Title = "Hello World")]
public class HelloWorldNode : Node {

    // New code below
    [DataInput]
    [IntegerSlider(1, 100)] 
    public int LuckyNumber = 42;
    // New code above

    [FlowInput]
    public Continuation Enter() {
        // Changed code below
        Context.Service.PromptMessage("Hello World!", "This node is working! My lucky number: " + LuckyNumber);
        return Exit;
    }
        
    [FlowOutput]
    public Continuation Exit;

}
```

Immediately after you press Ctrl+S, another toast message should appear:

[image]

This indicates the node has been successfully compiled and hot-reloaded. The node in the blueprint is also updated accordingly:

[image]

Try set a lucky number and verify the node still works!

[image]

## Step 4: Custom Asset

Warudo can also detect new `.cs` files. Let's try creating a custom asset this time. Create a file called `CookieClickerAsset.cs` in the `Playground` directory, and paste the following code:

```csharp
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;

[NodeType(Title = "Cookie Clicker")]
public class CookieClickerAsset : Asset {

    [Markdown] 
    public string Status = "You don't have any cookies.";

    [DataInput] 
    [IntegerSlider(1, 10)]
    [Description("Increase me to get more cookies each time!")]
    public int Multiplier = 1;

    private int count;

    [Trigger]
    public void GimmeCookie() {
        count++;
        SetDataInput(nameof(Status), "You have " + count + " cookie(s).", broadcast: true);
    }

}
```

You should see a toast message that indicates one custom node (`HelloWorldNode.cs`) and one custom asset (`CookieClickerAsset.cs`) have been loaded:

[image]

You can find the new asset in the **Add Asset** menu:

[image]

Add it to your scene and have fun! Who needs VTubing when I can do this all day?

[image]

## Summary

In this short tutorial, we learned how to use Playground and took a glimpse into how custom nodes and assets work. In the next page, we will look into the code structure in greater detail.