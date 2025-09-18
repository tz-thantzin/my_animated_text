import 'package:flutter/material.dart';

import '../src/animated_text/config/text_effect.dart';

class ColorizeEffect extends TextEffect {
  final List<Color> colors;

  ColorizeEffect({required this.colors});

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    // Build tween sequence that transitions between given colors
    final items = <TweenSequenceItem<Color?>>[];
    for (int i = 0; i < colors.length - 1; i++) {
      items.add(
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: colors[i], end: colors[i + 1]),
          weight: 1.0,
        ),
      );
    }
    final animation = TweenSequence<Color?>(items).animate(controller);

    // Use ColorFiltered to recolor the rendered child to `animation.value`.
    // This overrides explicit colors and works for transformed/stacked text.
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final color = animation.value ?? Colors.transparent;
        return ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          child: child,
        );
      },
    );
  }
}
