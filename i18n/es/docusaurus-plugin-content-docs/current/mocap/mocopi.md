---
sidebar_position: 80
---

# Sony Mocopi

Seguimiento corporal a través de [Sony Mocopi](https://electronics.sony.com/more/mocopi/all-mocopi/p/qmss1-uscx).

## Configuración

Sigue el [video tutorial oficial](https://www.sony.com/electronics/support/articles/00298063) para configurar Sony Mocopi.

Luego, entra a la página de configuración en la app Mocopi. En **External device connection settings** (Configuración de conexión de dispositivo externo), selecciona **mocopi (UDP)** para **Transfer format** (Formato de transferencia), e ingresa la dirección IP de tu computadora para **IP address** (Dirección IP).

:::tip
Si no conoces la IP de tu computadora, puedes verificarla en la página de configuración del asset **Mocopi Receiver**.

![](/doc-img/en-ifacialmocap-1.png)

Si aparecen múltiples IPs listadas, necesitarías probar cada una. Usualmente, la dirección IP asignada a tu computadora por tu router WiFi comienza con `192.168`. Por ejemplo, en la imagen de arriba, puedes intentar primero `192.168.1.151`.
:::

Regresa a la interfaz principal, toca **Motion** en la barra de menú, y toca el ícono **SAVE** para cambiar al modo **SEND**. Toca el botón verde de envío en la parte inferior para comenzar a enviar datos de seguimiento.

![](/doc-img/en-mocopi-1.png)

## Calibración

La calibración de Sony Mocopi se realiza en la app Mocopi.

## Opciones

* **Motion Buffering**: Si habilitar el buffering de movimiento integrado de Mocopi. Esto usualmente puede ser deshabilitado porque Warudo ya suaviza los datos de movimiento.

## Preguntas Frecuentes

Por favor consulta [Resumen](overview#FAQ) y [Personalizar Seguimiento de Pose](body-tracking#FAQ) para preguntas comunes.

### Mi seguimiento se va desviando con el tiempo.

Este es un problema común con los sistemas de captura de movimiento inerciales, que se desvían con el tiempo debido a errores acumulativos. Para reducir la deriva, asegúrate de que no haya interferencia magnética o eléctrica cerca de los sensores de seguimiento.

<AuthorBar authors={{
  creators: [
    {name: 'HakuyaTira', github: 'TigerHix'},
  ],  translators: [
    {name: 'かぐら', github: 'Arukaito'},
  ],
}} />
