import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class TypewriterEffect extends TextEffect {
  const TypewriterEffect({
    super.begin,
    super.end,
    super.curve = Curves.linear,
  });

  @override
  EffectLayer get layer => EffectLayer.character;

  @override
  TypewriterEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return TypewriterEffect(
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
        final visibleCount =
            (characters.length * animation.value).clamp(0.0, characters.length.toDouble()).floor();
        final visibleText = characters.take(visibleCount).join();
        return Text(visibleText, style: style);
      },
    );
  }
}
