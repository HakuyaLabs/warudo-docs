---
sidebar_position: 2
---

# 당신의 첫 플러그인 모드를 만들어보세요

지난 튜토리얼에서는 [Playground](playground)를 사용해 커스텀 노드와 에셋을 로드했어요. 하지만 Playground는 몇 가지 한계가 있어요: 예를 들어, 유니티 에셋을 참조할 수 없기 때문에, 커스텀 유니티 파티클 프리팹을 스폰하는 노드를 만들고 싶다면 Playground만으로는 해결할 수 없어요.

이번 튜토리얼에서는 [Warudo SDK](../modding/mod-sdk)를 사용해 우리가 만든 `HelloWorldNode`와 `CookieClickerAsset`을 포함하는 플러그인 모드를 빌드할 거예요. 플러그인 모드는 유니티 에셋을 저장하고 참조할 수 있을 뿐만 아니라, 다른 사용자와 커스텀 노드 및 에셋을 공유할 수도 있어요.

## 1단계: Warudo SDK 프로젝트 생성

아직 [Warudo SDK 설치](../modding/sdk-installation) 가이드를 따라 새로운 Warudo SDK 프로젝트를 만들지 않았다면 만들어 주세요. 먼저 [당신의 첫 모드를 만들어보세요](../modding/creating-your-first-mod) 튜토리얼을 따라 Warudo SDK에 익숙해지는 것을 권장해요.

:::tip
플러그인 모드를 빌드하는 과정은 다른 종류의 모드를 빌드하는 것과 매우 비슷해요! 유일한 차이점은, 플러그인 모드가 `Plugin` 클래스를 상속하는 C# 스크립트를 포함해야 한다는 점이에요.
:::

## 2단계: 새 모드 만들기

새 모드를 만들려면, 메뉴 바에서 **Warudo → New Mod**를 선택하세요:

![](/doc-img/en-mod-sdk-3.webp)

**Mod Name**에 "HelloWorldPlugin"을 입력하고, Create Mod! 버튼을 클릭하세요:

![](/doc-img/en-plugin-mod-1.png)

Assets 폴더 하위에 모드를 위한 폴더가 생성된 것을 확인할 수 있을 거예요.

## 3단계: 플러그인 스크립트 만들기

"HelloWorldPlugin" 모드 폴더에서 마우스 오른쪽 클릭 후, 새 C# 스크립트를 만들어 `HelloWorldPlugin.cs`라고 이름을 지정하세요. 스크립트에 아래 코드를 붙여넣으세요:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;

[PluginType(
    Id = "hakuyatira.helloworld",
    Name = "Hello World",
    Description = "A simple plugin that says hello to the world.",
    Version = "1.0.0",
    Author = "Hakuya Tira",
    SupportUrl = "https://docs.warudo.app",
    AssetTypes = new [] { typeof(CookieClickerAsset) },
    NodeTypes = new [] { typeof(HelloWorldNode) })]
public class HelloWorldPlugin : Plugin {

