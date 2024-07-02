---
sidebar_position: 10
---

# はじめに

## 基本設定

Warudoを開くと、**メインウィンドウ**と**エディターウィンドウ**の2つのウィンドウが表示されます。

![](/doc-img/jp-getting-started-1.png)
<p class="img-desc">メインウィンドウ</p>

![](/doc-img/jp-getting-started-2.png)
<p class="img-desc">エディターウィンドウ</p>

エディターウィンドウはキャラクターや環境などを設定するために使用され、メインウィンドウではエディターウィンドウで設定したすべての操作が実行されます。エディターウィンドウを閉じてしまった場合、メインウィンドウにフォーカスをあてた状態で**Esc**キーを押すと、再度開くことができます。

![](/doc-img/jp-getting-started-66.png)

さあ、始めましょう！ **「基本設定」→[始める]** をクリックします。

![](/doc-img/jp-getting-started-3.png)
<p class="img-desc">基本設定ウィンドウ</p>

**[キャラクター フォルダを開く]** をクリックすると、エクスプローラーの「Characters」という名前のフォルダーが開きます。ここにキャラクターモデルを配置します。

Warudoは、`.vrm`と`.warudo`の2つのモデル形式をサポートしています。`.vrm`は[VRoid Studio]((https://vroid.com/en/studio))などのソフトウェアによってエクスポートされる標準的なアバター形式であり、`.warudo`はWarudo独自の形式で、ほぼすべてのUnity互換のキャラクターモデルをサポートしています （[詳細](modding/character-mod.md)）。まずは、`.vrm`ファイルを「Characters」フォルダに配置しましょう。

:::info
**Q:** Warudoは、`.vsfavatar`モデルをサポートしていますか？

**A:** いいえ、サポートしていません。ただし、`.vsfavatar`モデルの作成に使用するUnityプロジェクトにアクセスできるのであれば、 `.warudo`モデルの作成は非常に簡単です。両形式ともUnityからエクスポートできます。詳細については、[modding guide](modding/character-mod.md)を参照してください。
:::

Warudoのエディターウィンドウに戻ってキャラクター選択のドロップダウンを開きます。リストにキャラクターの名前が表示されるので、使用したいキャラクターを選択すると、モデルがシーンに読み込まれます！

![](/doc-img/jp-getting-started-4.png)
<p class="img-desc">キャラクターがシーンにロードされました</p>

**[OK]** をクリックして次のステップに進みましょう。ここでは、推奨されるモーションキャプチャ設定をWarudoに適用するかどうかを尋ねられます。

![](/doc-img/jp-getting-started-5.png)
<p class="img-desc">モーションキャプチャを設定</p>

**[はい]** を選択すると、Warudoは、使用するモーショントラッキングおよびフェイストラッキングソフトを決定するためにいくつかの質問をします。たとえば、iPhoneとWebカメラがあり、Leap Motionコントローラーまたはフルトラッキング機器がない場合、Warudoはフェイストラッキングに[iFacialMocap](mocap/ifacialmocap.md)（iPhoneアプリ）、手のトラッキングに[MediaPipe](mocap/mediapipe.md)（Webカメラを使用するWarudo内臓のモーショントラッキングソフト）の使用を推奨します。**[いいえ]** を選択した場合は、使用するフェイストラッキングおよびモーショントラッキングソフトを手動で選択する必要があります。

初めてWarudoを使用する場合は、**[はい、お勧めしてください]** を選択して、Warudoが推奨するモーションキャプチャ設定を適用することをおすすめします。 **[OK]** をクリックし、設定に最も適したオプションを選択後、**[OK]** をクリックします。

![](/doc-img/jp-getting-started-6.png)
<p class="img-desc">いくつかの質問に答えてください</p>

次の画面では、Warudoが選択したフェイストラッキングおよびモーショントラッキングソフトを確認するよう求められます。

![](/doc-img/jp-getting-started-7.png)
![](/doc-img/jp-getting-started-8.png)
<p class="img-desc">モーションキャプチャの設定を確認</p>

:::tip
セカンダリトラッキングを設定する場合は、**[Secondary Pose Tracking]** オプションを使用できます。
これは、プライマリトラッキングにVRトラッカー/Mocopiを使用していて、追加の指トラッキングに[MediaPipe](mocap/mediapipe.md)、[Leap Motion Controller](mocap/leap-motion.md)または[StretchSense Gloves](mocap/stretchsense.md)を使用する場合に役立つオプションです。
:::
**[OK]** をクリックして次のステップに進みます。モデルに表情トリガーが含まれている場合、Warudoにインポートしてショートカットキーを割り当てることができます。**[表情をインポートします]** を選択し、**[OK]** をクリックします。

![](/doc-img/jp-getting-started-9.png)
<p class="img-desc">Import expressions.</p>

インポートしたトリガーのリストとそのショートカットキーを含むポップアップウィンドウが表示されます。もちろん、ショートカットキーはあとで変更できます。**[OK]** をクリックしましょう。

![](/doc-img/jp-getting-started-10.png)
<p class="img-desc">ショートカットキーを確認</p>

最後に、シーンの背景を選択するように求められます。透明な背景またはデフォルトのスカイボックスを使用できますが、Warudoにはすぐに使用できる素敵な背景がいくつか付属しています (これらは**環境**と呼ばれます)。**[環境を選択して適用]** を選択して、**VR Room** を選択しましょう。 **[OK]** をクリックしてセットアップを完了します。

![](/doc-img/jp-getting-started-11.png)
<p class="img-desc">環境を選択</p>

メインウィンドウは以下のようになります:

![](/doc-img/jp-getting-started-12.png)
<p class="img-desc">セットアップ後のシーン</p>

すでにトラッキングソフトや機器を接続している場合、キャラクターが動いているのがわかるはずです。

![](/doc-img/jp-getting-started-13.png)
<p class="img-desc">シーン内で動くキャラクター</p>

:::tip
MediaPipe選択時、トラッカーウィンドウが真っ黒で「Loading...」と表示され続けてキャラクターが動かない場合、WebカメラのGPUアクセラレーションを無効にすることで問題が解決する可能性があります。詳しくは[MediaPipeのFAQ](mocap/mediapipe.md)を参照してください。
:::

それでは、基本的な操作方法を学びましょう！

## シーン操作

キャラクターモデルをじっくりと鑑賞してみましょう。デフォルトでは、シーンカメラは**オービットキャラクター**モードに設定されており、カメラは常にキャラクターの周りを回転します。**マウスの左ボタン/右ボタン**を使用してビューを回転させ、**マウスホイール**を使用してズームインまたはズームアウトし、**マウスの中央ボタン**を使用してビューをパン（水平・垂直方向に移動）することができます。カメラを次の角度に動かしてみてください。

![](/doc-img/jp-getting-started-14.png)
<p class="img-desc">キャラクターの周りを回るカメラ</p>

次に、キャラクターを動かす方法を学びましょう。エディターウィンドウで、**「キャラクター」** をクリックして、キャラクターアセットを選択します。

![](/doc-img/jp-getting-started-15.png)
<p class="img-desc">キャラクターアセットを選択</p>

モデルの足下に、モデルを移動するために使用できる**移動ギズモ**が表示されます。軸をドラッグするだけで、その軸に沿って移動できます。ここでは、モデルをベッドの隣に移動しました。

![](/doc-img/jp-getting-started-16.png)
<p class="img-desc">モデルを移動させる</p>

:::tip
ギズモが表示されませんか？**マウスの中央ボタン**を使用して、カメラを後退させてみてください。
:::

**E**キー を押すと**回転ギズモ**に切り替えることができます（**W** キーを押すと移動ギズモに戻ります）

![](/doc-img/jp-getting-started-17.png)
<p class="img-desc">モデルを回転させる</p>

**R**キーを押して**スケールギズモ**に切り替えます。通常はキャラクターをスケールする必要はありませんが、試しにモデルの幅を広げてみましょう。

![](/doc-img/jp-getting-started-18.png)
<p class="img-desc">モデルを拡大縮小させる</p>

見た目がよくありませんね。スケールを元に戻すにはどうしたらよいでしょうか。エディターウィンドウをよく見てみると、ギ​​ズモのドラッグに応じて **[変換]** セクションの値が変化することに気付いたかもしれません。たとえば、私のギズモは現在以下のようになっています。

![](/doc-img/jp-getting-started-19.png)
<p class="img-desc">変換の値が変わっている</p>

デフォルトのスケールに戻すには、**スケール**の値を**1**に設定するか、**スケール**の値の上にマウスを置いたときに表示される**リセット**ボタンをクリックします。

![](/doc-img/jp-getting-started-20.png)
<p class="img-desc">スケールをリセットする</p>

やったぜ！

![](/doc-img/jp-getting-started-21.png)
<p class="img-desc">初期状態に戻りました</p>

:::tip
エディターウインドウにもギズモを切り替えるボタンが配置されています。

![](/doc-img/en-getting-started-66.png)
:::

カメラを**自由観察**モードに切り替えると、モデルの周りを回るだけでなくシーン内を飛行させることもできます。**「ビデオカメラ」** アセットを選択し、**コントロール**の**自由観察**を選択します。

![](/doc-img/jp-getting-started-22.png)
<p class="img-desc">カメラを自由観察モードに切り替える</p>

**マウスの右ボタンを押しながら**、**WASD**キーで前後左右に移動し、**E**キーと**Q**キーで上下に移動します。**左シフト**キーを押したまま移動すると移動速度が速くなります。**マウスの中央ボタン**を使用してビューをパンします。

2つのカメラモードに慣れたら、**オービットキャラクター**モードを選択し直し、**[カメラ変換をリセット]** ボタンをクリックしてカメラをデフォルトの位置に戻します。
:::tip
**V** キーを押して、**オービットキャラクター** モードと**自由観察** モードを切り替えることもできます。
:::

![](/doc-img/jp-getting-started-24.png)
<p class="img-desc">カメラの変換をリセットする</p>

![](/doc-img/jp-getting-started-23.png)
<p class="img-desc">カメラがデフォルト位置に戻ります</p>

## アセットタブ

キャラクターとカメラを動かす基本的な方法がわかったので、エディターウィンドウを見てみましょう。デフォルトでは、**[アセット]** タブが表示されます。

![](/doc-img/jp-getting-started-67.png)
<p class="img-desc">アセットタブ</p>

**アセット**とは、キャラクター、カメラ、小道具、モーション キャプチャトラッカーなど、基本的に「シーン内」にあるものすべてを指します。

それぞれの**アセット** をクリックして選択すると、詳細設定を変更することができます。たとえば、**指向性ライト**アセットをクリックして選択し、照明の色を調整します。

![](/doc-img/en-getting-started-25.png)
<p class="img-desc">指向性ライトを選択し、色を調整します</p>

不気味ですね！

![](/doc-img/en-getting-started-26.png)
<p class="img-desc">ライトの色が赤に設定されました</p>

モーションキャプチャトラッカーもアセットのひとつとして扱われます。たとえば、フェイストラッキングソフトとして**iFacialMocap**を選択すると、シーンに**iFacialMocapの受信機**アセットが表示されます。これをクリックして選択し、 **[キャリブレーション]** ボタンをクリックするとフェイストラッキングをキャリブレーションできます。

![](/doc-img/en-getting-started-27.png)
<p class="img-desc">iFacialMocapの調整</p>

せっかくなので、続いて新しいアセットを追加してみしょう。 **[アセットの追加]** をクリックして **[Prop]** を選択します。

![](/doc-img/jp-getting-started-28.png)
<p class="img-desc">アセットを追加します</p>

![](/doc-img/jp-getting-started-29.png)
<p class="img-desc">「道具」を選択します</p>

**道具**アセットがシーンに追加されましたが、まだモデルが選択されていません。**ソース**ドロップダウンメニューの横にある**ギャラリープレビュー**ボタンをクリックしましょう。

![](/doc-img/jp-getting-started-30.png)
<p class="img-desc">ギャラリーのプレビュー</p>

次に、**マイク**のプロップを選択しましょう。**X**ボタン (またはポップアップの外側の任意の場所) をクリックしてギャラリープレビューを閉じます。

![](/doc-img/jp-getting-started-31.png)
<p class="img-desc">道具の中からマイクを選択します</p>

あれ？マイクはどこにあるのでしょうか。少しズームアウトすると・・・地面に埋め込まれているのが見えるはずです！

![](/doc-img/jp-getting-started-32.png)
<p class="img-desc">そこにいたのか</p>

このままではよろしくありません。キャラクターの手に取り付けたいですね。**トランスフォームバインド**セクションの**バインド**ドロップダウンメニューをクリックして、**キャラクター**を選択します。

![](/doc-img/jp-getting-started-33.png)
<p class="img-desc">キャラクターにアタッチします</p>

これで、マイクがキャラクターの手に取り付けられました。変換ギズモを使用して、マイクのサイズや取り付け位置を調整できます。

![](/doc-img/jp-getting-started-35.png)
<p class="img-desc">マイクの取り付け位置を調整します</p>

フルボディトラッキングまたはハンドトラッキングを設定している場合は、マイクが手に合わせて動くのを確認できるはずです！

![](/doc-img/jp-getting-started-36.png)
<p class="img-desc">マイクが手の動きに追従する</p>

As you can see, each type of asset comes with many options. For example, you can change **Attach To Bone** to attach the microphone to the character's left hand instead, or change **Override Hand Pose** to make the character hold the microphone with a different hand pose:

![](/doc-img/en-getting-started-37.png)
<p class="img-desc">Adjust prop options.</p>

The character asset is also highly customizable. For example, our character has stood next to the bed for a while. Let's make them sit on the bed! Click on the **Character** asset to select it, and click on the **Preview Gallery** button next to the **Idle Animation** dropdown menu:

![](/doc-img/en-getting-started-42.png)
<p class="img-desc">Select a character idle animation.</p>

![](/doc-img/en-getting-started-41.png)
<p class="img-desc">Select the "Sitting" idle animation.</p>

Comfy!

![](/doc-img/en-getting-started-43.png)
<p class="img-desc">Character sitting on the bed.</p>

The best part is that **Warudo's motion capture blends seamlessly with the idle animations**! For example, if you raise your hand, the character will still raise their hand while sitting:

![](/doc-img/en-getting-started-55.png)
<p class="img-desc">Character raises hand while sitting.</p>


:::info
**Q:** Help! There are so many options in Warudo, and I don't know what they do!

**A:** It is easy to feel overwhelmed, but don't worry, you don't need to understand all of them. Many options are for advanced users and are not necessary for day-to-day usage.

If you are new to Warudo, just play around with the options and see what they do. You can always reset the options to their default values by clicking the **Reset** button when hovering on them. The later sections of this handbook will explore each type of asset and their options in detail with examples.
:::

Finally, let's try to add a **Screen** asset. Click on **Add Asset** and select **Screen**:

![](/doc-img/en-getting-started-38.png)
<p class="img-desc">Add screen asset.</p>

The screen asset is used to display images and videos, but it can also capture your windows/monitors just like OBS Studio! In the following example, I have selected **Window** for the **Content Type** option and **Warudo Editor** for the **Window** option, and moved the screen to behind the character:

![](/doc-img/en-getting-started-39.png)
<p class="img-desc">Screen usage example.</p>

:::tip
If the screen is too bright, you can adjust the **Tint** option to a gray color to make it darker.
:::

## Blueprints Tab

Now you are familiar with assets, let's take a look at the **Blueprints** tab. Click on the sigma icon to switch to the blueprints tab:

![](/doc-img/en-getting-started-40.png)
<p class="img-desc">Switch to the blueprints tab.</p>

But what is a blueprint? Essentially, blueprints are "what should happen when something happens." For example, "when I press the **Space** key, the character should wave their hand." Or, "when I receive a Twitch redeem, a prop should be thrown at my character."

Our scene already has a few blueprints. For example, the **Expression Key Bindings** blueprint implements the hotkeys for switching between expressions. Let's click on it to select it:

![](/doc-img/en-getting-started-44.png)
<p class="img-desc">Select the expression key bindings blueprint.</p>

Use **Mouse Wheel** to zoom in and out, and **Mouse LMB** to pan the view. Pan to the right until you see these two nodes:

![](/doc-img/en-getting-started-45.png)
<p class="img-desc">Zoom out and pan to the right.</p>

The two nodes right here are essentially saying: "when **Alt+1** is pressed, the character asset **Character** should switch to the **Joy** expression." Let's try it out! Press **Alt+1** on your keyboard, and you should see your character switch to the **Joy** expression:

![](/doc-img/en-getting-started-46.png)
<p class="img-desc">Character switches to the "Joy" expression.</p>

Similarly, the two nodes below are saying: "when **Alt+Backspace** is pressed, the character asset **Character** should exit all expressions." Press **Alt+Backspace** to try it out.

![](/doc-img/en-getting-started-47.png)
<p class="img-desc">Character exits all expressions.</p>

Let's go back to the two nodes that switch to the **Joy** expression. You can change the hotkey by changing the **Keystroke** option and other options; for example, in the following, I have changed the hotkey to **Ctrl+Shift+Q**:

![](/doc-img/en-getting-started-48.png)
<p class="img-desc">Change hotkey.</p>

You can also make more things happen when the hotkey is pressed. How about playing a sound effect? Type **play sound** in the search bar and drag the **Play Sound** node to the right of the **Toggle Character Expression** node:

![](/doc-img/en-getting-started-49.png)
<p class="img-desc">Locate the "Play Sound" node.</p>

Click on the green dot next to the **Exit** output of the **Toggle Character Expression** node and drag it to the green dot next to the **Enter** input of the **Play Sound** node:

![](/doc-img/en-getting-started-50.png)
<p class="img-desc">Drag the "Play Sound" node to the right of the "Toggle Character Expression" node.</p>

This connects the two nodes together. Now, click on the **Source** dropdown menu and select a sound effect you like. I have selected the **Punch Light 01** sound effect.

![](/doc-img/en-getting-started-51.png)
<p class="img-desc">Select a sound effect.</p>

:::tip
You can click **Open Sounds Folder** and put in your own sound effects!
:::

Now, when you press **Ctrl+Shift+Q** (or the hotkey you assigned), your character should switch to the **Joy** expression, and you should hear a sound effect!

Let's implement something new. For example, let's play an emote animation on the character when we press **Space**. Pan to an empty area and try to add the following nodes yourself and connect them together as shown. Select the character asset in the **Character** dropdown menu, and select **Energetic** for the **Animation** option:

![](/doc-img/en-getting-started-52.png)
<p class="img-desc">Add nodes to play an emote animation.</p>

If your character is currently sitting, you may want to mask the animation to only play on the upper body. To do so, click on **Mask Upper Body** on the **Play Character One Shot Overlay Animation** node:

![](/doc-img/en-getting-started-53.png)
<p class="img-desc">Mask the animation to only play on the upper body.</p>

Now, when you press **Space**, your character should play the **Energetic** emote animation!

![](/doc-img/en-getting-started-54.png)
<p class="img-desc">Character plays the "Energetic" emote animation.</p>


That's our brief introduction to blueprints! Hopefully it offers you a glimpse of what blueprints can do. Blueprints are a very powerful feature, but even without touching them at all, you can still do a lot of things with Warudo. Once you are familiar with the rest of the features, we recommend reading the [blueprint tutorial](/docs/blueprints/overview) to learn more about blueprints.

:::tip
You can use **Mouse RMB** to drag a selection box to select multiple nodes. To remove a node, select it and press **Delete**.
:::

:::info
You may have noticed there is a blueprint for face tracking and a blueprint for pose tracking. These blueprints were automatically generated by the onboarding assistant and can be customized to your liking. For beginners though, they could look intimidating, so we recommend leaving them alone for now.
:::

## Interaction Setup {#interaction-setup}

VTubing isn't fun if you can't interact with your viewers! Warudo offers a wide range of interaction features, but the quickest way to get started is to use our onboarding assistant. Select the **Onboarding Assistant** asset, and click on **Interaction Setup → Get Started**:

![](/doc-img/en-getting-started-58.png)
<p class="img-desc">Interaction setup.</p>

You will be asked to select a streaming platform:

![](/doc-img/en-getting-started-59.png)
<p class="img-desc">Select a streaming platform.</p>

Follow the instructions to set up the streaming platform integration. For example, in the following, I am setting the **Launching Liquid** interaction to trigger when I receive a Twitch redeem called "Water":

![](/doc-img/en-getting-started-60.png)
<p class="img-desc">Set up integration.</p>

When you are done, you will notice a new blueprint has been added to the blueprints tab. Remember what we said about blueprints? They are "what should happen when something happens." In this case, the blueprint should contain the logic for launching liquid at our character when we receive a Twitch redeem called "Water." Click on the blueprint to select it, and locate the **Launch Liquid At Character** node:

![](/doc-img/en-getting-started-61.png)
<p class="img-desc">A new blueprint has been added.</p>

![](/doc-img/en-getting-started-62.png)
<p class="img-desc">Locate the "Launch Liquid At Character" node.</p>

Indeed, the nodes above are essentially saying: "when we receive a Twitch redeem, if the redeem title is 'Water', then launch liquid at the character asset 'Character'." You can click the "Enter" button on the **Launch Liquid At Character** node to test it out:

![](/doc-img/en-getting-started-63.png)
<p class="img-desc">Test the interaction.</p>

![](/doc-img/en-getting-started-64.png)
<p class="img-desc">It works!</p>

## Outputting to OBS Studio / Streamlabs

It's time to put Warudo into your favorite streaming software! There are four ways to do so:

* **Virtual camera:** Warudo can output as a virtual camera. This is useful for collab streams on [VDO.Ninja](https://vdo.ninja/) or you want to use your VTubing avatar on Discord/Zoom. To use this method, go to **Settings → Output** and enable **Virtual Camera Output**.
* **NDI:** Warudo can output as an [NDI](https://ndi.video/) source. To use this method, go to **Settings → Output** and enable **NDI Output**. Note that audio output is not supported.
* **Spout:** Warudo can output as a [Spout](https://spout.zeal.co/) source. To use this method, go to **Settings → Output** and enable **Spout Output**. **This is by default already enabled.**
* **Window/Game capture:** You can also use window/game capture in OBS Studio or Streamlabs to capture the Warudo window. We do not recommend this method, as it takes up significantly more CPU/GPU resources than the other methods.

We recommend using the **Spout** method, as it has zero latency and best performance. Furthermore, it hides the transform gizmos, so you can move/rotate characters or props during a stream without showing the gizmos to the audience! To set up Spout output, follow these steps:

* **OBS Studio:** Install the [**Spout2 Plugin for OBS Studio**](https://github.com/Off-World-Live/obs-spout2-plugin) first, then add a **Spout2 Capture** source, and select **Warudo** as the sender.
* **Streamlabs:** Add a **Spout2** source, and select **Warudo** as the sender.

![](/doc-img/en-getting-started-65.png)
<p class="img-desc">Spout output to OBS Studio.</p>

:::tip
All output methods support transparency output. To enable transparent background, simply go to the camera asset and enable **Basic Properties → Transparent Background**.
:::

## Saving and Loading Scenes

Now that you have set up your scene, remember to save it! Unlike other software, Warudo does not automatically save your scene, so that you can experiment with different settings without worrying about messing up your scene. Click on the Warudo icon, and select **Save Scene**:

![](/doc-img/en-getting-started-56.png)
<p class="img-desc">Save scene.</p>

You can also save the scene as a new file by selecting **Save Scene As**. To load a scene, select **Open Scene**.

![](/doc-img/en-getting-started-57.png)
<p class="img-desc">Open scene.</p>

Finally, you can use **Reload Scene** and **Restart Scene** to reload and restart the scene respectively. **Reload Scene** resets the scene state and abandons all changes made to the scene since the last save, while **Restart Scene** only resets the scene state but keeps the changes made to the scene.

:::info
"Resetting the scene state" means resetting physics, temporary objects, etc. in the scene. For example, if you have somehow spawned 1,000 thrown props in the scene, using **Reload Scene** or **Restart Scene** will remove all of them, since they are not part of the scene file.
:::

## Summary

Congratulations! You have now learned the basics of Warudo. We recommend reading the rest of the handbook to learn more about Warudo's features. If you have any questions, please join our [Discord](https://discord.gg/warudo), and we will be happy to help you out!

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
