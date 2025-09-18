import 'package:my_animated_text/my_animated_text.dart';

/// Defines the slide-in direction for [SlideText].
enum SlideDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

/// A text widget that slides into view with a fade animation.
///
/// Example:
/// ```dart
/// SlideText(
///   "Hello World",
///   direction: SlideDirection.leftToRight,
///   duration: Duration(seconds: 1),
///   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
class SlideText extends MultiAnimatedText {
  final SlideDirection direction;

  /// Creates a slide text animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [direction]: Direction of animated from
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the shadow animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  /// - [effects]: Internal list of animation text effects applied to the text.
  SlideText(
    super.text, {
    super.key,
    this.direction = SlideDirection.leftToRight,
    super.duration,
    super.style,
    super.mode,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
  }) : super(effects: [SlideEffect(direction: direction)]);
}
