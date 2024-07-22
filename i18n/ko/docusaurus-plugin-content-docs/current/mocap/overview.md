---
sidebar_position: 10
---

# 개요

![](/doc-img/mocap-cover.jpg)

집에서 스트리밍을 하시든, 전문 모캡 스튜디오에서 작업을 하시든 Warudo가 도와드려요. 현재 Warudo는 다음 모션 캡처 시스템을 지원해요:

* 웹캠
  * [MediaPipe](./mediapipe) 또는 [OpenSeeFace](./openseeface)를 통한 내장 추적.
* iPhone
  * [iFacialMocap / FaceMotion3D](./ifacialmocap) 또는 [RhyLive](./rhylive) 앱이 아이폰에 설치되어 있어야 해요.
* [SteamVR](./steamvr)
* [Leap Motion Controller](./leap-motion)
* [Sony Mocopi](./mocopi)
* [Rokoko](./rokoko)
* [Xsens MVN](./xsens-mvn)
* [Virdyn Studio (VDMocapStudio)](./virdyn)
* [Noitom Axis](./noitom)
* [StretchSense Glove](./stretchsense)
* [VMC 프로토콜](./vmc)을 지원하는 외부 애플리케이션, e.g., [VSeeFace](https://www.vseeface.icu/), [VirtualMotionCapture](https://vmc.info/)
  * VR 트래커는 유료(서포터) 버전의 [VirtualMotionCapture](https://www.patreon.com/sh_akira)를 사용해서 지원돼요.

[Warudo Pro](../pro.md)는 다음 모션 캡처 시스템도 지원해요:

* [Autodesk MotionBuilder](./motionbuilder)와 호환되는 모든 광학 추적 시스템, e.g., [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/)
* [OptiTrack Motive](./optitrack)
* [Chingmu Avatar](./chingmu)

## 어떤 모션 캡처 시스템을 사용해야 하나요?

만약 3D VTubing에 완전히 처음이시라면, 얼굴 추적과 손 추적 모두 [MediaPipe](./mediapipe)로 시작하는 것을 추천해요. MediaPipe는 Warudo에 내장된 모션 캡처 시스템으로, 웹캠만 있으면 사용할 수 있어요. 만약 아이폰을 가지고 있다면, [iFacialMocap](./ifacialmocap) 앱을 사용해 얼굴 추적을 하는 것을 추천해요. 이 앱은 MediaPipe보다 훨씬 높은 정확도를 제공하며, 얼굴 추적을 아이폰으로 분담하면 컴퓨터의 부담도 줄일 수 있어요.

추적 품질을 향상시키고자 한다면, 다음 몇 가지를 추천드려요:

* 얼굴 추적을 위해 아이폰 사용 ([iFacialMocap](./ifacialmocap) 앱을 통해). 이것은 가장 좋은 얼굴 추적 솔루션이에요. 만약 아이폰이 없다면 중고 아이폰을 고려해 볼 수도 있어요. Face ID와 호환되는 모델이라면 iFacialMocap과 함께 사용할 수 있어요.

:::tip
최상의 추적 품질을 위해, 아이폰 12 또는 그 이상의 모델(아이폰 미니도 가능)을 사용하는 것을 추천해요. 구형 아이폰은 추적 품질이 낮을 수 있어요.
:::
* 만약 MediaPipe의 손 추적이 정확하지 않다고 느끼신다면, [Leap Motion Controller](./leap-motion)를 사용해서 손 추적을 고려해 볼 수 있어요. [neck mount](https://www.etsy.com/market/leap_motion_mounting)를 사용해 목에 착용하면 손을 추적할 수 있어요.
* 만약 전신 추적 솔루션을 찾고 있다면, [Sony Mocopi](./mocopi)나 [VR trackers](./vmc.md)를 고려해 볼 수 있어요. 예산이 충분한 상태라면 [Virdyn VDSuit](./virdyn), [Noitom Perception Neuron](./noitom), [Rokoko Smartsuit Pro](./rokoko), 또는 [Xsens MVN Link](./xsens-mvn)와 같은 모션 캡처 수트를 사용할 수도 있어요. 이러한 모션 캡처 수트에 [StretchSense gloves](./stretchsense) 장갑을 사용해 손가락 추적을 추가할 수 있어요.
* 만약 더 전문적인 솔루션을 찾고 있다면 [Vicon](https://www.vicon.com/), [OptiTrack](https://optitrack.com/), 또는 [Chingmu](https://www.chingmu.com/)와 같은 광학 추적 시스템을 고려해 볼 수 있어요.

## 설정 {#setup}

Warudo에서 모션 캡처를 설정하는 두 가지 방법이 있어요. 첫 번째이자 권장되는 방법은 모든 화면(씬)에 포함된 **Onboarding Assistant** asset을 사용하는 것이예요. **Basic Setup → Get Started**를 클릭하여 온보딩 프로세스를 시작하고 지시에 따라 진행하세요.

![](/doc-img/en-getting-started-2.png)
<p class="img-desc">onboarding assistant asset에서 모션 캡처 설정하기.</p>

온보딩 프로세스가 완료된 후, 관련 모션 캡처 asset을 선택하여 추적을 더욱 커스터마이즈할 수 있어요. 예를 들어, iFacialMocap을 사용하는 경우, 머리가 움직일 때 Warudo가 캐릭터의 몸에 약간의 움직임을 추가하는 것을 볼 수 있어요. 만약 이 움직임이 원치 않는다면, **iFacialMocap Receiver** asset에서 **Body Movement Intensity**를 0으로 설정할 수 있어요.

![](/doc-img/en-mocap-1.png)
<p class="img-desc">iFacialMocap의 몸 움직임 강도 조정하기.</p>

두 번째 모션 캡처 설정 방법은 **Character → Setup Motion Capture**를 사용하는 거예요. 이를 통해 얼굴 추적 및/또는 포즈 추적을 직접 설정할 수 있어요. 하지만, 온보딩 과정에서 일부 확인 단계가 생략돼요.

![](/doc-img/en-mocap-2.png)
<p class="img-desc">캐릭터 asset에서 모션 캡처 설정하기.</p>

이 방법은 여러 얼굴 추적 또는 포즈 추적 시스템을 설정해야 할 때 유용해요. 온보딩 어시스턴트는 새 온보딩 프로세스를 시작할 때 기존 모션 캡처 설정을 항상 제거하기 때문이에요.

어느 방법을 선택하든, 해당 추적 blueprints가 생성되어 씬에 추가돼요. 예를 들어, 얼굴 추적을 위해 iFacialMocap을 선택하고 포즈 추적을 위해 MediaPipe를 선택한 경우, **Face Tracking - iFacialMocap**과 **Pose Tracking - MediaPipe**두 개의 Blueprint가 생성된 것을 볼 수 있어요. 이러한 블루프린트를 수정하여 추적을 커스터마이즈할 수 있어요.

:::caution
모션 캡처 asset을 수동으로 생성해서는 안 돼요, 예를 들어 **Add Asset**을 클릭하고 **iFacialMocap Receiver**와 같은 모션 캡처 asset을 선택하는 방식으로요. 이는 모션 캡처 asset 자체는 추적 데이터를 수신하거나 제공할 뿐, 해당 데이터를 캐릭터에 연결하지 않기 때문이에요. 이 작업은 Blueprint에 의해 이루어져야 해요. 온보딩 어시스턴트와 **Setup Motion Capture** 기능은 필요한 Blueprint를 자동으로 생성해 줘요.
:::

## 자주 묻는 질문 {#FAQ}

### 내 캐릭터가 움직이지 않아요.

외부 애플리케이션이 필요한 모션 캡처 시스템(iFacialMocap 등)을 사용 중이라면, 애플리케이션이 실행 중이고 추적 데이터가 Warudo로 전송되고 있는지 확인해 주세요. 또한, 컴퓨터의 방화벽이 Warudo가 추적 데이터를 수신하는 것을 차단하지 않는지 확인해 주세요. Warudo를 화이트리스트에 추가하거나 방화벽을 일시적으로 비활성화해야 할 수도 있어요.

네트워크를 개인 네트워크로 설정하는 것도 고려해 보세요. Windows는 공용 네트워크에서 들어오는 연결을 차단할 수 있어요. 자세한 내용은 [이 가이드](https://support.microsoft.com/en-us/windows/make-a-wi-fi-network-public-or-private-in-windows-0460117d-8d3e-a7ac-f003-7a0da607448d)를 참조해 주세요.

일부 모션 캡처 수신기에는 **포트(port)** 옵션이 있어요. 포트 번호가 외부 애플리케이션의 포트 번호와 일치하는지 확인해 주세요.

### 내 트랙킹이 너무 부드럽거나 너무 떨려요.

추적 blueprint (예를 들어, **Face Tracking - iFacialMocap**)로 이동하여 **Smooth Rotation List** / **Smooth Position List** / **Smooth Transform** / **Smooth BlendShape List** 노드를 찾아보세요. 추적을 더 부드럽게 하려면 **Smooth Time** 값을 증가시키고, 더 반응성 있게 하려면 값을 줄여보세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
