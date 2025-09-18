import 'package:my_animated_text/my_animated_text.dart';
import 'package:my_animated_text/src/config/duration.dart';

/// A text widget that simulates a typewriter effects, revealing characters one by one.
///
/// Example:
/// ```dart
/// TypewriterText(
///   'Hello, World!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(milliseconds: 200),
///   mode: AnimatedTextMode.forward,
/// )
/// ```
///
/// Features:
/// - Reveals text character by character.
/// - Supports forward, reverse, and looping modes.
/// - Customizable text style and typing speed.
class TypewriterText extends MultiAnimatedText {
  /// Creates a typewriter text animation.
  ///
  /// - [text]: The string to display.
  /// - [duration]: Duration for each character to appear.
  /// - [style]: Text style.
  /// - [mode]: Animation mode (forward, reverse, loop).
  /// - [autoStart]: Automatically start animation if true.
  /// - [controller]: Optional custom AnimationController.
  /// - [onStarted], [onCompleted], [onRepeated]: Optional callbacks.
  /// - [effects]: Internal list of animation text effects applied to the text.
  TypewriterText(
    super.text, {
    super.key,
    super.style,
    super.duration = duration3000,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.mode,
  }) : super(effects: [TypewriterEffect(duration: duration)]);
}
