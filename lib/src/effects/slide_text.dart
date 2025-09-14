import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// Defines the slide-in direction for [SlideText].
enum SlideDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

/// A text widget that slides into view with a fade animation.
///
/// Example:
/// ```dart
/// SlideText(
///   "Hello World",
///   direction: SlideDirection.leftToRight,
///   duration: Duration(seconds: 1),
///   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class SlideText extends AnimatedTextBase {
  final SlideDirection direction;

  const SlideText(
    super.text, {
    super.key,
    this.direction = SlideDirection.leftToRight,
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
    return _SlideTextAnimation(
      controller: controller,
      text: text,
      direction: direction,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

class _SlideTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final bool autoStart;
  final SlideDirection direction;
  final AnimatedTextMode mode;
  final TextStyle? style;

  const _SlideTextAnimation({
    required this.controller,
    required this.text,
    required this.direction,
    required this.autoStart,
    required this.mode,
    this.style,
  });

  @override
  State<_SlideTextAnimation> createState() => _SlideTextAnimationState();
}

class _SlideTextAnimationState extends State<_SlideTextAnimation> {
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    final beginOffset = switch (widget.direction) {
      SlideDirection.leftToRight => const Offset(-1.0, 0.0),
      SlideDirection.rightToLeft => const Offset(1.0, 0.0),
      SlideDirection.topToBottom => const Offset(0.0, -1.0),
      SlideDirection.bottomToTop => const Offset(0.0, 1.0),
    };

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero)
        .animate(
          CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
        );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: widget.controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(widget.text, style: widget.style),
      ),
    );
  }
}
