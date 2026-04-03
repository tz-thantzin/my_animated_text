import '../../my_animated_text.dart';

class BlurText extends MultiAnimatedText {
  final double beginSigma;
  final double endSigma;

  BlurText(
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
    this.beginSigma = 14.0,
    this.endSigma = 0.0,
  }) : super(
         effects: [
           BlurEffect(beginSigma: beginSigma, endSigma: endSigma),
         ],
       );
}
