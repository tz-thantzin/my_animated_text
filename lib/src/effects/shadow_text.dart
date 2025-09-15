import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

/// A text widget that animates its shadow (pulsing / waving effect).
///
/// The [ShadowText] widget gradually animates the text shadow's blur and offset,
/// creating a dynamic glowing or waving shadow effect.
///
/// Example:
/// ```dart
/// ShadowText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class ShadowText extends AnimatedTextBase {
  /// Creates a shadow text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the shadow animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  const ShadowText(
    super.text, {
    super.key,
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
    return _ShadowTextAnimation(
      controller: controller,
      text: text,
      style: style,
      autoStart: autoStart,
      mode: mode,
    );
  }
}

/// Internal widget that builds and runs the shadow animation for [ShadowText].
class _ShadowTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;
  final bool autoStart;
  final AnimatedTextMode mode;

  const _ShadowTextAnimation({
    required this.controller,
    required this.text,
    this.style,
    required this.autoStart,
    required this.mode,
  });

  @override
  State<_ShadowTextAnimation> createState() => _ShadowTextAnimationState();
}

class _ShadowTextAnimationState extends State<_ShadowTextAnimation> {
  late Animation<double> _blurAnimation;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _blurAnimation = Tween<double>(begin: 2.0, end: 20.0).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
    );

    _offsetAnimation = Tween<double>(begin: 0.0, end: 6.0).animate(
      CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        return Text(
          widget.text,
          style:
              widget.style?.copyWith(
                shadows: [
                  Shadow(
                    color:
                        widget.style?.color?.withValues(alpha: 0.6) ??
                        Colors.black54,
                    blurRadius: _blurAnimation.value,
                    offset: Offset(0, _offsetAnimation.value),
                  ),
                  Shadow(
                    color:
                        widget.style?.color?.withValues(alpha: 0.3) ??
                        Colors.black26,
                    blurRadius: _blurAnimation.value / 2,
                    offset: Offset(
                      _offsetAnimation.value / 2,
                      _offsetAnimation.value / 2,
                    ),
                  ),
                ],
              ) ??
              TextStyle(
                color: Colors.black,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    blurRadius: _blurAnimation.value,
                    offset: Offset(0, _offsetAnimation.value),
                  ),
                  Shadow(
                    color: Colors.black26,
                    blurRadius: _blurAnimation.value / 2,
                    offset: Offset(
                      _offsetAnimation.value / 2,
                      _offsetAnimation.value / 2,
                    ),
                  ),
                ],
              ),
        );
      },
    );
  }
}
