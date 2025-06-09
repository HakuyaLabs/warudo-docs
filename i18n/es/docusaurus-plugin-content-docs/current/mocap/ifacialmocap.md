---
sidebar_position: 60
---

# iFacialMocap/FaceMotion3D

Seguimiento facial basado en ARKit. Requiere un dispositivo iOS compatible con [Face ID](https://support.apple.com/en-us/HT208109) y la aplicación [iFacialMocap](https://apps.apple.com/us/app/id1489470545) de $5.99. Rastrea 52 blendshapes de ARKit, rotación de cabeza y traslación de cabeza.

Una alternativa a iFacialMocap es [FaceMotion3D](https://apps.apple.com/us/app/facemotion3d/id1507538005), que cuesta $14.99 por una licencia permanente. Tiene más funciones que iFacialMocap, pero en cuanto al seguimiento facial para Warudo, ambas aplicaciones son funcionalmente equivalentes.

:::tip
Para obtener la mejor calidad de seguimiento, recomendamos usar un iPhone 12 o más reciente (iPhone mini también funciona). Los iPhones más antiguos pueden tener menor calidad de seguimiento.
:::

:::info
Si tu iPhone no es compatible con Face ID, aún podrías usar iFacialMocap / FaceMotion3D si tiene un chip A12 o superior y ha sido actualizado a iOS 14. Sin embargo, la calidad del seguimiento puede ser deficiente.
:::

## Configuración

:::tip
Si no conoces la IP de tu computadora, puedes verificarla en la página de configuración del asset **iFacialMocap Receiver**.

![](/doc-img/en-ifacialmocap-1.png)

Si se listan múltiples IPs, necesitarás probar cada una. Por lo general, la dirección IP asignada a tu computadora por tu router WiFi comienza con `192.168`. Por ejemplo, en la imagen de arriba, puedes probar primero `192.168.1.151`.
:::

### iFacialMocap

Abre la aplicación iFacialMocap, toca el ícono de engranaje en la esquina superior derecha para entrar a la interfaz de configuración. Toca en **Destination IP address** e ingresa la dirección IP de tu computadora.

![](/doc-img/zh-ifacialmocap-1.webp)

Se recomienda habilitar **Optimize for long-time streaming**, lo cual puede ayudar a reducir el sobrecalentamiento del dispositivo por uso prolongado.

![](/doc-img/zh-ifacialmocap-3.webp)

### FaceMotion3D

Abre la aplicación FaceMotion3D, toca el ícono **Setting** en la esquina inferior izquierda para entrar a la interfaz de configuración. Toca en **Streaming settings**. Establece **Software Name** en **Other**, y habilita **Compatible with iFacialMocap**.

Regresa a la interfaz principal, toca el botón **Live** en la esquina superior izquierda, selecciona **Other** como el software, e ingresa la dirección IP de tu computadora. Luego, toca **Connect** para comenzar la transmisión.

## Calibración

Puedes calibrar el seguimiento de iFacialMocap:
* haciendo clic en **Character → Motion Capture → Quick Calibration → Calibrate iFacialMocap**, o
* haciendo clic en **Calibrate** en el asset **iFacialMocap Receiver**.

Durante la calibración, debes mirar hacia adelante y mantener tu cabeza quieta. Después de la calibración, puedes mover tu cabeza libremente.

## Preguntas Frecuentes

Por favor consulta [Overview](overview#FAQ) y [Customizing Face Tracking](face-tracking#FAQ) para preguntas comunes.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],
  translators: [
    {name: 'かぐら (h.o.r.o)', github: 'Arukaito'},
  ],
}} />
