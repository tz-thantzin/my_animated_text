# my_animated_text
[![pub package](https://img.shields.io/pub/v/my_animated_text.svg)](https://pub.dev/packages/my_animated_text) &nbsp;
[![GitHub stars](https://img.shields.io/github/stars/tz-thantzin/my_animated_text.svg?style=flat&logo=github&colorB=deeppink)](https://github.com/tz-thantzin/my_animated_text/stargazers) &nbsp;
[![GitHub license](https://img.shields.io/github/license/tz-thantzin/my_animated_text)](https://github.com/tz-thantzin/my_animated_text/blob/main/LICENSE) &nbsp;
[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-donate-yellow.svg)](https://buymeacoffee.com/devthantziq)

<img src="display/previews/multi.gif" alt="Several text effects composed into one animation" width="800" />

The preview above combines effects. The gallery below shows each animation
separately. The [original full showcase GIF](display/animated_text_demo.gif)
is also available.

✨ A Flutter package offering a collection of customizable animated text widgets to enhance your app's UI with engaging text animations.

---

## 📦 Features

* **SlideText**: Slides text in from left to right or right to left.
* **TypewriterText**: Simulates a typewriter effect, revealing text character by character.
* **WaveMotionText**: Applies a sinusoidal wave motion to each character.
* **WavingGradientText**: Applies a waving gradient effect to the text.
* **ShimmerText**: Creates a shimmer shine effect.
* **FadeText**: Fades text in/out.
* **ScaleText**: Scales text up and down.
* **RotationText**: Rotates text back and forth.
* **MarqueeText**: Moves text horizontally like a marquee.
* **FallingText**: Makes each character fall into place.
* **ColorizedText**: Animates text through multiple colors.
* **BouncingText**: Animates each character with a bouncing effect.
* **ShadowText**: Animates text shadows.
* **BlurText**: Brings text into focus with an animated blur.
* **FlipText**: Adds a 3D-style flip reveal on the X or Y axis.
* **ShakeText**: Adds a damped shake for alerts and attention states.
* **ScrambleText / .scramble()**: Decodes text through changing symbols with a configurable reveal order.
* **CirclingText**: Animates text in a circular path.
* **MultiAnimatedText**: Combine multiple effects for a single text widget (e.g., Falling + Colorized).
* **AnimateText / String.animate()**: Chain effects with a fluent API and predictable timing windows.
* **AnimatedTextCarousel**: Rotate between phrases with a timed, animated transition or manual controls.

---
### Effect previews

These GIFs were recorded from the Flutter [effect preview app](example/lib/effect_preview.dart). Each effect preview also represents its matching fluent method, such as `SlideText` and `.slide()`.

| Effect | Effect |
| --- | --- |
| **SlideText**<br><img src="display/previews/slide.gif" alt="SlideText sliding into view" width="360" /> | **TypewriterText**<br><img src="display/previews/typewriter.gif" alt="TypewriterText revealing letters" width="360" /> |
| **WaveMotionText**<br><img src="display/previews/wave_motion.gif" alt="WaveMotionText moving letters in a wave" width="360" /> | **WavingGradientText**<br><img src="display/previews/waving_gradient.gif" alt="WavingGradientText moving a gradient across text" width="360" /> |
| **ShimmerText**<br><img src="display/previews/shimmer.gif" alt="ShimmerText sweeping a highlight across text" width="360" /> | **FadeText**<br><img src="display/previews/fade.gif" alt="FadeText changing opacity" width="360" /> |
| **ScaleText**<br><img src="display/previews/scale.gif" alt="ScaleText growing in size" width="360" /> | **RotationText**<br><img src="display/previews/rotation.gif" alt="RotationText turning text" width="360" /> |
| **MarqueeText**<br><img src="display/previews/marquee.gif" alt="MarqueeText scrolling horizontally" width="360" /> | **FallingText**<br><img src="display/previews/falling.gif" alt="FallingText dropping letters into place" width="360" /> |
| **ColorizedText**<br><img src="display/previews/colorized.gif" alt="ColorizedText cycling through colors" width="360" /> | **BouncingText**<br><img src="display/previews/bouncing.gif" alt="BouncingText bouncing letters" width="360" /> |
| **ShadowText**<br><img src="display/previews/shadow.gif" alt="ShadowText animating a glow" width="360" /> | **BlurText**<br><img src="display/previews/blur.gif" alt="BlurText coming into focus" width="360" /> |
| **FlipText**<br><img src="display/previews/flip.gif" alt="FlipText flipping into view" width="360" /> | **ShakeText**<br><img src="display/previews/shake.gif" alt="ShakeText shaking horizontally" width="360" /> |
| **ScrambleText**<br><img src="display/previews/scramble.gif" alt="ScrambleText resolving changing symbols" width="360" /> | **CirclingText**<br><img src="display/previews/circling.gif" alt="CirclingText rotating letters in a circle" width="360" /> |
| **MultiAnimatedText**<br><img src="display/previews/multi.gif" alt="MultiAnimatedText combining several effects" width="360" /> | **AnimateText / String.animate()**<br><img src="display/previews/fluent.gif" alt="Fluent animation composing several effects" width="360" /> |
| **AnimatedTextCarousel**<br><img src="display/previews/carousel.gif" alt="AnimatedTextCarousel changing phrases" width="360" /> | |

---
### Attribute

| Property       | Type                     | Default                                | Description |
|----------------|--------------------------|----------------------------------------|-------------|
| `text`         | `String`                 | —                                      | The text content to animate |
| `duration`     | `Duration`               | `Duration(milliseconds: 2000)`        | Duration of the animation. Ignored if an external controller is provided |
| `style`        | `TextStyle?`             | `null`                                 | Optional text style |
| `mode`         | `AnimatedTextMode`       | `AnimatedTextMode.forward`            | Defines how the animation plays (forward, reverse, loop, etc.) |
| `autoStart`    | `bool`                   | `true`                                 | Automatically start animation on widget initialization |
| `controller`   | `AnimationController?`   | `null`                                 | Optional external AnimationController; if null, one is created internally |
| `onStarted`    | `VoidCallback?`          | `null`                                 | Callback triggered when the animation starts |
| `onCompleted`  | `VoidCallback?`          | `null`                                 | Callback triggered when the animation completes |
| `onRepeated`   | `VoidCallback?`          | `null`                                 | Callback triggered when the animation repeats (loop/reverse) |
---
## 📥 Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  my_animated_text: ^3.0.0
```

or run below in your terminal
 
```bash
 $ flutter pub add my_animated_text
```

Then, run:

```bash
 $ flutter pub get
```

---

## 🧪 Usage

Import the package:

```dart
import 'package:my_animated_text/my_animated_text.dart';
```

### AnimatedTextCarousel

Cycle through short messages automatically, pause while the pointer is over the
text, or advance manually. Keep the key in your widget's state so it stays
attached across rebuilds:

```dart
class PhraseCarousel extends StatefulWidget {
  const PhraseCarousel({super.key});

  @override
  State<PhraseCarousel> createState() => _PhraseCarouselState();
}

class _PhraseCarouselState extends State<PhraseCarousel> {
  final carouselKey = GlobalKey<AnimatedTextCarouselState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedTextCarousel(
          key: carouselKey,
          phrases: const [
            'Build with care',
            'Ship with confidence',
            'Keep exploring',
          ],
          interval: const Duration(seconds: 2),
          pauseOnHover: true,
          onChanged: (index) => debugPrint('Showing phrase $index'),
        ),
        IconButton(
          tooltip: 'Next phrase',
          onPressed: () => carouselKey.currentState?.next(),
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
```

`previous()` moves back and `show(index)` selects a phrase, wrapping the index
into range. Manual navigation starts a fresh interval before the next automatic
change. The example app shows both controls alongside the existing effect demos.

### Scramble reveal

<img src="display/scramble_reveal.gif" alt="Scramble text resolving into a headline" width="900" />

Use `ScrambleText` for a complete reveal, or `.scramble()` to add it to a fluent
timeline. The effect keeps whitespace in place and resolves Unicode grapheme
clusters together. `seed` makes the random order and replacement symbols
repeatable.

```dart
ScrambleText(
  'MAKE EVERY WORD COUNT',
  reveal: ScrambleReveal.random,
  seed: 17,
  cyclesPerSecond: 24,
  duration: const Duration(milliseconds: 2800),
  mode: AnimatedTextMode.loop,
  style: const TextStyle(fontFamily: 'monospace', fontSize: 24),
)
```

```dart
'Launch with clarity'
    .animate(duration: const Duration(seconds: 4))
    .scramble(
      reveal: ScrambleReveal.leftToRight,
      duration: const Duration(seconds: 2),
    );
```

In the fluent example, the resolved text stays visible for the remaining two
seconds of each loop. The focused preview used for the GIF is in
`example/lib/scramble_demo.dart`.

### Fluent multi-effect composition

```dart
'Launch faster'.animate(
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  duration: Duration(milliseconds: 2600),
)
    .blur(duration: Duration(milliseconds: 500), advanceCursor: false)
    .flip(duration: Duration(milliseconds: 700), advanceCursor: false)
    .shimmer(delay: Duration(milliseconds: 200), advanceCursor: false)
    .then(delay: Duration(milliseconds: 120))
    .shake(duration: Duration(milliseconds: 450));
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
  rotationDirection: RotationDirection.custom,
  rotationDegrees: 180, 
)
```

### CirclingText

```dart
CirclingText(
  'Circling Text Circling Text ',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  mode: AnimatedTextMode.loop,
  direction: CirclingDirection.clockwise,
  minLetterPadding: 2,
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

### BouncingText

```dart
BouncingText(
  'Bouncing Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
)
```

### ShadowText

```dart
ShadowText(
  'Shadow Text',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  mode: AnimatedTextMode.reverseLoop,
)
```

### MultiAnimatedText

```dart
MultiAnimatedText(
  'Falling & Colorized!',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  effects: [
    FallingEffect(begin: 0.0, end: 0.45),
    ColorizeEffect(
      colors: [Colors.red, Colors.yellow, Colors.blue],
      begin: 0.2,
      end: 1.0,
    ),
  ],
  mode: AnimatedTextMode.loop,
)
```

```dart
BouncingText(
  'Bounce Effect with Fade and Colorized!',
).withEffects([
  const FadeEffect(begin: 0.0, end: 0.35),
  ColorizeEffect(begin: 0.0, end: 1.0),
]);
```

### Fluent composition

```dart
'Hello Flutter'.animate(
  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  duration: const Duration(seconds: 3),
)
.fade(duration: const Duration(milliseconds: 400))
.scale(duration: const Duration(milliseconds: 500))
.then(delay: const Duration(milliseconds: 150))
.slide(direction: SlideDirection.bottomToTop)
.shimmer(advanceCursor: false);
```

Use `advanceCursor: false` when you want effects to overlap on the same portion of the timeline. You can also convert any existing `MultiAnimatedText` into the fluent API with `.compose()`.

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
