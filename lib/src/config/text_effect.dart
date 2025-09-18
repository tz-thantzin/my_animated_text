import 'package:flutter/material.dart';

abstract class TextEffect {
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  );
}
