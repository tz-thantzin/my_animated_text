import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';
import 'package:my_animated_text/src/config/duration.dart';

/// Default shimmer gradient colors (light gray to white to light gray).
const defaultShimmerColors = [Colors.grey, Color(0xFFF4F4F4), Colors.grey];

/// A text widget that displays a shimmer (shining) animation.
///
/// The [ShimmerText] widget animates a moving gradient across the text,
/// giving the effects of a light reflection or shine.
///
/// Example:
/// ```dart
/// ShimmerText(
///   'Shiny Text',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 3),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
///
/// Features:
/// - Configurable shimmer colors (default is a gray-to-white gradient).
/// - Supports forward, reverse, and looping modes.
/// - Adjustable duration, text style, and auto-start option.
class ShimmerText extends MultiAnimatedText {
  /// Colors used for the shimmer gradient.
  ///
  /// By default, uses shades of gray and white.
  final List<Color> colors;

  /// Creates a shimmer text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [colors]: A list of [Color]s used for the shimmer effect. These colors will animate across the text to create a glowing, moving
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the shadow animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  /// - [effects]: Internal list of animation text effects applied to the text.
  ShimmerText(
    super.text, {
    super.key,
    this.colors = defaultShimmerColors,
    super.duration = duration3000,
    super.style,
    super.mode,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
  }) : super(effects: [ShimmerEffect(colors: colors)]);
}
