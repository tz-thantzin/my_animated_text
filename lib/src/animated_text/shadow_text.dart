import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

/// A text widget that animates its shadow (pulsing / waving effects).
///
/// The [ShadowText] widget gradually animates the text shadow's blur and offset,
/// creating a dynamic glowing or waving shadow effects.
///
/// Example:
/// ```dart
/// ShadowText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class ShadowText extends MultiAnimatedText {
  /// Creates a shadow text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the shadow animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  /// - [effects]: Internal list of animation text effects applied to the text.
  ShadowText(
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
  }) : super(effects: [ShadowEffect()]);
}
