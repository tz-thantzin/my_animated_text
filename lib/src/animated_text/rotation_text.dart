import 'package:my_animated_text/my_animated_text.dart';

enum RotationDirection { swing, clockwise, anticlockwise, custom }

/// A text widget that animates with rotation.
///
/// The [RotationText] widget rotates the given text around its center.
/// You can choose swing, clockwise, anticlockwise, or specify a custom degree (max 360°).
///
/// Example:
/// ```dart
/// RotationText(
///   'Rotating Text!',
///   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
///   duration: Duration(seconds: 2),
///   mode: AnimatedTextMode.loop,
///   rotationDirection: RotationDirection.custom,
///   rotationDegrees: 90,
/// )
/// ```
///
/// Features:
/// - Swing rotation between -0.1 and 0.1 radians (default).
/// - Clockwise or anticlockwise rotation up to a user-defined degree.
/// - Throws error if user-defined degree > 360.
/// - Supports forward, reverse, and looping animation modes.
/// - Customizable duration, style, and animation control.
class RotationText extends MultiAnimatedText {
  /// Rotation direction: swing, clockwise, anticlockwise, or custom.
  final RotationDirection rotationDirection;

  /// Rotation in degrees (only used if rotationDirection is custom, max 360°)
  final double? rotationDegrees;

  /// Creates a rotation text animation.
  RotationText(
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
    this.rotationDirection = RotationDirection.swing,
    this.rotationDegrees,
  }) : assert(
         rotationDegrees == null || rotationDegrees <= 360,
         'rotationDegrees cannot exceed 360',
       ),
       super(
         effects: [
           RotationEffect(
             rotationDegrees: rotationDegrees,
             rotationDirection: rotationDirection,
           ),
         ],
       );
}
