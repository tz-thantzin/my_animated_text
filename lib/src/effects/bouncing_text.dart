import 'package:flutter/material.dart';

import '../../animated_text_base.dart';

enum TextAnimationDirection { leftToRight, rightToLeft }

/// A text widget that animates each character with a jumping (bouncing) effect
/// from a user-defined direction.
///
/// The [BouncingText] widget animates each character in sequence, moving them
/// vertically up and down to create a "jumping" effect. You can control the
/// direction of the animation and the maximum jump height.
///
/// Example:
/// ```dart
/// JumpingText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
///   direction: TextAnimationDirection.leftToRight,
///   jumpHeight: 12.0,
/// )
/// ```
class BouncingText extends AnimatedTextBase {
  /// The direction in which the characters animate sequentially.
  final TextAnimationDirection direction;

  /// Maximum height of each character's jump.
  final double jumpHeight;

  /// Creates a bouncing text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the fade animation.
  /// - [mode]: Animation mode (forward, reverse, or loop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  const BouncingText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.mode,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    this.direction = TextAnimationDirection.leftToRight,
    this.jumpHeight = 12.0,
  });

  @override
  Widget buildAnimation(BuildContext context, AnimationController controller) {
    return _JumpingTextAnimation(
      controller: controller,
      text: text,
      style: style,
      direction: direction,
      jumpHeight: jumpHeight,
    );
  }
}

/// Internal widget that builds and runs the jumping animation for [BouncingText].
class _JumpingTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? style;
  final TextAnimationDirection direction;
  final double jumpHeight;

  const _JumpingTextAnimation({
    required this.controller,
    required this.text,
    this.style,
    required this.direction,
    required this.jumpHeight,
  });

  @override
  State<_JumpingTextAnimation> createState() => _JumpingTextAnimationState();
}

class _JumpingTextAnimationState extends State<_JumpingTextAnimation> {
  late List<Animation<double>> _characterAnimations;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  /// Sets up animations for each character using a TweenSequence to bounce.
  void _setupAnimations() {
    final charCount = widget.text.length;
    _characterAnimations = List.generate(charCount, (i) {
      final start = widget.direction == TextAnimationDirection.leftToRight
          ? i / charCount
          : (charCount - 1 - i) / charCount;
      final end = start + (1 / charCount);

      return TweenSequence<double>([
        TweenSequenceItem(
          tween: Tween(
            begin: 0.0,
            end: -widget.jumpHeight,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 0.5,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: -widget.jumpHeight,
            end: 0.0,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 0.5,
        ),
      ]).animate(
        CurvedAnimation(parent: widget.controller, curve: Interval(start, end)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.text.length, (i) {
            final char = widget.text[i];
            final anim = _characterAnimations[i];

            return Transform.translate(
              offset: Offset(0, anim.value),
              child: Text(char, style: widget.style),
            );
          }),
        );
      },
    );
  }
}
