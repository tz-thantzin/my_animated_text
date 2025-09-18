import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class WaveMotionEffect extends TextEffect {
  WaveMotionEffect();

  @override
  EffectLayer get layer => EffectLayer.widget;

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

    return _WaveMotionTextAnimation(
      controller: controller,
      text: text,
      style: textStyle,
    );
  }
}

class _WaveMotionTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;

  const _WaveMotionTextAnimation({
    required this.controller,
    required this.text,
    this.style,
  });

  @override
  State<_WaveMotionTextAnimation> createState() =>
      _WaveMotionTextAnimationState();
}

class _WaveMotionTextAnimationState extends State<_WaveMotionTextAnimation> {
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
