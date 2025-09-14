import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget that animates each character in a wave-like motion.
///
/// Example:
/// ```dart
/// WaveMotionText(
///   'Waving Text!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
///
/// Features:
/// - Each character moves up and down in a sine-wave pattern.
/// - Supports forward, reverse, and loop animation modes.
/// - Customizable text style and animation duration.
class WaveMotionText extends AnimatedTextBase {
  const WaveMotionText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.mode,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _WaveMotionTextAnimation(
      controller: controller,
      text: text,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

class _WaveMotionTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final AnimationController controller;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _WaveMotionTextAnimation({
    required this.text,
    this.style,
    required this.controller,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_WaveMotionTextAnimation> createState() =>
      _WaveMotionTextAnimationState();
}

class _WaveMotionTextAnimationState extends State<_WaveMotionTextAnimation> {
  @override
  void initState() {
    super.initState();
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
    final characters = widget.text.characters.toList();

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final double wave = widget.controller.value * 2 * math.pi;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(characters.length, (index) {
            // Each character has a phase offset based on its index
            final double offsetY = 5 * math.sin(wave + index);
            return Transform.translate(
              offset: Offset(0, -offsetY),
              child: Text(characters[index], style: widget.style),
            );
          }),
        );
      },
    );
  }
}
