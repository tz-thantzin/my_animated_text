import 'package:flutter/material.dart';

enum EffectLayer { character, widget }

abstract class TextEffect {
  EffectLayer get layer;

  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  );
}
