---
sidebar_position: 30
version: 2026-01-23
---

# Stream Deck 연동

**Stream Deck 연동**을 사용하면 Stream Deck에서 직접 Warudo의 트리거, 토글, 메시지 전송을 할 수 있어요.

![](/doc-img/streamdeck-integration-0.png)

---

## 준비

Warudo에서 Stream Deck 연동을 사용하려면, [Stream Deck](https://www.elgato.com/p/stream-deck) 장치가 있어야 하고 [Stream Deck 앱](https://www.elgato.com/s/stream-deck-app)이 올바르게 설치되어 있어야 해요.

다음으로, Stream Deck 마켓플레이스에서 Warudo 플러그인을 설치해야 해요: [Warudo | Elgato Marketplace](https://marketplace.elgato.com/product/warudo-d443ffb3-0b14-40d8-aa95-cdac4688328d)

## 사용법

Warudo는 Stream Deck과 관련된 세 가지 노드를 제공해요:

- **On Stream Deck Trigger**
- **On Stream Deck Toggle**
- **On Stream Deck Message**

이 노드들은 Stream Deck 앱의 Warudo 플러그인에 있는 세 가지 액션에 대응해요:

- **Trigger**
- **Toggle**
- **Message**

노드와 액션을 연결하려면 다음 단계를 따라주세요:

1. Warudo에서 **On Stream Deck ...** 노드를 추가하세요.
2. 노드의 **Receiver Name** 포트에 이름을 입력하세요.
![](/doc-img/streamdeck-integration-4.png)
3. Stream Deck 앱에서 **노드 유형과 일치하는** 액션을 추가하세요.
4. 액션의 **Receiver Name** 드롭다운에서 노드의 **Receiver Name** 포트에 입력한 문자열이 표시될 거예요.
![](/doc-img/streamdeck-integration-5.png)
5. 이를 선택하세요. 이제 Stream Deck에서 해당 액션을 누르면 Warudo의 해당 노드가 트리거될 거예요!
![](/doc-img/streamdeck-integration-6.png)

:::caution
드롭다운에 옵션이 표시되지 않고, 노드 유형과 액션 유형이 일치하는 것을 확인했다면, Stream Deck과 Warudo 간의 연결이 올바르게 설정되지 않았을 수 있어요.
두 애플리케이션을 모두 재시작하거나, 컴퓨터를 재부팅하거나, 최신 버전으로 업데이트해 보세요. 이 방법으로 문제가 해결될 수 있어요.
:::

세 가지 노드/액션 유형의 차이점은 아래에서 설명할게요.

### Trigger

**Trigger** 액션을 활성화하면, 연결된 노드의 "**Exit**" 포트가 활성화돼요.

### Toggle

⚪ *회색* 아이콘의 **Toggle** 액션을 활성화하면, 연결된 노드의 "**If Yes**" 포트가 활성화되고 🟣 *보라색*으로 변해요.

🟣 *보라색* 아이콘의 **Toggle** 액션을 활성화하면, 연결된 노드의 "**If No**" 포트가 활성화되고 ⚪ *회색*으로 변해요.

### Message

**Message** 액션을 활성화하면, "**Message**" 포트의 값이 변경되고 연결된 노드의 "**Exit**" 포트가 활성화돼요.

## 예시

### 표정 전환

![](/doc-img/streamdeck-integration-1.png)

### 인터랙티브 효과

![](/doc-img/streamdeck-integration-2.png)

### 카메라 및 액세서리

![](/doc-img/streamdeck-integration-3.png)

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'Puri', github: 'Puri12'},
  ],
}} />
