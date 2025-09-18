import 'package:my_animated_text/my_animated_text.dart';

/// A text widget that animates each character in a wave-like motion.
///
/// Example:
/// ```dart
/// WaveMotionText(
///   'Waving Text!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
/// )
/// ```
///
/// Features:
/// - Each character moves up and down in a sine-wave pattern.
/// - Supports forward, reverse, and loop animation modes.
/// - Customizable text style and animation duration.
class WaveMotionText extends MultiAnimatedText {
  /// Creates a wave motion animation.
  ///
  /// - [text]: The string to display and animate.
  /// - [style]: The text style (e.g., font size, weight, color).
  /// - [duration]: Duration of the waving motion animation.
  /// - [mode]: Animation mode (forward, reverse, loop, reverseLoop).
  /// - [autoStart]: Whether the animation should start automatically.
  /// - [controller]: Custom [AnimationController] if you want external control.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional animation callbacks.
  /// - [effects]: Internal list of animation text effects applied to the text.
  WaveMotionText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.mode,
  }) : super(effects: [WaveMotionEffect()]);
}
