---
sidebar_position: 20
translate_from_version: 2024-01-05
---

# 성능 최적화

Warudo는 대부분의 PC에서 원활하게 실행될 거예요. 하지만 다른 게임이나 애플리케이션을 동시에 실행할 때 성능 문제가 발생한다면, 다음 방법을 시도하여 성능을 개선할 수 있어요.

## 윈도우 해상도

Warudo 창의 해상도는 성능에 가장 중요한 영향을 미치는 요소 중 하나예요. 해상도가 높을수록 프레임 속도가 낮아져요. 매우 고사양 PC가 아닌 이상 4K 해상도는 거의 사용하지 않는 것이 좋아요. 권장 해상도는 1920 x 1080이며, 대부분의 라이브 스트리밍 플랫폼도 1080p까지만 지원해요.

만약 1920 x 1080 해상도도 GPU에 부담이 된다면, 1280 x 720을 시도해볼 수 있어요. **Menu → Settings → Window Width/Height**를 조정하여 Warudo 창의 해상도를 수동으로 설정할 수 있어요.

## 환경

Warudo의 [환경](../assets/environment), 즉 3D 배경도 성능에 큰 영향을 미치는 요소예요. 환경이 복잡할수록 프레임 속도가 낮아져요. 예를 들어, [Tokyo City](https://steamcommunity.com/sharedfiles/filedetails/?id=3004012790) 환경은 대부분의 GPU에 매우 부담이 되는 것으로 알려져 있어요. 더 단순한 환경을 사용하거나, 아예 환경을 사용하지 않는 것도 방법이에요.

## 캐릭터

캐릭터에 너무 많은 메쉬 렌더러가 있나요? [VRoid Studio](https://vroid.com/en/studio)에서 내보낸 모델은 메쉬 수를 줄이기 위한 최적화 설정을 잊어버리면 종종 이런 문제가 발생해요. (머리카락만 100개 이상의 메쉬를 가진 모델도 봤어요!) 모델을 다시 내보내거나 Blender에서 메쉬를 결합할 수 있어요.

마찬가지로, 캐릭터에도 너무 많이 없는지 확인하세요.

## FPS 제한

30 FPS만 지원하는 플랫폼에 스트리밍하거나, Warudo와 함께 무거운 게임을 실행 중이라면, FPS를 30으로 제한하여 GPU의 부담을 줄일 수 있어요. **Menu → Settings → Limit FPS**에서 이를 조정할 수 있어요. VSync를 활성화했다면 먼저 이를 꺼야 해요.

## MediaPipe 트래킹

[MediaPipe](../mocap/mediapipe) 손 추적은 **MediaPipe Tracker → GPU Acceleration**을 활성화했는지 여부에 따라 CPU나 GPU에 큰 부담이 될 수 있어요. 만약 성능 문제가 발생하면 MediaPipe 손 추적을 끄거나 GPU 가속을 비활성화하여 CPU 추적을 사용하는 것을 시도해보세요.

## 다른 애플리케이션과 GPU 리소스 경쟁

Warudo가 더 높은 GPU 우선순위를 갖도록 하려면, 먼저 Warudo를 관리자 권한으로 실행해야 해요. Steam 라이브러리로 가서 Warudo를 오른쪽 클릭하고 **Manage → Browse local files**를 선택하세요:

![](/doc-img/zh-faq-1.webp)

Warudo.exe에 마우스 오른쪽 클릭 후 **Properties** 클릭:

![](/doc-img/zh-faq-2.webp)

그런 다음 **호환성(Compatibility)** 탭으로 이동하여 **관리자 권한으로 이 프로그램을 실행(Run this program as an administrator)** 체크박스를 체크하고 확인을 클릭하세요.

![](/doc-img/en-performance-1.png)

마지막으로 Warudo를 열고 **Menu → Settings → Increase GPU Priority**를 활성화 하세요.

:::caution
Warudo의 GPU 우선순위를 높이면 동시에 실행되는 다른 3D 애플리케이션/게임의 프레임 속도가 감소할 수 있어요.
:::

:::info
다른 애플리케이션/게임에서도 성능 문제가 발생하면, 해당 프로그램들도 관리자 권한으로 실행해보세요.
:::

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'Willycho', github: 'Willycho'},
  ],
}} />
