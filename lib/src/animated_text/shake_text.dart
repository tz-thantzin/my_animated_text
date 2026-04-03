import '../../my_animated_text.dart';

class ShakeText extends MultiAnimatedText {
  final ShakeAxis axis;
  final double distance;
  final int shakes;
  final double damping;

  ShakeText(
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
    this.axis = ShakeAxis.horizontal,
    this.distance = 12.0,
    this.shakes = 4,
    this.damping = 0.85,
  }) : super(
         effects: [
           ShakeEffect(
             axis: axis,
             distance: distance,
             shakes: shakes,
             damping: damping,
           ),
         ],
       );
}
