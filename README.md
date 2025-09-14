# my_animated_text

![Animated Text Demo](display/animated_text_demo.gif)

✨ A Flutter package offering a collection of customizable animated text widgets to enhance your app's UI with engaging text animations.

---

## 📦 Features

* **SlideText**: Slides text in from left to right or right to left.
* **TypewriterText**: Simulates a typewriter effect, revealing text character by character.
* **WaveMotionText**: Applies a sinusoidal wave motion to each character.
* **WavingGradientText**: Applies a waving gradient effect to the text.
* **ShimmerText**: Applies a shimmer shine effect to the text.
* **FadeText**: Fades text in/out.
* **ScaleText**: Scales text up and down.
* **RotationText**: Rotates text back and forth.
* **MarqueeText**: Moves text horizontally like a marquee.
* **FallingText**: Makes each character fall into place.
* **ColorizedText**: Animates text through multiple colors.

---

## 📥 Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  my_animated_tex: ^0.0.1
```

or 

```bash
 $ flutter pub add my_animated_text
```

Then, run:

```bash
flutter pub get
```

---

## 🧪 Usage

Import the package:

```dart
import 'package:my_animated_text/my_animated_text.dart';
```

### SlideText

```dart
SlideText(
  'Hello, World!',
  direction: SlideDirection.leftToRight,
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### TypewriterText

```dart
TypewriterText(
  'Hello, World!',
  duration: Duration(seconds: 5),
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### WaveMotionText

```dart
WaveMotionText(
  'Hello, World!',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### WavingGradientText

```dart
WavingGradientText(
  'Hello, World!',
  colors: [Colors.red, Colors.blue, Colors.green],
  direction: WavingDirection.leftToRight,
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### ShimmerText

```dart
ShimmerText(
  'Shimmering Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### FadeText

```dart
FadeText(
  'Fading Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### ScaleText

```dart
ScaleText(
  'Scaling Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### RotationText

```dart
RotationText(
  'Rotating Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### MarqueeText

```dart
MarqueeText(
  'Scrolling Text',
  speed: 50,
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### FallingText

```dart
FallingText(
  'Falling Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### ColorizedText

```dart
ColorizedText(
  'Colorful Text',
  colors: [Colors.red, Colors.yellow, Colors.blue],
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

---

## 📄 Example Project

For a complete example demonstrating all animated text widgets, check out the [example](example/) directory in this repository.

---

## 🔧 Development

To contribute or run the example locally:

1. Clone the repository:

```bash
git clone https://github.com/tz-thantzin/my_animated_text.git
cd my_animated_text
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the example:

```bash
flutter run
```

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📣 Acknowledgments

* Inspired by various Flutter animation libraries.
* Special thanks to the Flutter community for their continuous support.

---

## 🌐 Links

* GitHub Home: [https://github.com/tz-thantzin](https://github.com/tz-thantzin)
* Repository: [https://github.com/tz-thantzin/my\_animated\_text](https://github.com/tz-thantzin/my_animated_text)

Copyright (©️) 2025 __Thant Zin__