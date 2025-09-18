import '../../my_animated_text.dart';

/// ## FadeText
///
/// A Flutter text animation widget that gradually fades the text in and out.
///
/// This widget uses [MultiAnimatedText] and applies the [FadeEffect],
/// which animates the opacity of the text over time.
///
/// ### Example
/// ```dart
/// FadeText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
/// )
/// ```
///
/// ### Features
/// - Smooth fade-in and fade-out animation for text.
/// - Looping animation mode supported (default).
/// - Compatible with [MultiAnimatedText] to combine with other effects.
///
/// ### Parameters
/// - `text`: The string to animate.
/// - `style`: Optional [TextStyle] for font size, weight, color, etc.
/// - `duration`: Duration of one complete fade cycle.
/// - `mode`: Animation mode: loop, forward, or reverse. Defaults to loop.
/// - `autoStart`: Automatically start animation if true.
/// - `controller`: Optional external [AnimationController] for custom control.
/// - `onStarted`, `onCompleted`, `onRepeated`: Optional lifecycle callbacks.
class FadeText extends MultiAnimatedText {
  FadeText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.mode = AnimatedTextMode.loop,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
  }) : super(effects: [FadeEffect()]);
}
