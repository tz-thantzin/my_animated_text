import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget that animates its opacity (fade-in / fade-out).
///
/// The [FadeText] widget gradually changes the opacity of the text
/// between fully transparent and fully visible, depending on the
/// animation mode and duration.
///
/// Example:
/// ```dart
/// FadeText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class FadeText extends AnimatedTextBase {
  /// Creates a fade text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the fade animation.
  /// - [mode]: Animation mode (forward, reverse, or loop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  const FadeText(
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
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _FadeTextAnimation(
      controller: controller,
      text: text,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that builds and runs the fade animation for [FadeText].
class _FadeTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _FadeTextAnimation({
    required this.controller,
    required this.text,
    this.style,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_FadeTextAnimation> createState() => _FadeTextAnimationState();
}

class _FadeTextAnimationState extends State<_FadeTextAnimation> {
  @override
  Widget build(BuildContext context) {
    final animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(widget.controller);

    return FadeTransition(
      opacity: animation,
      child: Text(widget.text, style: widget.style),
    );
  }
}
