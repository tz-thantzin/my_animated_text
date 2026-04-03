import 'package:flutter/material.dart';

/// Defines how the animated text should play.
enum AnimatedTextMode { forward, reverse, loop, reverseLoop }

/// Base class for creating custom animated text widgets.
///
/// Handles the [AnimationController] lifecycle and common callbacks for
/// starting, completing, and repeating animations.
///
/// Subclasses must implement [buildAnimation] to define the widget's animation.
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
  AnimationController? _internalController;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _resolveController(widget.controller);
    _controller.addStatusListener(_handleStatus);

    if (widget.autoStart) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _startAnimation(reset: true);
        }
      });
    }
  }

  AnimationController _resolveController(AnimationController? external) {
    if (external != null) {
      return external;
    }

    final controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _internalController = controller;
    return controller;
  }

  void _handleStatus(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.forward:
        widget.onStarted?.call();
        break;
      case AnimationStatus.completed:
        widget.onCompleted?.call();
        if (widget.mode == AnimatedTextMode.loop ||
            widget.mode == AnimatedTextMode.reverseLoop) {
          widget.onRepeated?.call();
        }
        break;
      case AnimationStatus.reverse:
        if (widget.mode == AnimatedTextMode.reverseLoop) {
          widget.onRepeated?.call();
        }
        break;
      case AnimationStatus.dismissed:
        break;
    }
  }

  void _startAnimation({bool reset = false}) {
    switch (widget.mode) {
      case AnimatedTextMode.forward:
        _controller.forward(from: reset ? 0.0 : _controller.value);
        break;
      case AnimatedTextMode.reverse:
        _controller.reverse(from: reset ? 1.0 : _controller.value);
        break;
      case AnimatedTextMode.loop:
        _controller.repeat();
        break;
      case AnimatedTextMode.reverseLoop:
        _controller.repeat(reverse: true);
        break;
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedTextBase oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      _controller.removeStatusListener(_handleStatus);

      if (oldWidget.controller == null) {
        _internalController?.dispose();
        _internalController = null;
      }

      _controller = _resolveController(widget.controller);
      _controller.addStatusListener(_handleStatus);

      if (widget.autoStart) {
        _startAnimation(reset: true);
      }
      return;
    }

    if (widget.controller == null && oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }

    if (oldWidget.autoStart != widget.autoStart && widget.autoStart) {
      _startAnimation(reset: true);
      return;
    }

    if (oldWidget.mode != widget.mode && widget.autoStart) {
      _startAnimation(reset: true);
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_handleStatus);
    if (widget.controller == null) {
      _internalController?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildAnimation(context, _controller);
  }
}
