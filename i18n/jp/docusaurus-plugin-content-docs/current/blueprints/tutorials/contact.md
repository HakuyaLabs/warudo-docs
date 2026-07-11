---
sidebar_position: 130
translate_from_version: 2024-06-14
---

# 火花を散らそう

配信に火花を散らしましょう！ このチュートリアルでは、オブジェクトがほかのオブジェクトと _接触_ したときに、さまざまな楽しいエフェクトをトリガーできる Warudo の強力なコンタクトシステムを紹介します。

<div style={{width: '100%'}} className="video-box"><video controls loop src="/doc-img/contact.mp4" /></div>
<p class="img-desc">コンタクトシステムを使って指の間に火花を発生させ、刀を抜きます。</p>

:::info
このチュートリアルにはハンドトラッキングまたはフルボディトラッキングが必要です。ハンドトラッキングには [MediaPipe](../../mocap/mediapipe) でも十分ですが、より高い精度のために [Leap Motion](../../mocap/leap-motion) の使用をおすすめします。
:::

## コンタクトシステム

コンタクトシステムの概念はシンプルです。2つのオブジェクトが接触すると、フローをトリガーできます。たとえば、人差し指の指先同士が接触したことを検出し、その間に火花を発生させます。実装方法を見ていきましょう！

まずは **On Contact** ノードを見てみましょう。信じられないかもしれませんが、このノードだけでコンタクトシステムのすべてです！ 本質的には、このノードが **Contact Senders** のオブジェクトと **Contact Receivers** のオブジェクトが接触しているかを自動的に確認し、状況に応じて **On Contact Enter**（オブジェクトが接触した瞬間）、**On Contact Stay**（オブジェクトが接触している間）、**On Contact Exit**（オブジェクトが接触しなくなった瞬間）のフロー出力をトリガーします。

![](/doc-img/en-blueprint-contact-2.png)

**Contact Senders** にエントリーを追加し、次のように設定します。

![](/doc-img/en-blueprint-contact-4.png)

これで右手を上げると、人差し指の先端に赤い球体が現れるはずです。

![](/doc-img/en-blueprint-contact-3.png)

次に、**Contact Receivers** にエントリーを追加し、次のように設定します。

![](/doc-img/en-blueprint-contact-5.png)

手を上げると、左手の人差し指の先端に緑の球体が現れるはずです。

![](/doc-img/en-blueprint-contact-6.png)

あとは実際に電気の火花を発生させるだけです！ 幸い、**Spawn Particle** ノードで実現できます。ノードエディターに追加し、**Source** オプションで好きなパーティクル（ここでは "Basic Impact 3" を使用）を選び、適切な **Scale**（ここでは 0.1）も選択します。次に、次のように **On Contact → On Contact Stay** を **Spawn Particle → Enter** に、**On Contact → Contact Position** を **Spawn Particle → Position Offset** に接続します。

![](/doc-img/en-blueprint-contact-7.png)

これで両手を近づけると、指先の間に火花が飛び散るはずです！ 思ったより簡単だったでしょう？

![](/doc-img/en-blueprint-contact-1.png)

:::tip
設定が完了したら、**Visualized** を No に設定して赤と緑の球体を非表示にできます。
:::

## フローを間引く

パーティクルが非常に高い頻度で生成され、火花のエフェクトがとても密になっていることに気付くかもしれません。これは、オブジェクトが接触している間、**On Contact Stay** フロー出力がフレームごとにトリガーされるためです。Warudo を 60 FPS で実行している場合、毎秒60個のパーティクルが生成されます！

フローの頻度を下げるには、**Throttle Flow** ノードを使います。スロットルは水の流量を調節するバルブであり、Throttle Flow ノードも同様にフロー出力の頻度を調節します。次の例では、**Interval** を 0.1 秒に設定した Throttle Flow ノードが、0.1 秒ごとに最大1回だけフロー出力をトリガーします。

![](/doc-img/en-blueprint-contact-8.png)

間隔は好みに合わせて調整できます。たとえば、毎秒20個の火花を発生させたい場合は、間隔を 0.05 に設定します。

## 刀を抜く

別の例を見てみましょう。背中から刀を抜く例です！ 刀の道具（または好きな剣、ナイフ、その他の武器）を追加し、次のようにキャラクターの左手に取り付けます。

![](/doc-img/en-blueprint-contact-9.png)

ひとまず **Prop → Enabled** を No に設定して刀を非表示にします。続いてコンタクトシステムを設定します。新しい On Contact ノードで、Contact Senders リストに次の項目を追加します。

![](/doc-img/en-blueprint-contact-12.png)

そして Contact Receivers リストに次の項目を追加します。

![](/doc-img/en-blueprint-contact-13.png)

右肩に赤い球体、左手に緑の球体が表示されるはずです。手（緑の球体）で赤い球体に楽に届くまで、**Position Offset** オプションを調整してください。

![](/doc-img/en-blueprint-contact-11.png)

最後に、手が肩に接触したときに **Toggle Asset Enabled** を追加するだけです。

![](/doc-img/en-blueprint-contact-10.png)

これで左手を右肩に伸ばすと、手に刀が現れるはずです！ 刀が現れたときに効果音を再生する **Play Sound** ノードや、パーティクルなど、好きなものを追加することもできます。それがコンタクトシステムの魅力です！

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'そらみかん', github: 'soramikan'},
  ],
}} />
