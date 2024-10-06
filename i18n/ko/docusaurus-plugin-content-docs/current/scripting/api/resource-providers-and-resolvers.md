---
sidebar_position: 200
---

# 리소스 프로바이더와 리졸버

Warudo에서 리소스는 에셋과 노드에서 사용할 수 있는 외부 데이터를 의미해요. 예를 들어, 캐릭터 리소스는 `.vrm` 및 `.warudo` 파일이며, 이는 `Characters` 디렉토리에 저장돼요. 캐릭터 애니메이션 리소스는 Warudo에서 제공하는 500개 이상의 기본 애니메이션과 `CharacterAnimations` 디렉토리에 있는 커스텀 [캐릭터 애니메이션 모드](../../modding/character-animation-mod)를 포함해요. [스크린](../../assets/screen) 이미지 리소스는 `Images` 디렉토리에 있는 이미지 파일 등이 있어요.

## 개요

내부적으로, 각 리소스는 **resource URI**로 고유하게 식별되며, 이런 식으로 나타나요: `character://data/Characters/MyModel.vrm` 또는 `character-animation://resources/Animations/AGIA/01_Idles/AGIA_Idle_generic_01`.

캐릭터 에셋의 `Source` 드롭다운과 같은 리소스 드롭다운을 열면, 드롭다운이  **리소스 제공자** 를 쿼리해 호환 가능한 resource URI 목록을 받아요. 캐릭터 에셋의 경우, 두 개의 리소스 제공자가 결과를 반환해요: 하나는 `Characters` 디렉토리에서 파일을 찾고, 다른 하나는 Steam Workshop에서 설치된 캐릭터 모드를 찾아요.

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '75%'}}>
![](/doc-img/en-resource-providers-1.png)
</div>
</div>

리소스 URI를 선택하면 Warudo는 해당 **리소스 URI 리졸버**를 호출해 리소스 데이터를 로드해요. 예를 들어, `.vrm` 파일과 `.warudo` 파일은 각각 다른 리졸버가 로드하지만, 두 리졸버는 모두 `GameObject`를 반환해요(Unity 씬에 로드된 캐릭터). 따라서 캐릭터 에셋은 이 둘을 동일하게 처리할 수 있어요.

리소스 프로바이더와 리졸버는 반드시 [플러그인](plugins)에 의해 등록돼야 해요. 

## 프로바이더

큐브와 구체 같은 소품 리소스를 제공하는 커스텀 리소스 프로바이더를 등록하는 토이 플러그인 예제를 살펴볼게요.

```csharp
using System;
using System.Collections.Generic;
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Core.Resource;

[PluginType(
    Id = "hakuyatira.primitiveprops", 
    Name = "Primitive Props",
    Description = "A simple plugin that registers primitive props.",
    Version = "1.0.0", 
    Author = "Hakuya Tira", 
    SupportUrl = "https://docs.warudo.app")]
public class PrimitivePropsPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Context.ResourceManager.RegisterProvider(new PrimitivePropResourceProvider(), this);
    }
    
}

public class PrimitivePropResourceProvider : IResourceProvider {
    public string ResourceProviderName => "Primitives"; // The name of your provider
    
    public List<Resource> ProvideResources(string query) {
        if (query != "Prop") return null; // If the query is not "Prop", we don't have any compatible resources
        return new List<Resource> {
            new Resource {
                category = "Primitives", // Category that will be shown in the dropdown
                label = "Cube", // Label that will be shown in the dropdown
                uri = new Uri("prop://primitives/cube") // Underlying resource URI
            },
            new Resource {
                category = "Primitives",
                label = "Sphere",
                uri = new Uri("prop://primitives/sphere")
            }
        };
    }
}
```

위 예제에서, 우리는 두 가지 소품 리소스(큐브와 구체)를 제공하는 커스텀 리소스 프로바이더를 등록해요. `ProvideResources` 메서드는 쿼리가 `"Prop"`일 때만 리소스 목록을 반환하는데, 이는 소품 에셋이 `"Prop"`이라는 쿼리로 소품 리소스를 요청하기 때문이에요. 예시는 다음과 같아요:

```csharp
// In the prop asset class
[AutoCompleteResource("Prop")]
public string Source;
```

