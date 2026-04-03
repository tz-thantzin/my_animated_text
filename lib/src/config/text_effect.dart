import 'package:flutter/material.dart';

enum EffectLayer { character, widget }

abstract class TextEffect {
  final double begin;
  final double end;
  final Curve curve;

  const TextEffect({
    this.begin = 0.0,
    this.end = 1.0,
    this.curve = Curves.linear,
  }) : assert(begin >= 0.0 && begin <= 1.0),
       assert(end >= 0.0 && end <= 1.0),
       assert(begin < end);

  EffectLayer get layer;

  @protected
  Animation<double> animationOf(AnimationController controller) {
    return CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end, curve: curve),
    );
  }

  TextEffect copyWithTiming({double? begin, double? end, Curve? curve});

  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  );
}
