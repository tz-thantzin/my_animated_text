import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ShadowEffect extends TextEffect {
  final double blurBegin;
  final double blurEnd;
  final double offsetBegin;
  final double offsetEnd;
  final Color? color;

  const ShadowEffect({
    this.blurBegin = 2.0,
    this.blurEnd = 18.0,
    this.offsetBegin = 0.0,
    this.offsetEnd = 8.0,
    this.color,
    super.begin,
    super.end,
    super.curve = Curves.easeInOut,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  ShadowEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return ShadowEffect(
      blurBegin: blurBegin,
      blurEnd: blurEnd,
      offsetBegin: offsetBegin,
      offsetEnd: offsetEnd,
      color: color,
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
    final shadowColor =
        color ?? style?.color?.withValues(alpha: 0.5) ?? Colors.black54;

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, childWidget) {
        final blur = Tween<double>(begin: blurBegin, end: blurEnd)
            .transform(animation.value);
        final offset = Tween<double>(begin: offsetBegin, end: offsetEnd)
            .transform(animation.value);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Transform.translate(
              offset: Offset(0, offset),
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(shadowColor, BlendMode.srcIn),
                  child: childWidget ?? const SizedBox.shrink(),
                ),
              ),
            ),
            childWidget ?? const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
