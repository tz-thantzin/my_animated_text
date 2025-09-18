import 'package:flutter/material.dart';

import '../../animated_text_base.dart';
import '../effects/bouncing_effect.dart';
import 'multi_animated_text.dart';

enum TextAnimationDirection { leftToRight, rightToLeft }

/// ## BouncingText
///
/// A Flutter text animation widget that makes each character "bounce" sequentially.
///
/// This widget uses [MultiAnimatedText] and applies the [BounceEffect] to animate
/// individual characters with a vertical jump. You can control the direction of
/// animation (left-to-right or right-to-left) and the jump height.
///
/// ### Example
/// ```dart
/// BouncingText(
///   'Hello Flutter!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
///   jumpHeight: 12.0,
///   direction: TextAnimationDirection.leftToRight,
/// )
/// ```
///
/// ### Features
/// - Sequential character animation with bouncing effects.
/// - Configurable jump height and animation direction.
/// - Supports looping, forward, or reverse modes via [AnimatedTextMode].
/// - Fully compatible with [MultiAnimatedText] to combine with other effects.
///
/// ### Parameters
/// - `text`: The string to animate.
/// - `style`: Optional [TextStyle] for customizing font size, weight, and color.
/// - `duration`: Optional animation duration. Defaults to package defaults.
/// - `mode`: Animation mode: loop, forward, or reverse.
/// - `autoStart`: Automatically start animation if true.
/// - `controller`: Optional external [AnimationController] for custom control.
/// - `jumpHeight`: Maximum vertical jump height for each character. Default is 12.0.
/// - `direction`: Direction of character animation. Default is `leftToRight`.
class BouncingText extends MultiAnimatedText {
  BouncingText(
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
    double jumpHeight = 12.0,
    TextAnimationDirection direction = TextAnimationDirection.leftToRight,
  }) : super(
         effects: [BounceEffect(jumpHeight: jumpHeight, direction: direction)],
       );
}
