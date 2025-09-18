import 'package:flutter/material.dart';

import '../../my_animated_text.dart';
import '../config/text_effect.dart';

class RotationEffect extends TextEffect {
  final RotationDirection rotationDirection;
  final double? rotationDegrees;

  @override
  EffectLayer get layer => EffectLayer.widget;

  RotationEffect({
    this.rotationDirection = RotationDirection.swing,
    this.rotationDegrees,
  });

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    return _RotationEffectWidget(
      controller: controller,
      child: child,
      rotationDegrees: rotationDegrees,
      rotationDirection: rotationDirection,
    );
  }
}

class _RotationEffectWidget extends StatefulWidget {
  final AnimationController controller;
  final RotationDirection rotationDirection;
  final double? rotationDegrees;
  final Widget child;

  const _RotationEffectWidget({
    required this.controller,
    required this.child,
    required this.rotationDirection,
    required this.rotationDegrees,
  });

  @override
  State<_RotationEffectWidget> createState() => _RotationEffectWidgetState();
}

class _RotationEffectWidgetState extends State<_RotationEffectWidget> {
  late final Animation<double> _rotation;

  @override
  void initState() {
    super.initState();

    double start, end;
    switch (widget.rotationDirection) {
      case RotationDirection.clockwise:
        start = 0;
        end = 3.14159 * 2;
        break;
      case RotationDirection.anticlockwise:
        start = 0;
        end = -3.14159 * 2;
        break;
      case RotationDirection.custom:
        start = 0;
        final degrees = widget.rotationDegrees ?? 180;
        end = (degrees.clamp(0, 360)) * (3.14159 / 180);
        break;
      case RotationDirection.swing:
        start = -0.2;
        end = 0.2;
        break;
    }

    _rotation = Tween(begin: start, end: end).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotation,
      child: widget.child,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotation.value,
          alignment: Alignment.center,
          child: Center(child: child),
        );
      },
    );
  }
}
