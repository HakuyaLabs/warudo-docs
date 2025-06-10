---
sidebar_position: 70
---

# Ancla

Un ancla es un punto 3D en la escena, que puede usarse como objetivo para el [Look At IK](character/#look-ik) o [Body IK](character/#body-ik) del personaje.

Algunos nodos de blueprint también te permiten especificar un ancla como origen o destino. Por ejemplo, el nodo **Launch Liquid At Character** por defecto lanza el líquido desde la cámara principal, pero puedes especificar un ancla como origen para lanzar el líquido desde esa ancla en su lugar. Digamos que tienes el ancla adjunta a la boca de un prop de hipopótamo, entonces puedes lanzar el líquido desde la boca del hipopótamo.

![](/doc-img/en-anchor-1.png)
<p class="img-desc">El prop del hipopótamo tiene un ancla adjunta a su boca, que se usa como origen del líquido.</p>

## Configuración

Para configurar un ancla, primero establece la opción **Attach To** si quieres que el ancla esté adjunta a un personaje o prop. Luego, usa los gizmos de transformación para mover y rotar el ancla, para que esté en la posición deseada.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'}
  ],
}} />
