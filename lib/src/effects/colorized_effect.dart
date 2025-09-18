import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ColorizeEffect extends TextEffect {
  final List<Color> colors;

  @override
  EffectLayer get layer => EffectLayer.widget;

  ColorizeEffect({
    this.colors = const [Colors.red, Colors.blue, Colors.green, Colors.orange],
  });
  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final textStyle = style ?? const TextStyle();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final totalColors = colors.length;
        final progress = (controller.value * totalColors) % totalColors;
        final index = progress.floor();
        final nextIndex = (index + 1) % totalColors;
        final t = progress - index;
        final currentColor = Color.lerp(colors[index], colors[nextIndex], t)!;

        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: double.infinity),
          child: DefaultTextStyle.merge(
            style: textStyle.copyWith(color: currentColor),
            child: child,
          ),
        );
      },
    );
  }
}
