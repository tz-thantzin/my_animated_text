import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class FadeEffect extends TextEffect {
  FadeEffect();

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
    final fade = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    return FadeTransition(opacity: fade, child: child);
  }
}
