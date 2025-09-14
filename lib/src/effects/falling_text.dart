import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget where each character "falls" into place from above.
///
/// The [FallingText] widget animates each character of the string independently,
/// creating a falling effect with a bounce when they land.
///
/// Example:
/// ```dart
/// FallingText(
///   'Bounce In!',
///   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   fallHeight: 40.0,
///   mode: AnimatedTextMode.forward,
/// )
/// ```
class FallingText extends AnimatedTextBase {
  /// The vertical distance each character falls from before landing.
  ///
  /// Defaults to `30.0`.
  final double fallHeight;

  /// Creates a falling text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [fallHeight]: The starting vertical offset for each character.
  /// - [style]: The text style.
  /// - [duration]: Duration of the overall animation.
  /// - [mode]: The animation mode (forward, reverse, or loop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Optional custom [AnimationController].
  /// - [onStarted], [onCompleted], [onRepeated]: Animation lifecycle callbacks.
  const FallingText(
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
    this.fallHeight = 30.0, // The height from which the text falls
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _FallingTextAnimation(
      controller: controller,
      text: text,
      style: style,
      fallHeight: fallHeight,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that builds and runs the falling animation for [FallingText].
class _FallingTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double fallHeight;
  final AnimationController controller;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _FallingTextAnimation({
    required this.text,
    this.style,
    required this.fallHeight,
    required this.controller,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_FallingTextAnimation> createState() => _FallingTextAnimationState();
}

class _FallingTextAnimationState extends State<_FallingTextAnimation> {
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    // Create individual animations for each character in the text,
    // staggering them with intervals for a sequential falling effect.
    _animations = List.generate(widget.text.length, (index) {
      final double start = index / widget.text.length;
      final double end = (index + 1) / widget.text.length;
      return Tween<double>(begin: -widget.fallHeight, end: 0.0).animate(
        CurvedAnimation(
          parent: widget.controller,
          curve: Interval(start, end, curve: Curves.bounceOut),
        ),
      );
    });

    if (widget.autoStart) {
      _startAnimation();
    }
  }

  /// Starts the animation based on the selected [AnimatedTextMode].
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
      animation: widget.controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.text.length, (index) {
            final character = widget.text[index];
            final animation = _animations[index];
            return Transform.translate(
              offset: Offset(0, animation.value),
              child: Text(character, style: widget.style),
            );
          }),
        );
      },
    );
  }
}
