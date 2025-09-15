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
    final textStyle = const TextStyle(fontSize: 24, color: Colors.orange);

    final demos = [
      const ColorizedText(
        'Colorized Text',
        style: TextStyle(fontSize: 24),
        mode: AnimatedTextMode.loop,
      ),
      const WavingGradientText(
        'Waving Text',
        style: TextStyle(fontSize: 24),
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
      ),
      WaveMotionText(
        'Wave Motion Text',
        style: textStyle,
        mode: AnimatedTextMode.loop,
      ),
      const ShimmerText(
        'Shimmer Text',
        style: TextStyle(fontSize: 24),
        mode: AnimatedTextMode.loop,
      ),
      const FallingText(
        'Falling Text',
        style: TextStyle(fontSize: 24),
        mode: AnimatedTextMode.loop,
      ),
      const BouncingText(
        'Bouncing Text',
        style: TextStyle(fontSize: 24),
        mode: AnimatedTextMode.loop,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              for (var widget in demos) AnimatedTextDemo(child: widget),
            ],
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
      padding: const EdgeInsets.only(bottom: 24),
      child: SizedBox(width: double.infinity, child: child),
    );
  }
}
