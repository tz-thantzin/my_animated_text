import 'package:flutter/material.dart';

import '../../animated_text_base.dart';
import '../config/text_effect.dart';

class MarqueeEffect extends TextEffect {
  final double speed; // pixels per second
  final AnimatedTextMode mode;
  MarqueeEffect({this.speed = 50.0, this.mode = AnimatedTextMode.loop});

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
    final textStyle = style ?? const TextStyle();
    return _MarqueeTextAnimation(
      text: text,
      style: textStyle,
      speed: speed,
      controller: controller,
      mode: mode,
    );
  }
}

/// Internal widget that manages the marquee scroll effect for [MarqueeText].
class _MarqueeTextAnimation extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double speed;
  final AnimationController controller;
  final AnimatedTextMode mode;

  const _MarqueeTextAnimation({
    required this.text,
    this.style,
    required this.speed,
    required this.controller,
    required this.mode,
  });

  @override
  State<_MarqueeTextAnimation> createState() => _MarqueeTextAnimationState();
}

class _MarqueeTextAnimationState extends State<_MarqueeTextAnimation> {
  final GlobalKey _textKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  double _textWidth = 0;

  @override
  void initState() {
    super.initState();

    // Wait until layout is complete to measure text width
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _textWidth = _textKey.currentContext?.size?.width ?? 0;
      final totalScrollWidth = _textWidth + 50;
      final durationSeconds = totalScrollWidth / widget.speed;

      // Ensure positive duration before assigning
      if (durationSeconds > 0) {
        widget.controller.duration = Duration(seconds: durationSeconds.toInt());

        if (widget.controller.status == AnimationStatus.dismissed) {
          widget.controller.forward();
        }
      }

      // Link the controller's value to the scroll offset
      widget.controller.addListener(() {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(
            (widget.controller.value * totalScrollWidth),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLooping = widget.mode == AnimatedTextMode.loop;

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.text, key: _textKey, style: widget.style),
              // Add duplicates for looping marquee effect
              if (isLooping) ...[
                const SizedBox(width: 50),
                Text(widget.text, style: widget.style),
                const SizedBox(width: 50),
                Text(widget.text, style: widget.style),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
