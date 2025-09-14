import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget that simulates a typewriter effect, revealing characters one by one.
///
/// Example:
/// ```dart
/// TypewriterText(
///   'Hello, World!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(milliseconds: 200),
///   mode: AnimatedTextMode.forward,
/// )
/// ```
///
/// Features:
/// - Reveals text character by character.
/// - Supports forward, reverse, and looping modes.
/// - Customizable text style and typing speed.
class TypewriterText extends AnimatedTextBase {
  /// Creates a typewriter text animation.
  ///
  /// - [text]: The string to display.
  /// - [duration]: Duration for each character to appear.
  /// - [style]: Text style.
  /// - [mode]: Animation mode (forward, reverse, loop).
  /// - [autoStart]: Automatically start animation if true.
  /// - [controller]: Optional custom AnimationController.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional callbacks.
  const TypewriterText(
    super.text, {
    super.key,
    super.style,
    super.duration = const Duration(milliseconds: 300),
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.mode,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _TypewriterTextAnimation(
      text: text,
      style: style,
      duration: duration,
      autoStart: autoStart,
      mode: mode,
      controller: controller,
    );
  }
}

class _TypewriterTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final bool autoStart;
  final AnimatedTextMode mode;
  final AnimationController controller;

  const _TypewriterTextAnimation({
    required this.text,
    this.style,
    required this.duration,
    required this.autoStart,
    required this.mode,
    required this.controller,
  });

  @override
  State<_TypewriterTextAnimation> createState() =>
      _TypewriterTextAnimationState();
}

class _TypewriterTextAnimationState extends State<_TypewriterTextAnimation> {
  late final Animation<int> _animation;

  @override
  void initState() {
    super.initState();

    // Total duration is duration per character multiplied by number of characters
    final totalDuration = widget.duration * widget.text.length;
    widget.controller.duration = totalDuration;

    _animation = StepTween(
      begin: 0,
      end: widget.text.length,
    ).animate(CurvedAnimation(parent: widget.controller, curve: Curves.linear));

    if (widget.autoStart) {
      _startAnimation();
    }
  }

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
      animation: _animation,
      builder: (context, child) {
        // Safety: ensure substring is within bounds
        final currentIndex = _animation.value.clamp(0, widget.text.length);
        return Text(
          widget.text.substring(0, currentIndex),
          style: widget.style,
        );
      },
    );
  }
}
