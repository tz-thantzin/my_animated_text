import 'package:flutter/material.dart';

import '../config/text_effect.dart';

/// The order in which a [ScrambleEffect] resolves its characters.
enum ScrambleReveal { leftToRight, rightToLeft, random }

/// Replaces unresolved grapheme clusters with changing symbols.
///
/// The replacement sequence and random reveal order are deterministic for a
/// given [seed], so unrelated rebuilds do not change the current frame.
class ScrambleEffect extends TextEffect {
  /// Default replacement alphabet.
  static const defaultSymbols = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  /// Symbols used while a character has not resolved.
  final String symbols;

  /// Order in which characters resolve to the original text.
  final ScrambleReveal reveal;

  /// Seed used for the symbol sequence and random reveal order.
  final int seed;

  /// Approximate number of symbol changes per second.
  final double cyclesPerSecond;

  const ScrambleEffect({
    this.symbols = defaultSymbols,
    this.reveal = ScrambleReveal.leftToRight,
    this.seed = 0,
    this.cyclesPerSecond = 24,
    super.begin,
    super.end,
    super.curve = Curves.linear,
  }) : assert(symbols.length > 0),
       assert(cyclesPerSecond > 0);

  @override
  EffectLayer get layer => EffectLayer.character;

  @override
  ScrambleEffect copyWithTiming({double? begin, double? end, Curve? curve}) {
    return ScrambleEffect(
      symbols: symbols,
      reveal: reveal,
      seed: seed,
      cyclesPerSecond: cyclesPerSecond,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      curve: curve ?? this.curve,
    );
  }

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final original = text.characters.toList(growable: false);
    final replacements = symbols.characters.toList(growable: false);
    final positions = [
      for (var index = 0; index < original.length; index++)
        if (original[index].trim().isNotEmpty) index,
    ];

    switch (reveal) {
      case ScrambleReveal.leftToRight:
        break;
      case ScrambleReveal.rightToLeft:
        positions.sort((a, b) => b.compareTo(a));
        break;
      case ScrambleReveal.random:
        positions.sort((a, b) {
          final comparison = _mix(seed ^ a).compareTo(_mix(seed ^ b));
          return comparison == 0 ? a.compareTo(b) : comparison;
        });
        break;
    }

    final rank = List<int>.filled(original.length, 0);
    for (var order = 0; order < positions.length; order++) {
      rank[positions[order]] = order;
    }

    final animation = animationOf(controller);
    final windowSeconds =
        (controller.duration?.inMicroseconds ??
            const Duration(seconds: 2).inMicroseconds) /
        Duration.microsecondsPerSecond *
        (end - begin);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final progress = animation.value;
        final revealed = (positions.length * progress).floor();
        final frame = (progress * windowSeconds * cyclesPerSecond).floor();
        final displayed = [
          for (var index = 0; index < original.length; index++)
            if (original[index].trim().isEmpty || rank[index] < revealed)
              original[index]
            else
              replacements[_mix(seed ^ (index * 0x9e3779b9) ^ frame) %
                  replacements.length],
        ].join();

        return Semantics(
          label: text,
          excludeSemantics: true,
          child: Text(displayed, style: style),
        );
      },
    );
  }
}

int _mix(int value) {
  var result = value & 0x7fffffff;
  result = ((result ^ (result >> 16)) * 0x45d9f3b) & 0x7fffffff;
  result = ((result ^ (result >> 16)) * 0x45d9f3b) & 0x7fffffff;
  return result ^ (result >> 16);
}
