---
sidebar_position: 60
---

# Structured Data

Structured data is a way to define an embedded data structure within an entity. They are useful for defining complex data inputs that need to be reused within the same entity or across multiple entities.

## Type Definition

You can create structured data types by inheriting from the `StructuredData` type, like below:

```csharp
public class MyTransformData : StructuredData {
    [DataInput]
    public Vector3 Position;

    [DataInput]
    public Vector3 Rotation;
    
    [DataInput]
    public Vector3 Scale = Vector3.one;
    
    [Trigger]
    public void ResetAll() {
        Position = Vector3.zero;
        Rotation = Vector3.zero;
        Scale = Vector3.one;
        Broadcast();
    }
}
```

Then you can use this structured data type as any data input field's type in an entity:

```csharp
[DataInput]
public MyTransformData MyTransform;
```

Which looks like this:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-1.png)
</div>
</div>

Note that you do not need to assign a value to the structured data field as it will be automatically instantiated when the entity is created. That means you can access the structured data's data inputs directly:

```csharp
public override void OnCreate() {
    base.OnCreate();
    MyTransform.ResetAll();
}
```

## Components

A structured data type can define data inputs and triggers.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-5.png)
</div>
</div>

## Lifecycle

A structured data only has one additional lifecycle event `OnUpdate()`, other than the standard lifecycle events (e.g., `OnCreate()`) listed on the [Entities](entities#lifecycle) page. 

:::tip
Structured data are best thought as data containers, so you should not perform complicated logic inside them. It is recommended to keep structured data as simple as possible and let the parent entity handle the heavy lifting.
:::

## Updating Structured Data

Structured data are just entities, so you can update their data inputs like any other entity:

```csharp
MyTransform.SetDataInput(nameof(MyTransform.Position), new Vector3(1, 2, 3), broadcast: true);

// or

MyTransform.Position = new Vector3(1, 2, 3);
MyTransform.BroadcastDataInput(nameof(MyTransform.Position));
```

When updating multiple data inputs, you can also just assign to the fields directly, and use the `Broadcast` method to broadcast all data inputs at once:

```csharp
MyTransform.Position = new Vector3(1, 2, 3);
MyTransform.Rotation = new Vector3(0, 0, 0);
MyTransform.Scale = new Vector3(1, 1, 1);
MyTransform.Broadcast(); // Or BroadcastDataInput(nameof(MyTransform));
```

## Nested Structured Data

Structured data can be nested:

```csharp
public class MyData1 : StructuredData {
    [DataInput]
    public MyData2 NestedData;
    
    public class MyData2 : StructuredData {
        [DataInput]
        public MyData3 NestedData;
        
        public class MyData3 : StructuredData {
            [DataInput]
            public bool SuperNestedBool;
        }
    }
}
```

## Arrays

You can also define arrays of structured data:

```csharp
[DataInput]
public MyTransformData[] MyTransforms;
```

Note you do not need to initialize the array. Warudo will automatically initialize an empty array:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-2.png)
</div>
</div>

When the user clicks the **+** button, structured data elements are appended to the array:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-3.png)
</div>
</div>

## Custom Initializer

Elements in a structured data array are automatically initialized by Warudo:

```csharp
[DataInput]
public MyTransformData[] MyTransforms; // Each MyTransforms[i].Scale is initialized to (1, 1, 1)
```

However, sometimes you may want to initialize the new element with dynamic values. We can use the `[StructuredDataInitializer]` attribute to specify a method that will be called to initialize the structured data:

```csharp
[DataInput]
[StructuredDataInitializer(nameof(InitializeTransform))]
public MyTransformData[] MyTransforms;

protected void InitializeTransform(MyTransformData transform) {
    transform.Position = new Vector3(Random.value, Random.value, Random.value);
    transform.Rotation = new Vector3(Random.value, Random.value, Random.value);
    transform.Scale = new Vector3(Random.value, Random.value, Random.value);
    // Note there is no need to broadcast - the structured data has not be sent to the editor anyway
}
```

When the user clicks the **+** button, the `InitializeTransform` method is called to initialize the new structured data element.

## Programmatically Creating Structured Data

To manually populate the structured data array, or to add structured data elements programmatically, use the `StructuredData.Create<T>()` method:

