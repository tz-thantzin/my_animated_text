import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget that animates with a subtle rotation back and forth.
///
/// The [RotationText] widget rotates the given text around its center
/// using a tweened angle. By default, it rotates between `-0.1` and `0.1` radians,
/// creating a smooth swinging effect.
///
/// Example:
/// ```dart
/// RotationText(
///   'Swinging Text!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
///
/// Features:
/// - Smooth rotation using [Curves.easeInOut].
/// - Supports forward, reverse, and looping animation modes.
/// - Customizable duration, style, and animation control.
class RotationText extends AnimatedTextBase {
  /// Creates a rotation text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the rotation animation.
  /// - [mode]: The animation mode (forward, reverse, or loop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if needed.
  /// - [onStarted], [onCompleted], [onRepeated]: Animation callbacks.
  const RotationText(
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
    return _RotationTextAnimation(
      controller: controller,
      text: text,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that handles the rotation effect for [RotationText].
class _RotationTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _RotationTextAnimation({
    required this.controller,
    required this.text,
    this.style,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_RotationTextAnimation> createState() => _RotationTextAnimationState();
}

class _RotationTextAnimationState extends State<_RotationTextAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    // Define the back-and-forth rotation between -0.1 and 0.1 radians
    _rotation = Tween(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
    );

    if (widget.autoStart) {
      _startAnimation();
    }
  }

  /// Starts the rotation animation depending on the [AnimatedTextMode].
  void _startAnimation() {
    switch (widget.mode) {
      case AnimatedTextMode.forward:
        widget.controller.forward();
        break;
      case AnimatedTextMode.reverse:
        widget.controller.reverse();
        break;
      case AnimatedTextMode.loop:
        widget.controller.repeat();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotation.value,
          child: Text(widget.text, style: widget.style),
        );
      },
    );
  }
}
