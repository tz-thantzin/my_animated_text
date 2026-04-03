import 'package:flutter/material.dart';

import '../animated_text/slide_text.dart';
import '../config/text_effect.dart';

class SlideEffect extends TextEffect {
  final SlideDirection direction;

  const SlideEffect({
    this.direction = SlideDirection.leftToRight,
    super.begin,
    super.end,
    super.curve = Curves.easeOut,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  SlideEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return SlideEffect(
      direction: direction,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      curve: curve ?? this.curve,
    );
  }

  Offset get _beginOffset {
    return switch (direction) {
      SlideDirection.leftToRight => const Offset(-1.0, 0.0),
      SlideDirection.rightToLeft => const Offset(1.0, 0.0),
      SlideDirection.topToBottom => const Offset(0.0, -1.0),
      SlideDirection.bottomToTop => const Offset(0.0, 1.0),
    };
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
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(begin: _beginOffset, end: Offset.zero).animate(
          animation,
        ),
        child: child,
      ),
    );
  }
}
