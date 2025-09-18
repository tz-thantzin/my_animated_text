import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../my_animated_text.dart';
import '../config/text_effect.dart';

class CirclingEffect extends TextEffect {
  final CirclingDirection direction;
  final double minLetterPadding;

  CirclingEffect({
    this.direction = CirclingDirection.anticlockwise,
    this.minLetterPadding = 2.0,
  });

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
    double charWidth(String char) {
      final painter = TextPainter(
        text: TextSpan(text: char, style: style),
        textDirection: TextDirection.ltr,
      )..layout();
      return painter.width;
    }

    final charWidths = text.runes
        .map((r) => charWidth(String.fromCharCode(r)))
        .toList();
    final arcLengths = charWidths.map((w) => w + minLetterPadding).toList();
    final totalArc = arcLengths.fold(0.0, (a, b) => a + b);

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final rotation =
            (direction == CirclingDirection.clockwise ? 1 : -1) *
            controller.value *
            2 *
            math.pi;

        // Automatically calculate radius based on total arc
        final radius = totalArc / (2 * math.pi);
        final circumference = 2 * math.pi * radius;
        final startArcOffset = -totalArc / 2;
        double cumulativeArc = startArcOffset;

        final letters = <Widget>[];
        for (int i = 0; i < text.length; i++) {
          final halfArc = arcLengths[i] / 2;
          cumulativeArc += halfArc;

          final angle =
              (cumulativeArc / circumference) * 2 * math.pi + rotation;

          final offset = Offset(
            radius * math.cos(angle),
            radius * math.sin(angle),
          );

          final glyphRotation = angle + math.pi / 2;

          letters.add(
            Transform.translate(
              offset: offset,
              child: Transform.rotate(
                angle: glyphRotation,
                child: Text(text[i], style: style),
              ),
            ),
          );

          cumulativeArc += halfArc;
        }

        final fontSize = style?.fontSize ?? 14;
        return ClipRect(
          child: SizedBox(
            width: (radius + fontSize * 1.5) * 2,
            height: (radius + fontSize * 1.5) * 2,
            child: Stack(alignment: Alignment.center, children: letters),
          ),
        );
      },
    );
  }
}
