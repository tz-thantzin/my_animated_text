import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget that animates by scaling (growing and shrinking).
///
/// The [ScaleText] widget applies a scaling effect to the given text
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
class ScaleText extends AnimatedTextBase {
  /// Creates a scale text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the scale animation.
  /// - [mode]: The animation mode (forward, reverse, or loop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if needed.
  /// - [onStarted], [onCompleted], [onRepeated]: Animation callbacks.
  const ScaleText(
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
    return _ScaleTextAnimation(
      controller: controller,
      text: text,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that handles the scaling effect for [ScaleText].
class _ScaleTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _ScaleTextAnimation({
    required this.controller,
    required this.text,
    this.style,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_ScaleTextAnimation> createState() => _ScaleTextAnimationState();
}

class _ScaleTextAnimationState extends State<_ScaleTextAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Define the scaling animation between 0.2x and 1.2x the original size
    _animation = Tween(begin: 0.2, end: 1.2).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
    );

    if (widget.autoStart) {
      _startAnimation();
    }
  }

  /// Starts the scaling animation depending on the [AnimatedTextMode].
  void _startAnimation() {
    switch (widget.mode) {
      case AnimatedTextMode.forward:
        widget.controller.forward();
        break;
      case AnimatedTextMode.reverse:
        widget.controller.reverse();
        break;
      case AnimatedTextMode.loop:
        widget.controller.repeat(reverse: true);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Text(widget.text, style: widget.style),
    );
  }
}
