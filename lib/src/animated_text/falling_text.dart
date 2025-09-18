import '../my_animated_text.dart';
import 'effects/falling_effect.dart';

/// ## FallingText
///
/// A Flutter text animation widget where each character "falls" into place
/// from above, creating a bouncing entrance effect.
///
/// This widget uses [MultiAnimatedText] with the [FallingEffect],
/// animating each character independently with a vertical drop and bounce.
///
/// ### Example
/// ```dart
/// FallingText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
/// )
/// ```
///
/// ### Features
/// - Each character falls independently with a bounce.
/// - Looping, forward, or reverse animation modes.
/// - Works seamlessly with [MultiAnimatedText] to combine effects.
///
/// ### Parameters
/// - `text`: The string to animate.
/// - `style`: Optional [TextStyle] for font size, weight, color, etc.
/// - `duration`: Duration of the overall falling animation.
/// - `mode`: Animation mode (loop, forward, reverse). Defaults to loop.
/// - `autoStart`: Automatically start animation if true.
/// - `controller`: Optional external [AnimationController] for custom control.
/// - `onStarted`, `onCompleted`, `onRepeated`: Optional animation lifecycle callbacks.

class FallingText extends MultiAnimatedText {
  FallingText(
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
  }) : super(effects: [FallingEffect()]);
}
