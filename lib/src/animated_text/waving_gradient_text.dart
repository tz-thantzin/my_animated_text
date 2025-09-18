import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

/// Direction in which the gradient waves across the text.
enum WavingDirection { leftToRight, rightToLeft }

/// Default gradient colors for the waving text animation.
const defaultWavingColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

/// A text widget that animates a waving gradient across the text.
///
/// Example:
/// ```dart
/// WavingGradientText(
///   'Flutter Rocks!',
///   colors: [Colors.purple, Colors.blue, Colors.yellow, Colors.red],
///   direction: WavingDirection.leftToRight,
///   duration: Duration(seconds: 3),
///   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class WavingGradientText extends MultiAnimatedText {
  final List<Color> colors;
  final WavingDirection direction;

  /// Creates a shimmer text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [colors]: A list of [Color]s used for the waving effect.
  /// - [direction]: Direction of animated from
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the shadow animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  /// - [effects]: Internal list of animation text effects applied to the text.
  WavingGradientText(
    super.text, {
    super.key,
    super.style,
    this.direction = WavingDirection.leftToRight,
    this.colors = defaultWavingColors,
    super.duration,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.mode,
  }) : super(
         effects: [WaveGradientEffect(direction: direction, colors: colors)],
       );
}
