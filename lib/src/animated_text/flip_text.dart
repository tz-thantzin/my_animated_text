import 'package:flutter/material.dart';

import '../../my_animated_text.dart';

class FlipText extends MultiAnimatedText {
  final FlipAxis axis;
  final double beginAngle;
  final double endAngle;
  final Alignment alignment;
  final double perspective;
  final bool fade;

  FlipText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.mode = AnimatedTextMode.loop,
    super.autoStart,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    this.axis = FlipAxis.vertical,
    this.beginAngle = 1.5707963267948966,
    this.endAngle = 0.0,
    this.alignment = Alignment.center,
    this.perspective = 0.0018,
    this.fade = true,
  }) : super(
         effects: [
           FlipEffect(
             axis: axis,
             beginAngle: beginAngle,
             endAngle: endAngle,
             alignment: alignment,
             perspective: perspective,
             fade: fade,
           ),
         ],
       );
}
