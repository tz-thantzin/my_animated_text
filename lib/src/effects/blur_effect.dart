import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class BlurEffect extends TextEffect {
  final double beginSigma;
  final double endSigma;

  const BlurEffect({
    this.beginSigma = 14.0,
    this.endSigma = 0.0,
    super.begin,
    super.end,
    super.curve = Curves.easeOutCubic,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  BlurEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return BlurEffect(
      beginSigma: beginSigma,
      endSigma: endSigma,
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
        final sigma = Tween<double>(
          begin: beginSigma,
          end: endSigma,
        ).transform(animation.value);

        return ImageFiltered(
          imageFilter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: childWidget,
        );
      },
    );
  }
}
