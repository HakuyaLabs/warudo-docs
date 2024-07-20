---
sidebar_position: 10
---


# 시작하기

## 기본 설정

먼저, Warudo를 열면 **메인 창**과 **에디터 창**이 보일 거에요.

![](/doc-img/en-getting-started-1.png)
<p class="img-desc">메인 창.</p>

![](/doc-img/en-getting-started-2.png)
<p class="img-desc">에디터 창.</p>

에디터는 캐릭터, 환경 등을 설정하는 데 사용되며, 메인 창은 모든 작업이 진행되는 곳이에요. 에디터 창은 언제든지 닫을 수 있으며, 메인 창이 선택된 상태에서 **Esc** 키를 눌러 다시 열 수 있어요.

이제 시작해봐요! **Basic Setup → Get Started**를 클릭하세요.

![](/doc-img/en-getting-started-3.png)
<p class="img-desc">기본 설정 창.</p>

**Open Characters Folder**를 클릭하면 파일 탐색기에서 "Characters"라는 폴더가 열릴 거예요. 여기에 캐릭터 모델을 넣으면 돼요.

Warudo는 두 가지 모델 형식을 지원해요: `.vrm`과 `.warudo`. `.vrm`는 [VRoid Studio](https://vroid.com/en/studio)와 같은 소프트웨어에서 보내준 표준 아바타 형식이고, `.warudo`는 Warudo의 고유 형식으로 사실상 모든 Unity 호환 캐릭터 모델을 지원해요([details](../modding/character-mod.md)). 지금은 "Characters" 폴더에 `.vrm` 파일을 넣어보도록 해요.

:::info
**Q:** Warudo는 `.vsfavatar` 모델을 지원하나요?

**A:** 아니요, Warudo는 `.vsfavatar` 모델을 지원하지 않아요. 하지만 `.vsfavatar` 모델을 만드는데 사용된 Unity 소스 파일에 접근할 수 있다면, `.warudo` 모델을 만드는 것은 매우 쉬워요; `.vsfavatar`와 `.warudo`는 모두 Unity에서 내보내지거든요. 자세한 내용은 [modding guide](../modding/character-mod.md)를 참조해 주세요.
:::

이제 Warudo로 돌아가서 드롭다운 메뉴를 열어보세요. 목록에서 캐릭터의 이름을 볼 수 있을 거예요. 이를 선택하면 캐릭터가 화면에 로드된 것을 확인할 수 있어요!

![](/doc-img/en-getting-started-4.png)
<p class="img-desc">화면에 로드 된 캐릭터.</p>

다음 단계로 넘어가기 위해 **OK**를 클릭하세요. 이 단계에서 Warudo가 모션 캡쳐 설정을 추천해줄지 여부를 물어볼 거예요. "Yes,"를 선택하면 Warudo가 몇 가지 질문을 통해 얼굴 추적 및 자세 추적 솔루션을 결정해요. 예를 들어, 아이폰과 웹캠을 가지고 있고 Leap Motion Controller나 전신 추적 하드웨어가 없는 경우, Warudo는 얼굴 추적을 위해 [iFacialMocap](../mocap/ifacialmocap.md) (아이폰 어플)을, 손 추적을 위해 웹캠을 [MediaPipe](../mocap/mediapipe.md) (웹캠에 내장된 추적 기능을 이용하는)을 추천할 거에요. 만약 "No"를 선택하면 얼굴 추적 및 자세 추적 솔루션을 수동으로 선택해야 해요.

처음 사용하는 사용자라면, Warudo가 모션 캡처 설정을 추천하도록 "Yes"를 선택하는 것을 권장드려요. **OK**를 클릭하고 자신의 설정을 가장 잘 설명하는 옵션을 선택한 후 다시 **OK**를 클릭하세요.

![](/doc-img/en-getting-started-5.png)
<p class="img-desc">모션 캡처 설정.</p>

![](/doc-img/en-getting-started-6.png)
<p class="img-desc">질의응답.</p>

다음 화면에서 Warudo가 선택한 얼굴 추적 및 자세 추적 솔루션을 확인하라는 요청을 받을 거예요:

![](/doc-img/en-getting-started-7.png)
![](/doc-img/en-getting-started-8.png)
<p class="img-desc">모션 캡처 설정 확인.</p>

:::tip
보조 추적을 설정하려면 **Secondary Pose Tracking** 옵션을 사용할 수 있어요. 이는 VR 트래커/Mocopi를 기본 추적으로 사용하고 [MediaPipe](../mocap/mediapipe.md)나 [Leap Motion Controller](../mocap/leap-motion.md) 또는 [StretchSense Gloves](../mocap/stretchsense.md) 등을 추가하여 손가락 추적을 할 때 유용해요.
:::

다음 단계로 넘거가기 위해 **OK**를 클릭하세요. 모델에 표정이 포함되어 있다면, Warudo가 이를 가져오고 단축키를 할당하는데 도움을 줄 수 있어요. **Yes**를 선택하고 계속하려면 **OK**를 클릭하세요.

![](/doc-img/en-getting-started-9.png)
<p class="img-desc">표정 가져오기.</p>

팝업 창이 나타나면 방금 가져온 표정들과 그에 할당된 단축키 목록이 표시돼요. 하지만 걱정하지 마세요, 단축키는 나중에 변경할 수 있어요. 계속하려면 **OK**를 클릭하세요.

![](/doc-img/en-getting-started-10.png)
<p class="img-desc">표정 단축키 확인.</p>

마지막으로, VTubing 화면의 배경을 선택하라는 요청을 받아요. 투명 배경이나 기본 스카이박스를 사용할 수 있지만, Warudo에는 사용할 수 있는 몇 가지 멋진 배경(**환경**이라 불려요)이 제공돼요. **Yes**를 선택하고 **VR Room** 환경을 선택하도록 해요. 설정을 완료하려면 **OK**를 클릭하세요.

![](/doc-img/en-getting-started-11.png)
<p class="img-desc">환경 선택.</p>

메인 창은 아래 사진처럼 보여야해요:

![](/doc-img/en-getting-started-12.png)
<p class="img-desc">설정 후 화면.</p>

이미 추적 소프트웨어/하드웨어를 연결했다면,——예를 들어 저의 경우에는 iPhone에서 iFacialMocap 앱을 열었어요——이제 캐릭터가 움직이는 것을 볼 수 있을 거예요!

![](/doc-img/en-getting-started-13.png)
<p class="img-desc">캐릭터 움직임.</p>

이제 기본 조작법을 배워봐요!

## 화면 컨트롤

잠시 시간을 내어 캐릭터 모델을 감상해봐요. 기본적으로 화면 카메라는 **Orbit Character(캐릭터 궤도)** 모드로 설정되어 있어서 카메라가 항상 캐릭터 주위를 회전해요. **마우스 좌클릭/우클릭**을 사용해 뷰를 회전시키고, **마우스 휠**로 확대하거나 축소하며, **마우스 휠클릭**으로 뷰를 이동할 수 있어요. 카메라를 다음 각도로 이동해보세요:

![](/doc-img/en-getting-started-14.png)
<p class="img-desc">캐릭터 주위를 도는 카메라.</p>

이제 캐릭터를 이동시키는 방법을 배워보도록 해요. 에디터 창에서 **Character**를 클릭하여 캐릭터 Asset을 선택하세요.

![](/doc-img/en-getting-started-15.png)
<p class="img-desc">캐릭터 Asset 선택.</p>

모델 발 밑에 있는 **이동 기즈모**를 볼 수 있을 거예요. 이를 사용해 모델을 이동시킬 수 있어요. 축을 따라 이동하려면 축을 따라 끌기만 하면 돼요. 여기서는 모델을 침대 옆으로 이동시켰어요:

![](/doc-img/en-getting-started-16.png)
<p class="img-desc">모델 움직이기.</p>

:::tip
기즈모가 보이지 않나요? **마우스 휠클릭**을 눌러 뷰를 이동해 보세요.
:::

**E** 키를 눌러 **회전 기즈모**로 전환할 수 있어요 (참고로, **W**를 눌러 다시 이동 기즈모로 전환할 수 있어요). 모델을 약간 회전시켜 봅시다:

![](/doc-img/en-getting-started-17.png)
<p class="img-desc">모델 회전시키기.</p>

**R** 키를 눌러 **크기 조절 기즈모**로 전환할 수 있어요. 보통은 캐릭터의 크기를 조절하지 않지만, 재미 삼아 모델을 더 넓게 만들어 봅시다:

![](/doc-img/en-getting-started-18.png)
<p class="img-desc">모델 크기 조절.</p>

보기 좋지 않네요! 크기를 어떻게 복원할 수 있을까요? 주의를 기울였다면, 기즈모를 드래그할 때 **Transform** 섹션의 값들이 변하는 것을 눈치챘을 거예요. 예를 들어, 지금 제 것이 이렇게 생겼어요:

![](/doc-img/en-getting-started-19.png)
<p class="img-desc">Transform 값.</p>

초기 크기로 돌아가려면 **Scale** 값을 **1**로 설정하거나, **Scale** 값 위에 마우스를 올렸을 떄 나타나는 **Reset** 버튼을 클릭하세요.

![](/doc-img/en-getting-started-20.png)
<p class="img-desc">크기 리셋.</p>

훨씬 보기 좋네요!

![](/doc-img/en-getting-started-21.png)
<p class="img-desc">정상 크기로 돌아오기.</p>

:::tip
에디터에서 다양한 기즈모 간에 전환할 수도 있어요.

![](/doc-img/en-getting-started-66.png)
:::

모델 주위를 도는 것 외에도, 카메라는 자유롭게 장면을 탐색할 수 있는 free-look 모드로 전환할 수 있어요. 에디터 창에서 **Camera** Asset을 선택하고 **Control Mode**에서 **Free Look**을 선택하세요:

![](/doc-img/en-getting-started-22.png)
<p class="img-desc">free-look 모드로 변경하기.</p>

**마우스 우클릭을 누른 상태**에서, **WASD** 키를 사용해 이동하고, **E**와 **Q** 키를 사용해 위아래로 이동하며, **왼쪽 Shift** 키를 누르면 더 빠르게 이동할 수 있어요. **마우스 휠클릭**으로는 뷰를 이동할 수 있어요.

두 가지 카메라 모드에 익숙해진 후, **Orbit Character** 모드로 다시 전환하고 **Reset Camera Transform**을 클릭하여 카메라를 기본 위치로 되돌리세요.

:::tip
**V** 키를 눌러 **Orbit Character** 모드와 **Free Look** 모드 간에 전환할 수도 있어요.
:::

![](/doc-img/en-getting-started-24.png)
<p class="img-desc">카메라 변환 초기화.</p>

![](/doc-img/en-getting-started-23.png)
<p class="img-desc">기본 카메라 위치로 복귀.</p>

## Assets 탭

이제 캐릭터와 카메라를 움직이는 기본 방법을 알았으니, 에디터를 살펴봅시다!

기본적으로 **Assets** 탭에 위치해 있어요. **Asset** 캐릭터, 카메라, 소품, 모션 캡처 트래커 등 장면에 있는 모든 것을 의미해요.

에셋을 클릭하여 선택할 수 있어요. 예를 들어, **Directional Light**(방향 조명) 에셋을 클릭하여 선택하고 색상을 조정해보세요:

![](/doc-img/en-getting-started-25.png)
<p class="img-desc">방향 조명 선택 및 색상 조정.</p>

으스스하네요!

![](/doc-img/en-getting-started-26.png)
<p class="img-desc">빨간색으로 조명색 설정.</p>

모션 캡처 트래커도 에셋이에요. 예를 들어, 저는 얼굴 추적 솔루션으로 **iFacialMocap**을 선택했기 때문에, 장면에 **iFacialMocap Receiver** 에셋이 있어요. 이를 클릭하여 선택한 다음, **Calibrate** 버튼을 클릭하여 얼굴 추적을 보정할 수 있어요:

![](/doc-img/en-getting-started-27.png)
<p class="img-desc">iFacialMocap 보정.</p>

이 화면에 들어온 김에, 새로운 에셋을 추가해볼까요? **Add Asset**을 클릭하고 **Prop**을 선택하세요:

![](/doc-img/en-getting-started-28.png)
<p class="img-desc">Asset 추가.</p>

![](/doc-img/en-getting-started-29.png)
<p class="img-desc">"Prop" 선택.</p>

Prop(소품) 에셋이 장면에 추가되었지만, 아직 모델을 선택하지 않았어요! **Source** 드롭다운 메뉴 옆에 있는 **Preview Gallery** 버튼을 클릭해보세요:

![](/doc-img/en-getting-started-30.png)
<p class="img-desc">미리보기 갤러리.</p>

**Microphone** 소품을 선택하세요. 그런 다음, **X** 버튼(또는 팝업 밖의 아무 곳이나)을 클릭하여 미리보기 갤러리를 닫으세요:

![](/doc-img/en-getting-started-31.png)
<p class="img-desc">마이크 소품 선택.</p>

흠, 마이크가 어디에 있을까요? 조금 확대해보면... 땅에 파묻혀 있는 것을 볼 수 있을 거예요!

![](/doc-img/en-getting-started-32.png)
<p class="img-desc">오 이런.</p>

그건 좋지 않아요! 마이크를 캐릭터의 손에 부착하고 싶어요. **Transform Attachment** 섹션에서 **Attach To** 드롭다운 메뉴를 클릭하고 **Character**를 선택하세요::

![](/doc-img/en-getting-started-33.png)
<p class="img-desc">캐릭터에 부착.</p>

이제 마이크가 캐릭터의 손에 부착되었어요! 이제 변환 기즈모를 사용하여 부착 위치를 조정할 수 있어요:

![](/doc-img/en-getting-started-34.png)
<p class="img-desc">캐릭터 손에 부착된 마이크.</p>

![](/doc-img/en-getting-started-35.png)
<p class="img-desc">부착 위치 조정하기.</p>

전신 추적이나 손 추적을 설정했다면, 손과 함께 마이크가 움직이는 것을 볼 수 있을 거예요!

![](/doc-img/en-getting-started-36.png)
<p class="img-desc">손과 함께 움직이는 마이크.</p>

보시다시피, 각 에셋 유형마다 다양한 옵션이 있어요. 예를 들어, **Attach To Bone**을 변경하여 마이크를 캐릭터의 왼손에 부착하거나, **Override Hand Pose**를 변경하여 캐릭터가 다른 손 자세로 마이크를 잡도록 할 수 있어요:

![](/doc-img/en-getting-started-37.png)
<p class="img-desc">소품 옵션 조정.</p>

캐릭터 에셋도 여러가지 커스터마이즈가 가능해요. 예를 들어, 캐릭터가 한동안 침대 옆에 서 있었어요. 이제 캐릭터를 침대에 앉혀봅시다! **Character** 에셋을 클릭하여 선택하고, **Idle Animation** 드롭다운 메뉴 옆에 있는 **Preview Gallery** 버튼을 클릭하세요:

![](/doc-img/en-getting-started-42.png)
<p class="img-desc">캐릭터 대기 애니메이션 선택.</p>

![](/doc-img/en-getting-started-41.png)
<p class="img-desc">"Sitting" 대기 애니메이션 선택.</p>

편안해요!

![](/doc-img/en-getting-started-43.png)
<p class="img-desc">침대 위에 앉아 있는 캐릭터.</p>

가장 좋은 점은 **Warudo의 모션 캡처가 대기 애니메이션과 매끄럽게 어우러진다는 거예요**! 예를 들어, 손을 들어 올리면 캐릭터가 앉아 있는 동안에도 손을 들어 올릴 거예요:

![](/doc-img/en-getting-started-55.png)
<p class="img-desc">앉아 있는 동안 손을 드는 캐릭터.</p>


:::info
**Q:** 도와주세요! Warudo에 옵션이 너무 많아서 무엇을 하는지 모르겠어요!

**A:** 처음에는 너무 많아 당황할 수 있지만, 걱정하지 마세요. 모든 옵션을 다 이해할 필요는 없어요. 많은 옵션은 고급 사용자들을 위한 것이며, 일상적인 사용에는 필요하지 않아요.

Warudo를 처음 사용하는 경우, 다양한 옵션을 시도해보고 어떤 기능을 하는지 알아보세요. 옵션 위에 마우스를 올려놓으면 **Reset** 버튼을 클릭하여 언제든지 기본값으로 재설정할 수 있어요. 이 핸드북의 뒷부분에서는 각 에셋의 종류와 그 옵션들을 예제를 통해 자세히 다룰 거예요.
:::

마지막으로, **Screen** 에셋을 추가해봅시다. **Add Asset**을 클릭하고 **Screen**을 선택하세요:

![](/doc-img/en-getting-started-38.png)
<p class="img-desc">스크린 에셋 추가.</p>

Screen 에셋은 이미지와 동영상을 표시하는 데 사용되지만, OBS Studio처럼 윈도우나 모니터를 캡처할 수도 있어요! 다음 예제에서는 **Content Type** 옵션으로 **Window**를 선택하고 **Window** 옵션으로 **Warudo Editor**를 선택한 다음, 스크린을 캐릭터 뒤로 이동시켰어요:

![](/doc-img/en-getting-started-39.png)
<p class="img-desc">스크린 사용 예시.</p>

:::tip
스크린이 너무 밝다면, **Tint** 옵션을 회색으로 조정하여 어둡게 만들 수 있어요.
:::

## Blueprints 탭

이제 에셋에 익숙해졌으니, **Blueprints** 탭을 살펴봅시다. 시그마 아이콘을 클릭하여 Blueprints 탭으로 전환하세요:

![](/doc-img/en-getting-started-40.png)
<p class="img-desc">blueprints 탭으로 변경.</p>

하지만 Blueprint가 무엇일까요? 기본적으로, Blueprint는 "어떤 일이 발생했을 때 무슨 일이 일어나야 하는가"를 정의하는 거예요. 예를 들어, "내가 **Space** 키를 누르면, 캐릭터가 손을 흔들어야 한다." 또는 "Twitch 리딤을 받으면, 소품이 내 캐릭터에게 던져져야 한다."

우리 화면에는 이미 몇 가지 Blueprint가 있어요. 예를 들어, **Expression Key Bindings Blueprint**는 표정 전환을 위한 단축키를 구현해요. 이를 클릭하여 선택해보세요:

![](/doc-img/en-getting-started-44.png)
<p class="img-desc">표정 키 바인딩 Blueprints 선택.</p>

**마우스 휠**을 사용하여 확대 및 축소하고, **마우스 왼쪽 버튼**을 눌러서 화면을 이동하세요. 화면을 오른쪽으로 이동하면 다음 두 노드를 볼 수 있을 거예요::

![](/doc-img/en-getting-started-45.png)
<p class="img-desc">화면을 축소하고 오른쪽으로 이동.</p>

여기 두 개의 노드는 이렇게 말하고 있어요: "**Alt+1**이 눌리면, **캐릭터**는 **Joy**표정으로 전환해야 한다." 한번 시도해보세요! 키보드에서 **Alt+1**을 누르면 캐릭터가 **Joy** 표정으로 전환될 거예요.

![](/doc-img/en-getting-started-46.png)
<p class="img-desc">즐거운 표정으로 바뀐 캐릭터.</p>

마찬가지로, 아래의 두 노드는 이렇게 말하고 있어요: "**Alt+Backspace**가 눌리면, **캐릭터**는 모든 표정을 종료해야 한다." **Alt+Backspace**를 눌러서 확인해 보세요.

![](/doc-img/en-getting-started-47.png)
<p class="img-desc">모든 캐릭터 표정 종료.</p>

**Joy** 표정으로 전환하는 두 노드로 돌아가 보세요. 단축키를 변경하려면 **Keystroke** 옵션과 다른 옵션들을 수정할 수 있어요. 예를 들어, 아래에서는 단축키를 **Ctrl+Shift+Q**로 변경했어요:

![](/doc-img/en-getting-started-48.png)
<p class="img-desc">단축키 변경.</p>

단축키가 눌릴 때 더 많은 작업을 수행하도록 설정할 수도 있어요. 예를 들어, 사운드 효과를 재생해 볼까요? 검색창에 **play sound**를 입력하고, **Play Sound** 노드를 **Toggle Character Expression** 노드의 오른쪽으로 드래그해 보세요:

![](/doc-img/en-getting-started-49.png)
<p class="img-desc">"Play Sound" 노드 찾기.</p>

**Toggle Character Expression** 노드의 **Exit** 출력 옆에 있는 녹색 점을 클릭하고, Play Sound 노드의 **Enter** 입력 옆에 있는 녹색 점으로 드래그해 보세요.:

![](/doc-img/en-getting-started-50.png)
<p class="img-desc">"Toggle Character Expression" 오른쪽 노드를 "Play Sound" 노드로 드래그.</p>

이렇게 두 노드가 연결되었어요. 이제 **Source** 드롭다운 메뉴를 클릭하고 원하는 음향 효과를 선택해요. 저는 **Punch Light 01** 음향 효과를 선택했어요.

![](/doc-img/en-getting-started-51.png)
<p class="img-desc">음향 효과 선택.</p>

:::tip
**Open Sounds Folder**를 클릭해 자신만의 음향 효과를 넣을 수도 있어요!
:::

이제 **Ctrl+Shift+Q** (또는 설정한 단축키)를 누르면 캐릭터가 **Joy** 표현으로 변경되며, 음향 효과도 들릴 거예요!

새로운 것을 구현해볼까요? 예를 들어, **Space**를 눌렀을 때 캐릭터가 감정 표현 애니메이션을 재생하도록 해볼게요. 빈 공간으로 이동하여 아래에 보이는 노드를 추가하고 연결해 보세요. **Character** 드롭다운 메뉴에서 캐릭터 에셋을 선택하고, **Animation** 옵션에서 **Energetic**을 선택하세요:

![](/doc-img/en-getting-started-52.png)
<p class="img-desc">감정 표현 애니메이션을 재생하는 노드 추가.</p>

현재 캐릭터가 앉아 있는 상태라면, 애니메이션이 상체에서만 재생되도록 마스킹할 수 있어요. 이를 위해 **Play Character One Shot Overlay Animation** 노드에서 **Mask Upper Body**를 클릭하세요:

![](/doc-img/en-getting-started-53.png)
<p class="img-desc">상체에만 애니메이션이 재생되도록 마스킹.</p>

이제 **Space** 키를 누르면, 캐릭터가 **Energetic** 감정 표현 애니메이션을 재생할 거예요!

![](/doc-img/en-getting-started-54.png)
<p class="img-desc">"Energetic" 감정 표현 재생.</p>


Blueprint에 대해 간단히 소개를 해드렸어요! Blueprint가 무엇을 할 수 있는지 엿볼 수 있었기를 바래요. Blueprint는 매우 강력한 기능이지만, Blueprint를 전혀 건드리지 않고도 Warudo로 많은 작업을 할 수 있어요. 나머지 기능에 익숙해진 후에는 [blueprint tutorial](/docs/blueprints/overview)을 읽어 보시는 것을 추천해요.

:::tip
**마우스 오른쪽 버튼**을 눌러 선택 박스를 드래그하면 여러 노드를 동시에 선택할 수 있어요. 노드를 제거하려면 선택한 후 **Delete** 키를 누르세요.
:::

:::info
얼굴 추적과 포즈 추적을 위한 Blueprint가 있을 수 있어요. 이 Blueprint들은 온보딩 어시스턴트가 자동으로 생성한 것이며, 원하는 대로 사용자화할 수 있어요. 초보자에게는 다소 복잡해 보일 수 있으니, 당분간은 건드리지 않는 것이 좋겠어요.
:::

## 상호작용 설정 {#interaction-setup}

VTubing은 시청자와 상호작용할 수 있어야 재미있죠! Warudo 는 다양한 상호작용 기능을 제공하지만, 가장 빠르게 시작할 수 있는 방법은 온보딩 어시스턴트를 사용하는 거예요. **Onboarding Assistant** 에셋을 선택하고 **Interaction Setup → Get Started**를 클릭하세요:

![](/doc-img/en-getting-started-58.png)
<p class="img-desc">상호작용 설정.</p>

스트리망 플랫폼을 선택하라는 메세지가 나타나요:

![](/doc-img/en-getting-started-59.png)
<p class="img-desc">스트리밍 플랫폼 선택.</p>

스트리밍 플랫폼의 통합 지침을 따르도록 설정해요. 예를 들어, 아래에서는 트위치 리딤 "Water"를 받을 때 **Launching Liquid** 상호작용이 트리거되도록 설정하고 있어요:

![](/doc-img/en-getting-started-60.png)
<p class="img-desc">상호작용 설정.</p>

설정을 완료하면 Blueprint 탭에 새로운 Blueprint가 추가된 것을 확인할 수 있어요. Blueprint가 무엇인지 기억하시나요? Blueprint는 "어떤 일이 발생했을 때 무슨 일이 일어나야 하는가"를 정의하는 거라고 했었죠. 이 경우에는 Blueprint는 트위치 리딤 "Water"를 받을 때 캐릭터에게 액체를 발사한다라는 논리를 포함하고 있어요. Blueprint를 클릭해서 선택하고, **Launch Liquid Character**노드를 찾으세요

![](/doc-img/en-getting-started-61.png)
<p class="img-desc">새로운 Blueprint가 추가된 모습.</p>

![](/doc-img/en-getting-started-62.png)
<p class="img-desc">"Launch Liquid At Character"노드 찾기.</p>

실제로, 위의 노드들은 기본적으로 "트위치 리딤을 받을 때 만약 리딤 제목이 'Water'일 경우, 캐릭터 에셋의 '=캐릭터'에게 액체를 발사합니다."라는 의미예요. **Launch Liquid At Character** 노드에서 'Enter' 버튼을 클릭해서 테스트 해볼 수 있어요.

![](/doc-img/en-getting-started-63.png)
<p class="img-desc">상호작용 테스트.</p>

![](/doc-img/en-getting-started-64.png)
<p class="img-desc">작동해요!</p>

## OBS Studio / Streamlabs에 출력하기

이제 Warudo를 좋아하는 스트리밍 소프트웨어에 넣을 시간이에요! 이를 위해 네 가지 방법이 있어요:

* **Virtual camera(가상 카메라):** Warudo를 가상 카메라로 출력할 수 있어요. 이 방법은 [VDO.Ninja](https://vdo.ninja/)에서 협업 스트리밍을 하거나 Discord/Zoon에서 VTubing 아바타를 사용하고 싶을 때 유용해요. 이 방법을 사용하려면 **Settings → Output**으로 **Virtual Camera Output**(가상 카메라 출력)을 활성화하세요.
* **NDI:** Warudo를 [NDI](https://ndi.video/) 소스로 출력할 수 있어요. 이 방법을 사용하려면 **Settings → Output**으로 가서 **NDI Output**을 활성화 하세요. 단. 오디오 출력은 지원되지 않아요.
* **Spout:** Warudo를 [Spout](https://spout.zeal.co/) 소스로 출력할 수 있어요. 이 방법을 사용하려면 **Settings → Output**으로 가서 **Spout Output**을 활성화하세요. **이 방법이 기본적으로 활성화되어 있어요.**
* **Window/Game capture(윈도우/게임 캡쳐):** OBS Studio나 Streamlabs에서 Warudo 창을 캡처할 수도 있어요. 하지만 이 방법은 다른 방법들에 비해 CPU/GPU 자원을 훨씬 더 많이 소모하므로 권장하지 않아요.

우리는 **Spout** 방법을 사용하는 것을 권장해요. 이 방법은 지연이 없는 최고의 성능을 제공해요. 또한 변환 도구(transform gizmos)를 숨길 수 있어, 스트리밍 중에 캐릭터나 소품을 이동/회전할 때 시청자에게 도구를 보이지 않게 할 수 있어요! Spout 출력을 설정하려면 다음 단계를 따르세요:

* **OBS Studio:** 먼저 [**Spout2 Plugin for OBS Studio**](https://github.com/Off-World-Live/obs-spout2-plugin)를 설치한 다음, **Spout2 Capture** 소스를 추가하고, **Warudo**를 송신자로 선택하세요.
* **Streamlabs:** **Spout2**를 추가하고, **Warudo**를 송신자로 선택하세요.

![](/doc-img/en-getting-started-65.png)
<p class="img-desc">OBS Studio에 Spout 출력 설정.</p>

:::tip
모든 출력 방법은 투명 출력 기능을 지원해요. 투명 배경을 활성화하려면, 카메라 에셋으로 가서 **Basic Properties → Transparent Background**를 활성화하세요.
:::

## 화면 저장 및 불러오기

화면 설정을 완료했다면, 잊지말고 꼭 저장하세요! Warudo는 다른 소프트웨어와 달리 자동으로 화면을 저장하지 않아요. 이렇게 하면 다양한 설정을 실험해도 화면이 엉망이 될 걱정이 없어요. Warudo 아이콘을 클릭하고 **Save Scene**을 선택하세요:

![](/doc-img/en-getting-started-56.png)
<p class="img-desc">화면 저장.</p>

화면을 새로운 파일로 저장하려면 **Save Scene As**을 선택하세요. 화면을 불러오려면 **Open Scene**을 선택하세요.

![](/doc-img/en-getting-started-57.png)
<p class="img-desc">화면 불러오기.</p>

마지막으로, **Reload Scene(화면 다시 불러오기)**와 **Restart Scene(화면 다시 시작)**을 사용하여 화면을 각각 다시 불러오거나 다시 시작할 수 있어요. **Reload Scene(화면 다시 불러오기)**는 화면 상태를 초기화하고 마지막 저장 이후의 모든 변경 사항을 제거해요. 반면에 **Restart Scene(화면 다시 시작)**은 화면 상태만 초기화하고 변경 사항은 유지해요.

:::info
"화면 상태 초기화"는 화면의 물리 상태, 임시 객체 등을 초기화하는 것을 의미해요. 예를 들어, 화면에 1,000개의 던져진 props(소품)을 생성했다면, **Reload Scene** 또는 **Restart Scene**을 사용하면 이 소품들은 모두 제거돼요. 이 소품들은 화면 파일의 일부가 아니기 때문이에요.
:::

## 요약

 축하해요! 이제 Warudo의 기본 사항을 배웠어요. Warudo의 다양한 기능을 더 배우기 위해 나머지 핸드북도 읽어보는 것을 추천해요. 궁금한 점이 있다면 [Discord](https://discord.gg/warudo)에 가입해서 질문해 주세요. 기꺼이 도와드릴게요!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
