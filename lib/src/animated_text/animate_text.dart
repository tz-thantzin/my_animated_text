import 'package:flutter/material.dart';
import 'package:my_animated_text/src/config/duration.dart';

import '../../animated_text_base.dart';
import '../config/text_effect.dart';
import '../effects/bouncing_effect.dart';
import '../effects/shake_effect.dart';
import '../effects/flip_effect.dart';
import '../effects/blur_effect.dart';
import '../effects/circling_effect.dart';
import '../effects/colorized_effect.dart';
import '../effects/fade_effect.dart';
import '../effects/falling_effect.dart';
import '../effects/marquee_effect.dart';
import '../effects/rotation_effect.dart';
import '../effects/scale_effect.dart';
import '../effects/shadow_effect.dart';
import '../effects/shimmer_effect.dart';
import '../effects/slide_effect.dart';
import '../effects/typewriter_effect.dart';
import '../effects/wave_motion_effect.dart';
import '../effects/waving_gradient_effect.dart';
import 'bouncing_text.dart';
import 'circling_text.dart';
import 'shimmer_text.dart';
import 'colorized_text.dart';
import 'multi_animated_text.dart';
import 'rotation_text.dart';
import 'slide_text.dart';
import 'waving_gradient_text.dart';

class AnimateText extends MultiAnimatedText {
  final Duration cursor;
  final Duration defaultEffectDuration;

  AnimateText(
    super.text, {
    super.key,
    super.style,
    super.duration = duration2000,
    super.mode = AnimatedTextMode.loop,
    super.autoStart = true,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    super.effects = const <TextEffect>[],
    this.cursor = Duration.zero,
    this.defaultEffectDuration = const Duration(milliseconds: 600),
  });

  AnimateText copyWith({
    Key? key,
    String? text,
    TextStyle? style,
    Duration? duration,
    AnimatedTextMode? mode,
    bool? autoStart,
    AnimationController? controller,
    VoidCallback? onStarted,
    VoidCallback? onCompleted,
    VoidCallback? onRepeated,
    List<TextEffect>? effects,
    Duration? cursor,
    Duration? defaultEffectDuration,
  }) {
    return AnimateText(
      text ?? this.text,
      key: key ?? this.key,
      style: style ?? this.style,
      duration: duration ?? this.duration,
      mode: mode ?? this.mode,
      autoStart: autoStart ?? this.autoStart,
      controller: controller ?? this.controller,
      onStarted: onStarted ?? this.onStarted,
      onCompleted: onCompleted ?? this.onCompleted,
      onRepeated: onRepeated ?? this.onRepeated,
      effects: effects ?? this.effects,
      cursor: cursor ?? this.cursor,
      defaultEffectDuration:
          defaultEffectDuration ?? this.defaultEffectDuration,
    );
  }

  AnimateText then({Duration delay = Duration.zero}) {
    return copyWith(cursor: _clampDuration(cursor + delay));
  }

  AnimateText addEffect(
    TextEffect effect, {
    Duration delay = Duration.zero,
    Duration? effectDuration,
    Curve? curve,
    bool advanceCursor = true,
  }) {
    final startTime = _clampDuration(cursor + delay);
    final endTime = _clampDuration(
      startTime + (effectDuration ?? defaultEffectDuration),
    );

    var begin = _fractionOf(startTime);
    var end = _fractionOf(endTime);

    if (end <= begin) {
      end = ((begin + 0.0001).clamp(0.0, 1.0) as num).toDouble();
      begin = (begin.clamp(0.0, end - 0.0001) as num).toDouble();
    }

    return copyWith(
      effects: [
        ...effects,
        effect.copyWithTiming(begin: begin, end: end, curve: curve),
      ],
      cursor: advanceCursor ? endTime : cursor,
    );
  }

  double _fractionOf(Duration value) {
    if (duration.inMicroseconds <= 0) {
      return 1.0;
    }
    return ((value.inMicroseconds / duration.inMicroseconds).clamp(0.0, 1.0)
            as num)
        .toDouble();
  }

  Duration _clampDuration(Duration value) {
    if (value <= Duration.zero) {
      return Duration.zero;
    }
    return value > duration ? duration : value;
  }
}

