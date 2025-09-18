import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Text Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(fontSize: 18, color: Colors.orange);

    final demos = [
      BouncingText(
        'Bounce Effect with Fade and Colorized!',
      ).withEffects([FadeEffect(), ColorizeEffect()]),
      ScaleText(
        'Scale Text with wave gradient',
      ).withEffect(WaveGradientEffect()),
      MultiAnimatedText(
        "Circling Text Effect with colorized",
        mode: AnimatedTextMode.loop,
        effects: [CirclingEffect(), ColorizeEffect()],
      ),

      MultiAnimatedText(
        "Falling Text Effect with Colorized",
        mode: AnimatedTextMode.loop,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        effects: [FallingEffect(), ColorizeEffect()],
      ),

      MultiAnimatedText(
        "Waving Text Effect with Typewriter",
        mode: AnimatedTextMode.loop,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        effects: [WaveGradientEffect(), TypewriterEffect()],
      ),

      MultiAnimatedText(
        "Rotation Text Effect",
        mode: AnimatedTextMode.loop,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        effects: [
          RotationEffect(
            rotationDirection: RotationDirection.clockwise,
            rotationDegrees: 180,
          ),
          WaveGradientEffect(),
          ShadowEffect(),
        ],
      ),
      ColorizedText(
        'Colorized Text',
        style: TextStyle(fontSize: 18),
        mode: AnimatedTextMode.loop,
      ),
      WavingGradientText(
        'Waving Text',
        style: TextStyle(fontSize: 18),
        mode: AnimatedTextMode.loop,
      ),
      FadeText('Fade Text', style: textStyle, mode: AnimatedTextMode.loop),
      ShadowText(
        'Shadow Text',
        style: textStyle,
        mode: AnimatedTextMode.reverseLoop,
      ),
      TypewriterText(
        'Typewriter Text',
        style: textStyle,
        mode: AnimatedTextMode.loop,
      ),
      ScaleText(
        'Scale Text',
        style: textStyle,
        mode: AnimatedTextMode.reverseLoop,
      ),
      SlideText(
        'Slide Text',
        style: textStyle,
        mode: AnimatedTextMode.reverseLoop,
      ),
      MarqueeText(
        'Marquee Text',
        style: textStyle,
        mode: AnimatedTextMode.loop,
      ),
      RotationText(
        'Rotation Text',
        style: textStyle,
        mode: AnimatedTextMode.loop,
        rotationDirection: RotationDirection.custom,
        rotationDegrees: 180,
      ),
      CirclingText(
        'Circling Text with clockwise direction',
        style: textStyle,
        mode: AnimatedTextMode.loop,
        direction: CirclingDirection.clockwise,
      ),
      WaveMotionText(
        'Wave Motion Text',
        style: textStyle,
        mode: AnimatedTextMode.loop,
      ),
      ShimmerText(
        'Shimmer Text',
        style: TextStyle(fontSize: 18),
        mode: AnimatedTextMode.loop,
      ),
      FallingText(
        'Falling Text',
        style: TextStyle(fontSize: 18),
        mode: AnimatedTextMode.loop,
      ),

      BouncingText(
        'Bouncing Text Bouncing Text Bouncing Text Bouncing Text Bouncing Text Bouncing Text',
        style: TextStyle(fontSize: 18),
        mode: AnimatedTextMode.loop,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [...demos.map((demo) => AnimatedTextDemo(child: demo))],
          ),
        ),
      ),
    );
  }
}

class AnimatedTextDemo extends StatelessWidget {
  final Widget child;
  const AnimatedTextDemo({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: SizedBox(width: double.infinity, child: child),
    );
  }
}
