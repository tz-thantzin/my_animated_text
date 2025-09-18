import 'package:my_animated_text/src/config/text_effect.dart';

import '../../my_animated_text.dart';

extension MultiAnimatedTextExtensions on MultiAnimatedText {
  /// Adds an additional [TextEffect] to the current MultiAnimatedText.
  /// Returns a new MultiAnimatedText with combined effects.
  MultiAnimatedText withEffect(TextEffect effect) {
    final newEffects = List<TextEffect>.from(effects)..add(effect);

    // Return a new MultiAnimatedText with combined effects
    return MultiAnimatedText(
      text,
      key: key,
      style: style,
      duration: duration,
      mode: mode,
      autoStart: autoStart,
      controller: controller,
      onStarted: onStarted,
      onCompleted: onCompleted,
      onRepeated: onRepeated,
      effects: newEffects,
    );
  }

  /// Adds multiple effects at once
  MultiAnimatedText withEffects(List<TextEffect> newEffects) {
    final combinedEffects = List<TextEffect>.from(effects)..addAll(newEffects);
    return MultiAnimatedText(
      text,
      key: key,
      style: style,
      duration: duration,
      mode: mode,
      autoStart: autoStart,
      controller: controller,
      onStarted: onStarted,
      onCompleted: onCompleted,
      onRepeated: onRepeated,
      effects: combinedEffects,
    );
  }
}
