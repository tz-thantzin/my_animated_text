import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ShimmerEffect extends TextEffect {
  ShimmerEffect();

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
