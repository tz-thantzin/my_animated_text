import '../../animated_text_base.dart';
import '../effects/scramble_effect.dart';
import 'multi_animated_text.dart';

/// Reveals text through a fast changing sequence of symbols.
///
/// Whitespace stays in place, and Unicode grapheme clusters resolve as units.
class ScrambleText extends MultiAnimatedText {
  ScrambleText(
    super.text, {
    super.key,
    super.style,
    super.duration = const Duration(milliseconds: 2400),
    super.mode = AnimatedTextMode.forward,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    String symbols = ScrambleEffect.defaultSymbols,
    ScrambleReveal reveal = ScrambleReveal.leftToRight,
    int seed = 0,
    double cyclesPerSecond = 24,
  }) : super(
         effects: [
           ScrambleEffect(
             symbols: symbols,
             reveal: reveal,
             seed: seed,
             cyclesPerSecond: cyclesPerSecond,
           ),
         ],
       );
}
