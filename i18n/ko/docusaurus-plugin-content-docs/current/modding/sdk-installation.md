---
sidebar_position: 1
---

# Unity & Warudo SDK 설치

이 페이지에서는 **Unity Editor**와 **Warudo SDK**를 단계별로 설치하는 방법을 안내할거에요.

---

:::info

현재 **64-bit Windows** 시스템만 지원돼요.

:::

## 1단계 - Unity Hub 설치

먼저, **Unity Hub**를 다운로드해야 해요. (보통 최신 버전이면 괜찮아요.)  
Unity Hub는 서로 다른 버전의 Unity Editor와 그 버전의 프로젝트를 관리하는 데 사용하는 소프트웨어예요.

[**Unity 공식 웹사이트**](https://unity.com/download)를 열고 아래 이미지의 빨간 상자 중 하나를 클릭해서 Unity Hub를 다운로드하세요. 다운로드를 진행하려면 Unity 계정이 필요할 수 있어요.

![](/doc-img/sdk-installation-13.png)

다운로드한 UnityHubSetup.exe 파일을 실행해 원하는 경로에 설치하세요.
설치 후, Unity Hub가 정상적으로 열리는지 확인해 주세요.

![](/doc-img/sdk-installation-2.png)

로그인 후, Unity Hub는 자동으로 최신 장기 지원(LTS) 버전의 Unity Editor를 다운로드하라고 제안해요.
하지만 Warudo는 이 버전을 사용하지 않으니, **Skip installation**를 클릭하는 것이 좋습니다.

만약 해당 버전을 설치하고 싶다면, 설치 경로를 `...\<version>` (예를 들어, `D:\Softwares\Unity\2021.3.18f1`)로 변경하는 것을 강력히 권장해요.  
이렇게 하면 **여러 버전**의 Unity Editor를 더 편리하게 관리할 수 있고, 기본 설치 경로인 `C:\Program Files\Unity\Hub\Editor`를 사용하지 않게 됩니다.

![](/doc-img/sdk-installation-3.png)

Unity의 개인용 에디션 사용 조건을 충족하는 경우, 이 단계에서 개인 라이선스를 활성화하고 받을 수 있어요.

![](/doc-img/sdk-installation-4.png)

이전 단계에서 활성화를 건너뛰었거나 활성화가 실패한 경우, 나중에 Unity Hub에서 라이선스를 수동으로 활성화할 수도 있어요.

![](/doc-img/sdk-installation-5.png)

![](/doc-img/sdk-installation-6.png)

![](/doc-img/sdk-installation-7.png)

Unity HubUnity Hub의 언어는 【Preferences】-【Appearance】에서 변경할 수 있어요.

![](/doc-img/sdk-installation-8.png)

## 2단계 - Unity Editor 설치

다음으로 Unity Editor 설치 프로그램을 다운로드해야 하는데, 반드시 **Unity 2021.3.18f1** 버전 이어야 해요.

이 버전은 Unity Hub에서 직접 다운로드할 수 없으므로, 다음과 같은 절차를 따르세요:

1. [Unity Download Archive](https://unity.com/releases/editor/archive)로 이동합니다;
2. **【Unity 2021.X】** 탭에서 【Unity **2021.3.18** (February 1, 2023)】을 찾습니다;
3. 【Downloads (Win)】을 클릭합니다;
4. **【Unity Editor (64-bit)】**를 선택합니다;
5. 【 `UnitySetup 64-2021.3.18f1.exe` 】가 다운로드 완료될 때까지 기다립니다. (약 2.3 GiB 크기);

![](/doc-img/sdk-installation-9.png)

다음으로 `UnitySetup 64-2021.3.18f1.exe` 파일을 실행해 설치를 시작하세요

기본 설치 위치는 `C:\Program Files\Unity 2021.3.18f1`이며, 설치 경로는 변경할 수 있지만 버전 충돌을 피하기 위해 경로에 **버전 번호를 포함**하는 것이 좋습니다.

설치 과정은 다소 시간이 걸리니 인내심을 가지고 기다리세요.

설치가 완료 된 후 다음 단계를 진행하세요:

1. Unity Hub를 엽니다;
2. 【Installs】 탭에서 【Locate】을 클릭합니다;
3. 설치 경로에서 【Editor】 하위 폴더를 찾아 【Unity.exe】 파일을 선택합니다;
4. 선택 후 【Select Editor】를 클릭합니다.

이제 Unity Hub에서 `2021.3.18f1` 버전의 Unity.exe가 정상적으로 표시될 거예요.

![](/doc-img/sdk-installation-10.png)

## 3단계 - Warudo SDK 다운로드 및 임포트

Unity에 Warudo SDK를 설정하는 방법에는 두 가지가 있어요: 

- 모드 프로젝트 템플릿을 다운로드하는 방법, 
- SDK `.unitypackage` 파일을 프로젝트에 수동으로 임포트하는 방법 

첫 번째 옵션을 권장해요. 이 방법이 더 쉽고 오류가 발생할 가능성이 적어요.  
두 번째 옵션은 기존 모딩 프로젝트를 업데이트할 때 더 적합해요.

### 옵션 1: 모드 프로젝트 템플릿 (추천)

[Warudo SDK 0.12.0 Modding Project.zip](https://docs.warudo.app/sdk/Warudo%20SDK%200.12.0%20Modding%20Project.zip)

1. 위의 zip 파일을 **다운로드**한 후, 내용을 원하는 위치에 **압축 해제**하세요. 예를 들어, `D:\Softwares\Unity\2021.3.18f1\Projects\WarudoModding` 같은 경로로 해제할 수 있어요.
2. Unity Hub에서 **"Add"** 버튼을 클릭하고, 위에서 선택한 폴더를 선택하세요.
3. 그 후 Unity가 프로젝트를 실행할 때까지 기다리세요. 프로젝트를 처음 열 때 Unity가 프로젝트를 설정하는 데 5-10분 정도 걸릴 수 있어요.

![](/doc-img/en-mod-9.png)

콘솔에서 오류가 있는지 확인하세요. 몇 가지 경고가 표시될 수 있는데, 이는 정상이에요:

![](/doc-img/en-mod-10.png)

오류가 없다면 준비 완료! 이제 [당신의 첫 모드를 만들어보세요](creating-your-first-mod).

:::tip

콘솔에 오류가 보인다면 "Clear" 버튼을 클릭해 오류가 사라지는지 확인해 보세요. 그래도 문제가 해결되지 않으면, [Discord](https://discord.gg/warudo)에서 저희에게 문의하세요.

:::

### 옵션 2: 수동 설치 (권장하지 않음)

:::caution

**기존 모딩 프로젝트를 업데이트**하거나, 첫 번째 옵션이 작동하지 않는 매우 드문 경우에만 이 옵션을 사용하세요.

:::

Unity 프로젝트를 연 후, 프로젝트 폴더 아래 `Packages/manifest.json`파일을 열고(이 파일은 Unity 에디터에서 보이지 않아요) `dependencies` 섹션에 다음 **9개** dependencies를 추가하세요:

```
{
  "dependencies": {
    "com.unity.burst": "1.7.2",
    "com.unity.cinemachine": "2.8.9",
    "com.unity.collections": "1.4.0",
    "com.unity.postprocessing": "3.2.2",
    "com.unity.nuget.newtonsoft-json": "3.0.2",
    "com.vrmc.gltf": "https://github.com/vrm-c/UniVRM.git?path=/Assets/UniGLTF#v0.107.0",
    "com.vrmc.univrm": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRM#v0.107.0",
    "com.vrmc.vrmshaders": "https://github.com/vrm-c/UniVRM.git?path=/Assets/VRMShaders#v0.107.0",
    "com.cysharp.unitask": "https://github.com/Cysharp/UniTask.git?path=src/UniTask/Assets/Plugins/UniTask",
    // ...
```

Unity로 돌아가 프로젝트가 다시 로드될 때까지 기다리고, 오류가 없는지 확인하세요.

:::caution

만약 `An error occurred while resolving packages / Error adding package`라는 메시지와 함께 `No 'git' executable was found. Please install Git on your system then restart Unity and Unity Hub`와 비슷한 오류 메시지가 나타난다면, 시스템에 Git이 설치되어 있지 않은 것입니다.

![](/doc-img/en-mod-sdk-1.webp)

이 문제를 해결하려면 [https://git-scm.com/download](https://git-scm.com/download)에서 Git을 다운로드한 후 Unity와 Unity Hub를 재시작하세요.

:::

**File → Build Settings... → Player Settings... → Other Settings**에서 **Api Compatibility Level**이 .NET Framework로 설정되어 있는지 확인하세요.

![](/doc-img/en-mod-sdk-2.webp)

아래의 `.unitypackage`를 다운로드하여 Unity 프로젝트에 임포트하세요:

<a href="/sdk/Warudo SDK 0.12.0.unitypackage" target="_blank">
<div className="file-box">
<p>
Warudo SDK 0.12.0.unitypackage
</p></div>
</a>

:::caution

**기존** 프로젝트에 임포트하는 경우, 다음 항목 중 설치된 것이 있다면:

* [Animancer](https://assetstore.unity.com/packages/tools/animation/animancer-pro-116514)
* [Dynamic Bones](https://assetstore.unity.com/packages/tools/animation/dynamic-bone-16743)
* [Final IK](https://assetstore.unity.com/packages/tools/animation/final-ik-14290)
* [Magica Cloth](https://assetstore.unity.com/packages/tools/physics/magica-cloth-160144)
* [PuppetMaster](https://assetstore.unity.com/packages/tools/physics/puppetmaster-48977)

해당 폴더를 임포트에서 체크 해제하세요. 그렇지 않으면 컴포넌트가 스텁 파일로 대체됩니다::

* `Plugins/Animancer`
* `Packages/DynamicBone`
* `Plugins/RootMotion/FinalIK`
* `Plugins/MagicaCloth`
* `Plugins/RootMotion/PuppetMaster`

:::

콘솔에서 오류가 있는지 확인하세요. 오류가 없다면, 이제 [당신의 첫 모드를 만들어보세요](creating-your-first-mod).

:::tip

콘솔에 오류가 보인다면 "Clear" 버튼을 클릭해 오류가 사라지는지 확인해 보세요. 그래도 문제가 해결되지 않으면, [Discord](https://discord.gg/warudo)에서 저희에게 문의하세요.

:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
