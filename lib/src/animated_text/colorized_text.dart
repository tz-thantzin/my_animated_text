import 'package:flutter/material.dart';

import '../../my_animated_text.dart';

/// Default set of colors used in [ColorizedText] animation
const defaultColorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

/// ## ColorizedText
///
/// A Flutter text animation widget that cycles through multiple colors,
/// giving a "colorized" or rainbow-like effects to the text.
///
/// This widget uses [MultiAnimatedText] and applies the [ColorizeEffect],
/// which animates the color of the text over time.
///
/// ### Example
/// ```dart
/// ColorizedText(
///   'Flutter',
///   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 4),
///   colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue],
/// )
/// ```
///
/// ### Features
/// - Animates the color of the text through a configurable list of colors.
/// - Looping animation mode supported (default).
/// - Compatible with [MultiAnimatedText] for combining with other text effects.
///
/// ### Parameters
/// - `text`: The string to animate.
/// - `style`: Optional [TextStyle] for font size, weight, etc.
/// - `duration`: Duration of one complete color cycle.
/// - `mode`: Animation mode: loop, forward, or reverse. Defaults to loop.
/// - `autoStart`: Automatically start animation if true.
/// - `controller`: Optional external [AnimationController] for custom control.
/// - `colors`: List of colors to cycle through. Defaults to `[Colors.purple, Colors.blue, Colors.yellow, Colors.red]`.

class ColorizedText extends MultiAnimatedText {
  ColorizedText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.mode = AnimatedTextMode.loop,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    List<Color> colors = defaultColorizeColors,
  }) : super(effects: [ColorizeEffect(colors: colors)]);
}
