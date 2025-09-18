import 'package:flutter/material.dart';
import 'package:my_animated_text/src/config/duration.dart';

import '../config/text_effect.dart';

class TypewriterEffect extends TextEffect {
  final Duration duration;
  TypewriterEffect({this.duration = duration3000});

  @override
  EffectLayer get layer => EffectLayer.character;

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    if (child is! Text) return child;

    final textStyle = style ?? const TextStyle();

    return _TypewriterTextAnimation(
      controller: controller,
      text: text,
      style: textStyle,
      duration: duration,
    );
  }
}

class _TypewriterTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final AnimationController controller;

  const _TypewriterTextAnimation({
    required this.text,
    this.style,
    required this.duration,
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
