# my\_animated\_text Example Project

This example project demonstrates all the animated text widgets from the **my\_animated\_text** Flutter package.

<img src="../display/animated_text_demo.gif" alt="Animated text effects demo" width="640" />

The runnable example also includes an `AnimatedTextCarousel` demo with timed
phrase changes, pause-on-hover behavior, and previous/next controls.

---

## 📦 Features

This example showcases all text animations included in the package:

* **SlideText**: Slides text from left or right.
* **TypewriterText**: Reveals text character by character.
* **WaveMotionText**: Creates wave motion for each character.
* **WavingGradientText**: Gradient text with waving animation.
* **ShimmerText**: Shimmer/shine effects on text.
* **FadeText**: Fading in and out.
* **ScaleText**: Scaling up and down.
* **RotationText**: Rotates back and forth.
* **MarqueeText**: Scrolling text horizontally.
* **FallingText**: Characters falling into place.
* **ColorizedText**: Cycling through multiple colors.
* **AnimatedTextCarousel**: Rotates short phrases with animated transitions.
* **ScrambleText**: Reveals text through changing symbols in a chosen order.

---

## 🔧 Getting Started

1. Clone this repository:

```bash
git clone https://github.com/tz-thantzin/my_animated_text.git
cd my_animated_text/example
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the example:

```bash
flutter run
```

To open the focused scramble reveal preview shown in the package README:

```bash
flutter run -t lib/scramble_demo.dart
```

The README's individual GIF previews come from `lib/effect_preview.dart`.
Run it in Chrome and change the `effect` query parameter to a preview name such
as `slide`, `scramble`, `multi`, or `carousel`:

```bash
flutter run -d chrome -t lib/effect_preview.dart
```

---

## 🧪 Example Usage

### ScrambleText

```dart
ScrambleText(
  'MAKE EVERY WORD COUNT',
  reveal: ScrambleReveal.random,
  seed: 17,
  mode: AnimatedTextMode.loop,
)
```

### AnimatedTextCarousel

```dart
AnimatedTextCarousel(
  phrases: const ['Create with motion', 'Keep messages clear'],
  interval: Duration(seconds: 2),
  transitionDuration: Duration(milliseconds: 400),
  direction: Axis.vertical,
  pauseOnHover: true,
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### SlideText

```dart
SlideText('Hello Slide!', style: TextStyle(fontSize: 24));
```

### TypewriterText

```dart
TypewriterText('Typing...', style: TextStyle(fontSize: 24));
```

### WaveMotionText

```dart
WaveMotionText('Wave Motion', style: TextStyle(fontSize: 24));
```

### WavingGradientText

```dart
WavingGradientText('Gradient Wave', style: TextStyle(fontSize: 24));
```

### ShimmerText

```dart
ShimmerText('Shimmer', style: TextStyle(fontSize: 24));
```

### FadeText

```dart
FadeText('Fade In', style: TextStyle(fontSize: 24));
```

### ScaleText

```dart
ScaleText('Scale', style: TextStyle(fontSize: 24));
```

### RotationText

```dart
RotationText('Rotate', style: TextStyle(fontSize: 24));
```

### MarqueeText

```dart
MarqueeText('Scrolling Marquee', style: TextStyle(fontSize: 24));
```

### FallingText

```dart
FallingText('Falling', style: TextStyle(fontSize: 24));
```

### ColorizedText

```dart
ColorizedText('Colorful!', style: TextStyle(fontSize: 24));
```

---

## 🌐 Links

* GitHub Home: [https://github.com/tz-thantzin](https://github.com/tz-thantzin)
* Repository: [https://github.com/tz-thantzin/my\_animated\_text](https://github.com/tz-thantzin/my_animated_text)

---

## License

MIT License. See the LICENSE file for details.