extension AnimateTextStringExtension on String {
  AnimateText animate({
    Key? key,
    TextStyle? style,
    Duration duration = duration2000,
    AnimatedTextMode mode = AnimatedTextMode.loop,
    bool autoStart = true,
    AnimationController? controller,
    VoidCallback? onStarted,
    VoidCallback? onCompleted,
    VoidCallback? onRepeated,
    Duration defaultEffectDuration = const Duration(milliseconds: 600),
  }) {
    return AnimateText(
      this,
      key: key,
      style: style,
      duration: duration,
      mode: mode,
      autoStart: autoStart,
      controller: controller,
      onStarted: onStarted,
      onCompleted: onCompleted,
      onRepeated: onRepeated,
      defaultEffectDuration: defaultEffectDuration,
    );
  }
}

extension AnimateTextEffectsExtension on AnimateText {
  AnimateText fade({
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeInOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      const FadeEffect(),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText scale({
    double beginScale = 0.2,
    double endScale = 1.1,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeInOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      ScaleEffect(beginScale: beginScale, endScale: endScale),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText blur({
    double beginSigma = 14.0,
    double endSigma = 0.0,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeOutCubic,
    bool advanceCursor = true,
  }) {
    return addEffect(
      BlurEffect(beginSigma: beginSigma, endSigma: endSigma),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText flip({
    FlipAxis axis = FlipAxis.vertical,
    double beginAngle = 1.5707963267948966,
    double endAngle = 0.0,
    Alignment alignment = Alignment.center,
    double perspective = 0.0018,
    bool fade = true,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeOutBack,
    bool advanceCursor = true,
  }) {
    return addEffect(
      FlipEffect(
        axis: axis,
        beginAngle: beginAngle,
        endAngle: endAngle,
        alignment: alignment,
        perspective: perspective,
        fade: fade,
      ),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText shake({
    ShakeAxis axis = ShakeAxis.horizontal,
    double distance = 12.0,
    int shakes = 4,
    double damping = 0.85,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      ShakeEffect(
        axis: axis,
        distance: distance,
        shakes: shakes,
        damping: damping,
      ),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText slide({
    SlideDirection direction = SlideDirection.leftToRight,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      SlideEffect(direction: direction),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText shimmer({
    List<Color> colors = defaultShimmerColors,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      ShimmerEffect(colors: colors),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText waveGradient({
    List<Color> colors = defaultWavingColors,
    WavingDirection direction = WavingDirection.leftToRight,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      WaveGradientEffect(colors: colors, direction: direction),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText colorize({
    List<Color> colors = defaultColorizeColors,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      ColorizeEffect(colors: colors),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText rotate({
    RotationDirection direction = RotationDirection.swing,
    double? degrees,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeInOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      RotationEffect(
        rotationDirection: direction,
        rotationDegrees: degrees,
      ),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText shadow({
    double blurBegin = 2.0,
    double blurEnd = 18.0,
    double offsetBegin = 0.0,
    double offsetEnd = 8.0,
    Color? color,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeInOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      ShadowEffect(
        blurBegin: blurBegin,
        blurEnd: blurEnd,
        offsetBegin: offsetBegin,
        offsetEnd: offsetEnd,
        color: color,
      ),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText bounce({
    double jumpHeight = 12.0,
    TextAnimationDirection direction = TextAnimationDirection.leftToRight,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.easeInOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      BounceEffect(jumpHeight: jumpHeight, direction: direction),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText fall({
    double fallHeight = 35.0,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.bounceOut,
    bool advanceCursor = true,
  }) {
    return addEffect(
      FallingEffect(fallHeight: fallHeight),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText typewriter({
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      const TypewriterEffect(),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText wave({
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      const WaveMotionEffect(),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText circle({
    CirclingDirection direction = CirclingDirection.anticlockwise,
    double minLetterPadding = 2.0,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      CirclingEffect(
        direction: direction,
        minLetterPadding: minLetterPadding,
      ),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }

  AnimateText marquee({
    double speed = 50.0,
    double spacing = 50.0,
    Duration delay = Duration.zero,
    Duration? duration,
    Curve curve = Curves.linear,
    bool advanceCursor = true,
  }) {
    return addEffect(
      MarqueeEffect(speed: speed, spacing: spacing),
      delay: delay,
      effectDuration: duration,
      curve: curve,
      advanceCursor: advanceCursor,
    );
  }
}
