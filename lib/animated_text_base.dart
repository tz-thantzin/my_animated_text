import 'package:flutter/material.dart';

/// Defines how the animated text should play.
enum AnimatedTextMode { forward, reverse, loop, reverseLoop }

/// Base class for creating custom animated text widgets.
///
/// Handles the [AnimationController] lifecycle and common callbacks for
/// starting, completing, and repeating animations.
///
/// Subclasses must implement [buildAnimation] to define the widget's animation.
///
/// Example:
/// ```dart
/// class MyAnimatedText extends AnimatedTextBase {
///   const MyAnimatedText(String text, {super.key}) : super(text);
///
///   @override
///   Widget buildAnimation(BuildContext context, AnimationController controller) {
///     return FadeTransition(
///       opacity: controller,
///       child: Text(text),
///     );
///   }
/// }
/// ```
abstract class AnimatedTextBase extends StatefulWidget {
  /// The text to animate.
  final String text;

  /// Duration of the animation. If a controller is provided, this is ignored.
  final Duration duration;

  /// Optional text style.
  final TextStyle? style;

  /// Determines how the animation should play.
  final AnimatedTextMode mode;

  /// Automatically start animation when the widget is initialized.
  final bool autoStart;

  /// Optional external AnimationController. If null, one will be created internally.
  final AnimationController? controller;

  /// Callback triggered when animation starts (forward).
  final VoidCallback? onStarted;

  /// Callback triggered when animation completes.
  final VoidCallback? onCompleted;

  /// Callback triggered when the animation repeats (loop or reverse).
  final VoidCallback? onRepeated;

  const AnimatedTextBase(
    this.text, {
    super.key,
    this.duration = const Duration(milliseconds: 2000),
    this.style,
    this.mode = AnimatedTextMode.forward,
    this.autoStart = true,
    this.controller,
    this.onStarted,
    this.onCompleted,
    this.onRepeated,
  });

  /// Subclasses must implement this to build the animated widget.
  Widget buildAnimation(BuildContext context, AnimationController controller);

  @override
  State<AnimatedTextBase> createState() => _AnimatedTextBaseState();
}

class _AnimatedTextBaseState extends State<AnimatedTextBase>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    // Use provided controller or create a new one.
    controller =
        widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);

    // Listen to animation status to trigger callbacks.
    controller.addStatusListener(_handleStatus);

    // Start animation automatically if requested.
    if (widget.autoStart) {
      _startAnimation();
    }
  }

  void _handleStatus(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        widget.onStarted?.call();
        break;
      case AnimationStatus.completed:
        widget.onCompleted?.call();
        if (widget.mode == AnimatedTextMode.loop) {
          widget.onRepeated?.call();
        } else if (widget.mode == AnimatedTextMode.reverseLoop) {
          widget.onRepeated?.call();
        }
        break;
      case AnimationStatus.reverse:
        if (widget.mode == AnimatedTextMode.reverseLoop) {
          widget.onRepeated?.call();
        }
        break;
      case AnimationStatus.dismissed:
        // Nothing to do: repeat(reverse:true) handles it
        break;
    }
  }

  void _startAnimation() {
    switch (widget.mode) {
      case AnimatedTextMode.forward:
        controller.forward();
        break;
      case AnimatedTextMode.reverse:
        controller.reverse(from: 1.0);
        break;
      case AnimatedTextMode.loop:
        controller.repeat();
        break;
      case AnimatedTextMode.reverseLoop:
        controller.repeat(reverse: true); // automatic back-and-forth
        break;
    }
  }

  @override
  void dispose() {
    // Dispose only if we created the controller internally
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildAnimation(context, controller);
  }
}
