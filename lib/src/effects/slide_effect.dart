import 'package:flutter/material.dart';

import '../../my_animated_text.dart';
import '../config/text_effect.dart';

class SlideEffect extends TextEffect {
  final SlideDirection direction;

  SlideEffect({this.direction = SlideDirection.leftToRight});

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
    if (child is! Text) return child;

    final textStyle = style ?? const TextStyle();

    return _SlideTextAnimation(
      controller: controller,
      text: text,
      style: textStyle,
      direction: direction,
    );
  }
}

class _SlideTextAnimation extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final SlideDirection direction;
  final TextStyle? style;

  const _SlideTextAnimation({
    required this.controller,
    required this.text,
    required this.direction,
    this.style,
  });

  @override
  State<_SlideTextAnimation> createState() => _SlideTextAnimationState();
}

class _SlideTextAnimationState extends State<_SlideTextAnimation> {
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    final beginOffset = switch (widget.direction) {
      SlideDirection.leftToRight => const Offset(-1.0, 0.0),
      SlideDirection.rightToLeft => const Offset(1.0, 0.0),
      SlideDirection.topToBottom => const Offset(0.0, -1.0),
      SlideDirection.bottomToTop => const Offset(0.0, 1.0),
    };

    _slideAnimation = Tween<Offset>(begin: beginOffset, end: Offset.zero)
        .animate(
          CurvedAnimation(parent: widget.controller, curve: Curves.easeOut),
        );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: widget.controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(widget.text, style: widget.style),
      ),
    );
  }
}
