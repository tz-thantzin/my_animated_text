import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// Default shimmer gradient colors (light gray to white to light gray).
const _defaultShimmerColors = [Colors.grey, Color(0xFFF4F4F4), Colors.grey];

/// A text widget that displays a shimmer (shining) animation.
///
/// The [ShimmerText] widget animates a moving gradient across the text,
/// giving the effect of a light reflection or shine.
///
/// Example:
/// ```dart
/// ShimmerText(
///   'Shiny Text',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 3),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
///
/// Features:
/// - Configurable shimmer colors (default is a gray-to-white gradient).
/// - Supports forward, reverse, and looping modes.
/// - Adjustable duration, text style, and auto-start option.
class ShimmerText extends AnimatedTextBase {
  /// Colors used for the shimmer gradient.
  ///
  /// By default, uses shades of gray and white.
  final List<Color> colors;

  const ShimmerText(
    super.text, {
    super.key,
    this.colors = _defaultShimmerColors,
    super.duration = const Duration(milliseconds: 3000),
    super.style,
    super.mode,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _ShimmerTextAnimation(
      controller: controller,
      text: text,
      colors: colors,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that renders the shimmer effect.
class _ShimmerTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final AnimationController controller;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _ShimmerTextAnimation({
    required this.text,
    this.style,
    required this.colors,
    required this.controller,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_ShimmerTextAnimation> createState() => _ShimmerTextAnimationState();
}

class _ShimmerTextAnimationState extends State<_ShimmerTextAnimation>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    if (widget.autoStart) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    switch (widget.mode) {
      case AnimatedTextMode.forward:
        widget.controller.forward();
        break;
      case AnimatedTextMode.reverse:
        widget.controller.reverse();
        break;
      case AnimatedTextMode.loop:
        widget.controller.repeat();
        break;
    }
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
