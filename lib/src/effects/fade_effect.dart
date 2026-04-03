import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class FadeEffect extends TextEffect {
  const FadeEffect({super.begin, super.end, super.curve});

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  FadeEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return FadeEffect(
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
    return FadeTransition(opacity: animationOf(controller), child: child);
  }
}
