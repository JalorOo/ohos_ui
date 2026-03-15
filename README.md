# OhosUI 📱

**ohos_ui** 是一个致力于在 Flutter 中还原 HarmonyOS (OpenHarmony) 原生 UI 风格与交互体验的组件库。
> ⚠️ **注意**：目前项目处于早期开发阶段，仅实现了极少部分的 UI 特性与基础交互效果。

## ✨ 特性 (Features)
目前主要包含以下核心组件与效果：

### 1. 交互反馈 (Interaction)
- **HarmonyPressEffect**: 完美复刻鸿蒙系统的点击缩放反馈效果。
  - 👆 **真实触感**: 按下时组件平滑缩小，抬起时回弹。
  - ⚙️ **高度定制**: 支持自定义缩放比例 (pressedScale) 和动画时长 (duration)。
  - 
### 2. 基础组件 (Components)
- **HarmonyIconButton**: 遵循鸿蒙设计规范的圆形图标按钮。
  - 🎨 **原生样式**: 默认采用鸿蒙风格的灰色背景与尺寸。
  - 🖼️ **SVG 支持**: 内置 SVG 图标支持，清晰锐利。
  - 
## 📦 安装 (Installation)
在你的 pubspec.yaml 中添加依赖：
`yaml
dependencies:
  ohos_ui:
    git:
      url: https://github.com/JalorOo/ohos_ui.git
`
## 🚀 使用示例 (Usage)

### 实现点击缩放效果
为任意 Widget 添加鸿蒙风格的按压反馈：

```dart
import 'package:ohos_ui/effect.dart';

HarmonyPressEffect(
  pressedScale: 0.9, // 自定义按下时的缩放比例，默认为 0.85
  onTap: () {
    print("Tapped!");
  },
  child: Container(
    height: 50,
    width: 200,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text("点击我体验效果", style: TextStyle(color: Colors.white)),
  ),
);
```

### 使用圆形图标按钮
```dart
import 'package:ohos_ui/button/icon.dart';

HarmonyIconButton(
  iconName: "chevron_left", // 支持 'chevron_left', 'xmark' 等
  size: 24, // 图标大小
  onTap: () {
    Navigator.of(context).pop();
  },
);
```

## 🗓️ 开发计划 (Roadmap)
我们计划逐步实现以下内容：
- [ ] **基础组件**: Button, Toggle, Slider, Progress
- [ ] **布局**: List, Grid, Card (带鸿蒙阴影与圆角)
- [ ] **反馈**: Toast, Dialog, ActionSheet
- [ ] **导航**: NavigationBar, TabBar
- [ ] **动画**: 转场动画, 更加细腻的手势交互

## ❤️ 贡献 (Contribution)
非常欢迎提交 Issue 和 Pull Request 来帮助完善这个库。让我们一起把鸿蒙的精美 UI 带到 Flutter 鸿蒙社区！
