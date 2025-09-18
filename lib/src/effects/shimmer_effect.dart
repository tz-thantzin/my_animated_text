import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

import '../config/text_effect.dart';

class ShimmerEffect extends TextEffect {
  final List<Color> colors;

  ShimmerEffect({this.colors = defaultShimmerColors});

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    if (child is! Text) return child;

    final textStyle = style ?? const TextStyle();

    return _ShimmerTextAnimation(
      controller: controller,
      text: text,
      style: textStyle,
      colors: colors,
    );
  }
}

/// Internal widget that renders the shimmer effects.
class _ShimmerTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final AnimationController controller;

  const _ShimmerTextAnimation({
    required this.text,
    this.style,
    required this.colors,
    required this.controller,
  });

  @override
  State<_ShimmerTextAnimation> createState() => _ShimmerTextAnimationState();
}

class _ShimmerTextAnimationState extends State<_ShimmerTextAnimation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final double xOffset = 3.0 * widget.controller.value - 1.5;

        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: widget.colors,
              stops: const [0.3, 0.5, 0.7],
              begin: Alignment(xOffset, 0),
              end: Alignment(xOffset + 1.0, 0),
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style: (widget.style ?? const TextStyle()).copyWith(
              // Needs a visible base color for the shader to apply.
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
