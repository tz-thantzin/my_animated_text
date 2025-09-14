import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// Direction in which the gradient waves across the text.
enum WavingDirection { leftToRight, rightToLeft }

/// Default gradient colors for the waving text animation.
const _defaultWavingColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

/// A text widget that animates a waving gradient across the text.
///
/// Example:
/// ```dart
/// WavingGradientText(
///   'Flutter Rocks!',
///   colors: [Colors.purple, Colors.blue, Colors.yellow, Colors.red],
///   direction: WavingDirection.leftToRight,
///   duration: Duration(seconds: 3),
///   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class WavingGradientText extends AnimatedTextBase {
  final List<Color> colors;
  final WavingDirection direction;

  const WavingGradientText(
    super.text, {
    super.key,
    super.style,
    this.direction = WavingDirection.leftToRight,
    this.colors = _defaultWavingColors,
    super.duration,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.mode,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _WavingGradientTextAnimation(
      controller: controller,
      text: text,
      style: style,
      colors: colors,
      direction: direction,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

class _WavingGradientTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final WavingDirection direction;
  final AnimationController controller;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _WavingGradientTextAnimation({
    required this.text,
    this.style,
    required this.colors,
    required this.direction,
    required this.controller,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_WavingGradientTextAnimation> createState() =>
      _WavingGradientTextAnimationState();
}

class _WavingGradientTextAnimationState
    extends State<_WavingGradientTextAnimation> {
  @override
  Widget build(BuildContext context) {
    final Alignment beginAlignment =
        widget.direction == WavingDirection.leftToRight
        ? Alignment.centerLeft
        : Alignment.centerRight;

    final Alignment endAlignment =
        widget.direction == WavingDirection.leftToRight
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: beginAlignment,
              end: endAlignment,
              colors: widget.colors,
              tileMode: TileMode.repeated,
              transform: _GradientTranslation(
                widget.direction == WavingDirection.leftToRight
                    ? widget.controller.value * bounds.width
                    : -widget.controller.value * bounds.width,
              ),
            ).createShader(bounds);
          },
          child: Text(
            widget.text,
            style:
                widget.style?.copyWith(color: Colors.white) ??
                const TextStyle().copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}

/// GradientTransform subclass to slide the gradient horizontally.
class _GradientTranslation extends GradientTransform {
  final double translateX;
  const _GradientTranslation(this.translateX);

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(translateX, 0.0, 0.0);
  }
}
