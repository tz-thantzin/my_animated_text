import 'dart:async';

import 'package:flutter/material.dart';

/// Cycles through phrases with an animated transition between each phrase.
///
/// The carousel is useful for rotating short headlines, status messages, or
/// product highlights. Set [autoPlay] to false to advance it with
/// [AnimatedTextCarouselState.next].
class AnimatedTextCarousel extends StatefulWidget {
  /// The phrases shown by the carousel.
  final List<String> phrases;

  /// Time each phrase remains visible before advancing.
  final Duration interval;

  /// Duration of the transition between phrases.
  final Duration transitionDuration;

  /// Direction in which the incoming phrase travels.
  final Axis direction;

  /// Whether phrases advance automatically.
  final bool autoPlay;

  /// Whether automatic playback resumes after the pointer leaves the widget.
  final bool pauseOnHover;

  /// Style applied to every phrase.
  final TextStyle? style;

  /// Alignment for each phrase.
  final TextAlign? textAlign;

  /// Maximum number of visible lines.
  final int? maxLines;

  /// Overflow behavior for long phrases.
  final TextOverflow? overflow;

  /// Called when playback or a manual control selects a different index.
  final ValueChanged<int>? onChanged;

  const AnimatedTextCarousel({
    required this.phrases,
    this.interval = const Duration(seconds: 3),
    this.transitionDuration = const Duration(milliseconds: 450),
    this.direction = Axis.vertical,
    this.autoPlay = true,
    this.pauseOnHover = false,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.onChanged,
    super.key,
  }) : assert(phrases.length > 0),
       assert(interval > Duration.zero),
       assert(transitionDuration >= Duration.zero);

  @override
  State<AnimatedTextCarousel> createState() => AnimatedTextCarouselState();
}

/// State and manual controls for an [AnimatedTextCarousel].
class AnimatedTextCarouselState extends State<AnimatedTextCarousel> {
  Timer? _timer;
  int _index = 0;
  bool _hovered = false;

  /// Index of the phrase currently being displayed.
  int get index => _index;

  /// Advances to the next phrase, wrapping to the first phrase at the end.
  void next() => _show((_index + 1) % widget.phrases.length, manual: true);

  /// Moves to the previous phrase, wrapping to the final phrase at the start.
  void previous() => _show(
    (_index - 1 + widget.phrases.length) % widget.phrases.length,
    manual: true,
  );

  /// Shows [index], wrapping it into the available phrase range.
  void show(int index) {
    final normalized =
        ((index % widget.phrases.length) + widget.phrases.length) %
        widget.phrases.length;
    _show(normalized, manual: true);
  }

  void _show(int index, {bool manual = false}) {
    if (index == _index || widget.phrases.length < 2) return;
    setState(() => _index = index);
    if (manual) _syncTimer();
    widget.onChanged?.call(index);
  }

  void _syncTimer() {
    _timer?.cancel();
    if (widget.autoPlay &&
        (!widget.pauseOnHover || !_hovered) &&
        widget.phrases.length > 1) {
      _timer = Timer.periodic(
        widget.interval,
        (_) => _show((_index + 1) % widget.phrases.length),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _syncTimer();
  }

  @override
  void didUpdateWidget(covariant AnimatedTextCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_index >= widget.phrases.length) {
      _index = widget.phrases.length - 1;
    }
    if (widget.autoPlay != oldWidget.autoPlay ||
        widget.interval != oldWidget.interval ||
        widget.pauseOnHover != oldWidget.pauseOnHover ||
        widget.phrases.length != oldWidget.phrases.length) {
      _syncTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final distance = widget.direction == Axis.vertical
        ? const Offset(0, .25)
        : const Offset(.25, 0);
    return MouseRegion(
      onEnter: (_) {
        _hovered = true;
        if (widget.pauseOnHover) _syncTimer();
      },
      onExit: (_) {
        _hovered = false;
        if (widget.pauseOnHover) _syncTimer();
      },
      child: Semantics(
        liveRegion: true,
        label: widget.phrases[_index],
        excludeSemantics: true,
        child: AnimatedSwitcher(
          duration: widget.transitionDuration,
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(begin: distance, end: Offset.zero)
                  .animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    ),
                  ),
              child: child,
            ),
          ),
          child: Text(
            widget.phrases[_index],
            key: ValueKey((_index, widget.phrases[_index])),
            style: widget.style,
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
            overflow: widget.overflow,
          ),
        ),
      ),
    );
  }
}