    protected override void OnCreate() {
        base.OnCreate();
        Debug.Log("The Hello World plugin is officially enabled! Hooray!");
    }

}
```

[이전 튜토리얼](creating-your-first-script)에서 사용했던 `HelloWorldNode.cs`와 `CookieClickerAsset.cs` 파일을 "HelloWorldPlugin" 모드 폴더에 복사하세요.

이제 모드 폴더는 다음과 같이 보여야 합니다:

<div style={{display: 'flex', justifyContent: 'space-between', gap: '1rem'}}>
<div style={{width: '25%'}}>
<img src="/doc-img/en-plugin-mod-2.png" />
</div>
</div>

## 4단계: 플러그인 모드 익스포트

거의 완료되었어요! 모드를 익스포트하기 전에 **Warudo → Mod Settings**에서 모드 설정이 올바른지 확인하세요. 모드의 이름, 버전, 저자, 설명 등을 설정할 수 있는데, 이는 `[PluginType]` 파라미터와 동일해야 해요.

기본적으로 **Mod Export Directory**는 비어 있는데, 이 경우 모드는 프로젝트의 루트 폴더로 익스포트돼요. 대신 Warudo의 데이터 폴더 내 `Plugins` 디렉토리로 설정할 수 있어요. 예를 들어, `C:\Program Files (x86)\Steam\steamapps\common\Warudo\Warudo_Data\StreamingAssets\Plugins` 경로로 설정할 수 있어요..

:::warning
익스포트하기 전에 Warudo를 닫고 `Playground` 디렉토리에서 `HelloWorldNode.cs`와 `CookieClickerAsset.cs` 파일을 삭제하세요. 이는 Playground와 플러그인 모드 간의 충돌을 방지하기 위함이에요.
:::

**Warudo → Export Mod** 를 선택해 플러그인 모드를 익스포트하세요. 모든 것이 제대로 진행되면 콘솔에 `BUILD SUCCEEDED!` 메시지가 표시될 거예요:

![](/doc-img/en-plugin-mod-4.png)

모드 폴더의 스크립트가 실제로 플러그인 모드로 컴파일되었는지 확인하는 것이 좋아요. 콘솔을 스크롤하여 아래와 같은 라인을 찾으세요:

![](/doc-img/en-plugin-mod-5.png)

:::warning
이 라인이 보이지 않으면, Unity 프로젝트가 C# 스크립팅을 위해 올바르게 설정되지 않았을 수 있어요. [이 섹션](../modding/mod-sdk#custom-scripts)의 단계를 다시 따라 플러그인 모드를 익스포트하세요.
:::

익스포트된 `HelloWorldPlugin.warudo` 폴더가 Warudo의 데이터 폴더 내 `Plugins` 디렉토리에 있는지 확인하세요. 이제 Warudo를 열고 About 대화 상자에서 플러그인 모드가 로드되었는지 확인할 수 있어요:

![](/doc-img/en-plugin-mod-3.png)

그리고 물론 Cookie Clicker 에셋이 **Add Asset** 메뉴에, Hello World 노드가 노드 팔레트에 표시될 거예요:

![](/doc-img/en-getting-started-playground-7.png)

![](/doc-img/en-getting-started-playground-2.png)

짜잔! Warudo에서의 첫 플러그인 모드 완성입니다!

## 5단계: Unity 에셋 로드하기

이제 플러그인 모드를 만들었으니, Warudo에 커스텀 Unity 에셋을 로드할 수 있어요! 이번에는 `CookieClickerAsset` 스크립트에서 Unity 에셋을 로드해볼 거예요.

먼저 Unity Asset Store에서 [Cartoon FX Remaster Free](https://assetstore.unity.com/packages/vfx/particles/cartoon-fx-remaster-free-109565)를 다운로드하고, Unity 프로젝트에 임포트하세요. 패키지에서 파티클 프리팹을 선택한 후, **Ctrl** 키를 누른 상태로 "HelloWorldPlugin" 폴더에 드래그하세요. 이번 예제에서는 "CFXR Explosion 1" 프리팹을 사용할 거예요.

![](/doc-img/en-plugin-mod-6.png)

프리팹 이름을 `Particle`로 변경하세요. 이제 모드 폴더는 아래와 같이 보일 거예요:

![](/doc-img/en-plugin-mod-7.png)

`CookieClickerAsset.cs` 스크립트를 열고, 아래 코드로 교체하세요:

```csharp
using System;
using Cysharp.Threading.Tasks;
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Scenes;
using Object = UnityEngine.Object;
using Random = UnityEngine.Random;

[AssetType(Id = "82ae6c21-e202-4e0e-9183-318e2e607672", Title = "Cookie Clicker")]
public class CookieClickerAsset : Asset {

    [Markdown] 
    public string Status = "You don't have any cookies.";

