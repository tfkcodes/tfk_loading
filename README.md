# TfkLoading

A Flutter package for displaying customizable loading overlays with various animations

## Features

- Show custom widgets (Lottie, GIF, or any widget) as loading indicators.
- Support for different loading animation types (e.g., fade, scale).
- Positioning the overlay (center, top, bottom, etc.).
- Customizable background color, opacity, and dismissible functionality.

## Getting Started

### 1. Add to `pubspec.yaml`:

```yaml
dependencies:
  tfk_loading: ^1.0.0
```

### 2 . Install :

flutter pub get

```yaml
flutter pub get:
```

### 3. Initialize navigator key:

```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>()
```

## Getting Started

### 1. Show loading

```dart
    TfkLoading().show(
    child: Icon(Icons.hourglass_bottom, color: Colors.white, size: 80),
    backgroundColor: Colors.black54,
    );
```

### 2 .Hide Loading

```dart
TfkLoading().hide();
```

# TfkLoading Argumentss

| **Argument**      | **Type**          | **Description**                                                                 |
| ----------------- | ----------------- | ------------------------------------------------------------------------------- |
| `child`           | `Widget`          | The widget to be shown as the loading indicator (e.g., Icon, Lottie animation). |
| `lottie`          | `String`          | Path to a Lottie animation file to be displayed during loading.                 |
| `backgroundColor` | `Color`           | The background color of the overlay.                                            |
| `opacity`         | `double`          | The opacity level of the background color (0.0 to 1.0).                         |
| `position`        | `LoadingPosition` | Defines the position of the loading overlay (e.g., center, top, bottom).        |
| `width`           | `double`          | Width of the loading indicator (if using a custom widget).                      |
| `height`          | `double`          | Height of the loading indicator (if using a custom widget).                     |
| `loadingText`     | `String`          | The text to display next to the loading indicator.                              |
| `textStyle`       | `TextStyle`       | Style to apply to the `loadingText`.                                            |
| `isDismissible`   | `bool`            | Whether the loading overlay can be dismissed by tapping (defaults to `false`).  |

## Usage Example

```dart
TfkLoading().show(
  lottie: 'assets/loading.json',
  backgroundColor: Colors.black54,
  opacity: 0.8,
  position: LoadingPosition.center,
  width: 150,
  height: 150,
  loadingText: 'Loading...',
  textStyle: TextStyle(color: Colors.white),
  isDismissible: true,
);
```
