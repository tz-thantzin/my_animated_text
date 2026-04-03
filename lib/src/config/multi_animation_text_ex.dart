import 'package:my_animated_text/src/config/text_effect.dart';

import '../animated_text/animate_text.dart';
import '../animated_text/multi_animated_text.dart';

extension MultiAnimatedTextExtensions on MultiAnimatedText {
  /// Adds an additional [TextEffect] to the current [MultiAnimatedText].
  MultiAnimatedText withEffect(TextEffect effect) {
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
      effects: [...effects, effect],
    );
  }

  /// Adds multiple effects at once.
  MultiAnimatedText withEffects(List<TextEffect> newEffects) {
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
      effects: [...effects, ...newEffects],
    );
  }

  /// Converts the widget into the fluent animation composer.
  AnimateText compose({
    Duration cursor = Duration.zero,
    Duration defaultEffectDuration = const Duration(milliseconds: 600),
  }) {
    return AnimateText(
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
      effects: effects,
      cursor: cursor,
      defaultEffectDuration: defaultEffectDuration,
    );
  }
}
