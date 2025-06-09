---
sidebar_position: 0
---

# Resumen

El sistema de scripting de Warudo te permite extender la funcionalidad de Warudo escribiendo código C# que agrega nuevos [assets](../assets/overview) y [nodos](../blueprints/overview) a tu configuración de VTubing. Puedes compartir tus assets y nodos personalizados en el workshop de Steam creando un [plugin mod](plugin-mod).

Aquí hay solo algunos plugins maravillosos creados por la comunidad de Warudo:

* [Feline's Headpat Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3010238299&searchtext=)
* [Input Receiver and Tools for Mouse/Pen/Gamepad](https://steamcommunity.com/sharedfiles/filedetails/?id=3221461980&searchtext=) 
* [Emotes From Twitch Message + Emote Dropper](https://steamcommunity.com/sharedfiles/filedetails/?id=3070622133&searchtext=)
* [Rainbow Color Node](https://steamcommunity.com/sharedfiles/filedetails/?id=3016521495&searchtext=)
* [Streamer.bot integration](https://steamcommunity.com/sharedfiles/filedetails/?id=3260939914&searchtext=)

:::tip
**Warudo está construido con scripting personalizado en mente.** De hecho, toda la funcionalidad de Warudo está construida con las mismas APIs (el namespace `Warudo.Core`) que están disponibles para ti cuando creas nodos, assets y plugins personalizados.

Por ejemplo, la integración de Stream Deck en Warudo es en realidad un plugin integrado! Hemos hecho su código fuente disponible [aquí](https://github.com/HakuyaLabs/WarudoPluginExamples) para tu referencia.
:::

Para darte una muestra de cómo funciona el sistema de scripting de Warudo, aquí hay un ejemplo simple de un nodo personalizado que reproduce una expresión aleatoria en un personaje cuando se activa:

![](/doc-img/en-scripting-overview.png)

Y el código C# correspondiente:

```csharp
using UnityEngine;
using Warudo.Core.Attributes;
using Warudo.Core.Graphs;
using Warudo.Plugins.Core.Assets.Character;

// Define un tipo de nodo personalizado que se mostrará en la paleta de nodos
[NodeType(Id = "95cd88ae-bebe-4dc0-b52b-ba94799f08e9", Title = "Character Play Random Expression")]
public class CharacterPlayRandomExpressionNode : Node {

    [DataInput]
    public CharacterAsset Character; // Permite al usuario seleccionar un personaje

    [FlowInput]
    public Continuation Enter() { // Cuando el nodo se activa a través de la entrada de flujo "Enter"
        if (Character.Expressions.Length == 0) return Exit; // Si el personaje no tiene expresiones, salir

        Character.ExitAllExpressions(); // Salir de todas las expresiones actuales

        var randomExpression = Character.Expressions[Random.Range(0, Character.Expressions.Length)];
        Character.EnterExpression(randomExpression.Name, transient: false); // Reproducir una expresión aleatoria
        
        return Exit; // Continuar el flujo y activar lo que esté conectado a la salida de flujo "Exit"
    }
    
    [FlowOutput]
    public Continuation Exit;
    
}
```

¿Intrigado? ¡Sigue leyendo!

<AuthorBar authors={{
creators: [
{name: 'HakuyaTira', github: 'TigerHix'},
],
translators: [
{name: 'かぐら (Arukaito)', github: 'Arukaito'}
],
}} />
