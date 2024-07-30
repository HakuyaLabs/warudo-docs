---
sidebar_position: 500
---

# VMC

외부 애플리케이션을 통해 추적하며, [VirtualMotionCapture 프로토콜](https://protocol.vmc.info/english)을 통해 Warudo에 데이터를 전송해요. 유료(서포터) 버전의 [VirtualMotionCapture](https://www.patreon.com/sh_akira)를 사용하면 VR 트래커도 지원돼요.

## 설정

### VR 트래커

먼저, 유료(서포터) 버전의 [**VirtualMotionCapture**](https://vmc.info/)가 설치되어 있는지 확인하세요. 해당 버전은 개발자의 [Patreon](https://www.patreon.com/sh_akira) 또는 [pixivFANBOX](https://akira.fanbox.cc/)에서 다운로드 할 수 있어요.

:::tip
VirtualMotionCapture와 VMC의 차이점은 무엇인가요? 간단히 말해, 두 용어는 같은 것을 의미하지만 두 가지 다른 것을 가리킬 수 있어요. 하나는 원래의 VirtualMotionCapture 애플리케이션이고, 다른 하나는 VirtualMotionCapture 및 다른 애플리케이션에서 사용되는 프로토콜이에요. (프로토콜은 기본적으로 애플리케이션 간의 통신 방식을 의미해요.) 이 핸드북에서는 "VMC"를 프로토콜을 지칭할 때 사용하고, "VirtualMotionCapture"를 애플리케이션을 지칭할 때 사용해요.
:::

VR 트래커를 SteamVR에 연결했는지 확인하세요. 그런 다음, VirtualMotionCapture를 열고 VRM 모델을 불러온 후 보정을 수행하세요. 마지막으로, **Settings → VMCProtocol Motion sender**에서 **Enable OSC motion sender**를 체크하세요. 기본 포트 39539는 Warudo의 VMC 수신기가 사용하는 기본 포트이기도 해요.

![](/doc-img/en-vmc-1.png)

### VSeeFace

다음 예시는 [VSeeFace](https://www.vseeface.icu/)를 사용하여 VMC 데이터를 캐릭터에 적용하는 방법을 보여줘요. VMC를 지원하는 다른 소프트웨어도 유사한 방식으로 구성할 수 있어요.

**General settings**에서 **VMC Protocol → Send datawith VMC protocol**이 체크되어 있는지 확인하세요. 기본 포트 39539는 Warudo의 VMC 수신기가 사용하는 기본 포트이기도 해요.

![](/doc-img/zh-vmc-1.webp)

### 기타 애플리케이션

VMC를 지원하는 다른 애플리케이션의 경우, 애플리케이션의 문서를 참조하여 VMC 추적을 활성화하는 방법을 확인하세요. 올바른 포트(기본 39539)로 데이터를 전송하고 있는지 확인하세요.

## 보정

VMC 호환 추적 시스템의 보정은 외부 애플리케이션에서 이루어져요.

## 자주 묻는 질문

일반적인 질문은 [개요](overview#FAQ) and [포즈 추적 커스터마이징](body-tracking#FAQ)을 참조해 주세요.

### 내 캐릭터가 매우 이상한 포즈를 취하고 있어요.

먼저, Warudo와 외부 애플리케이션에서 동일한 모델을 로드했는지 확인하세요.

모델의 모든 뼈가 T-포즈일 때 회전 값이 0(0, 0, 0)이어야 하는, 즉 정상화된 뼈를 가진 모델이어야 해요. 만약 모델이 [VRM 형식](https://vrm.dev/)인 경우 대부분 문제가 없어요. 하지만, 매우 드문 경우로, 모델러가 내보낼 때 Enforce T-Pose 옵션을 체크하지 않은 경우가 있을 수 있어요. 이 문제는 해당 옵션을 체크한 상태로 다시 내보내면 해결돼요. 자세한 내용은 [이 페이지](../misc/normalizing-model-bones)를 참조하세요.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
