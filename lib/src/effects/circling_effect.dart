import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../my_animated_text.dart';
import '../src/animated_text/config/text_effect.dart';

class CirclingEffect extends TextEffect {
  final CirclingDirection direction;
  final double minLetterPadding;
  final double radius;

  CirclingEffect({
    this.direction = CirclingDirection.anticlockwise,
    this.minLetterPadding = 2.0,
    this.radius = 40.0,
  });

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final effectiveText = text;
    final effectiveStyle = style ?? const TextStyle();

    double tp(String char) {
      final painter = TextPainter(
        text: TextSpan(text: char, style: effectiveStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      return painter.width;
    }

    final charWidths = effectiveText.runes
        .map((r) => tp(String.fromCharCode(r)))
        .toList();

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final rotation =
            (direction == CirclingDirection.clockwise ? 1 : -1) *
            controller.value *
            2 *
            math.pi;

        final arcLengths = charWidths.map((w) => w + minLetterPadding).toList();
        final totalArc = arcLengths.fold(0.0, (a, b) => a + b);

        final effectiveRadius = math.max(radius, totalArc / (2 * math.pi));
        final circumference = 2 * math.pi * effectiveRadius;
        final startArcOffset = -totalArc / 2;
        double cumulativeArc = startArcOffset;

        final letters = <Widget>[];
        for (int i = 0; i < effectiveText.length; i++) {
          final halfArc = arcLengths[i] / 2;
          cumulativeArc += halfArc;

          final angle =
              (cumulativeArc / circumference) * 2 * math.pi + rotation;

          final offset = Offset(
            effectiveRadius * math.cos(angle),
            effectiveRadius * math.sin(angle),
          );
          final glyphRotation = angle + math.pi / 2;

          letters.add(
            Transform.translate(
              offset: offset,
              child: Transform.rotate(
                angle: glyphRotation,
                child: Text(effectiveText[i], style: effectiveStyle),
              ),
            ),
          );

          cumulativeArc += halfArc;
        }

        final fontSize = effectiveStyle.fontSize ?? 14;
        return ClipRect(
          child: SizedBox(
            width: (effectiveRadius + fontSize * 1.5) * 2,
            height: (effectiveRadius + fontSize * 1.5) * 2,
            child: Stack(alignment: Alignment.center, children: letters),
          ),
        );
      },
    );
  }
}
