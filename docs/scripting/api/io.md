---
sidebar_position: 110
version: 2024-06-16
---

# Saving and Loading Data {#io}

## Using Data Inputs

[Data inputs](ports-and-triggers#data-inputs) in entities are automatically serialized. That means if you need to store any data in your custom asset or node, the best way is to simply define a data input:

```csharp
[DataInput]
public Vector3 MySpecialVector3;
```

You can also have hidden data inputs if you don't want to show them to the user:

```csharp
[DataInput]
[Hidden]
public Vector3 MySpecialVector3;
```

For more complex states, you can serialize them into a JSON string and deserialize when needed:

```csharp
[DataInput]
[Hidden]
public string MyJSONState;

// Use Newtonsoft.Json to serialize and deserialize
MyJSONState = JsonConvert.SerializeObject(mySerializableObject);
mySerializableObject = JsonConvert.DeserializeObject<MySerializableObject>(MyJSONState);
```

## Using Persistent Data Manager

For non-serializable data, you can use `Context.PersistentDataManager` to access a file system API restricted to the data folder. For example, to load and save an image from a custom directory:

```csharp
var bytes = await Context.PersistentDataManager.ReadFileBytesAsync("MyPlugin/MyProfileImage.png");
await Context.PersistentDataManager.WriteFileBytesAsync("MyPlugin/MyProfileImage.png", bytes);
```

## Using Plugin Mod

A [plugin mod](../plugin-mod) can store text assets in the mod folder, which can be accessed by the plugin at runtime. For example, you can store a JSON file `Animations.json` in the mod folder and load it in the plugin:

```csharp
protected override void OnCreate() {
    base.OnCreate();
    var json = ModHost.Assets.Load<TextAsset>("Assets/MyModFolder/Animations.json"); // Change the path to match your mod folder structure
}
```

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
],
}} />
