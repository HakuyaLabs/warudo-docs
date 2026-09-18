---
sidebar_position: 140
version: 2026-09-19
---

# Temporary Control Points {#control-points}

Temporary control points are the little draggable handles you see in the scene when editing certain assets — for example, the **bone handles in [Character](../../assets/character) Key Motion editing**. The system behind them, `Context.TemporaryControlPointManager`, is also available to your own plugins and assets: you declare a set of short-lived points in the scene, the manager handles clicking, selecting, and dragging them with the transform gizmo, and writes the results back through callbacks you provide.

Typical use cases: authoring curves/paths, positioning decorations, posing a skeleton, or any "edit a handful of values by dragging in the viewport" workflow.

:::info
The manager itself knows nothing about drawing or gizmos — rendering and the transform gizmo are injected through two hooks (`CanvasFactory` and `GizmoAdapter`). Both are wired up in the [complete example](#example) below by reusing what Warudo itself ships: the **ALINE** line-drawing library and the scene transform gizmo, so you don't have to build anything from scratch.
:::

:::warning
ALINE is bundled inside Warudo but **not referenced by mod scripts out of the box**. To use it, import the ALINE package into your modding SDK project (the same way [particle mods import Asset Store packages](../creating-your-first-plugin-mod)); at runtime your script is automatically linked to the ALINE that ships with Warudo, so nothing extra is distributed with your mod.
:::

## The Single-Session Model {#session}

There is exactly **one active session** at a time. Acquiring a session ends (and disables) whatever session was active before — this prevents two editing modes from fighting over the viewport and the gizmo.

```csharp
var manager = Context.TemporaryControlPointManager;
if (!manager.IsOwnedBy(this)) {
    var session = manager.BeginSession(this, new TemporaryControlPointManager.SessionOptions {
        Name = "My Handles",
        // ...see below
    });
}
```

- **`BeginSession(object owner, SessionOptions options)`**: Ends the previous session and returns a new one. Pass the entity creating the session (`this`) as `owner`. If the owner is a Unity object and gets destroyed (e.g. the asset is deleted), the session releases itself automatically.
- **`session.IsActive`**: A session becomes inactive when a new session starts, when the scene is closed or switched, or when you call `session.Dispose()`. Always check it before using a cached session.
- **`SessionOptions.Ended`**: Called when the session ends for any reason. Use it to restore whatever state your editing mode changed.
- **`Reset()`** is called automatically on scene load, and the manager **updates itself every frame** after all plugins and assets — you never call those yourself.

:::tip
`BeginSession` from inside an `Ended` callback throws. If you need to re-acquire the session right after losing it, do it from `OnUpdate()` instead.
:::

## Declaring Points and Connections {#declaring}

A **point** is a control handle bound to a pose. Instead of storing data itself, a point reads and writes a `Pose` (position + rotation + scale) through delegates you supply, so the underlying data can be a `Transform`, an element of a `List<Pose>`, a serialized array — anything:

```csharp
session.DeclarePoint(
    id: i,                                        // any unique object: int, string, enum, tuple...
    poseGetter: () => MyPoints[i],                // reads the current pose (local space of VirtualRoot)
    poseSetter: pose => MyPoints[i] = pose,       // omit for a read-only (non-draggable) point
    options: new TemporaryControlPointManager.PointOptions {
        Name = $"Point {i}",
        Style = new TemporaryControlPointManager.PointStyle {
            Color = Color.cyan,
            Radius = 0.02f,                       // world-space radius of the drawn circle
            HitRadius = 24f,                      // screen-pixel radius for mouse picking
        },
    });

// Optional: draw a line between two points (e.g. segments of a path)
session.DeclareConnection("seg-0", fromId: 0, toId: 1);
```

Declaring the same `id` again **updates** the existing point in place (delegates and options are replaced), which makes it easy to refresh the whole set every frame or on data change. Other methods: `RemovePoint(id)` (also removes attached connections), `ClearPoints()`, and the corresponding `DeclareConnection` / `RemoveConnection` / `ClearConnections` for lines.

:::tip
A point without a `poseSetter` is still drawn and hoverable, but it cannot be dragged and it does not contribute to the allowed operations of the selection. Use this for "reference only" markers.
:::

## Selecting {#selecting}

By default, the manager uses the left mouse button: clicking a point selects it, Shift-clicking adds to or removes from the selection, and clicking empty space clears the selection (if `AllowEmptySelection` is `true`). A click is only recognized if the pointer moves less than `ClickMovementThreshold` pixels between press and release, so camera dragging is not affected.

You get notified through two hooks in `SessionOptions`:

```csharp
SelectionChanging = change => change.Current.Count <= 1,  // veto: enforce single selection
SelectionChanged  = change => Debug.Log($"Now selected: {string.Join(", ", change.Current)}"),
```

- **`SelectionChanging`**: called before the selection changes; return `false` to reject the change (works for programmatic selection too).
- **`SelectionChanged`**: called after the change. `change.Source` tells you whether it came from the `User`, `Programmatic` calls, a `PointRemoved`, or `DeclarationsCleared`.
- The selected ids are readable at any time via `session.SelectedIds`; `session.HoveredId` exposes the point currently under the mouse.
- `session.SetSelection(ids)` / `ClearSelection()` drive the selection from code (e.g. from a UI list).

## Dragging: Operations and Constraints {#dragging}

When points are selected, the manager positions an invisible **pivot** GameObject at the selection and hands it to the transform gizmo via your `GizmoAdapter`. Dragging the gizmo moves all selected points relative to their captured snapshot. What can be dragged, and how, is controlled by two flag sets:

| Option | Meaning |
| --- | --- |
| `SessionOptions.AllowedOperations` / `PointOptions.AllowedOperations` | Which gizmo modes are allowed: `Move`, `Rotate`, `Scale` (flags). The effective set is the intersection of session-level and point-level settings. |
| `PointOptions.WritableChannels` | Which pose channels are actually written back: `Position`, `Rotation`, `Scale`. E.g. a point that may only orbit but not change height: `AllowedOperations = Rotate`, `WritableChannels = Rotation`. |
| `SessionOptions.PivotMode` | `Center` (average of selected points) or `LastSelected` (pivot sits on the most recently selected point — good for bone hierarchies). |

Two callbacks bracket every drag:

```csharp
TransformStarted  = change => { /* change.Operation, change.PointIds */ },
TransformFinished = change => { if (change.Changed) MarkDirty(); },
```

`TransformFinished.Changed` is `false` when the user grabbed the gizmo but didn't actually move anything, which is handy for avoiding unnecessary keyframe/undo records.

## Drawing {#drawing}

`SessionOptions.CanvasFactory` is called once per frame with the active camera (from `CameraProvider`) and should return a `Canvas` — a thin wrapper over your line/circle drawing delegates.

The pattern below uses **ALINE** — remember to import the ALINE package into your SDK project first (see the warning at the top of this page), then add `using Drawing;`. The recommended pattern is to create a builder per frame, target the editing camera, and dispose the canvas back into it:

```csharp
CameraProvider = () => Context.PluginManager.GetPlugin<CorePlugin>().MainCamera,
CanvasFactory = camera => {
    var draw = DrawingManager.GetBuilder(true);
    draw.cameraTargets = new[] { camera };
    draw.PushDuration(0f);   // commands live for this frame only
    return new TemporaryControlPointManager.Canvas(
        (from, to, color, width) => {
            draw.PushLineWidth(width, false);
            try { draw.Line(from, to, color); } finally { draw.PopLineWidth(); }
        },
        (center, normal, radius, color) => draw.SolidCircle(center, normal, radius, color),
        () => {
            try { draw.PopDuration(); } finally { draw.Dispose(); } // called by the manager at end of frame
        }
    );
},
```

On the canvas you can call `Line`, `Polyline`, `Bezier` (quadratic and cubic), `DashedLine`, and `SolidCircle`. By default, points render as solid circles colored by state (normal / hovered / selected) and connections as straight lines; override either by passing a custom `Draw` callback in `PointOptions` / `ConnectionOptions`:

```csharp
Draw = context => {
    var color = context.Selected ? Color.orange : context.Hovered ? Color.yellow : Color.white;
    context.Canvas.SolidCircle(context.WorldPose.Position, context.Camera.transform.forward, 0.02f, color);
},
```

The draw context also gives you `PointerHeld` (useful for "brighten while dragging" effects) and, for connections, the world poses of both endpoints. Connections are drawn before points. Exceptions thrown in your callbacks are logged and do not break the frame.

## Pausing and Cancelling {#pausing}

- **`SessionOptions.Enabled`**: return `false` to pause all interaction and drawing while keeping the session (and its selection) intact — for example, while another modal is open.
- **`session.Dispose()`**: end your editing mode and restore state via the `Ended` hook.
- Other code can detect that you hold the channel with `manager.IsOwnedBy(someOwner)` and `manager.ActiveSession`.

## Complete Example {#example}

A self-contained plugin that edits a list of points on the ground: `Add Point` appends a handle, clicking and dragging them edits the data, and `TransformFinished` notifies you when anything actually changed. It reuses Warudo's own gizmo so the handles behave exactly like the built-in editors.

```csharp
using System.Collections.Generic;
using Drawing;                                    // ALINE — import the package into your SDK project first
using RuntimeGizmos;                              // The gizmo types used below
using UnityEngine;
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Plugins.Core;                        // CorePlugin, for the camera + gizmo
using TCPP = Warudo.Core.Utils.TemporaryControlPointManager;

[PluginType(Id = "com.example.pointeditor", Name = "Point Editor", Version = "1.0.0")]
public class PointEditorPlugin : Plugin {

    private TCPP.Session session;
    private readonly List<TCPP.Pose> points = new();

    private CorePlugin Core => Context.PluginManager.GetPlugin<CorePlugin>();

    [Trigger]
    public void AddPoint() {
        points.Add(new TCPP.Pose(new Vector3(points.Count * 0.5f - 1f, 0.05f, 0f)));
        RefreshPoints();
    }

    [Trigger]
    public void BeginEditing() {
        if (session is { IsActive: true }) return;
        session = Context.TemporaryControlPointManager.BeginSession(this, new TCPP.SessionOptions {
            Name = "Point Editor",
            AllowedOperations = TCPP.TransformOperations.Move,   // no rotate/scale handles
            CameraProvider = () => Core.MainCamera,
            CanvasFactory = CreateCanvas,
            Gizmo = CreateGizmoAdapter(),
            TransformFinished = change => {
                if (change.Changed) Debug.Log($"Points moved: {string.Join(", ", change.PointIds)}");
            },
            Ended = _ => session = null,
        });
        RefreshPoints();
    }

    [Trigger]
    public void EndEditing() => session?.Dispose();

    private void RefreshPoints() {
        if (session is not { IsActive: true }) return;
        session.ClearPoints();
        for (var i = 0; i < points.Count; i++) {
            var index = i; // capture for the delegates
            session.DeclarePoint(index,
                () => points[index],
                pose => points[index] = pose,
                new TCPP.PointOptions { Name = $"Point {i}" });
            if (i > 0) session.DeclareConnection($"seg-{i}", i - 1, i);
        }
    }

    // ---- Drawing: one ALINE builder per frame ----

    private TCPP.Canvas CreateCanvas(Camera camera) {
        var draw = DrawingManager.GetBuilder(true);
        draw.cameraTargets = new[] { camera };
        draw.PushDuration(0f);
        return new TCPP.Canvas(
            (from, to, color, width) => {
                draw.PushLineWidth(width, false);
                try { draw.Line(from, to, color); } finally { draw.PopLineWidth(); }
            },
            (center, normal, radius, color) => draw.SolidCircle(center, normal, radius, color),
            () => {
                try { draw.PopDuration(); } finally { draw.Dispose(); }
            });
    }

    // ---- Gizmo: hand the session's pivot to Warudo's scene gizmo ----

    private TCPP.GizmoAdapter CreateGizmoAdapter() {
        var transformGizmo = Core.TransformGizmo;
        return new TCPP.GizmoAdapter {
            Attach = (pivot, onPivotChanged) => transformGizmo.AddTarget(pivot, onPivotChanged, gizmo => {
                gizmo.maxUndoStored = 0;                    // the session owns the data, no gizmo undo
                gizmo.fromCamera = Core.MainCamera;
                gizmo.manuallyHandleGizmo = false;
                gizmo.transformType = Core.GizmoTransformType;
                gizmo.space = Core.GizmoTransformSpace;
            }),
            Detach = pivot => {
                if (pivot != null) transformGizmo.RemoveTarget(pivot);
            },
            IsTransforming = pivot => transformGizmo.GetInternalGizmo(pivot)?.isTransforming ?? false,
            GetOperation = pivot => {
                var gizmo = transformGizmo.GetInternalGizmo(pivot);
                var type = gizmo != null
                    ? (gizmo.isTransforming ? gizmo.transformingType : gizmo.transformType)
                    : Core.GizmoTransformType;
                return type switch {
                    TransformType.Move => TCPP.TransformOperation.Move,
                    TransformType.Rotate => TCPP.TransformOperation.Rotate,
                    TransformType.Scale => TCPP.TransformOperation.Scale,
                    _ => TCPP.TransformOperation.None,
                };
            },
            SetOperation = operation => Core.GizmoTransformType = operation switch {
                TCPP.TransformOperation.Move => TransformType.Move,
                TCPP.TransformOperation.Rotate => TransformType.Rotate,
                TCPP.TransformOperation.Scale => TransformType.Scale,
                _ => Core.GizmoTransformType,
            },
            GetCoordinateSpace = pivot => {
                var gizmo = transformGizmo.GetInternalGizmo(pivot);
                var space = gizmo != null ? gizmo.GetProperTransformSpace() : Core.GizmoTransformSpace;
                return space == TransformSpace.Global
                    ? TCPP.TransformCoordinateSpace.Global
                    : TCPP.TransformCoordinateSpace.Local;
            },
        };
    }
}
```

:::info
While your session is active, the gizmo follows the user's global Move/Rotate/Scale and camera settings, just like in the built-in editors. To keep the user from selecting scene objects at the same time, consider hiding the normal selection gizmo or gating your mode behind your own toggle — see `SessionOptions.Enabled`.
:::

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [],
}} />
