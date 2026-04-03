import 'package:flutter/material.dart';
import 'package:my_animated_text/src/animated_text/shimmer_text.dart';

import '../config/text_effect.dart';

class ShimmerEffect extends TextEffect {
  final List<Color> colors;

  const ShimmerEffect({
    this.colors = defaultShimmerColors,
    super.begin,
    super.end,
    super.curve,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  ShimmerEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return ShimmerEffect(
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
        final xOffset = 3.0 * animation.value - 1.5;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: colors,
              stops: const [0.3, 0.5, 0.7],
              begin: Alignment(xOffset, 0),
              end: Alignment(xOffset + 1.0, 0),
            ).createShader(bounds);
          },
          child: DefaultTextStyle.merge(
            style: const TextStyle(color: Colors.white),
            child: childWidget ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
