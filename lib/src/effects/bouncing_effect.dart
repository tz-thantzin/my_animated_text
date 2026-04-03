import 'package:flutter/material.dart';

import '../animated_text/bouncing_text.dart';
import '../config/text_effect.dart';

class BounceEffect extends TextEffect {
  final double jumpHeight;
  final TextAnimationDirection direction;

  const BounceEffect({
    this.jumpHeight = 12.0,
    this.direction = TextAnimationDirection.leftToRight,
    super.begin,
    super.end,
    super.curve = Curves.linear,
  });

  @override
  EffectLayer get layer => EffectLayer.character;

  @override
  BounceEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return BounceEffect(
      jumpHeight: jumpHeight,
      direction: direction,
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
    final charCount = characters.length;

    if (charCount == 0) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Wrap(
          spacing: 0,
          runSpacing: 0,
          children: List.generate(charCount, (index) {
            final start = direction == TextAnimationDirection.leftToRight
                ? index / charCount
                : (charCount - 1 - index) / charCount;
            final end = start + (1 / charCount);
            final value = Interval(start, (end.clamp(0.0, 1.0) as num).toDouble()).transform(
              animation.value,
            );
            final offsetY = value < 0.5
                ? Tween<double>(begin: 0.0, end: -jumpHeight)
                    .chain(CurveTween(curve: Curves.easeOut))
                    .transform(value * 2)
                : Tween<double>(begin: -jumpHeight, end: 0.0)
                    .chain(CurveTween(curve: Curves.easeIn))
                    .transform((value - 0.5) * 2);

            return Transform.translate(
              offset: Offset(0, offsetY),
              child: Text(characters[index], style: style, softWrap: true),
            );
          }),
        );
      },
    );
  }
}