:::tip
내장 에셋에서 사용하는 쿼리 목록은 [내장 리소스 타입](#built-in-resource-types) 섹션에서 확인할 수 있어요.
:::

:::tip
`prop://primitives/cube`와 같은 방식으로 URI를 작성하는데, 소품 리소스에는 `prop://` 스킴을 사용하는 것이 관례지만, 반드시 이를 따를 필요는 없어요. 특히, 리소스 URI에 대한 커스텀 리졸버를 작성하는 경우에는 더 자유롭게 작성할 수 있어요.
:::

플러그인이 로드된 후, 소품 에셋의 `Source` 드롭다운을 열면, 우리가 커스텀 리소스 프로바이더로 제공한 두 가지 리소스를 확인할 수 있을 거예요.

![](/doc-img/en-resource-providers-2.png)

이 리소스를 선택하면 해당하는 리소스 URI 리졸버가 호출되어 소품 데이터를 로드하게 돼요. 하지만 아무도 우리의 URI를 어떻게 해결할지 모르니, 이제 URI를 해결할 리졸버를 만들어볼게요.

## URI 리졸버

다음 클래스를 플러그인에 추가해 주세요:

```csharp
public class PrimitivePropResourceUriResolver : IResourceUriResolver {
    public object Resolve(Uri uri) {
        if (uri.Scheme != "prop" || uri.Authority != "primitives") return null;
        var path = uri.LocalPath.TrimStart('/');
        
        return path switch {
            "cube" => GameObject.CreatePrimitive(PrimitiveType.Cube),
            "sphere" => GameObject.CreatePrimitive(PrimitiveType.Sphere),
            _ => throw new Exception("Unknown primitive prop: " + path)
        };
    }
}
```

첫 두 줄은 URI가 우리의 커스텀 형식인 `prop://primitives/xxx`와 일치하는지 확인해요. 일치하는 경우, URI의 마지막 부분(`path`)을 추출하여 큐브나 구체를 생성해요. 소품 에셋이 소품 리소스를 선택할 때 기대하는 것이 `GameObject`이므로 게임오브젝트를 직접 반환해요.

:::tip
반환되는 오브젝트 타입은 해당 리소스를 사용하는 에셋과 호환되어야 해요. 예를 들어, 캐릭터 에셋은 캐릭터 리소스를 선택할 때 `GameObject`를 기대하고, 화면 에셋은 이미지 리소스를 선택할 때 `ImageResource`를 기대해요. 내장 에셋에서 기대하는 타입 목록은 [내장 리소스 타입](#built-in-resource-types) 섹션에서 확인할 수 있어요.
:::

이제 플러그인의 `OnCreate` 메서드에서 리졸버를 등록하기만 하면 돼요:

```csharp
Context.ResourceManager.RegisterUriResolver(new PrimitivePropResourceUriResolver(), this);
```

플러그인이 다시 로드되면, 소품 에셋에서 큐브나 구체를 선택할 때 Warudo가 Unity 씬에 큐브나 구체를 생성할 거예요!

## 모드 컬렉션

리소스 프로바이더와 리졸버의 일반적인 사용 사례 중 하나는 모드 컬렉션을 제공하는 거예요. 예를 들어, Unity에 100개의 소품 프리팹이 있고 이를 Warudo에서 사용하고 싶다면, 100개의 [소품 모드](../../modding/prop-mod)를 `Props` 디렉토리에 익스포트하는 대신, 플러그인의 모드 폴더에서 프리팹을 직접 로드하는 커스텀 리소스 프로바이더와 리졸버를 작성할 수 있어요(자세한 내용은 [로딩 Unity 에셋](plugins#loading-unity-assets) 참고). 이렇게 하면 모든 리소스를 드롭다운에서 동일한 카테고리로 볼 수 있는 추가 이점도 얻을 수 있어요.

:::tip
모드 컬렉션 플러그인을 작성하는 모범 사례는 [카타나 애니메이션](https://gist.github.com/TigerHix/2cb8052b0e8aeeb7f9cb796dc7edc6a3) 샘플 플러그인을 참고하세요.
:::

## 커스텀 리소스 타입

리소스는 제네릭하게 설계되었기 때문에 어떤 종류의 데이터에도 사용할 수 있어요. 예를 들어, 사용자가 이모트를 스폰할 수 있게 해주는 플러그인을 작성하려 한다면 `Emote`라는 커스텀 리소스 타입을 만들 수 있어요::

```csharp
[AutoCompleteResource("Emote")]
public string Emote; // This will be used by the user to select the emote URI
```

그런 다음, 쿼리가 `"Emote"`일 때 이모트 URI(예: `emote://xxx/yyy`) 목록을 제공하는 커스텀 리소스 프로바이더와, URI 스킴이 커스텀 스킴과 일치할 때 이모트 데이터를 로드하는 커스텀 리소스 URI 리졸버를 작성할 수 있어요.

## 내장 리소스 타입 {#built-in-resource-types}

내장 에셋에서 사용하는 내장 리소스 타입 목록이에요:

| Query              | Example(s)                               | Expects                                    |
|--------------------|------------------------------------------|--------------------------------------------|
| `"Character"`          | Character                                | `GameObject `                                |
| `"CharacterAnimation"` | Character, Play Character Idle Animation | `AnimationClip`                              |
| `"Environment"`        | Environment                              | `Scene` or `ValueTuple<ModHost, Scene>`       |
| `"Image"`              | Screen                                   | `Warudo.Plugins.Core.Utils.ImageResource`    |
| `"Music"`              | Music Player                             | `string` (absolute file path)                |
| `"Particle"`           | Throw Prop At Character                  | `GameObject`                                 |
| `"Prop"`               | Prop                                     | `GameObject`                                 |
| `"Sound"`              | Play Sound, Throw Prop At Character      | `AudioClip`                                  |
| `"Video"`              | Screen                                   | `string` (absolute file path)                |

## 썸네일 리졸버

리소스 드롭다운이 `[PreviewGallery]` 속성으로 주석 처리된 경우, 사용자는 "Preview Gallery" 버튼을 클릭하여 리소스의 썸네일 그리드를 볼 수 있어요. 이 기능은 리소스가 이미지, 소품, 포즈 또는 기타 시각적 데이터를 포함할 때 유용해요.

썸네일을 제공하려면 `IResourceUriThumbnailResolver` 인터페이스를 구현하여 비동기적으로 썸네일 이미지 데이터의 `byte[]`를 반환해야 해요. 그런 다음, 플러그인의 `OnCreate` 메서드에서 리졸버를 등록하세요:

```csharp
Context.ResourceManager.RegisterUriThumbnailResolver(new MyUriThumbnailResolver(), this);
```

:::tip
최상의 경험을 위해 썸네일 이미지는 50ms 이내에 로드될 수 있도록 하세요.
:::

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
