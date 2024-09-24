---
sidebar_position: 60
---

# 구조화된 데이터

구조화된 데이터는 엔티티 내에서 임베디드 데이터 구조를 정의하는 방식이에요. 이는 복잡한 데이터 인풋을 정의하고, 동일 엔티티 내 또는 여러 엔티티 간에 재사용해야 할 때 유용해요.

## 타입 정의

`StructuredData` 타입을 상속받아 구조화된 데이터 타입을 생성할 수 있어요. 예시는 아래와 같아요:

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

이제 이 구조화된 데이터 타입을 엔티티의 데이터 입력 필드 타입으로 사용할 수 있어요:

```csharp
[DataInput]
public MyTransformData MyTransform;
```

에디터에서는 이렇게 보여요:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-1.png)
</div>
</div>

구조화된 데이터 필드에 값을 할당할 필요는 없어요. 엔티티가 생성될 때 자동으로 인스턴스화되므로, 구조화된 데이터의 데이터 인풋에 직접 접근할 수 있어요:

```csharp
public override void OnCreate() {
    base.OnCreate();
    MyTransform.ResetAll();
}
```

## 컴포넌트

구조화 데이터 타입은 데이터 인풋과 트리거를 정의할 수 있어요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-5.png)
</div>
</div>

## 라이프사이클

구조화된 데이터는 [Entities](entities#lifecycle)페이지에 나열된 표준 라이프사이클 이벤트 외에 `OnUpdate()`라는 추가적인 라이프사이클 이벤트만 가지고 있어요(예 `OnCreate()`).

:::tip
구조화 데이터는 데이터 컨테이너로 생각하는 것이 좋아요. 복잡한 로직을 수행하지 말고, 구조화 데이터는 최대한 단순하게 유지하고, 상위 엔티티가 복잡한 작업을 처리하도록 하는 것이 좋습니다.
:::

## 구조화 데이터 업데이트하기

구조화 데이터는 단지 엔티티일 뿐이므로, 다른 엔티티처럼 데이터 인풋을 업데이트할 수 있어요:

```csharp
MyTransform.SetDataInput(nameof(MyTransform.Position), new Vector3(1, 2, 3), broadcast: true);

// or

MyTransform.Position = new Vector3(1, 2, 3);
MyTransform.BroadcastDataInput(nameof(MyTransform.Position));
```

여러 데이터 인풋을 업데이트할 때는 필드에 직접 할당한 후, `Broadcast` 메서드를 사용해 모든 데이터 인풋을 한 번에 브로드캐스트할 수도 있어요:

```csharp
MyTransform.Position = new Vector3(1, 2, 3);
MyTransform.Rotation = new Vector3(0, 0, 0);
MyTransform.Scale = new Vector3(1, 1, 1);
MyTransform.Broadcast(); // Or BroadcastDataInput(nameof(MyTransform));
```

## 중첩된 구조화 데이터

구조화 데이터는 중첩될 수 있어요:

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

## 배열

구조화 데이터 배열도 정의할 수 있어요:

```csharp
[DataInput]
public MyTransformData[] MyTransforms;
```

배열을 초기화할 필요는 없어요. Warudo가 자동으로 빈 배열을 초기화해줘요:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-2.png)
</div>
</div>

사용자가 **+** 버튼을 클릭하면, 구조화 데이터 요소가 배열에 추가돼요:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-3.png)
</div>
</div>

## 커스텀 이니셜라이저

구조화 데이터 배열의 요소는 Warudo에 의해 자동으로 초기화돼요:

```csharp
[DataInput]
public MyTransformData[] MyTransforms; // Each MyTransforms[i].Scale is initialized to (1, 1, 1)
```

하지만 동적인 값으로 새 요소를 초기화하고 싶을 때가 있을 수 있어요. 이럴 때는 `[StructuredDataInitializer]` 속성을 사용해 새 구조화 데이터 요소를 초기화할 메서드를 지정할 수 있어요:

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

사용자가 **+** 버튼을 클릭하면 `InitializeTransform` 메서드가 호출되어 새로운 구조화 데이터 요소가 초기화돼요.

## 프로그래밍 방식으로 구조화 데이터 생성

구조화 데이터 배열을 수동으로 채우거나, 프로그래밍 방식으로 구조화 데이터 요소를 추가하려면 `StructuredData.Create<T>()` 메서드를 사용하세요:

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
구조화 데이터 인스턴스를 생성할 때 `new MyTransformData()`를 사용하지 마세요. 항상 `StructuredData.Create<T>()`를 사용해 올바른 엔티티 초기화를 보장하세요.
:::

## 접을 수 있는 구조화 데이터

공간 절약을 위해 구조화 데이터를 접을 수 있어요:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '50%'}}>
![](/doc-img/en-structured-data-4.png)
</div>
</div>

`ICollapsibleStructuredData` 인터페이스만 구현하면 돼요:

```csharp
public class MyTransformData : StructuredData, ICollapsibleStructuredData {
    // ...
    
    public string GetHeader() => Position + " " + Rotation + " " + Scale;
}
```

`CollapsedSelf` 및 `CollapsedInHierarchy` 속성을 사용해 구조화 데이터가 접혔는지 여부를 확인할 수 있어요. 예를 들어, Unity 씬에서 구조화 데이터의 접힘 상태에 따라 게임오브젝트의 가시성을 토글할 수 있어요:

```csharp
public override void OnUpdate() {
    base.OnUpdate();
    gameObject.SetActive(!CollapsedInHierarchy);
}
```

## 부모 엔티티 액세스

구조화 데이터에서 부모 엔티티에 접근해야 할 때는 기본 클래스를 `StructuredData<TParent>`로 변경하고 `Parent` 속성을 사용해 자동으로 `TParent` 타입으로 캐스팅된 부모 엔티티에 접근할 수 있어요. `MyTransformData` 예제를 보면:

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

참고로 `OnCreate`가 호출될 때는  `Parent`가 `null` 이므로, 이 시점에 부모 엔티티에 접근하면 안돼요. 대신, `OnAssignedParent()` 콜백을 구현해야 해요:

```csharp
public class MyTransformData : StructuredData<MyTransformAsset> {
    public override void OnAssignedParent() {
        Parent.ParentMethod();
    }
}
```

## 구조화 데이터 인풋 다이얼로그 {#input}

구조화 데이터를 사용하는 가장 흔한 사례 중 하나는 사용자에게 다이얼로그에서 데이터를 입력할 수 있게 하는 거예요. 온보딩 도우미를 기억하나요? 온보딩 과정 중 나타났던 모든 팝업 창이 실제로는 구조화 데이터였어요!

구조화 데이터 인풋 다이얼로그를 만들려면, 구조화 데이터 타입을 정의하고 `Context.Service.PromptStructuredDataInput<T>`를 호출하면 돼요:

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

`[Markdown(primary: true)]` 속성을 문자열 데이터 인풋에 적용하고 `[CardSelect]` 속성을 열거형 데이터 인풋에 적용하며, `[HiddenIf]`를 적절히 사용하면 플러그인에서 깔끔하고 사용자 친화적인 다이얼로그를 만들 수 있어요!

### 재시도 다이얼로그

현재 다이얼로그를 다시 표시하려면, 현재 구조화 데이터를 사용해 `PromptStructuredDataInput`을 다시 호출하면 돼요:

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

이 방법은 사용자가 구조화 데이터에 입력한 내용을 유지하면서 잘못된 입력을 수정할 수 있도록 해줘요.

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
