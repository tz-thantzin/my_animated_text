import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class MarqueeEffect extends TextEffect {
  final double speed;
  final double spacing;

  const MarqueeEffect({
    this.speed = 50.0,
    this.spacing = 50.0,
    super.begin,
    super.end,
    super.curve = Curves.linear,
  });

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  MarqueeEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return MarqueeEffect(
      speed: speed,
      spacing: spacing,
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: Directionality.of(context),
        )..layout();

        final textWidth = textPainter.width;
        final viewportWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : textWidth;
        final totalTravel = textWidth + spacing;
        final safeSpeed = speed <= 0 ? 1.0 : speed;
        final controllerDurationMs = math.max(
          1,
          (controller.duration ?? const Duration(seconds: 1)).inMilliseconds,
        );
        final cycleDurationMs = math.max(
          1.0,
          ((textWidth + spacing) / safeSpeed) * 1000,
        );

        return ClipRect(
          child: SizedBox(
            width: viewportWidth,
            height: (style?.fontSize ?? 14.0) * 1.4,
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final cycles = controllerDurationMs / cycleDurationMs;
                final progress = (animation.value * cycles) % 1.0;
                final offset = -totalTravel * progress;
                final children = <Widget>[
                  Positioned(
                    left: offset,
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(text, style: style, maxLines: 1),
                    ),
                  ),
                ];

                children.addAll([
                  Positioned(
                    left: offset + totalTravel,
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(text, style: style, maxLines: 1),
                    ),
                  ),
                  Positioned(
                    left: offset + (totalTravel * 2),
                    top: 0,
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(text, style: style, maxLines: 1),
                    ),
                  ),
                ]);

                return Stack(children: children);
              },
            ),
          ),
        );
      },
    );
  }
}
