import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: ColorizedText(
                    'Colorized Text',
                    style: TextStyle(fontSize: 24),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24), // Add spacing between widgets
                const SizedBox(
                  width: double.infinity,
                  child: WavingGradientText(
                    'Waving Text',
                    style: TextStyle(fontSize: 24),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: FadeText(
                    'Fade Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: TypewriterText(
                    'Typewriter Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: ScaleText(
                    'Scale Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: SlideText(
                    'Slide Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: MarqueeText(
                    'Marquee Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: RotationText(
                    'Rotation Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: WaveMotionText(
                    'Wave Motion Text',
                    style: TextStyle(fontSize: 24, color: Colors.orange),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: ShimmerText(
                    'Shimmer Text',
                    style: TextStyle(fontSize: 24),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
                const SizedBox(height: 24),
                const SizedBox(
                  width: double.infinity,
                  child: FallingText(
                    'Falling Text',
                    style: TextStyle(fontSize: 24),
                    mode: AnimatedTextMode.loop,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
