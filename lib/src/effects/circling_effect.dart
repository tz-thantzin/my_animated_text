import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../animated_text/circling_text.dart';
import '../config/text_effect.dart';

class CirclingEffect extends TextEffect {
  final CirclingDirection direction;
  final double minLetterPadding;

  const CirclingEffect({
    this.direction = CirclingDirection.anticlockwise,
    this.minLetterPadding = 2.0,
    super.begin,
    super.end,
    super.curve,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  CirclingEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return CirclingEffect(
      direction: direction,
      minLetterPadding: minLetterPadding,
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
    double charWidth(String char) {
      final painter = TextPainter(
        text: TextSpan(text: char, style: style),
        textDirection: Directionality.of(context),
      )..layout();
      return painter.width;
    }

    final characters = text.characters.toList();
    final charWidths = characters.map(charWidth).toList();
    final arcLengths = charWidths.map((width) => width + minLetterPadding).toList();
    final totalArc = arcLengths.fold<double>(0.0, (sum, item) => sum + item);
    final animation = animationOf(controller);

    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        final rotationDirection =
            direction == CirclingDirection.clockwise ? 1.0 : -1.0;
        final rotation = rotationDirection * animation.value * 2 * math.pi;
        final radius = totalArc / (2 * math.pi);
        final circumference = 2 * math.pi * radius;
        final startArcOffset = -totalArc / 2;
        var cumulativeArc = startArcOffset;

        final letters = <Widget>[];
        for (var index = 0; index < characters.length; index++) {
          final halfArc = arcLengths[index] / 2;
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
                child: Text(characters[index], style: style),
              ),
            ),
          );

          cumulativeArc += halfArc;
        }

        final fontSize = style?.fontSize ?? 14.0;
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
