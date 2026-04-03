import 'package:flutter/material.dart';

import '../animated_text/waving_gradient_text.dart';
import '../config/text_effect.dart';

class WaveGradientEffect extends TextEffect {
  final List<Color> colors;
  final WavingDirection direction;

  const WaveGradientEffect({
    this.direction = WavingDirection.leftToRight,
    this.colors = defaultWavingColors,
    super.begin,
    super.end,
    super.curve,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  WaveGradientEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return WaveGradientEffect(
      direction: direction,
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

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, childWidget) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror,
              transform: GradientTranslation(
                direction == WavingDirection.leftToRight
                    ? animation.value * bounds.width
                    : -animation.value * bounds.width,
              ),
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: childWidget ?? const SizedBox.shrink(),
        );
      },
    );
  }
}

class GradientTranslation extends GradientTransform {
  final double translateX;
  const GradientTranslation(this.translateX);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(translateX, 0, 0);
  }
}
