---
sidebar_position: 140
---

# 临时控制点 (Temporary Control Points) {#control-points}

临时控制点就是编辑某些资产时出现在场景里的小拖拽手柄——例如[角色 (Character)](../../assets/character) Key Motion 编辑中的骨骼控制点。其背后的系统 `Context.TemporaryControlPointManager` 同样开放给你的插件和资产使用：你声明一组短期存在的场景控制点，管理器负责点选、多选以及通过变换 Gizmo 拖拽它们，并把结果通过你提供的回调写回。

典型使用场景：编辑曲线/路径、摆放装饰物、调整骨骼姿态，或任何"在视口里拖几个手柄来编辑数值"的工作流。

:::info
管理器本身不了解绘制和 Gizmo——两者通过 `CanvasFactory` 和 `GizmoAdapter` 两个钩子注入。下面的[完整示例](#example)直接复用了 Warudo 自带的两样东西：**ALINE** 画线库与场景变换 Gizmo，因此你不需要从零实现。
:::

:::warning
ALINE 虽然内置于 Warudo，但**默认并不被 Mod 脚本引用**。要使用它，请在你的 Mod SDK 工程中导入 ALINE 包（与《创建你的第一个插件 Mod》教程中导入粒子资源包的方式相同）；运行时你的脚本会自动链接到 Warudo 自带的 ALINE，Mod 发布时无需额外分发任何东西。
:::

## 单会话模型 {#session}

同一时刻只有**一个活跃会话（Session）**。新会话会顶掉之前的会话——这避免了两个编辑模式争抢视口和 Gizmo。

```csharp
var manager = Context.TemporaryControlPointManager;
if (!manager.IsOwnedBy(this)) {
    var session = manager.BeginSession(this, new TemporaryControlPointManager.SessionOptions {
        Name = "My Handles",
        // ……见下文
    });
}
```

- **`BeginSession(object owner, SessionOptions options)`**：结束旧会话并返回新会话。`owner` 通常传入创建会话的实体（`this`）；如果 owner 是 Unity 对象且被销毁（例如资产被删除），会话会自动释放。
- **`session.IsActive`**：当新会话开启、场景关闭/切换、或你调用 `session.Dispose()` 后，会话失效。使用缓存的会话前务必检查此属性。
- **`SessionOptions.Ended`**：会话因任何原因结束时调用，用来恢复编辑模式修改过的外部状态。
- 加载场景时会自动调用 `Reset()`；管理器**每帧在所有插件与资产之后自动更新**——这些都无需你手动调用。

:::tip
在 `Ended` 回调中调用 `BeginSession` 会抛出异常。如果确实需要立刻重新接管会话，请放到 `OnUpdate()` 中执行。
:::

## 声明点与连线 {#declaring}

一个**点（Point）**是绑定了姿态（Pose：位置 + 旋转 + 缩放）的控制手柄。点本身不存储数据，而是通过你提供的委托读写 Pose，因此底层数据可以是 `Transform`、`List<Pose>` 的元素、序列化数组——任何形态：

```csharp
session.DeclarePoint(
    id: i,                                        // 任意唯一对象：int、string、枚举、元组……
    poseGetter: () => MyPoints[i],                // 读取当前姿态（VirtualRoot 的局部空间）
    poseSetter: pose => MyPoints[i] = pose,       // 不传则为只读点（不可拖拽）
    options: new TemporaryControlPointManager.PointOptions {
        Name = $"Point {i}",
        Style = new TemporaryControlPointManager.PointStyle {
            Color = Color.cyan,
            Radius = 0.02f,                       // 绘制实心圆的世界半径
            HitRadius = 24f,                      // 鼠标拾取的屏幕像素半径
        },
    });

// 可选：在两个点之间画线（例如路径线段）
session.DeclareConnection("seg-0", fromId: 0, toId: 1);
```

用相同 `id` 再次 `DeclarePoint` 会**原位更新**该点（替换委托与 options），因此每帧或数据变化时全量刷新很方便。其余方法：`RemovePoint(id)`（会级联删除挂在它上面的连线）、`ClearPoints()`，以及连线对应的 `DeclareConnection` / `RemoveConnection` / `ClearConnections`。

:::tip
没有 `poseSetter` 的点依然会绘制、可悬停，但不可拖拽，也不为选择集贡献可执行操作。适合用作"仅参考"的标记点。
:::

## 选择 {#selecting}

默认使用鼠标左键：点击点即选中，Shift 点击加选/减选，点击空白清空选择（取决于 `AllowEmptySelection`）。只有按下与抬起之间指针移动不超过 `ClickMovementThreshold` 像素才算"点击"，因此不影响拖镜头等相机操作。

通过 `SessionOptions` 中的两个钩子获得通知：

```csharp
SelectionChanging = change => change.Current.Count <= 1,  // 否决：强制单选
SelectionChanged  = change => Debug.Log($"当前选中：{string.Join(", ", change.Current)}"),
```

- **`SelectionChanging`**：选择变更前调用，返回 `false` 可否决本次变更（对程序化选择同样生效）。
- **`SelectionChanged`**：变更后调用。`change.Source` 标明来源：`User`（用户操作）、`Programmatic`（代码调用）、`PointRemoved`（点被移除）或 `DeclarationsCleared`（清空声明）。
- 任何时候可通过 `session.SelectedIds` 读取当前选中的 id，`session.HoveredId` 是鼠标悬停中的点。
- `session.SetSelection(ids)` / `ClearSelection()` 供代码驱动选择（例如配合 UI 列表）。

## 拖拽：操作与约束 {#dragging}

有点被选中时，管理器会在选择集上定位一个隐藏的**枢轴（Pivot）**GameObject，并通过你的 `GizmoAdapter` 交给变换 Gizmo。拖拽 Gizmo 时，所有选中的点基于拖拽开始时的快照施加增量。允许哪些拖拽方式由两组标志控制：

| 选项 | 含义 |
| --- | --- |
| `SessionOptions.AllowedOperations` / `PointOptions.AllowedOperations` | 允许的 Gizmo 模式：`Move`、`Rotate`、`Scale`（可组合）。实际生效的是会话级与点级的交集。 |
| `PointOptions.WritableChannels` | 实际写回的姿态通道：`Position`、`Rotation`、`Scale`。例如"只能绕枢轴旋转、不能改变高度"的点：`AllowedOperations = Rotate`、`WritableChannels = Rotation`。 |
| `SessionOptions.PivotMode` | `Center`（所选点的平均位置）或 `LastSelected`（枢轴落在最后选中的点上，适合骨骼层级）。 |

每次拖拽前后有两个回调：

```csharp
TransformStarted  = change => { /* change.Operation、change.PointIds */ },
TransformFinished = change => { if (change.Changed) MarkDirty(); },
```

当用户抓住 Gizmo 但实际没动任何值时，`TransformFinished.Changed` 为 `false`——可用来避免记录无效的撤销/关键帧。

## 绘制 {#drawing}

`SessionOptions.CanvasFactory` 每帧被调用一次，参数是 `CameraProvider` 返回的相机，应返回一个 `Canvas`——它是对你的画线/画圆委托的轻量封装。

下面的写法使用 **ALINE**——请先在 Mod SDK 工程中导入 ALINE 包（见本页开头的警告），然后 `using Drawing;` 即可。推荐的模式是每帧创建一个 builder、指定目标相机，并在画布释放时一并销毁：

```csharp
CameraProvider = () => Context.PluginManager.GetPlugin<CorePlugin>().MainCamera,
CanvasFactory = camera => {
    var draw = DrawingManager.GetBuilder(true);
    draw.cameraTargets = new[] { camera };
    draw.PushDuration(0f);   // 绘制指令仅存活本帧
    return new TemporaryControlPointManager.Canvas(
        (from, to, color, width) => {
            draw.PushLineWidth(width, false);
            try { draw.Line(from, to, color); } finally { draw.PopLineWidth(); }
        },
        (center, normal, radius, color) => draw.SolidCircle(center, normal, radius, color),
        () => {
            try { draw.PopDuration(); } finally { draw.Dispose(); } // 由管理器在帧末调用
        }
    );
},
```

画布上可用 `Line`、`Polyline`、`Bezier`（二次/三次）、`DashedLine`、`SolidCircle`。默认情况下，点绘制为按状态（普通/悬停/选中）变色的实心圆，连线为直线；也可以在 `PointOptions` / `ConnectionOptions` 中传入自定义 `Draw` 回调接管绘制：

```csharp
Draw = context => {
    var color = context.Selected ? Color.orange : context.Hovered ? Color.yellow : Color.white;
    context.Canvas.SolidCircle(context.WorldPose.Position, context.Camera.transform.forward, 0.02f, color);
},
```

绘制上下文还提供 `PointerHeld`（适合"拖拽时高亮"效果），连线的上下文则包含两端点的世界姿态。绘制顺序为先全部连线、后全部点。回调中抛出的异常会被记录日志，不会中断本帧绘制。

## 暂停与取消 {#pausing}

- **`SessionOptions.Enabled`**：返回 `false` 可暂停全部交互与绘制但保留会话（及选择状态），例如另一个模态编辑打开期间。
- **`session.Dispose()`**：结束编辑模式，`Ended` 钩子负责恢复状态。
- 其他代码可用 `manager.IsOwnedBy(someOwner)` 与 `manager.ActiveSession` 判断会话通道是否被占用。

## 完整示例 {#example}

下面是一个自包含的插件：编辑地面上的一组点。`AddPoint` 追加手柄，点击并拖拽即可修改数据，`TransformFinished` 会在真正发生改动时通知你。它复用 Warudo 自己的 Gizmo，手柄手感与内置编辑器完全一致。

```csharp
using System.Collections.Generic;
using Drawing;                                    // ALINE：需先在 SDK 工程中导入该包
using RuntimeGizmos;                              // 下面用到的 Gizmo 类型
using UnityEngine;
using Warudo.Core;
using Warudo.Core.Attributes;
using Warudo.Core.Plugins;
using Warudo.Plugins.Core;                        // CorePlugin：相机 + Gizmo
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
            AllowedOperations = TCPP.TransformOperations.Move,   // 不需要旋转/缩放手柄
            CameraProvider = () => Core.MainCamera,
            CanvasFactory = CreateCanvas,
            Gizmo = CreateGizmoAdapter(),
            TransformFinished = change => {
                if (change.Changed) Debug.Log($"点被移动：{string.Join(", ", change.PointIds)}");
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
            var index = i; // 为委托捕获循环变量
            session.DeclarePoint(index,
                () => points[index],
                pose => points[index] = pose,
                new TCPP.PointOptions { Name = $"Point {i}" });
            if (i > 0) session.DeclareConnection($"seg-{i}", i - 1, i);
        }
    }

    // ---- 绘制：每帧一个 ALINE builder ----

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

    // ---- Gizmo：把会话的枢轴交给 Warudo 的场景 Gizmo ----

    private TCPP.GizmoAdapter CreateGizmoAdapter() {
        var transformGizmo = Core.TransformGizmo;
        return new TCPP.GizmoAdapter {
            Attach = (pivot, onPivotChanged) => transformGizmo.AddTarget(pivot, onPivotChanged, gizmo => {
                gizmo.maxUndoStored = 0;                    // 数据由会话管理，关闭 Gizmo 自带撤销
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
会话活跃期间，Gizmo 会跟随用户全局的 Move/Rotate/Scale 与相机设置，与内置编辑器行为一致。若不想让用户同时选中场景物体，可以隐藏常规选择 Gizmo，或用自己的开关配合 `SessionOptions.Enabled` 来控制模式。
:::

<AuthorBar authors={{
  creators: [
    {name: 'LiYin', github: 'cubesky'}
  ],
  translators: [],
}} />