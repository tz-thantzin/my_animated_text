import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

enum FlipAxis { horizontal, vertical }

class FlipEffect extends TextEffect {
  final FlipAxis axis;
  final double beginAngle;
  final double endAngle;
  final Alignment alignment;
  final double perspective;
  final bool fade;

  const FlipEffect({
    this.axis = FlipAxis.vertical,
    this.beginAngle = math.pi / 2,
    this.endAngle = 0.0,
    this.alignment = Alignment.center,
    this.perspective = 0.0018,
    this.fade = true,
    super.begin,
    super.end,
    super.curve = Curves.easeOutBack,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  FlipEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return FlipEffect(
      axis: axis,
      beginAngle: beginAngle,
      endAngle: endAngle,
      alignment: alignment,
      perspective: perspective,
      fade: fade,
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
        final angle = Tween<double>(
          begin: beginAngle,
          end: endAngle,
        ).transform(animation.value);
        final opacity = fade
            ? (animation.value.clamp(0.0, 1.0) as num).toDouble()
            : 1.0;
        final transform = Matrix4.identity()..setEntry(3, 2, perspective);

        switch (axis) {
          case FlipAxis.horizontal:
            transform.rotateX(angle);
            break;
          case FlipAxis.vertical:
            transform.rotateY(angle);
            break;
        }

        return Opacity(
          opacity: opacity,
          child: Transform(
            alignment: alignment,
            transform: transform,
            child: childWidget,
          ),
        );
      },
    );
  }
}