    [DataInput] 
    [IntegerSlider(1, 10)]
    [Description("Increase me to get more cookies each time!")]
    public int Multiplier = 1;

    private int count;
    private GameObject particlePrefab; // New field to store the particle prefab

    [Trigger]
    public async void GimmeCookie() { // Note the async keyword
        count += Multiplier;
        SetDataInput(nameof(Status), "You have " + count + " cookie(s).", broadcast: true);
        
        // Spawn the particle prefab Multiplier times
        for (var i = 0; i < Multiplier; i++) {
            var particle = Object.Instantiate(particlePrefab, Random.insideUnitSphere * 2f, Quaternion.identity);
            particle.SetActive(true);
            Object.Destroy(particle, 3f); // Automatically destroy the cloned particle after 3 seconds

            await UniTask.Delay(TimeSpan.FromSeconds(0.2f)); // Delay 0.2 seconds before spawning the next particle
        }
    }

    protected override void OnCreate() {
        base.OnCreate();
        SetActive(true);
        
        // Load the particle prefab from the mod folder. Change this path if your prefab is in a different folder
        particlePrefab = Plugin.ModHost.Assets.Instantiate<GameObject>("Assets/HelloWorldPlugin/Particle.prefab");
        // Disable it so that it doesn't show up in the scene
        particlePrefab.SetActive(false);
    }

}
```

모드를 다시 익스포트하세요. Warudo는 플러그인의 핫 리로딩을 지원하므로 `Plugins` 폴더에 모드를 익스포트하면 Warudo에서 바로 변경 사항을 확인할 수 있어요!

Cookie Clicker 에셋에서 "Gimme Cookie" 버튼을 누르면 파티클 프리팹이 씬에 생성되는 것을 볼 수 있을 거예요:

![](/doc-img/en-plugin-mod-8.png)

:::info
Warudo Pro 사용자라면, 파티클 효과를 보기 위해 내장 렌더링 파이프라인으로 전환하세요. 또는 URP 호환 파티클 에셋을 사용할 수도 있어요.
:::

Warudo에서 이런 작업을 할 수 있다니, 정말 멋지지 않나요?

## Playground와 비교

플러그인 모드를 사용하는 것이 [Playground](playground)보다 강력하지만, 단점도 있어요:

* 플러그인 모드를 개발할 때는 매번 변경 사항을 반영하기 위해 모드를 익스포트해야 하므로 속도가 느려질 수 있어요;
* 현재 Playground는 MessagePack, WebSocketSharp 등 Warudo에서 사용하는 더 많은 라이브러리에 접근할 수 있어요 (플러그인 모드를 개선하기 위한 작업이 진행 중이에요);
* 플러그인 모드는 더 많은 [보안 제한](plugin-mod#limitations)이 있어요. 예를 들어 `System.IO` 네임페이스에 접근할 수 없어요. (이를 대신할 수 있는 안전한 [sandboxed file persistence API](api/io)를 제공해요).

플러그인 모드나 Playground 중 어떤 것을 사용할지는 용도에 따라 달라요. Unity 에셋을 참조할 필요가 없는 새로운 기능이나 아이디어를 프로토타입으로 제작해 테스트할 때는 Playground가 빠르게 결과를 확인할 수 있는 훌륭한 도구예요. VTuber를 위한 맞춤형 개발에서도 Playground는 클라이언트를 위한 작은 기능을 구현하는 데 적합해요. 하지만 커스텀 Unity 에셋을 로드하거나 [our Steam Workshop](../modding/sharing)에 커스텀 노드와 에셋을 배포하려면 플러그인 모드가 더 적합해요. (그래도 플러그인 모드로 옮기기 전에 Playground에서 커스텀 노드와 에셋을 먼저 프로토타입으로 제작해볼 수 있다는 점은 여전히 유용하죠!)

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
    {name: 'Willycho', github: 'Willycho'},
],
}} />
