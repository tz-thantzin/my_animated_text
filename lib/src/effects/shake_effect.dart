import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

enum ShakeAxis { horizontal, vertical }

class ShakeEffect extends TextEffect {
  final ShakeAxis axis;
  final double distance;
  final int shakes;
  final double damping;

  const ShakeEffect({
    this.axis = ShakeAxis.horizontal,
    this.distance = 12.0,
    this.shakes = 4,
    this.damping = 0.85,
    super.begin,
    super.end,
    super.curve = Curves.easeOut,
  }) : assert(shakes > 0),
       assert(damping >= 0.0 && damping <= 1.0);

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  ShakeEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return ShakeEffect(
      axis: axis,
      distance: distance,
      shakes: shakes,
      damping: damping,
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

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, childWidget) {
        final progress = animation.value;
        final amplitude = distance * (1.0 - (progress * damping));
        final wave = math.sin(progress * math.pi * shakes * 2);
        final delta = amplitude * wave;
        final offset = axis == ShakeAxis.horizontal
            ? Offset(delta, 0)
            : Offset(0, delta);

        return Transform.translate(offset: offset, child: childWidget);
      },
    );
  }
}
