import 'package:flutter/material.dart';
import 'package:my_animated_text/my_animated_text.dart';

void main() => runApp(const ScrambleDemo());

/// A focused, shareable preview of the scramble reveal effect.
class ScrambleDemo extends StatelessWidget {
  const ScrambleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF090E1D),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF141F3B), Color(0xFF090E1D)],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 42,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF17233D),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFF41587C)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 36,
                      offset: Offset(0, 18),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MY ANIMATED TEXT  /  SCRAMBLE REVEAL',
                      style: TextStyle(
                        color: Color(0xFF8EA8D0),
                        fontFamily: 'monospace',
                        fontSize: 13,
                        letterSpacing: 1.7,
                      ),
                    ),
                    const SizedBox(height: 34),
                    'MAKE EVERY WORD COUNT'
                        .animate(
                          duration: const Duration(milliseconds: 4200),
                          mode: AnimatedTextMode.loop,
                          style: const TextStyle(
                            color: Color(0xFFF6FAFF),
                            fontFamily: 'monospace',
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.2,
                          ),
                        )
                        .scramble(
                          reveal: ScrambleReveal.random,
                          seed: 17,
                          duration: const Duration(milliseconds: 2700),
                        ),
                    const SizedBox(height: 26),
                    const Text(
                      'A new effect for expressive headlines, status updates, and reveals.',
                      style: TextStyle(
                        color: Color(0xFFB7C9E8),
                        fontSize: 17,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF24406B),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Text(
                        'Seeded • Unicode aware • Composable',
                        style: TextStyle(
                          color: Color(0xFFC5F4E7),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
