import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../config/text_effect.dart';

class ShadowEffect extends TextEffect {
  final double blurBegin;
  final double blurEnd;
  final double offsetBegin;
  final double offsetEnd;
  final Color? color;

  ShadowEffect({
    this.blurBegin = 2.0,
    this.blurEnd = 18.0,
    this.offsetBegin = 0.0,
    this.offsetEnd = 8.0,
    this.color,
  });

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
    return _ShadowWrapper(
      controller: controller,
      child: child,
      blurBegin: blurBegin,
      blurEnd: blurEnd,
      offsetBegin: offsetBegin,
      offsetEnd: offsetEnd,
      color: color ?? style?.color?.withValues(alpha: 0.5) ?? Colors.black54,
    );
  }
}

class _ShadowWrapper extends StatefulWidget {
  final Widget child;
  final AnimationController controller;
  final double blurBegin;
  final double blurEnd;
  final double offsetBegin;
  final double offsetEnd;
  final Color color;

  const _ShadowWrapper({
    required this.child,
    required this.controller,
    required this.blurBegin,
    required this.blurEnd,
    required this.offsetBegin,
    required this.offsetEnd,
    required this.color,
  });

  @override
  State<_ShadowWrapper> createState() => _ShadowWrapperState();
}

class _ShadowWrapperState extends State<_ShadowWrapper> {
  late Animation<double> _blurAnim;
  late Animation<double> _offsetAnim;

  @override
  void initState() {
    super.initState();
    _blurAnim = Tween<double>(begin: widget.blurBegin, end: widget.blurEnd)
        .animate(
          CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
        );
    _offsetAnim =
        Tween<double>(begin: widget.offsetBegin, end: widget.offsetEnd).animate(
          CurvedAnimation(parent: widget.controller, curve: Curves.easeInOut),
        );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Transform.translate(
              offset: Offset(0, _offsetAnim.value),
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(
                  sigmaX: _blurAnim.value,
                  sigmaY: _blurAnim.value,
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
                  child: widget.child,
                ),
              ),
            ),
            // Original widget on top
            widget.child,
          ],
        );
      },
    );
  }
}
