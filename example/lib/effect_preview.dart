import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

void main() => runApp(
  EffectPreview(effect: Uri.base.queryParameters['effect'] ?? 'slide'),
);

/// Renders one public animation at a time for the README previews.
class EffectPreview extends StatelessWidget {
  const EffectPreview({required this.effect, super.key});

  final String effect;

  static const titles = <String, String>{
    'slide': 'SlideText',
    'typewriter': 'TypewriterText',
    'wave_motion': 'WaveMotionText',
    'waving_gradient': 'WavingGradientText',
    'shimmer': 'ShimmerText',
    'fade': 'FadeText',
    'scale': 'ScaleText',
    'rotation': 'RotationText',
    'marquee': 'MarqueeText',
    'falling': 'FallingText',
    'colorized': 'ColorizedText',
    'bouncing': 'BouncingText',
    'shadow': 'ShadowText',
    'blur': 'BlurText',
    'flip': 'FlipText',
    'shake': 'ShakeText',
    'scramble': 'ScrambleText',
    'circling': 'CirclingText',
    'multi': 'MultiAnimatedText',
    'fluent': 'AnimateText / String.animate()',
    'carousel': 'AnimatedTextCarousel',
  };

  static const _textStyle = TextStyle(
    color: Color(0xFFF4F7FF),
    fontSize: 32,
    fontWeight: FontWeight.w800,
    height: 1.2,
  );

  @override
  Widget build(BuildContext context) {
    final title = titles[effect] ?? 'Unknown effect';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0C1428),
        body: Center(
          child: Container(
            width: 720,
            height: 380,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(36),
            decoration: BoxDecoration(
              color: const Color(0xFF17243F),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: const Color(0xFF42597E)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MY ANIMATED TEXT  /  EFFECT PREVIEW',
                  style: TextStyle(
                    color: Color(0xFF91ADD2),
                    fontFamily: 'monospace',
                    fontSize: 12,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFC4F5EA),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 600,
                      height: 160,
                      child: Center(child: _animation()),
                    ),
                  ),
                ),
                const Text(
                  'Flutter text animation • my_animated_text',
                  style: TextStyle(color: Color(0xFF91ADD2), fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _animation() => switch (effect) {
    'slide' => SlideText(
      'SLIDE INTO VIEW',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'typewriter' => TypewriterText(
      'TYPE IT OUT',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'wave_motion' => WaveMotionText(
      'WAVE MOTION',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'waving_gradient' => WavingGradientText(
      'FLOWING COLORS',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'shimmer' => ShimmerText(
      'SHIMMERING TEXT',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'fade' => FadeText(
      'FADE IN AND OUT',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'scale' => ScaleText(
      'GROW WITH STYLE',
      style: _textStyle,
      beginScale: 0.35,
      endScale: 1.15,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'rotation' => RotationText(
      'TURN THE PAGE',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'marquee' => MarqueeText(
      'A MESSAGE IN MOTION • A MESSAGE IN MOTION',
      style: _textStyle,
      speed: 90,
      duration: const Duration(milliseconds: 4000),
    ),
    'falling' => FallingText(
      'LETTERS FALL',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
    ),
    'colorized' => ColorizedText(
      'EVERY SHADE',
      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
      duration: const Duration(milliseconds: 2400),
    ),
    'bouncing' => BouncingText(
      'BOUNCE BY LETTER',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
    ),
    'shadow' => ShadowText(
      'DEPTH AND GLOW',
      style: _textStyle.copyWith(color: const Color(0xFF60E9D8)),
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'blur' => BlurText(
      'COMING INTO FOCUS',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
    ),
    'flip' => FlipText(
      'FLIP TO REVEAL',
      style: _textStyle,
      duration: const Duration(milliseconds: 2400),
    ),
    'shake' => ShakeText(
      'PAY ATTENTION',
      style: _textStyle,
      distance: 18,
      duration: const Duration(milliseconds: 2400),
    ),
    'scramble' => ScrambleText(
      'MAKE WORDS COUNT',
      style: _textStyle.copyWith(fontFamily: 'monospace'),
      reveal: ScrambleReveal.random,
      seed: 17,
      duration: const Duration(milliseconds: 2400),
      mode: AnimatedTextMode.loop,
    ),
    'circling' => CirclingText(
      'AROUND THE WORLD • ',
      style: _textStyle.copyWith(fontSize: 18),
      duration: const Duration(milliseconds: 4000),
      direction: CirclingDirection.clockwise,
    ),
    'multi' => MultiAnimatedText(
      'STACKED EFFECTS',
      style: _textStyle,
      duration: const Duration(milliseconds: 3000),
      mode: AnimatedTextMode.loop,
      effects: const [
        FadeEffect(begin: 0, end: .35),
        ScaleEffect(begin: 0, end: .5),
        ShimmerEffect(begin: .4, end: 1),
      ],
    ),
    'fluent' =>
      'COMPOSE YOUR STORY'
          .animate(
            style: _textStyle,
            duration: const Duration(milliseconds: 3000),
          )
          .fade(
            duration: const Duration(milliseconds: 500),
            advanceCursor: false,
          )
          .slide(
            duration: const Duration(milliseconds: 700),
            advanceCursor: false,
          )
          .shimmer(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 1800),
            advanceCursor: false,
          ),
    'carousel' => AnimatedTextCarousel(
      phrases: const ['FIRST MESSAGE', 'NEXT IDEA', 'KEEP EXPLORING'],
      style: _textStyle,
      interval: const Duration(milliseconds: 1400),
      transitionDuration: const Duration(milliseconds: 350),
    ),
    _ => Text('Unknown effect: $effect', style: _textStyle),
  };
}
