import 'package:flutter/material.dart';

import '../animated_text_base.dart';
import 'config/text_effect.dart';

class MultiAnimatedText extends AnimatedTextBase {
  final List<TextEffect> effects;

  const MultiAnimatedText(
    super.text, {
    super.key,
    super.duration,
    super.style,
    super.mode,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    required this.effects,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    final baseText = Text(text, style: style);

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        Widget current = baseText;

        // Apply ALL effects in order, not override

        for (final effect in effects) {
          current = effect.build(context, controller, text, style, current);
        }

        return current;
      },
    );
  }
}
