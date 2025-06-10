---
sidebar_position: 120
---

# Noitom Axis

Seguimiento corporal a través de [Noitom Axis Studio](https://neuronmocap.com/pages/axis-studio) o Axis Neuron. Requiere un traje [Noitom Perception Neuron](https://neuronmocap.com/).

## Configuración

Abre Noitom Axis Studio y habilita la transmisión BVH en **Settings → BVH Broadcasting** (cambia el interruptor en la esquina superior derecha).

![](/doc-img/en-noitom-1.png)

## Calibración

La calibración del hardware de Noitom se realiza en Noitom Axis Studio o Axis Neuron.

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
