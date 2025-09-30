---
sidebar_position: 1000
---

# Depuración

¿Los scripts no funcionan como esperabas? ¡Aquí tienes algunos consejos de depuración!

## Reiniciar Warudo

Por cliché que suene, reiniciar Warudo puede resolver muchos problemas, especialmente cuando tus mods o scripts se recargan en caliente. Siempre intenta esto primero si encuentras un problema desconcertante.

## Registro de Logs

Puedes usar `Debug.Log` de Unity para imprimir mensajes a la consola como siempre. Puedes acceder a la carpeta de logs usando **Menu → Open Logs Folder**. El archivo `Player.log` contiene los logs de la sesión actual, mientras que `Player-prev.log` contiene los logs de la sesión anterior.

## Habilitar Logs de Compilación Completos

Si estás creando un [plugin mod](plugin-mod), recomendamos establecer **Log Level** a All y desmarcar **Clear Console On Build** en la ventana de Mod Settings:

![](/doc-img/en-mod-13.png)

Por favor consulta también la documentación de [Modding](../modding/mod-sdk#custom-scripts).

## Únete al Discord

Si aún tienes problemas, siéntete libre de pedir ayuda en nuestro [Discord](https://discord.gg/warudo). Tenemos un canal dedicado **#plugins-scripting** para cualquier cosa relacionada con scripting, ¡y las personas experimentadas allí estarán felices de ayudarte a diagnosticar el problema!

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら', github: 'Arukaito'},
],
}} />
