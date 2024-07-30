---
sidebar_position: 42
---

# 風

風アセットは、シーン内の風をシミュレートするために使用されます。[VRM Spring Bones](https://vrm.dev/univrm/springbone/univrm_secondary/)や[Magica Cloth](https://magicasoft.jp/en/magica-cloth-2/)コンポーネントを含む髪の毛、衣服、その他のオブジェクトを風に反応させるために使用できます。

:::info
モデルにVRM Spring BonesやMagica Clothコンポーネントがあるかどうかを知るにはどうすればいいでしょうか？モデルの作成者に問い合わせることもできますが、モデルに動く髪や衣服がある場合は、おそらくVRM Spring BonesもしくはMagica Clothコンポーネントが含まれていると考えられます。ただし、Magica Clothコンポーネントを持つことができるのは、[Mod SDK](../modding/mod-sdk.md)を使用してエクスポートされた`.warudo`モデルのみであることに注意してください。
:::

![](/doc-img/en-wind-1.png)
<p class="img-desc">キャラクターの髪とジャケットをなびかせる風</p>

## 設定

モデルの物理コンポーネントの種類に応じて、 **Wind (VRM)** または **Wind (Magica Cloth)** アセットを作成します。そして、パラメータを操作して風の効果を調整します。

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: '星影月夜', github: 'unsolublesugar'},
  ],
}} />
