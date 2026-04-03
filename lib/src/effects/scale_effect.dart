import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ScaleEffect extends TextEffect {
  final double beginScale;
  final double endScale;

  const ScaleEffect({
    this.beginScale = 0.2,
    this.endScale = 1.1,
    super.begin,
    super.end,
    super.curve = Curves.easeInOut,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  ScaleEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return ScaleEffect(
      beginScale: beginScale,
      endScale: endScale,
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
    final animation = Tween<double>(begin: beginScale, end: endScale).animate(
      animationOf(controller),
    );
    return ScaleTransition(scale: animation, child: child);
  }
}
