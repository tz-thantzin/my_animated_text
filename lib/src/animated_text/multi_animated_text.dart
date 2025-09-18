import 'package:flutter/material.dart';
import 'package:my_animated_text/src/config/duration.dart';

import '../../animated_text_base.dart';
import '../config/text_effect.dart';

class MultiAnimatedText extends AnimatedTextBase {
  final List<TextEffect> effects;

  MultiAnimatedText(
    super.text, {
    super.key,
    super.style,
    super.duration = duration2000,
    super.mode = AnimatedTextMode.loop,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    required this.effects,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    Widget current = Text(text, style: style);

    // Apply CHARACTER layer effects first
    for (final effect in effects.where(
      (e) => e.layer == EffectLayer.character,
    )) {
      current = effect.build(context, controller, text, style, current);
    }

    // Apply WIDGET layer effects after
    for (final effect in effects.where((e) => e.layer == EffectLayer.widget)) {
      current = effect.build(context, controller, text, style, current);
    }

    // Wrap in Flexible to support multi-line text properly
    return Flexible(child: current);
  }
}
