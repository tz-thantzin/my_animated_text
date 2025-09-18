import 'package:flutter/material.dart';
import 'package:my_animated_text/src/config/duration.dart';

import '../my_animated_text.dart';

enum CirclingDirection { clockwise, anticlockwise }

/// ## CirclingText
///
/// A Flutter text animation widget that arranges text characters in a circular path
/// and rotates them continuously, creating a "circling" effects.
///
/// This widget uses [MultiAnimatedText] and applies the [CirclingEffect], which
/// positions each character along a circle and rotates the entire text over time.
///
/// ### Example
/// ```dart
/// CirclingText(
///   'Flutter',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
///   duration: Duration(seconds: 10),
///   radius: 50.0,
///   minLetterPadding: 2.0,
///   direction: CirclingDirection.clockwise,
/// )
/// ```
///
/// ### Features
/// - Positions text in a circular layout.
/// - Rotates continuously clockwise or anticlockwise.
/// - Adjustable circle radius and spacing between characters.
/// - Fully compatible with [MultiAnimatedText] to combine with other text effects.
///
/// ### Parameters
/// - `text`: The string to animate.
/// - `style`: Optional [TextStyle] for customizing font size, weight, and color.
/// - `duration`: Duration of one complete rotation. Defaults to `10 seconds`.
/// - `mode`: Animation mode: loop, forward, or reverse. Defaults to loop.
/// - `autoStart`: Automatically start animation if true.
/// - `controller`: Optional external [AnimationController] for custom control.
/// - `radius`: Circle radius. Defaults to `40.0`.
/// - `minLetterPadding`: Minimum space between letters. Defaults to `2.0`.
/// - `direction`: Rotation direction, clockwise or anticlockwise. Defaults to anticlockwise.
class CirclingText extends MultiAnimatedText {
  CirclingText(
    super.text, {
    super.key,
    super.style,
    super.duration = duration10000,
    super.mode = AnimatedTextMode.loop,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    double radius = 40.0,
    double minLetterPadding = 2.0,
    CirclingDirection direction = CirclingDirection.anticlockwise,
  }) : super(
         effects: [
           CirclingEffect(
             direction: direction,
             radius: radius,
             minLetterPadding: minLetterPadding,
           ),
         ],
       );
}