```csharp
public override void OnCreate() {
    base.OnCreate();
    
    // Create a new structured data instance
    var mySampleData = StructuredData.Create<MyTransformData>();
    mySampleData.Position = new Vector3(1, 2, 3);
    // Or equivalently
    // var mySampleData = StructuredData.Create<MyTransformData>(sd => sd.Position = new Vector3(1, 2, 3));
    
    SetDataInput(nameof(MyTransforms), new [] { mySampleData }, broadcast: true);
}

[Trigger]
public void AddNewRandomTransform() {
    var newTransform = StructuredData.Create<MyTransformData>();
    newTransform.Position = new Vector3(Random.value, Random.value, Random.value);
    newTransform.Rotation = new Vector3(Random.value, Random.value, Random.value);
    newTransform.Scale = new Vector3(Random.value, Random.value, Random.value);
    
    var newTransforms = new List<MyTransformData>(MyTransforms);
    newTransforms.Add(newTransform);
    
    SetDataInput(nameof(MyTransforms), newTransforms.ToArray(), broadcast: true);
}
```

:::caution
Do not use `new MyTransformData()` to create structured data instances. Always use `StructuredData.Create<T>()` to ensure proper entity initialization.
:::

## Collapsible Structured Data

Structured data can be collapsed to save space:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-4.png)
</div>
</div>

You only need to implement the `ICollapsibleStructuredData` interface:

```csharp
public class MyTransformData : StructuredData, ICollapsibleStructuredData {
    // ...
    
    public string GetHeader() => Position + " " + Rotation + " " + Scale;
}
```

You can use the `CollapsedSelf` and `CollapsedInHierarchy` properties to determine whether the structured data is collapsed. For example, you can toggle the visibility of a GameObject in the Unity scene based on the structured data's collapsed state:

```csharp
public override void OnUpdate() {
    base.OnUpdate();
    gameObject.SetActive(!CollapsedInHierarchy);
}
```

## Accessing Parent Entity

If you need to access the parent entity from the structured data, you can change the base class to `StructuredData<TParent>` and use the `Parent` property, which is automatically casted to `TParent`. Using the `MyTransformData` example:

```csharp
[AssetType(...)]
public class MyTransformAsset : Asset {
    
    [DataInput]
    public MyTransformData MyTransform;
    
    protected void ParentMethod() {
        // ...
    }
    
    public class MyTransformData : StructuredData<MyTransformAsset> {
        // ...
        
        public void AccessParentMethod() {
            Parent.ParentMethod();
        }
    }
}
```

Note that `Parent` is `null` when `OnCreate` is called, so you should not access the parent entity in `OnCreate`. Instead, implement the `OnAssignedParent()` callback:

```csharp
public class MyTransformData : StructuredData<MyTransformAsset> {
    public override void OnAssignedParent() {
        Parent.ParentMethod();
    }
}
```

## Structured Data Input Dialog {#input}

A very common use case for structured data is to allow the user to input data in a dialog. Remember the onboarding assistant? Every popup window that showed up during the onboarding process was actually a structured data!

To create a structured data input dialog, you simply define a structured data type and call `Context.Service.PromptStructuredDataInput<T>`:

```csharp
[Trigger]
public async void PromptUserInput() {
    var sd = await Context.Service.PromptStructuredDataInput<MyTransformData>("Customize Your Transform");
    if (sd == null) return; // The user clicked cancel
    
    Context.Service.Toast(ToastSeverity.Success, 
        "Thank you for your input!",
        "Your new transform is: " + sd.GetHeader());
    SetDataInput(nameof(MyTransform), sd, broadcast: true);
}
```

When combined with `[Markdown(primary: true)]` on string data inputs and `[CardSelect]` on enum data inputs, plus some clever use of `[HiddenIf]`, you will be able to create great-looking and user-friendly dialogs in your plugins!

### Retry Dialog

You can "retry" the current dialog by calling `PromptStructuredDataInput` again with the current structured data:

```csharp
[Trigger]
public async void PromptUserInput() {
    var sd = await Context.Service.PromptStructuredDataInput<MyTransformData>("Customize Your Transform");
    if (sd == null) return; // The user clicked cancel
    
    while (sd.Position == Vector3.zero) {
        Context.Service.Toast(ToastSeverity.Error, "Invalid Input", "Position cannot be zero!");
        sd = await Context.Service.PromptStructuredDataInput("Customize Your Transform", sd); // Note the second parameter
        if (sd == null) return; // The user clicked cancel
    }
}
```

This saves the user's edits to the structured data while allowing them to correct the invalid inputs.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
