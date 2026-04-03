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
    Widget current = Text(text, style: style, softWrap: true);

    final orderedEffects = <TextEffect>[
      ...effects.where((effect) => effect.layer == EffectLayer.character),
      ...effects.where((effect) => effect.layer == EffectLayer.widget),
    ];

    for (final effect in orderedEffects) {
      current = effect.build(context, controller, text, style, current);
    }

    return RepaintBoundary(
      child: DefaultTextStyle.merge(style: style, child: current),
    );
  }
}
