import 'package:flutter/material.dart';

import '../my_animated_text.dart';

///
/// The [ScaleText] widget applies a scaling effects to the given text
/// using a [Tween] that interpolates between 0.2 and 1.2 of its size.
///
/// Example:
/// ```dart
/// ScaleText(
///   'Zooming Text!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
///
/// Features:
/// - Smooth zoom-in and zoom-out animation.
/// - Supports forward, reverse, and looping animation modes.
/// - Customizable duration, style, and animation control.

class ScaleText extends MultiAnimatedText {
  final double beginScale;
  final double endScale;

  /// Creates a zooming text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the shadow animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  /// - [beginScale]: The initial scale factor for the text at the start of the animation.
  /// - [endScale]: The final scale factor for the text at the peak of the animation.
  /// - [effects]: Internal list of animation text effects applied to the text.
  ScaleText(
    super.text, {
    super.key,
    super.duration,
    super.style,
    super.mode,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    this.beginScale = 0.2,
    this.endScale = 1.1,
  }) : super(
         effects: [ScaleEffect(beginScale: beginScale, endScale: endScale)],
       );
}
