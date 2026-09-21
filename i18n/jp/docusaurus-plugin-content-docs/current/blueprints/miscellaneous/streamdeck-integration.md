---
sidebar_position: 30
translate_from_version: 2026-01-23
---

# Stream Deck連携

**Stream Deck連携**では、Stream Deckから直接Warudoをトリガー、切り替え、メッセージ送信できます。

![](/doc-img/streamdeck-integration-0.png)

---

## 準備

WarudoでStream Deck連携を使用するには、[Stream Deck](https://www.elgato.com/p/stream-deck)デバイスを用意し、[Stream Deck App](https://www.elgato.com/s/stream-deck-app)が正しくインストールされていることを確認してください。

次に、マーケットプレイスからStream Deck用のWarudoプラグインをインストールします。[Warudo | Elgato Marketplace](https://marketplace.elgato.com/product/warudo-d443ffb3-0b14-40d8-aa95-cdac4688328d)

## 使用方法

Warudoには、Stream Deckに関連する3つのノードがあります。

- **On Stream Deck Trigger**
- **On Stream Deck Toggle**
- **On Stream Deck Message**

これらは、Stream Deck App用Warudoプラグインの3つのアクションに対応しています。

- **Trigger**
- **Toggle**
- **Message**

ノードをアクションにリンクするには、次の手順に従ってください。

1. Warudoで**On Stream Deck ...**ノードを追加します。
2. ノードの**Receiver Name**ポートに名前を入力します。
![](/doc-img/streamdeck-integration-4.png)
3. Stream Deck Appで、**ノードの種類と一致する**アクションを追加します。
4. アクションの**Receiver Name**ドロップダウンに、ノードの**Receiver Name**ポートに入力した文字列が表示されます。
![](/doc-img/streamdeck-integration-5.png)
5. それを選択します。これで、Stream Deckでアクションを押すと、Warudo内の対応するノードがトリガーされます！
![](/doc-img/streamdeck-integration-6.png)

:::caution
ドロップダウンに選択肢が表示されず、ノードの種類とアクションの種類が一致していることを確認済みの場合、Stream DeckとWarudoの接続が正しく確立されていない可能性があります。
両方のアプリケーションの再起動、コンピューターの再起動、または最新版への更新をお試しください。これらの手順で問題が解決する場合があります。
:::

3種類のノード／アクションの違いを以下で説明します。

### Trigger

**Trigger**アクションを実行すると、接続されたノードの**Exit**ポートがトリガーされます。

### Toggle

⚪ *Grey*アイコンの**Toggle**アクションを実行すると、接続されたノードの**If Yes**ポートがトリガーされ、アイコンが🟣 *Purple*に変わります。

🟣 *Purple*アイコンの**Toggle**アクションを実行すると、接続されたノードの**If No**ポートがトリガーされ、アイコンが⚪ *Grey*に変わります。

### Message

**Message**アクションを実行すると、**Message**ポートの値が変更され、接続されたノードの**Exit**ポートがトリガーされます。

## 例

### 表情の切り替え

![](/doc-img/streamdeck-integration-1.png)

### インタラクティブエフェクト

![](/doc-img/streamdeck-integration-2.png)

### カメラと道具

![](/doc-img/streamdeck-integration-3.png)

<AuthorBar authors={{
  creators: [
    {name: 'Hane', github: 'hanekit'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
