import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// Default set of colors used in [ColorizedText] animation
const _colorizeColors = [Colors.purple, Colors.blue, Colors.yellow, Colors.red];

/// A text widget that animates its color by transitioning through a list of colors.
///
/// This widget extends [AnimatedTextBase] and allows you to create
/// colorized text animations with customizable duration, style, mode, and callbacks.
///
/// Example:
/// ```dart
/// ColorizedText(
///   'Hello Flutter!',
///   colors: [Colors.red, Colors.green, Colors.blue],
///   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class ColorizedText extends AnimatedTextBase {
  /// List of colors used for the animation.
  ///
  /// The text color will animate from one color to the next in sequence.
  final List<Color> colors;

  /// Creates a [ColorizedText] animation widget.
  ///
  /// - [text]: The string to be displayed and animated.
  /// - [colors]: The sequence of colors to animate through.
  /// - [style]: The text style.
  /// - [duration]: Duration of the animation.
  /// - [mode]: The animation mode (forward, reverse, or loop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if needed.
  /// - [onStarted], [onCompleted], [onRepeated]: Callbacks for animation events.
  const ColorizedText(
    super.text, {
    super.key,
    this.colors = _colorizeColors,
    super.duration,
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
    return _ColorizedTextAnimation(
      controller: controller,
      text: text,
      colors: colors,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that builds and runs the color animation for [ColorizedText].
class _ColorizedTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final List<Color> colors;
  final AnimationController controller;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _ColorizedTextAnimation({
    required this.text,
    this.style,
    required this.colors,
    required this.controller,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_ColorizedTextAnimation> createState() =>
      _ColorizedTextAnimationState();
}

class _ColorizedTextAnimationState extends State<_ColorizedTextAnimation>
    with SingleTickerProviderStateMixin {
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Build a sequence of tweens that transition through each color in the list
    final List<TweenSequenceItem<Color?>> items = [];
    for (int i = 0; i < widget.colors.length - 1; i++) {
      items.add(
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: widget.colors[i], end: widget.colors[i + 1]),
          weight: 1.0,
        ),
      );
    }

    _colorAnimation = TweenSequence(items).animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) => Text(
        widget.text,
        style: (widget.style ?? const TextStyle()).copyWith(
          color: _colorAnimation.value,
        ),
      ),
    );
  }
}
