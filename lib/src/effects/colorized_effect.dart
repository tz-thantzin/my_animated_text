import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ColorizeEffect extends TextEffect {
  final List<Color> colors;

  const ColorizeEffect({
    this.colors = const [Colors.red, Colors.blue, Colors.green, Colors.orange],
    super.begin,
    super.end,
    super.curve,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  ColorizeEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return ColorizeEffect(
      colors: colors,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      curve: curve ?? this.curve,
    );
  }

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final animation = animationOf(controller);
    final baseStyle = style ?? const TextStyle();

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, childWidget) {
        final totalColors = colors.length;
        if (totalColors == 0) {
          return childWidget ?? const SizedBox.shrink();
        }

        final progress = (animation.value * totalColors) % totalColors;
        final index = progress.floor();
        final nextIndex = (index + 1) % totalColors;
        final t = progress - index;
        final currentColor = Color.lerp(colors[index], colors[nextIndex], t)!;

        return DefaultTextStyle.merge(
          style: baseStyle.copyWith(color: currentColor),
          child: childWidget ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
