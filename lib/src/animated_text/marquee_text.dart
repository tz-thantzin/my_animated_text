import '../../my_animated_text.dart';

/// ## MarqueeText
///
/// A Flutter text animation widget that scrolls text horizontally like a marquee.
///
/// This widget uses [MultiAnimatedText] with the [MarqueeEffect] to create a
/// smooth, continuous scrolling effect.
///
/// ### Example
/// ```dart
/// MarqueeText(
///   'Flutter makes beautiful UIs!',
///   style: TextStyle(fontSize: 20, color: Colors.blue),
///   speed: 80, // pixels per second
/// )
/// ```
///
/// ### Features
/// - Smooth horizontal scrolling of text.
/// - Adjustable speed in pixels per second.
/// - Configurable spacing between repeated text for looping marquee effect.
/// - Works with [MultiAnimatedText] to combine multiple effects.
///
/// ### Parameters
/// - `text`: The string to scroll.
/// - `style`: Optional [TextStyle] for font size, weight, color, etc.
/// - `duration`: Duration of the animation (used internally for controlling loop).
/// - `mode`: Animation mode (loop, forward, reverse). Defaults to loop.
/// - `autoStart`: Automatically start animation if true (default is true).
/// - `controller`: Optional external [AnimationController] for custom control.
/// - `onStarted`, `onCompleted`, `onRepeated`: Optional animation lifecycle callbacks.
/// - `speed`: Scrolling speed in pixels per second (default 50).
/// - `spacing`: Space between repeated text items for seamless loop (default 50).
class MarqueeText extends MultiAnimatedText {
  MarqueeText(
    super.text, {
    super.key,
    super.style,
    super.duration,
    super.mode = AnimatedTextMode.loop,
    super.autoStart = true,
    super.controller,
    super.onStarted,
    super.onCompleted,
    super.onRepeated,
    double speed = 50.0,
    double spacing = 50.0,
  }) : super(
         effects: [MarqueeEffect(speed: speed, mode: mode)],
       );
}
