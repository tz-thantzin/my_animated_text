import 'package:flutter/material.dart';

import '../../my_animated_text.dart';
import '../config/text_effect.dart';

class BounceEffect extends TextEffect {
  final double jumpHeight;
  final TextAnimationDirection direction;

  BounceEffect({
    this.jumpHeight = 12.0,
    this.direction = TextAnimationDirection.leftToRight,
  });

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
    final charCount = text.length;

    final animations = List.generate(charCount, (i) {
      final start = direction == TextAnimationDirection.leftToRight
          ? i / charCount
          : (charCount - 1 - i) / charCount;
      final end = start + (1 / charCount);

      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(
            begin: 0.0,
            end: -jumpHeight,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 0.5,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: -jumpHeight,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.5,
        ),
      ]).animate(
        CurvedAnimation(parent: controller, curve: Interval(start, end)),
      );
    });

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Wrap(
          spacing: 0,
          runSpacing: 0,
          children: List.generate(charCount, (i) {
            return Transform.translate(
              offset: Offset(0, animations[i].value),
              child: Text(text[i], style: style, softWrap: true),
            );
          }),
        );
      },
    );
  }
}
