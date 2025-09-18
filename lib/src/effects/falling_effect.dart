import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class FallingEffect extends TextEffect {
  final double fallHeight;

  FallingEffect({this.fallHeight = 35.0});

  @override
  EffectLayer get layer => EffectLayer.widget;

  @override
  Widget build(
    BuildContext context,
    AnimationController controller,
    String text,
    TextStyle? style,
    Widget child,
  ) {
    final effectiveStyle = style ?? const TextStyle();
    return _FallingTextAnimation(
      controller: controller,
      text: text,
      style: effectiveStyle,
      fallHeight: fallHeight,
    );
  }
}

class _FallingTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle style;
  final double fallHeight;

  const _FallingTextAnimation({
    required this.controller,
    required this.text,
    required this.style,
    required this.fallHeight,
  });

  @override
  State<_FallingTextAnimation> createState() => _FallingTextAnimationState();
}

class _FallingTextAnimationState extends State<_FallingTextAnimation> {
  late final List<Animation<double>> _animations;
  late final List<String> _characters;

  @override
  void initState() {
    super.initState();
    _characters = widget.text.characters.toList();
    _animations = List.generate(_characters.length, (index) {
      final start = index / _characters.length;
      final end = (index + 1) / _characters.length;
      return Tween<double>(begin: -widget.fallHeight, end: 0.0).animate(
        CurvedAnimation(
          parent: widget.controller,
          curve: Interval(start, end, curve: Curves.bounceOut),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        return Wrap(
          alignment: WrapAlignment.start,
          children: List.generate(_characters.length, (index) {
            return Transform.translate(
              offset: Offset(0, _animations[index].value),
              child: Text(_characters[index], style: widget.style),
            );
          }),
        );
      },
    );
  }
}
