---
sidebar_position: 65
---

# RhyLive

Seguimiento facial y de la parte superior del cuerpo basado en ARKit. Requiere un dispositivo iOS compatible con [Face ID](https://support.apple.com/en-us/HT208109) y la app gratuita [RhyLive](https://apps.apple.com/us/app/rhylive/). Rastrea 52 blendshapes de ARKit, rotación de cabeza y movimientos de manos.

:::info
RhyLive e iFacialMocap tienen precisión similar cuando se trata de seguimiento facial, pero iFacialMocap es más flexible porque puede rastrear movimientos de cabeza, lo que permite que el modelo se mueva más naturalmente. Ve la siguiente comparación:

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-1.mp4" />
<p>RhyLive</p>
</div>

<div className="video-box"><video controls src="/doc-img/zh-rhylive-video-2.mp4" />
<p>iFacialMocap</p>
</div>
:::

## Configuración

Para usar RhyLive en un dispositivo iOS, abre la app y toca el ícono de menú en la esquina superior izquierda para entrar a la configuración. Si tu computadora y teléfono están conectados a la misma red WiFi, ingresa la IP de tu computadora en el campo "IP" y enciende el interruptor "无线" (Inalámbrico). Alternativamente, puedes conectar tu dispositivo a tu computadora usando un cable USB y encender el interruptor "有线" (Cableado) ([iTunes](https://www.apple.com/itunes/) requerido).

![](/doc-img/zh-rhylive-1.webp)

:::tip
Si no conoces la IP de tu computadora, puedes verificarla en la página de configuración del asset **RhyLive Receiver**.

![](/doc-img/en-ifacialmocap-1.png)

Si aparecen múltiples IPs listadas, necesitarías probar cada una. Usualmente, la dirección IP asignada a tu computadora por tu router WiFi comienza con `192.168`. Por ejemplo, en la imagen de arriba, puedes intentar primero `192.168.1.151`.
:::

:::info
Si usas la opción "Cableado", debes abrir la app RhyLive, conectar tu iPhone a tu PC antes de ejecutar Warudo.
:::

Se recomienda desactivar "锁定弯腰" (Bloquear inclinación del cuerpo) y activar "隐藏模型" (Ocultar modelo). Lo primero aumenta el rango de movimiento del modelo, mientras que lo segundo ayuda a reducir el sobrecalentamiento del dispositivo por uso prolongado.

![](/doc-img/zh-rhylive-3.webp)

## Calibración

Puedes calibrar el seguimiento de RhyLive:
* haciendo clic en **Character → Motion Capture → Quick Calibration → Calibrate RhyLive**, o
* haciendo clic en **Calibrate** en el asset **RhyLive Receiver**.

Durante la calibración, debes mirar hacia adelante y mantener tu cabeza quieta. Después de la calibración, puedes mover tu cabeza libremente.

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento Facial](face-tracking#FAQ) para preguntas comunes.

### Estoy usando la opción "Cableado" y conecté mi iPhone a mi computadora vía USB, pero mi personaje no se está moviendo.

Asegúrate de que [iTunes para Windows](https://support.apple.com/en-us/HT210384) esté instalado en tu computadora. Si tienes iTunes instalado desde Microsoft Store, puede que necesites desinstalarlo e instalar la versión del sitio web de Apple.

Alternativamente, puedes intentar usar la opción "Inalámbrico" en su lugar.

### Estoy usando la opción "Inalámbrico" y me aseguré de que mi computadora e iPhone estén conectados a la misma red WiFi, pero mi personaje no se está moviendo.

Por favor intenta desactivar y activar el interruptor "无线" (Inalámbrico) en la app RhyLive, o reinicia la app.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (Arukaito)', github: 'Arukaito'},
  ],
}} />
