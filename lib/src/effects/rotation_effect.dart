import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../animated_text/rotation_text.dart';
import '../config/text_effect.dart';

class RotationEffect extends TextEffect {
  final RotationDirection rotationDirection;
  final double? rotationDegrees;

  const RotationEffect({
    this.rotationDirection = RotationDirection.swing,
    this.rotationDegrees,
    super.begin,
    super.end,
    super.curve = Curves.easeInOut,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  RotationEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return RotationEffect(
      rotationDirection: rotationDirection,
      rotationDegrees: rotationDegrees,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      curve: curve ?? this.curve,
    );
  }

  double get _endAngle {
    switch (rotationDirection) {
      case RotationDirection.clockwise:
        return math.pi * 2;
      case RotationDirection.anticlockwise:
        return -math.pi * 2;
      case RotationDirection.custom:
        final degrees = ((rotationDegrees ?? 180).clamp(0.0, 360.0) as num).toDouble();
        return degrees * (math.pi / 180);
      case RotationDirection.swing:
        return 0.2;
    }
  }

  double get _startAngle {
    return rotationDirection == RotationDirection.swing ? -0.2 : 0.0;
  }

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final animation = Tween<double>(begin: _startAngle, end: _endAngle).animate(
      animationOf(controller),
    );

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, childWidget) {
        return Transform.rotate(
          angle: animation.value,
          alignment: Alignment.center,
          child: childWidget ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
