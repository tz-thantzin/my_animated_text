import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ScaleEffect extends TextEffect {
  final double beginScale;
  final double endScale;

  ScaleEffect({this.beginScale = 0.2, this.endScale = 1.1});

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final textStyle = style ?? const TextStyle();

    final animation = Tween(
      begin: beginScale,
      end: endScale,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    return ScaleTransition(
      scale: animation,
      child: Text(text, style: textStyle),
    );
  }
}
