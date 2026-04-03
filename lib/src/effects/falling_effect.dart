import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class FallingEffect extends TextEffect {
  final double fallHeight;

  const FallingEffect({
    this.fallHeight = 35.0,
    super.begin,
    super.end,
    super.curve = Curves.linear,
  });

  @override
  EffectLayer get layer => EffectLayer.character;

  @override
  FallingEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return FallingEffect(
      fallHeight: fallHeight,
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

    if (characters.isEmpty) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Wrap(
          alignment: WrapAlignment.start,
          children: List.generate(characters.length, (index) {
            final start = index / characters.length;
            final end = (index + 1) / characters.length;
            final progress = Interval(
              start,
              (end.clamp(0.0, 1.0) as num).toDouble(),
              curve: Curves.bounceOut,
            ).transform(animation.value);
            final offsetY =
                Tween<double>(begin: -fallHeight, end: 0.0).transform(progress);

            return Transform.translate(
              offset: Offset(0, offsetY),
              child: Text(characters[index], style: style),
            );
          }),
        );
      },
    );
  }
}
