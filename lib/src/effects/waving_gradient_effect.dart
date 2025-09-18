import 'package:flutter/material.dart';

import '../../my_animated_text.dart';
import '../config/text_effect.dart';

class WaveGradientEffect extends TextEffect {
  final List<Color> colors;
  final WavingDirection direction;

  @override
  EffectLayer get layer => EffectLayer.widget; // Important!

  WaveGradientEffect({
    this.direction = WavingDirection.leftToRight,
    this.colors = defaultWavingColors,
  });

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror,
              transform: GradientTranslation(
                direction == WavingDirection.leftToRight
                    ? controller.value * bounds.width
                    : -controller.value * bounds.width,
              ),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: child, // Wrap whatever widget is rendered by previous effects
        );
      },
    );
  }
}

/// GradientTransform to animate gradient horizontally
class GradientTranslation extends GradientTransform {
  final double translateX;
  const GradientTranslation(this.translateX);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(translateX, 0, 0);
  }
}
