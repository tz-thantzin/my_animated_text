import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class WaveMotionEffect extends TextEffect {
  const WaveMotionEffect({
    super.begin,
    super.end,
    super.curve,
  });

  @override
  EffectLayer get layer => EffectLayer.character;

  @override
  WaveMotionEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return WaveMotionEffect(
      begin: begin ?? this.begin,
      end: end ?? this.end,
      curve: curve ?? this.curve,
    );
  }

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final animation = animationOf(controller);
    final characters = text.characters.toList();

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final wave = animation.value * 2 * math.pi;

        return Wrap(
          spacing: 0,
          runSpacing: 0,
          children: List.generate(characters.length, (index) {
            final offsetY = 5 * math.sin(wave + index);
            return Transform.translate(
              offset: Offset(0, -offsetY),
              child: Text(characters[index], style: style),
            );
          }),
        );
      },
    );
  }
}
