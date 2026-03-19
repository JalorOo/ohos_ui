# OhosUI 📱

[中文](README_CN.md)

**ohos_ui** is a component library dedicated to recreating the native UI style and interaction experience of HarmonyOS (OpenHarmony) in Flutter.

> ⚠️ **Note**: The project is currently in an early development stage, and only a very small subset of UI features and basic interaction effects have been implemented.

## ✨ Features

Currently, it mainly includes the following core components and effects:

### 1. Interaction

* **HarmonyPressEffect**: Perfectly replicates the tap-and-scale feedback effect of HarmonyOS.

  * 👆 **Realistic feedback**: The widget smoothly scales down when pressed and rebounds when released.
  * ⚙️ **Highly customizable**: Supports custom scale ratio (`pressedScale`) and animation duration (`duration`).

### 2. Components

* **HarmonyIconButton**: A circular icon button that follows HarmonyOS design guidelines.

  * 🎨 **Native style**: Uses Harmony-style gray background and default sizing.
  * 🖼️ **SVG support**: Built-in SVG icon support for sharp and crisp visuals.

## 📦 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  ohos_ui:
    git:
      url: https://github.com/JalorOo/ohos_ui.git
```

## 🚀 Usage

### Add tap scale effect

Add Harmony-style press feedback to any widget:

```dart
import 'package:ohos_ui/effect.dart';

HarmonyPressEffect(
  pressedScale: 0.9, // Custom scale when pressed, default is 0.85
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
    child: Text("Tap me to try the effect", style: TextStyle(color: Colors.white)),
  ),
);
```

### Use circular icon button

```dart
import 'package:ohos_ui/button/icon.dart';

HarmonyIconButton(
  iconName: "chevron_left", // Supports 'chevron_left', 'xmark', etc.
  size: 24, // Icon size
  onTap: () {
    Navigator.of(context).pop();
  },
);
```

## 🗓️ Roadmap

We plan to gradually implement the following:

* [ ] **Core components**: Button, Toggle, Slider, Progress
* [ ] **Layout**: List, Grid, Card (with Harmony-style shadows and rounded corners)
* [ ] **Feedback**: Toast, Dialog, ActionSheet
* [ ] **Navigation**: NavigationBar, TabBar
* [ ] **Animation**: Page transitions and more refined gesture interactions

## ❤️ Contribution

Contributions are very welcome! Feel free to submit Issues and Pull Requests to help improve this library. Let’s bring the elegant HarmonyOS UI to the Flutter community together!