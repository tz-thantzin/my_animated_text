import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

void main() {
  runApp(const AnimatedTextExampleApp());
}

class AnimatedTextExampleApp extends StatelessWidget {
  const AnimatedTextExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_animated_text demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6D5EF5)),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  static const _headlineStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 1.15,
  );

  static const _demoTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const _compactDemoTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('my_animated_text'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeroCard(
                title: 'Compose expressive text animations',
                description:
                    'This example focuses on practical demos: fluent chaining, '
                    'clean multi-effect composition, new blur/flip/shake effects, '
                    'and ready-to-use text widgets.',
                tags: const ['Fluent API', 'Multi-effect', 'New effects'],
                child: 'Build smoother text motion'.animate(
                  style: _headlineStyle.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                  duration: const Duration(milliseconds: 2800),
                  mode: AnimatedTextMode.loop,
                )
                    .fade(
                      duration: const Duration(milliseconds: 420),
                      advanceCursor: false,
                    )
                    .slide(
                      direction: SlideDirection.bottomToTop,
                      duration: const Duration(milliseconds: 700),
                      advanceCursor: false,
                    )
                    .scale(
                      beginScale: 0.92,
                      endScale: 1.02,
                      duration: const Duration(milliseconds: 620),
                      advanceCursor: false,
                    )
                    .shimmer(
                      delay: const Duration(milliseconds: 220),
                      duration: const Duration(milliseconds: 1200),
                      advanceCursor: false,
                    ),
              ),
              const SizedBox(height: 28),
              DemoSection(
                title: 'Fluent composition',
                subtitle:
                    'Use animate() when you want readable timelines and flexible '
                    'overlap control for multiple effects.',
                children: [
                  DemoCard(
                    title: 'Polished entrance',
                    caption:
                        'Fade, slide, scale, and shimmer at the same time for a clean hero-style reveal.',
                    child: 'Elegant entrance'.animate(
                      style: _demoTextStyle,
                      duration: const Duration(milliseconds: 2300),
                    )
                        .fade(
                          duration: const Duration(milliseconds: 420),
                          advanceCursor: false,
                        )
                        .slide(
                          direction: SlideDirection.bottomToTop,
                          duration: const Duration(milliseconds: 650),
                          advanceCursor: false,
                        )
                        .scale(
                          beginScale: 0.9,
                          endScale: 1.03,
                          duration: const Duration(milliseconds: 650),
                          advanceCursor: false,
                        )
                        .shimmer(
                          delay: const Duration(milliseconds: 150),
                          duration: const Duration(milliseconds: 1000),
                          advanceCursor: false,
                        ),
                  ),
                  DemoCard(
                    title: 'Guided sequence',
                    caption:
                        'Use then() to keep the animation readable when each effect starts after the previous one.',
                    child: 'Timeline is easy'.animate(
                      style: _demoTextStyle,
                      duration: const Duration(milliseconds: 3000),
                    )
                        .fade(duration: const Duration(milliseconds: 280))
                        .then(delay: const Duration(milliseconds: 120))
                        .scale(
                          beginScale: 0.84,
                          endScale: 1.06,
                          duration: const Duration(milliseconds: 520),
                        )
                        .then(delay: const Duration(milliseconds: 80))
                        .colorize(
                          duration: const Duration(milliseconds: 1200),
                          advanceCursor: false,
                        ),
                  ),
                  DemoCard(
                    title: 'Neon headline',
                    caption:
                        'Shadow and gradient-driven motion works well for more expressive brand or splash text.',
                    child: 'Night mode energy'.animate(
                      style: _demoTextStyle.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                      duration: const Duration(milliseconds: 3200),
                    )
                        .fade(
                          duration: const Duration(milliseconds: 320),
                          advanceCursor: false,
                        )
                        .shadow(
                          blurBegin: 4,
                          blurEnd: 12,
                          offsetEnd: 3,
                          duration: const Duration(milliseconds: 800),
                          advanceCursor: false,
                        )
                        .waveGradient(
                          duration: const Duration(milliseconds: 1800),
                          advanceCursor: false,
                        ),
                  ),
                  DemoCard(
                    title: 'Character + widget mix',
                    caption:
                        'Combine typewriter with widget-level effects for reveal animations that still feel lightweight.',
                    child: 'Launch your next message'.animate(
                      style: _demoTextStyle,
                      duration: const Duration(milliseconds: 3200),
                    )
                        .typewriter(duration: const Duration(milliseconds: 1200))
                        .then(delay: const Duration(milliseconds: 80))
                        .shadow(
                          blurEnd: 14,
                          offsetEnd: 4,
                          duration: const Duration(milliseconds: 550),
                        )
                        .colorize(
                          duration: const Duration(milliseconds: 1000),
                          advanceCursor: false,
                        ),
                  ),
                  DemoCard(
                    title: 'Glass flip reveal',
                    caption:
                        'Blur, flip, and shimmer combine into a more dramatic reveal without losing composition control.',
                    child: 'Flip into focus'.animate(
                      style: _demoTextStyle,
                      duration: const Duration(milliseconds: 2800),
                    )
                        .blur(
                          beginSigma: 18,
                          endSigma: 0,
                          duration: const Duration(milliseconds: 650),
                          advanceCursor: false,
                        )
                        .flip(
                          axis: FlipAxis.vertical,
                          duration: const Duration(milliseconds: 780),
                          advanceCursor: false,
                        )
                        .shimmer(
                          delay: const Duration(milliseconds: 220),
                          duration: const Duration(milliseconds: 1200),
                          advanceCursor: false,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              DemoSection(
                title: 'MultiAnimatedText presets',
                subtitle:
                    'Use MultiAnimatedText when you want to declare a fixed stack '
                    'of effects directly.',
                children: [
                  DemoCard(
                    title: 'Readable effect stack',
                    caption:
                        'A simple stack of widget-level effects that works well together.',
                    child: MultiAnimatedText(
                      'Smooth stacked effects',
                      duration: const Duration(milliseconds: 2200),
                      mode: AnimatedTextMode.loop,
                      style: _compactDemoTextStyle,
                      effects: const [
                        FadeEffect(begin: 0.0, end: 0.22),
                        ScaleEffect(
                          beginScale: 0.9,
                          endScale: 1.05,
                          begin: 0.0,
                          end: 0.35,
                        ),
                        ColorizeEffect(begin: 0.25, end: 1.0),
                      ],
                    ),
                  ),
                  DemoCard(
                    title: 'Guided reveal',
                    caption:
                        'Typewriter for the reveal, with supporting widget effects layered on top.',
                    child: MultiAnimatedText(
                      'Compose without the mess',
                      duration: const Duration(milliseconds: 2800),
                      mode: AnimatedTextMode.loop,
                      style: _compactDemoTextStyle,
                      effects: const [
                        TypewriterEffect(begin: 0.0, end: 0.45),
                        SlideEffect(
                          direction: SlideDirection.bottomToTop,
                          begin: 0.0,
                          end: 0.35,
                        ),
                        ShadowEffect(
                          begin: 0.35,
                          end: 0.8,
                          blurEnd: 12,
                          offsetEnd: 4,
                        ),
                      ],
                    ),
                  ),
                  DemoCard(
                    title: 'Preset + continue',
                    caption:
                        'Start with withEffects() and switch into compose() for more timeline control.',
                    child: BouncingText(
                      'Flexible API flow',
                      style: _compactDemoTextStyle,
                      duration: const Duration(milliseconds: 2600),
                      mode: AnimatedTextMode.loop,
                    )
                        .withEffects(const [
                          FadeEffect(begin: 0.0, end: 0.25),
                          ColorizeEffect(begin: 0.2, end: 1.0),
                        ])
                        .compose()
                        .then(delay: const Duration(milliseconds: 150))
                        .shimmer(
                          duration: const Duration(milliseconds: 900),
                          advanceCursor: false,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              DemoSection(
                title: 'Signature animation styles',
                subtitle:
                    'These ready-made widgets cover the most common text motion styles '
                    'without building an effect list yourself.',
                children: [
                  DemoCard(
                    title: 'FadeText',
                    caption: 'Simple opacity animation for subtle entrances.',
                    child: FadeText(
                      'Soft fade in',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'SlideText',
                    caption: 'Directional movement for labels and callouts.',
                    child: SlideText(
                      'Slide from bottom',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                      direction: SlideDirection.bottomToTop,
                    ),
                  ),
                  DemoCard(
                    title: 'ScaleText',
                    caption: 'A clean zoom effect for emphasis.',
                    child: ScaleText(
                      'Grow into focus',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                      beginScale: 0.75,
                      endScale: 1.06,
                    ),
                  ),
                  DemoCard(
                    title: 'RotationText',
                    caption: 'A lively swing animation for punchy headlines.',
                    child: RotationText(
                      'Rotate with style',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                      rotationDirection: RotationDirection.swing,
                    ),
                  ),
                  DemoCard(
                    title: 'ShadowText',
                    caption: 'Depth and glow without changing the text content.',
                    child: ShadowText(
                      'Soft depth layer',
                      style: _compactDemoTextStyle.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'ShimmerText',
                    caption: 'Useful for attention-grabbing titles and tags.',
                    child: ShimmerText(
                      'Shimmer headline',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'BlurText',
                    caption: 'Bring text into focus for cinematic reveals and hero copy.',
                    child: BlurText(
                      'Focus from blur',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'FlipText',
                    caption: 'A 3D-style card flip effect for punchier entrances.',
                    child: FlipText(
                      'Flip to reveal',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                      axis: FlipAxis.vertical,
                    ),
                  ),
                  DemoCard(
                    title: 'ShakeText',
                    caption: 'Great for alerts, errors, and attention states.',
                    child: ShakeText(
                      'Needs attention',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                      distance: 10,
                      shakes: 5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              DemoSection(
                title: 'Character-driven styles',
                subtitle:
                    'These effects work at the letter level, which is useful for playful or highly expressive text.',
                children: [
                  DemoCard(
                    title: 'TypewriterText',
                    caption: 'Classic character-by-character reveal.',
                    child: TypewriterText(
                      'Typed copy feels alive',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'WaveMotionText',
                    caption: 'Creates a moving wave across each character.',
                    child: WaveMotionText(
                      'Wave through every letter',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'BouncingText',
                    caption: 'Characters bounce one after another for playful motion.',
                    child: BouncingText(
                      'Bounce one by one',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'FallingText',
                    caption: 'Letters fall into place with a soft bounce.',
                    child: FallingText(
                      'Drop into place',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'ColorizedText',
                    caption: 'Cycle through multiple colors for vibrant labels.',
                    child: ColorizedText(
                      'Dynamic palette',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                  DemoCard(
                    title: 'WavingGradientText',
                    caption: 'A flowing gradient works well for promotional copy.',
                    child: WavingGradientText(
                      'Gradient in motion',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              DemoSection(
                title: 'Special layouts',
                subtitle:
                    'These effects change the text layout more dramatically and are best used in dedicated spaces.',
                children: [
                  DemoCard(
                    title: 'CirclingText',
                    caption: 'Text arranged around a circular path for logos or loading states.',
                    child: Center(
                      child: CirclingText(
                        'Spin around',
                        style: _compactDemoTextStyle.copyWith(fontSize: 16),
                        duration: const Duration(milliseconds: 4200),
                        mode: AnimatedTextMode.loop,
                      ),
                    ),
                  ),
                  DemoCard(
                    title: 'MarqueeText',
                    caption:
                        'Best for longer messages in banners, status strips, and tickers.',
                    child: MarqueeText(
                      'This package now supports cleaner effect composition for longer animated text demos.',
                      style: _compactDemoTextStyle,
                      mode: AnimatedTextMode.loop,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.title,
    required this.description,
    required this.child,
    this.tags = const <String>[],
  });

  final String title;
  final String description;
  final Widget child;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFF2F0FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in tags) _TagChip(label: tag),
            ],
          ),
          if (tags.isNotEmpty) const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: theme.textTheme.bodyLarge?.copyWith(height: 1.45),
          ),
          const SizedBox(height: 20),
          child,
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'Tip: use advanceCursor: false for overlapping effects and then() for sequential timelines.',
              style: TextStyle(fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}

class DemoSection extends StatelessWidget {
  const DemoSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final columns = width >= 1080
                ? 3
                : width >= 700
                ? 2
                : 1;
            const gap = 16.0;
            final cardWidth = (width - (columns - 1) * gap) / columns;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final child in children)
                  SizedBox(width: cardWidth, child: child),
              ],
            );
          },
        ),
      ],
    );
  }
}

class DemoCard extends StatelessWidget {
  const DemoCard({
    super.key,
    required this.title,
    required this.caption,
    required this.child,
  });

  final String title;
  final String caption;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: theme.colorScheme.outlineVariant),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            caption,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.45),
          ),
          const SizedBox(height: 20),
          SizedBox(width: double.infinity, child: child),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
